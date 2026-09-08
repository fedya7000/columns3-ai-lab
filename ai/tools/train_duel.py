# Обучение БОЯМИ: поколения дерутся между собой, выжившие дают потомство.
#
# Чем отличается от одиночного обучения (train.py):
#   там наградой было «сколько фигур прожил», и меряли на быстром тренажёре;
#   здесь награда — ПОБЕДА НАД ЖИВЫМ СОПЕРНИКОМ, и мерить приходится в самом
#   ПЗУ, потому что атаки, слои, порча и золотая фигура есть только там.
#
# Отсюда цена: один бой это секунд двадцать, а не миллисекунды. Поэтому
# поколение маленькое, а бои раскладываются по ядрам.
#
# Наследство состоит из двух частей:
#   * веса сети — берутся у одиночного чемпиона, он уже умеет не умирать;
#   * БОЕВЫЕ ГЕНЫ — то, чего в одиночной игре не было вовсе:
#       когда бить, ломать ли сопернику фигуру, добивать ли лежачего.
import json
import os
import sys
import time
from multiprocessing import Pool

sys.path.insert(0, os.path.dirname(__file__))
import numpy as np

import brain
import duel
import train

OUT = os.path.join(os.path.dirname(__file__), '..', 'build')
BEST = os.path.join(OUT, 'net_duel.json')
# Лучший КАЖДОГО поколения, без всяких условий. Нужен потому, что гейт на
# рекорд может не сработать ни разу за прогон — и тогда часы обучения уходят
# в никуда (так и вышло 23.08: в BEST осталось поколение 0 за весь прогон).
LAST = os.path.join(OUT, 'net_duel_last.json')
LOG = os.path.join(OUT, 'boi.log')

# ⚠️ ПОТОЛОК JITTER. Выше ~230 заход по меню не доводит до боя: режим
# застревает на $0040, fight() возвращает ошибку, поколение считает пустоту.
# Замер 24.08 (build/_probe_jitter_granica.py): 240, 260, 280, 300, 320, 340,
# 360, 380 — все мимо; 0..220 играют. Прежний rng.integers(400) отправлял в
# никуда около 45 % боёв КАЖДОГО поколения — три прогона по 30 поколений
# искали улучшение, имея половину боёв пустыми.
JITTER_PREDEL = 230

# Чему учим: 'pobeda' — прежняя оценка (кто кого закопал),
# 'gruppy' — долгая партия с большим счётом. Переключается OX_CEL.
CEL = os.environ.get('OX_CEL', 'pobeda')

N_W = brain.Net.size()          # 407 весов сети
N_G = duel.N_GENES              # 3 боевых гена


def split(genome):
    g = np.asarray(genome, dtype=np.float64)
    return brain.Net(g[:N_W]), list(g[N_W:])


def зрелище(r, i):
    """Надбавка за то, ради чего это и смотрят.

    Голая победа даёт скучного бойца: он ровно кладёт камни, рубит по мелочи и
    ждёт чужой ошибки. Поэтому отдельно платим за то, что делает бой боем —
    за цепочки от трёх (только они дают алмаз), за сами алмазы и за порчу,
    наложенную сопернику. Потолок надбавки примерно равен цене победы, так что
    отсиживаться невыгодно, но и жертвовать игрой ради красоты бессмысленно.
    """
    к = r.get('комбо3+', [0, 0])[i]
    а = r.get('алмазов', [0, 0])[i]
    п = r.get('наложено порч', [0, 0])[i]
    длина = sum(r.get('фигур', [0, 0])) / 2.0
    return (0.25 * min(к, 8) / 8.0
            + 0.35 * min(а, 4) / 4.0
            + 0.30 * min(п, 4) / 4.0
            + 0.25 * min(длина, 200) / 200.0)   # за долгий бой тоже платим


def fight(job):
    """Один бой. Возвращает (очки первому, очки второму, кратко об итоге)."""
    ga, gb, jitter, layers, frames = job
    head_a, genes_a = split(ga)
    head_b, genes_b = split(gb)
    r = duel.run_duel(head_a, head_b, layers=layers, max_frames=frames,
                      genes_a=genes_a, genes_b=genes_b, quiet=True, jitter=jitter)
    if 'ошибка' in r:
        return 0.5, 0.5, r['ошибка'], r
    w = r.get('победил', 'ничья')
    pa, pb = r.get('фигур', [0, 0])

    if CEL == 'gruppy':
        # ⭐ ЦЕЛЬ «ДОЛГАЯ ПАРТИЯ» (слово владельца 24.08: «хочу под 500»).
        #
        # Прежняя оценка платила за ПОБЕДУ (вес 1.0) и отдельно за порчу,
        # НАЛОЖЕННУЮ СОПЕРНИКУ (0.30) — то есть прямо за скорейшее убийство
        # партии. Собранные группы не учитывались вовсе. Отсюда и вышло, что
        # обучение честно работало, но в другую сторону: боец поколения 29
        # обыгрывал поколение 10 (0.527 в очной ставке) и при этом собирал
        # 82 группы против 238. Владельцу нужны группы, а не победы.
        #
        # Здесь платим ровно за то, что он хочет видеть: за собранные группы
        # и за прожитые фигуры. Ни победы, ни порчи соперника в оценке нет —
        # пусть оба живут долго и набивают счёт.
        ga, gb = r.get('групп честных', [0, 0])
        sa = min(ga, 500) / 500.0 + 0.5 * min(pa, 600) / 600.0
        sb = min(gb, 500) / 500.0 + 0.5 * min(pb, 600) / 600.0
        return sa, sb, w, r

    edge = 0.1 * max(-1.0, min(1.0, (pa - pb) / 40.0))
    win_a = 1.0 if w == 'первый' else (0.0 if w == 'второй' else 0.5)
    sa = win_a + edge + зрелище(r, 0)
    sb = (1.0 - win_a) - edge + зрелище(r, 1)
    return sa, sb, w, r


YADRA = os.path.join(OUT, 'yadra.txt')


def zhelaemye_yadra(tekushchie):
    """
    Сколько ядер занимать. Число читается из build/yadra.txt МЕЖДУ поколениями,
    так что менять его можно НА ХОДУ, не трогая идущее обучение: садишься
    играть — пишешь 4, уходишь — пишешь 20, следующее поколение подхватит.

    Файла нет или в нём чушь — оставляем как есть, обучение не роняем.
    """
    try:
        with open(YADRA, encoding='utf-8-sig') as f:
            n = int(f.read().strip())
    except (OSError, ValueError):
        return tekushchie
    return max(1, min(n, os.cpu_count() or 4))


def protiv_etalona(pool, kandidat, etalon, boev, layers, frames, rng):
    """
    АБСОЛЮТНАЯ мера силы: доля побед кандидата против ЗАМОРОЖЕННОГО соперника.

    Зачем отдельная мера. Основной счёт поколения (`fits`) считается в боях
    ВНУТРИ популяции, то есть меряет «насколько я лучше своих современников».
    Когда усиливается вся стая, это число у всех сползает к 0.5 — и выглядит
    как ухудшение, хотя игра стала сильнее. Гейтить сохранение по такому числу
    нельзя: рекорд раннего поколения не побьётся никогда.

    Здесь соперник ОДИН И ТОТ ЖЕ на всём прогоне (чемпион, с которого начали),
    поэтому числа разных поколений сравнимы между собой. Стороны меняются
    поровну, чтобы преимущество первого игрока не подсуживало.
    """
    jobs, storony = [], []
    for k in range(boev):
        jit = int(rng.integers(JITTER_PREDEL))
        if k % 2 == 0:
            jobs.append((kandidat, etalon, jit, layers, frames))
            storony.append(0)                       # кандидат ходит первым
        else:
            jobs.append((etalon, kandidat, jit, layers, frames))
            storony.append(1)                       # кандидат ходит вторым
    if not jobs:
        return 0.0
    # ⚠️ Что считать чем — оплачено замером 24.08 (build/_probe_shum_gejta.py):
    # чемпион против САМОГО СЕБЯ давал 0.25 вместо честных 0.5, и планку никто
    # взять не мог. Виноваты были две породы исходов:
    #   * СОРВАВШИЙСЯ бой (не доехали до боя, сорвался эмулятор) — он вообще
    #     не бой, и в знаменателе ему не место. Раньше шёл в поражения;
    #   * `победил is None` — бой не кончился за отведённые кадры. Это ничья.
    # При цели «долгая партия» гейт судит не победы, а ГРУППЫ: доля кандидата
    # в общем счёте. 0.5 — собрали поровну, выше — кандидат набивает больше.
    # Форма ответа та же (0..1 с половиной на равенстве), поэтому вся остальная
    # механика гейта — планка 0.5, рекорд, сохранение — работает без изменений.
    if CEL == 'gruppy':
        moi = chuzhie = 0.0
        for (sa, sb, w, r), storona in zip(pool.map(fight, jobs), storony):
            if 'ошибка' in r:
                continue
            g = r.get('групп честных') or [0, 0]
            moi += g[storona]
            chuzhie += g[1 - storona]
        if moi + chuzhie <= 0:
            return 0.5
        return moi / (moi + chuzhie)

    ochki, sygrano = 0.0, 0
    for (sa, sb, w, r), storona in zip(pool.map(fight, jobs), storony):
        if 'ошибка' in r:
            continue
        sygrano += 1
        if w is None or w == 'ничья':
            ochki += 0.5
        elif (w == 'первый' and storona == 0) or (w == 'второй' and storona == 1):
            ochki += 1.0
    if not sygrano:
        return 0.5                     # ни один бой не состоялся — судить нечем
    return ochki / sygrano


def save(genome, gen, fitness, path=BEST):
    os.makedirs(OUT, exist_ok=True)
    net, genes = split(genome)
    with open(path, 'w', encoding='utf-8') as f:
        json.dump({'weights': list(map(float, genome[:N_W])),
                   'genes': list(map(float, genes)),
                   'n_in': brain.N_FEATURES, 'n_hidden': brain.N_HIDDEN,
                   'gen': gen, 'fitness': fitness,
                   'боевое_правило': dict(zip(duel.GENE_NAMES,
                                              map(float, genes)))}, f, ensure_ascii=False)


def load(path=BEST):
    with open(path, encoding='utf-8') as f:
        d = json.load(f)
    w = np.asarray(d['weights'], dtype=np.float64)
    n_in, n_hid = int(d['n_in']), int(d['n_hidden'])
    if n_in != brain.N_FEATURES or n_hid != brain.N_HIDDEN:
        # Сеть обучена на другой раскладке признаков (например 22 вместо 32):
        # напрямую она несовместима с текущим brain.extract и роняет каждый
        # ход в аварийную ветку пилота. Дополняем веса до нового размера
        # нулями: скрытый слой спит (его выход умножается на нулевые w2/b2),
        # а хвост старой линейной части совпадает с нынешними HAND_WEIGHTS,
        # так что оценка поля сразу осмысленна. Файл не переписываем.
        print('внимание: %s обучена на %d признаках x%d скрытых, текущие %d x%d;'
              ' несовпадающая часть обнулена' % (path, n_in, n_hid,
                                                 brain.N_FEATURES, brain.N_HIDDEN))
        o_old = n_in * n_hid + 2 * n_hid
        lin_old = w[o_old + 1:]              # прямая связка старой сети
        lin_new = np.zeros(brain.N_FEATURES)
        k = min(len(lin_old), brain.N_FEATURES)
        lin_new[:k] = lin_old[:k]            # старые признаки шли в том же порядке
        # lin = HAND_WEIGHTS: Net.seed_weights возвращает МАССИВ весов,
        # и строить его надо СРАЗУ под новую раскладку (n_in x n_hid)
        o_new = brain.N_FEATURES * n_hid
        new = np.asarray(brain.Net.seed_weights(n_in=brain.N_FEATURES,
                                                n_hidden=n_hid),
                         dtype=np.float64).copy()
        new[:o_old] = 0                      # спим: нелинейная часть от старых весов пуста
        new[o_new:o_new + brain.N_FEATURES] = lin_new
        return brain.Net(new, brain.N_FEATURES, n_hid), list(d['genes']), d
    return brain.Net(w, n_in, n_hid), list(d['genes']), d


def train_duels(generations=30, pop=14, elite=5, duels_each=8, layers=1,
                frames=30000, workers=10, seed=1, resume=True, etalon_boev=16):
    rng = np.random.default_rng(seed)
    solo, meta = train.load()
    print('берём одиночного чемпиона: поколение %d, стойкость %.0f'
          % (meta['gen'], meta['fitness']))

    base = np.asarray(solo.w, dtype=np.float64)
    mean = np.concatenate([base, np.asarray(duel.DEFAULT_GENES, dtype=np.float64)])
    # Продолжаем с ранее обученного бойца, если он есть: иначе каждый
    # перезапуск (сменили число ядер, добавили боёв) стирал бы наработку.
    if resume and os.path.exists(BEST):
        try:
            гб, гг, гм = load()
            if len(гб.w) == N_W and len(гг) == N_G:
                mean = np.concatenate([np.asarray(гб.w, dtype=np.float64),
                                       np.asarray(гг, dtype=np.float64)])
                print('продолжаем с боевого: поколение %d, счёт %.2f'
                      % (гм.get('gen', -1), гм.get('fitness', 0)))
        except Exception as e:
            print('боевого взять не вышло (%s), берём одиночного' % e)
    # ⭐ ЭТАЛОН: с кем сравниваем ВСЕ поколения. Замораживаем то, с чего начали,
    # и больше не трогаем — только против неподвижной мишени число «стал сильнее»
    # имеет смысл (см. protiv_etalona).
    etalon = mean.copy()

    # ⭐ ЗАМОРОЗКА ЗОЛОТА (25.08). Три золотых гена подобраны ПРЯМЫМ ПЕРЕБОРОМ
    # на 58 сидах: 125 -> 146 групп, лучше на 31 сиде из 43. Общий отбор их
    # почти не чувствует — золотая фигура приходит ~15 раз за бой против ~200
    # обычных, — и за десяток поколений просто размоет их дрейфом. Поэтому на
    # время обучения держим их неподвижно. OX_ZOLOTO=trenirovat снимает замок.
    ЗОЛОТО_С = N_W + N_G - 3
    морозим = os.environ.get('OX_ZOLOTO', 'zamorozit') != 'trenirovat'
    sigma = np.full(N_W + N_G, 0.05)
    LIN = 352 + 16 + 16 + 1         # начало прямой связки в весах сети

    # Подкручивать сети склонность к цепочкам НЕ надо: опыт (proba_stilya.py)
    # показал, что она и так собирает их чаще всех, а перекос только мешает.
    # Меняем поэтому только боевой мозг, а оценку поля почти не трогаем.
    sigma[LIN:N_W] = 0.08

    # ⭐ БОЕВЫЕ ГЕНЫ: разброс 0.30 вместо прежних 1.2.
    # Прежнее «совсем широко» задумывалось как старт с чистого листа, но на
    # деле мешало закрепить находку: потомки чемпиона улетали от него так
    # далеко, что каждое поколение бросало кости заново. Прогон 23.08 это
    # показал числом — пила 0.00…0.56 против эталона за 30 поколений, пик на
    # 15-м и падение до нуля к 25-му, без всякого накопления.
    # Узкий разброс означает, что гены наследуются ОТ ЭТАЛОНА (они уже лежат
    # в `mean`, загруженные из BEST) и лишь уточняются, а не выдумываются.
    sigma[N_W:] = 0.30
    if морозим:
        золотые = np.array(mean[ЗОЛОТО_С:], dtype=np.float64)
        sigma[ЗОЛОТО_С:] = 0.0
        print('золото заморожено: %s' % ', '.join(
            '%s %.2f' % (n, v) for n, v in
            zip(duel.GENE_NAMES[-3:], золотые)), flush=True)

    os.makedirs(OUT, exist_ok=True)

    # ⭐ СТРАХОВКА: копия чемпиона ДО прогона. Оплачена потерей 24.08 —
    # прогон записал в BEST бойца слабее того, что там лежал, и сильного
    # восстановить было неоткуда.
    if os.path.exists(BEST):
        import shutil
        shutil.copyfile(BEST, os.path.join(OUT, 'net_duel_pered_progonom.json'))

    log = open(LOG, 'a', encoding='utf-8')
    pool = Pool(workers)
    # ⚠️ Планка начинается с 0.5, а НЕ с -1. Эталон — это тот, кто уже лежит
    # в BEST, и 0.5 означает «сыграл с ним вничью». Претендент забирает файл,
    # только если эталона ПЕРЕИГРАЛ. С прежним -1 первое же поколение любого
    # прогона затирало чемпиона, даже будучи слабее: так 24.08 был потерян
    # боец со счётом 0.56, а на его место лёг 0.44.
    best_ever, best_fit = None, (0.5 if (resume and os.path.exists(BEST)) else -1.0)
    try:
        for gen in range(generations):
            # ⭐ Ядра можно переставить на ходу: пул пересобираем между
            # поколениями, внутри поколения он неподвижен (иначе оборвём бои).
            hochu = zhelaemye_yadra(workers)
            if hochu != workers:
                print('ядра: %d → %d (по %s)' % (workers, hochu, YADRA), flush=True)
                pool.close()
                pool.join()
                pool = Pool(hochu)
                workers = hochu

            people = [mean if (gen == 0 and i == 0)
                      else mean + sigma * rng.standard_normal(N_W + N_G)
                      for i in range(pop)]
            if best_ever is not None:
                people[0] = best_ever

            # пары: каждый дерётся duels_each раз, стороны меняются местами,
            # чтобы никому не досталось преимущество первого игрока
            # ⭐ ОДНИ И ТЕ ЖЕ СИДЫ ВСЕМ (25.08). Раньше каждый бой получал
            # СВОЙ случайный сид, и при разбросе в ~40 групп на сид оценка
            # бойца по 12 боям имела ошибку ≈11 групп — больше, чем настоящая
            # разница между кандидатами одного поколения. Отбор половину
            # времени сортировал везение с раздачей: 52 поколения за 12 часов
            # не сдвинули рекорд ни разу, как и 39 поколений ночью до того.
            # Теперь набор сидов один на всё поколение: везение достаётся
            # всем поровну и в сравнении сокращается.
            # OX_OBSCHIE_SIDY=0 возвращает прежнее поведение (для пары).
            общие = os.environ.get('OX_OBSCHIE_SIDY', '1') != '0'
            сиды_поколения = [int(rng.integers(JITTER_PREDEL))
                              for _ in range(max(1, duels_each // 2))]
            jobs, pairs = [], []
            for i in range(pop):
                for k in range(duels_each // 2):
                    j = int(rng.integers(pop - 1))
                    if j >= i:
                        j += 1
                    jit = (сиды_поколения[k] if общие
                           else int(rng.integers(JITTER_PREDEL)))
                    jobs.append((people[i], people[j], jit, layers, frames))
                    pairs.append((i, j))
                    jobs.append((people[j], people[i], jit, layers, frames))
                    pairs.append((j, i))

            t0 = time.time()
            out = pool.map(fight, jobs)
            res = [(a, b, w) for a, b, w, *_ in out]
            stats = [x[3] for x in out]
            score = np.zeros(pop)
            games = np.zeros(pop)
            for (i, j), (sa, sb, _) in zip(pairs, res):
                score[i] += sa
                score[j] += sb
                games[i] += 1
                games[j] += 1
            fits = score / np.maximum(games, 1)

            order = np.argsort(-fits)
            top = [people[i] for i in order[:elite]]
            mean = np.mean(top, axis=0)
            sigma = np.std(top, axis=0) + 0.01
            sigma[N_W:] = np.maximum(sigma[N_W:], 0.25)
            if морозим:
                mean[ЗОЛОТО_С:] = золотые
                sigma[ЗОЛОТО_С:] = 0.0

            # ⭐ Победителя поколения судим НЕ по своим современникам, а по
            # замороженному эталону — только это число сравнимо между
            # поколениями. Лучшего поколения пишем ВСЕГДА (в LAST), а в BEST —
            # когда он и правда сильнее всех прежних против той же мишени.
            pobeditel = people[order[0]]
            sila = protiv_etalona(pool, pobeditel, etalon, etalon_boev,
                                  layers, frames, rng)
            save(pobeditel, gen, sila, path=LAST)
            if sila > best_fit:
                best_fit = float(sila)
                best_ever = pobeditel
                save(best_ever, gen, best_fit)

            g = mean[N_W:]
            правило = ', '.join('%s %+.1f' % (n, v)
                                for n, v in zip(duel.GENE_NAMES, g) if abs(v) > 0.4)
            # ⭐ ПРИБОР против угрозы У4 (docs/razvedka_obuchenie.md): в строке
            # лога сигмы не было, и схлопнувшийся поиск выглядел живым. Сигма
            # здесь уже пересчитана по элите этого поколения (см. выше), она же
            # пойдёт в выборку следующего. Медианы по весам сети, по прямой
            # связке и все боевые гены поимённо.
            sig_w = float(np.median(sigma[:LIN]))
            sig_l = float(np.median(sigma[LIN:N_W]))
            sig_g = ', '.join('%s %.3f' % (n, v)
                              for n, v in zip(duel.GENE_NAMES, sigma[N_W:]))
            line = ('поколение %3d: ПРОТИВ ЭТАЛОНА %.2f (рекорд %.2f)  '
                    '| свои: лучший %.2f среди лучших %.2f  '
                    '| комбо %.1f алмазов %.1f порч %.1f фигур %.0f  '
                    '| сигма: веса %.4f связка %.4f  гены [%s]  '
                    '| бьёт когда: %s  (%.0f с)'
                    % (gen, sila, best_fit,
                       fits[order[0]], fits[order[:elite]].mean(),
                       np.mean([sum(x.get('комбо3+', [0, 0])) for x in stats]),
                       np.mean([sum(x.get('алмазов', [0, 0])) for x in stats]),
                       np.mean([sum(x.get('наложено порч', [0, 0])) for x in stats]),
                       np.mean([sum(x.get('фигур', [0, 0])) / 2 for x in stats]),
                       sig_w, sig_l, sig_g,
                       правило or 'никогда', time.time() - t0))
            print(line, flush=True)
            log.write(line + '\n')
            log.flush()
    finally:
        pool.close()
        pool.join()
        log.close()
    return best_ever, best_fit


if __name__ == '__main__':
    gens = int(sys.argv[1]) if len(sys.argv) > 1 else 30
    pop = int(sys.argv[2]) if len(sys.argv) > 2 else 14
    cores = int(sys.argv[3]) if len(sys.argv) > 3 else 10
    боёв = int(sys.argv[4]) if len(sys.argv) > 4 else 8
    # ⚠️ 25.08: после починки потолка команд на кадр (эмулятор больше не рубит
    # тяжёлый кадр) бои стали ВТРОЕ длиннее, и прежние 30000 кадров — это
    # семь минут на бой, шесть поколений за ночь. Предел вынесен ручкой.
    кадров = int(os.environ.get('OX_KADROV', '30000'))
    t0 = time.time()
    print('ядер под бои: %d (всего %d)' % (cores, os.cpu_count()))
    print('боёв на бойца за поколение: %d, предел кадров: %d' % (боёв, кадров))
    w, fit = train_duels(gens, pop, duels_each=боёв, workers=cores, frames=кадров)
    print('готово за %.0f мин, лучший счёт %.2f' % ((time.time() - t0) / 60, fit))
    print('веса и гены в %s' % os.path.abspath(BEST))
