# Обучение сети отбором поколений.
#
# Способ намеренно простой и надёжный: никаких градиентов. Берём поколение
# сетей, каждая играет свои партии на тренажёре, лучших оставляем, из них
# делаем следующее поколение с небольшим разбросом. Так выводят породу.
#
# Почему не градиентный спуск: награда здесь — «сколько фигур прожил», она не
# дифференцируема, зато отлично раскладывается на 24 ядра. Для сети из
# нескольких сотен весов отбор сходится быстрее, чем возня с обучением с
# подкреплением, и его нельзя случайно сломать неверной формулой.
#
# Запуск:  python tools\train.py [поколений] [размер поколения]
import json
import os
import sys
import time
from multiprocessing import Pool

sys.path.insert(0, os.path.dirname(__file__))
import numpy as np

import brain
import simulate

OUT = os.path.join(os.path.dirname(__file__), '..', 'build')
BEST = os.path.join(OUT, 'net_big.json')
LOG = os.path.join(OUT, 'obuchenie.log')


def score(job):
    """Оценка одной сети: сколько фигур она в среднем проживает.

    ⭐ Партии идут на РАЗНОЙ глубине поля. Раньше учили только на полном поле
    в тринадцать рядов, а в бою соперник загоняет тебя в шесть — и сеть,
    никогда таких полей не видевшая, там разваливалась. Теперь глубина едет
    вместе с зерном, и мелкое поле для неё не сюрприз.
    """
    weights, seeds, cap, depth = job
    head = brain.Net(np.asarray(weights))
    total = 0
    stones = 0
    worst = cap
    for s, layers in seeds:
        n, st = simulate.play_game(head, s, cap, depth, layers=layers)
        total += n
        stones += st
        worst = min(worst, n)
    n = len(seeds)
    return total / n, stones / n, worst


def save(weights, gen, fitness, cap):
    os.makedirs(OUT, exist_ok=True)
    with open(BEST, 'w', encoding='utf-8') as f:
        json.dump({'weights': list(map(float, weights)),
                   'n_in': brain.N_FEATURES, 'n_hidden': brain.N_HIDDEN,
                   'gen': gen, 'fitness': fitness, 'cap': cap}, f)


def load(path=BEST):
    with open(path, encoding='utf-8') as f:
        d = json.load(f)
    return brain.Net(np.asarray(d['weights']), d['n_in'], d['n_hidden']), d


def train(generations=40, pop=32, elite=8, games=8, cap=2000, depth=1,
          workers=None, seed=1, resume=True):
    # По умолчанию берём ЧЕТВЕРТЬ ядер и не больше шести: обучение идёт часами
    # фоном, и машина всё это время должна оставаться пригодной для работы.
    # Хотите быстрее — запускайте с явным числом ядер, когда компьютер свободен.
    rng = np.random.default_rng(seed)
    size = brain.Net.size()
    # Продолжаем с достигнутого, если сохранённый боец уже есть: иначе каждый
    # перезапуск (сменили число ядер, поправили признаки) начинал бы заново.
    mean = brain.Net.seed_weights(rng=rng)
    if resume and os.path.exists(BEST):
        try:
            head, meta = load()
            mean = np.asarray(head.w, dtype=np.float64)
            print('продолжаем с сохранённого: поколение %d, стойкость %.0f'
                  % (meta.get('gen', -1), meta.get('fitness', 0)))
        except Exception as e:
            print('сохранённого взять не вышло (%s), начинаем с черновика' % e)
    sigma = np.full(size, 0.12)
    sigma[-brain.N_FEATURES:] = 0.25        # линейной части позволяем шагать шире

    workers = workers or max(1, min(6, (os.cpu_count() or 4) // 4))
    os.makedirs(OUT, exist_ok=True)
    log = open(LOG, 'a', encoding='utf-8')

    best_ever = None
    best_fit = -1
    pool = Pool(workers)
    try:
        for gen in range(generations):
            # общие зёрна на всё поколение: сети сравниваются на ОДНИХ И ТЕХ ЖЕ
            # последовательностях фигур, иначе победит просто везучий
            # ⭐ Глубина берётся с ПЕРЕКОСОМ в мелкие поля. В бою соперник
            # загоняет именно туда: на полном поле сеть живёт двенадцать тысяч
            # фигур, а при пяти слоях — тысячу с небольшим. Тренировать надо
            # слабое место, а не то, что и так получается.
            ГЛУБИНЫ = [0, 2, 3, 4, 4, 5, 5, 6]
            seeds = [(int(rng.integers(1 << 30)),
                      int(ГЛУБИНЫ[int(rng.integers(len(ГЛУБИНЫ)))]))
                     for _ in range(games)]
            people = [mean if gen == 0 else mean + sigma * rng.standard_normal(size)
                      for _ in range(pop)]
            if best_ever is not None:
                people[0] = best_ever        # лучшего переносим без изменений

            t0 = time.time()
            res = pool.map(score, [(p, seeds, cap, depth) for p in people])
            fits = np.array([r[0] for r in res])
            order = np.argsort(-fits)
            top = [people[i] for i in order[:elite]]

            mean = np.mean(top, axis=0)
            sigma = np.std(top, axis=0) + 0.02      # разброс не даём схлопнуться
            if fits[order[0]] > best_fit:
                best_fit = float(fits[order[0]])
                best_ever = people[order[0]]
                save(best_ever, gen, best_fit, cap)

            line = ('поколение %3d: лучший %7.0f  среди лучших %7.0f  середина %7.0f'
                    '  худшая партия %5d  предел %5d  (%.0f с)'
                    % (gen, fits[order[0]], fits[order[:elite]].mean(),
                       np.median(fits), res[order[0]][2], cap, time.time() - t0))
            print(line, flush=True)
            log.write(line + '\n')
            log.flush()

            # ⚠️ Планку больше НЕ поднимаем без предела. Раньше она росла
            # вдвое каждый раз, партии удлинялись, и поколение доползло до
            # восьми минут — при том, что разница между «живёт 12 тысяч» и
            # «живёт 20 тысяч» на полном поле для боя не значит ничего.
            if fits[order[:elite]].mean() > 0.9 * cap and cap < 4000:
                cap *= 2
                best_fit = -1                # оценки на новой планке несравнимы
                print('   планка поднята до %d фигур' % cap, flush=True)
    finally:
        pool.close()
        pool.join()
        log.close()
    return best_ever, best_fit


if __name__ == '__main__':
    gens = int(sys.argv[1]) if len(sys.argv) > 1 else 40
    pop = int(sys.argv[2]) if len(sys.argv) > 2 else 32
    cores = int(sys.argv[3]) if len(sys.argv) > 3 else None
    t0 = time.time()
    print('ядер под обучение: %s (всего в машине %d)'
          % (cores or max(1, min(6, (os.cpu_count() or 4) // 4)), os.cpu_count()))
    w, fit = train(gens, pop, workers=cores)
    print('готово за %.0f с, лучшая стойкость %.0f фигур' % (time.time() - t0, fit))
    print('веса сохранены в %s' % os.path.abspath(BEST))
