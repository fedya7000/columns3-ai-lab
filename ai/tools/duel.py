# Поединок: сеть против самой себя в НАСТОЯЩЕМ ПЗУ, со слоями и подлянками.
#
# Почему отдельный файл, а не переделка play_rom: там бот ходит по очереди и
# сам шагает кадрами. В бою так нельзя — фигуры у обоих падают ОДНОВРЕМЕННО,
# и пока один доводит свою, второй теряет управление и заваливается.
#
# Здесь наоборот: кадрами шагает общий цикл, а каждый игрок — «пилот», который
# раз в кадр говорит, что нажать, и ничего не ждёт.
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))
import math

import numpy as np

import bot_io as io
import brain as brains
import rules

# БОЕВОЙ МОЗГ — маленькая отдельная голова, решающая один вопрос: бить сейчас?
#
# Почему не просто «порог шкалы»: в этой игре слои умеют только копиться.
# Атака отнимает d1 у себя и добавляет d1 сопернику, но если своих слоёв уже
# ноль, вычитать нечего — «сдача» пропадает, а сопернику всё равно прилетает.
# Значит бить выгоднее, КОГДА У ТЕБЯ САМОГО ЕСТЬ СЛОИ: тогда удар ещё и
# возвращает тебе поле. Это и есть та тонкость, ради которой затевалось
# обучение боями — и решать её должен отбор, а не я.
#
# Бьём, если взвешенная сумма признаков больше нуля.
GENE_NAMES = [
    # --- про себя ---
    'моя шкала', 'мои слои', 'я у потолка', 'мне есть чем забить',
    # --- ПРО СОПЕРНИКА: этого раньше почти не было ---
    'шкала врага', 'слои врага', 'враг у потолка', 'врагу есть чем забить',
    'у врага особый камень', 'на враге висит порча', 'враг вот-вот ударит',
    # --- прочее ---
    'просто так',
    # --- что делать золотой фигурой ---
    'золото: снять свои слои', 'золото: дать слои врагу', 'золото: смести цвет',
]
N_GENES = len(GENE_NAMES)

# Стартовое правило: копить до полной шкалы, золотой фигурой сметать цвет.
DEFAULT_GENES = [3.0, 0.0, 0.5, 0.0,
                 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                 -2.0,
                 0.5, 0.2, 1.5]

GOLD = (7, 8, 9)      # служебные значения золотой фигуры
#   внизу 7 — дать слои сопернику
#   внизу 8 — смести с поля ВЕСЬ цвет, которого коснулась
#   внизу 9 — снять слои себе

ROTATE = 'b'          # +0xAD
ATTACK = 'c'          # +0xAF (вторая кнопка атаки — 'a', +0xAE)


def tap_menu(md, port, *b, hold=4, gap=6):
    md.press(port, *b)
    for _ in range(hold):
        md.step_frame()
    md.release(port)
    for _ in range(gap):
        md.step_frame()


def wait(md, n):
    for _ in range(n):
        md.step_frame()


def boot_duel(md, layers=3):
    """Доводит до боя 1 на 1 с включёнными СЛОЯМИ.

    Слои по умолчанию выключены (LAYERS = 0), а без них мертва вся начинка:
    золотая фигура падает мусором и не слушается кнопок.
    Значение крутится кнопками A/C, диапазон 0..5, лежит в $FF0460 / $FF0461.
    """
    wait(md, 300)
    tap_menu(md, 0, 'start'); wait(md, 60)
    tap_menu(md, 0, 'start'); wait(md, 120)
    tap_menu(md, 0, 'right'); wait(md, 20)     # 1P -> 1on1
    tap_menu(md, 0, 'start'); wait(md, 120)
    for _ in range(3):                          # -> SETTING
        tap_menu(md, 0, 'down'); wait(md, 10)
    tap_menu(md, 0, 'start'); wait(md, 120)
    for _ in range(layers):                     # LAYERS первому
        tap_menu(md, 0, 'a'); wait(md, 8)
    tap_menu(md, 0, 'right'); wait(md, 10)
    for _ in range(layers):                     # и второму
        tap_menu(md, 0, 'a'); wait(md, 8)
    tap_menu(md, 0, 'start'); wait(md, 90)      # обратно к выбору
    tap_menu(md, 0, 'start'); wait(md, 150)     # BEST OF 3
    tap_menu(md, 0, 'start'); wait(md, 150)
    tap_menu(md, 1, 'start'); wait(md, 120)
    tap_menu(md, 0, 'start'); wait(md, 150)
    return md


def dozhat_do_boya(md, predel=1500):
    """Дожимает вход в бой, если отсчитанный кадрами сценарий меню промахнулся.

    ⚠️ Понадобилось 25.08, после подъёма потолка команд на кадр до 39000:
    меню проматывается иначе, и жёсткие паузы boot_duel попадают мимо экрана —
    сиды 185/200/215 вставали на режиме $0040 и объявлялись срывом.
    Жмём старт по очереди с обоих джойстиков: игра ждёт ОБОИХ.
    Если бой уже идёт, ничего не делаем.
    """
    for i in range(predel // 30):
        if md.rw(io.MODE) == io.BATTLE:
            return True
        tap_menu(md, i % 2, 'start')
        wait(md, 30)
    return md.rw(io.MODE) == io.BATTLE


# Гашение клеток-призраков. ⛔ ВЫКЛЮЧЕНО ПО ЗАМЕРУ 25.08: на 12 сидах оно
# дало 594 группы против 795 без него и подняло срывы эмулятора с 1 до 3.
# Клетку игре на миг НУЖНО (гашение в лоб роняет эмулятор на 3119-м кадре),
# а отложенное гашение всё равно вредит. Оставлено за выключателем как
# запись неудачной попытки: OX_CHISTKA=1 включает.
ЧИСТИТЬ_ПРИЗРАКОВ = os.environ.get('OX_CHISTKA', '0') != '0'


class Pilot:
    """Ведёт одного игрока покадрово. Сам кадрами НЕ шагает.

    Правило игры: кнопку нельзя держать — удержание засчитывается за одно
    нажатие. Поэтому каждый ход это такт «нажал / отпустил», и такт здесь
    размазан по кадрам, а не проварен на месте.
    """

    # Замер (probe_bystro.py): нажим 2 кадра + пауза 1 = три кадра на сдвиг и
    # ни одного промаха. Быстрее (1+1) игра уже глотает через раз.
    HOLD, GAP = 2, 1

    def __init__(self, md, port, p, head, depth=1, attack_at=None, name='бот',
                 genes=None, foe=None, noise=0.05, seed=None, ждать=False,
                 вместе=True, hold=2, gap=1):
        self.md, self.port, self.p = md, port, p
        self.head, self.depth = head, depth
        self.genes = list(genes) if genes is not None else list(DEFAULT_GENES)
        self.fixed_at = attack_at
        # ⭐ МИРНЫЙ БОЙ (слово владельца 26.08: «чтобы ИИ не использовал
        # подляны — ни кнопкой, ни золотой»). Пилот не бьёт вовсе и не дарит
        # плиты золотом. Плиты могут появиться только сами — со светящегося
        # камня, — и золотом их можно снять. Смотрим, сколько так протянут.
        self.мирно = False
        self.foe = foe if foe is not None else (io.P2 if p == io.P1 else io.P1)
        self.name = name
        # своя рука у каждого: без неё оба ходят пиксель в пиксель одинаково,
        # потому что лента фигур у игроков ОДНА И ТА ЖЕ
        self.ждать = ждать
        self.вместе = вместе
        self.HOLD, self.GAP = hold, gap
        self.noise = noise
        self.rng = np.random.default_rng(9161 + port * 7919 if seed is None else seed)
        self.phase = 'idle'
        self.hold = self.gap = 0
        self.btns = ()
        self.want = None
        self.col = None
        self.n0 = None
        self.placed = 0
        self.attacks = 0
        self.budget = 0
        self.reached = True
        self.падение = 0     # сколько кадров держим «вниз»
        self.misses = 0      # сколько раз не успел довести фигуру до цели

    # ---- мелкая механика нажатий ----
    def _start_tap(self, *btns):
        self.btns = btns
        self.hold = self.HOLD
        self.gap = self.GAP

    def _tapping(self):
        md = self.md
        if self.hold > 0:
            md.press(self.port, *self.btns)
            self.hold -= 1
            return True
        if self.gap > 0:
            md.release(self.port)
            self.gap -= 1
            return True
        return False

    # ---- решение ----
    def _decide_gold(self, cur):
        """Что делать золотой фигурой — решают три отдельных гена.

        Раньше пилот её просто пережидал, и она падала как попало. А падает она
        каждые двадцать собранных групп, и в трети случаев дарит слои СОПЕРНИКУ.
        Отсюда и брались тринадцать слоёв в бою, где никто ни разу не ударил.
        """
        md, p, f = self.md, self.p, self.foe
        g = self.genes
        свои = io.layers(md, p) / 13.0
        чужие = io.layers(md, f) / 13.0
        поле = io.field(md, p)
        занято = sum(1 for r in поле for v in r if 0 < v < 0xFF) / 78.0
        # ⚠️ ЗДЕСЬ БЫЛА ПУТАНИЦА (найдена 25.08 по вопросу владельца «почему ИИ
        # не жмёт золотом на плиты»). Брались гены g[7], g[8], g[9] — по
        # ЗНАЧЕНИЯМ КАМНЕЙ из GOLD=(7,8,9). Но это номера камней, а не генов:
        # золотые гены лежат под 12, 13, 14 (см. GENE_NAMES). Правил золотом
        # ген g[9] = «на враге висит порча», раскачанный обучением до +12.6, —
        # и «смести цвет» выигрывало 17 раз из 17, слои не трогались НИКОГДА.
        # Сами золотые гены при этом не участвовали в игре и потому дрейфовали
        # случайно: после этой правки их надо ПЕРЕОБУЧИТЬ, иначе они бесполезны.
        и = {n: k for k, n in enumerate(GENE_NAMES)}
        оценки = {9: g[и['золото: снять свои слои']] * свои,
                  8: g[и['золото: смести цвет']] * занято}
        if not self.мирно:
            оценки[7] = g[и['золото: дать слои врагу']] * (1.0 - чужие)
        низ = max(оценки, key=оценки.get)
        # колонка: под вариант 8 целимся туда, где сверху лежит самый частый цвет
        if низ == 8:
            цвета = {}
            for r in поле:
                for v in r:
                    if 0 < v < 0xFF:
                        цвета[v] = цвета.get(v, 0) + 1
            лучший, кол = -1, 2
            for c in range(io.COLS):
                верх = None
                for r in range(io.TOTAL):
                    v = поле[r][c]
                    if 0 < v < 0xFF:
                        верх = v
                        break
                if верх is not None and цвета.get(верх, 0) > лучший:
                    лучший, кол = цвета[верх], c
        else:
            высоты = [io.height(поле, c) for c in range(io.COLS)]
            кол = высоты.index(min(высоты))
        # доворачиваем так, чтобы нужное значение оказалось ВНИЗУ
        want = cur
        for _ in range(3):
            if want[2] == низ:
                break
            want = rules.cycle(want, 1)
        return кол, want

    def _decide(self):
        md, p = self.md, self.p
        # ⭐ ПОЛЕ БЕРЁМ ПРЕДСКАЗАННОЕ, а не сырое (24.08).
        # Было: `io.field(md, p)` — картинка как есть. В ней ещё лежат камни,
        # помеченные к сбору ($8000), и зияют дыры под теми, что ещё летят
        # после схлопывания. Бот планировал по полю, КОТОРОГО НЕ СУЩЕСТВУЕТ,
        # и оттого городил башни: в дуэли высоты доходили до [2,12,15,7,5,2],
        # тогда как в ОДИНОЧНОЙ игре тот же мозг держал [1,5,2,2,2,3] и брал
        # 220 групп. Разница была ровно здесь: play_rom.one_move всегда считал
        # по field_predicted с гравитацией и схлопыванием, а дуэль — нет.
        # Предупреждение об этом стоит прямо в bot_io.field_predicted.
        field = io.field_predicted(md, p)
        rules.gravity(field)
        rules.resolve(field)
        cur = io.live_piece(md, p)
        nxt = io.next_piece(md, p)
        if any(v >= 7 for v in cur):          # ЗОЛОТАЯ ФИГУРА
            self.col, self.want = self._decide_gold(cur)
            self.n0 = io.placed(md, p)
            self.budget = 90
            return
        if not all(1 <= c <= 6 for c in nxt):
            nxt = None
        col, rot, _ = brains.best_move(field, cur, nxt, self.head, self.depth,
                                       noise=self.noise, rng=self.rng)
        if col is None:
            # ⚠️ Раньше здесь был тихий запас «колонка 2, без поворота»: любая
            # ошибка оценки выглядела как то самое «громоздит столб в центре»,
            # и никто не знал, что сеть вообще не отвечает. Теперь кричим в
            # stderr, а фигуру роняем в самую низкую колонку.
            print('пилот %s: оценка хода недоступна, роняю фигуру как есть'
                  % self.name, file=sys.stderr)
            hs = brains.heights(field)
            col = hs.index(min(hs))
            rot = 0
        self.col = col
        self.want = rules.cycle(cur, rot)
        self.n0 = io.placed(md, p)
        self.budget = 90

    def battle_features(self):
        """Что боевой мозг видит перед решением «бить сейчас?».

        ⭐ Половина признаков — ПРО СОПЕРНИКА. Раньше их почти не было, и бот
        играл вслепую: жал по своим ощущениям, не глядя на чужое поле. А живой
        игрок именно туда и смотрит — видит, что у соперника в руках заготовка,
        и ломает её ударом ровно в этот момент.
        """
        md, p, f = self.md, self.p, self.foe
        моё = [v for row in io.field(md, p) for v in row]
        чужое = [v for row in io.field(md, f) for v in row]
        мои_места, _ = brains._gotovye(моё, 0)
        его_места, _ = brains._gotovye(чужое, 0)
        его_порча = sum(1 for t in io.curses(md, f) if t)
        его_шкала = io.attack_gauge(md, f)
        return [io.attack_gauge(md, p) / 30.0,
                io.layers(md, p) / 13.0,
                1.0 if io.stack_top(md, p) <= 8 else 0.0,
                min(мои_места, 10) / 10.0,
                его_шкала / 30.0,
                io.layers(md, f) / 13.0,
                1.0 if io.stack_top(md, f) <= 8 else 0.0,
                min(его_места, 10) / 10.0,
                1.0 if io.has_special(md, f) else 0.0,
                min(его_порча, 3) / 3.0,
                1.0 if его_шкала >= 20 else 0.0,
                1.0]

    def should_attack(self):
        gauge = io.attack_gauge(self.md, self.p)
        if gauge < 10:
            return False                      # меньше десятки атака вообще не проходит
        if self.fixed_at is not None:
            return gauge >= self.fixed_at
        v = sum(a * b for a, b in zip(self.genes, self.battle_features()))
        return v > 0

    # ---- главный такт ----
    def tick(self):
        md, p = self.md, self.p
        if not io.in_battle(md) or md.stopped:
            return
        if self._tapping():
            return
        золотая = any(v >= 7 for v in io.live_piece(md, p))
        if self.ждать and self.phase == 'idle' and not io.settled(md, p):
            md.release(self.port)
            return
        if (not io.piece_ready(md, p) and not золотая) or md.rw(p + 0x76) != 0:
            md.release(self.port)
            self.phase = 'idle'
            return

        if self.phase == 'idle':
            self._decide()
            self.phase = ('work' if self.мирно
                          else ('attack' if self.should_attack() else 'work'))
            return

        # запас тратится только на доводку: падение может занимать много
        # кадров само по себе, и это не промах
        if self.phase in ('attack', 'work'):
            self.budget -= 1
            if self.budget <= 0:             # не успеваем — роняем как есть
                self.phase = 'drop'
                self.reached = False

        if self.phase == 'attack':
            self._start_tap(ATTACK)
            self.attacks += 1
            self.phase = 'work'
            return

        if self.phase == 'work':
            # ⭐ ЦЕЛЬ ОТ ЧУЖОЙ ФИГУРЫ (найдено 24.08). Если новая фигура успела
            # появиться раньше, чем мы доложили старую, `want` остаётся от
            # ПРЕДЫДУЩЕЙ — и новую в него не превратить никаким поворотом.
            # Пилот крутил её по кругу до предохранителя: замер показал 402
            # кадра на одну фигуру, цвета шли (1,6,5)->(6,5,1)->(5,1,6)-> и
            # снова. Игра тем временем доводила +0x4C до 24 и объявляла смерть
            # на ПУСТОМ поле (высоты [3,2,1,3,1,1]).
            # Лечение: цель должна состоять из тех же цветов, что живая фигура;
            # иначе решаем заново.
            живая = io.live_piece(md, p)
            if self.want is None or sorted(живая) != sorted(self.want):
                self.phase = 'idle'
                return

            # ⭐ поворот и сдвиг игра принимает ОДНОВРЕМЕННО (probe_bystro.py).
            # Это вдвое сокращает доводку, а на высоких уровнях, где фигура
            # летит вниз впятеро быстрее, только это и позволяет успеть.
            нужно = []
            c = io.piece_col(md, p)
            крутить = io.live_piece(md, p) != self.want
            if крутить and not self.вместе:
                # по очереди, как в старой обвязке: сперва довернуть, потом ехать
                if io.rotate_blocked(md, p):
                    self.want = io.live_piece(md, p)
                else:
                    self._start_tap(ROTATE)
                    return
            if c != self.col:
                вправо = c < self.col
                # ⭐ ПОРЧА «лево-право наоборот»: кнопки перепутаны прямо в
                # обработчике ввода ($00EE98). Без учёта этого бот лупит фигуру
                # в стену весь срок действия — а он до пятидесяти секунд.
                if io.controls_swapped(md, p):
                    вправо = not вправо
                нужно.append('right' if вправо else 'left')
            if io.live_piece(md, p) != self.want:
                if io.rotate_blocked(md, p):
                    # ПОРЧА «не работает поворот»: не бьёмся зря, кладём как есть
                    self.want = io.live_piece(md, p)
                else:
                    нужно.append(ROTATE)
            if not нужно:
                self.phase = 'drop'
                self.reached = True
            else:
                self._start_tap(*нужно)
                return

        if self.phase == 'drop':
            # ⚠️ Раньше здесь не было предела, и если фигура почему-то не
            # ложилась (например игрок уже завалился, а игра этого ещё не
            # объявила), пилот вечно держал «вниз». Один такой бой тянулся
            # семьдесят тысяч кадров при тридцати восьми уложенных фигурах.
            self.падение += 1
            if self.падение > 400:
                md.release(self.port)
                self.падение = 0
                self.phase = 'idle'
                return
            if io.placed(md, p) != self.n0:
                md.release(self.port)
                self.placed += 1
                if not self.reached:
                    self.misses += 1
                self.reached = True
                self.падение = 0
                self.phase = 'idle'
                if getattr(md, '_freeze_level', False):
                    md.ww(p + 0x70, 0)   # держим уровень, если обвязка просила
                return
            md.press(self.port, 'down')


def run_duel(head_a, head_b, layers=3, max_frames=60000, attack_a=None, attack_b=None,
             genes_a=None, genes_b=None, on_frame=None, quiet=False, jitter=0,
             freeze_level=False, chistit_metku=True, derzhat_zhivymi=False,
             mnogo_raundov=False, prostor=False, mirno=False):
    """Гоняет бой. Возвращает словарь с итогом.

    jitter — сколько лишних кадров подождать перед боем. Игра берёт случайные
    числа из счётчика, который тикает всё время, поэтому разная задержка даёт
    РАЗНЫЕ последовательности фигур. Без этого все бои шли бы одинаково.
    """
    import session
    md = session.new()
    wait(md, jitter)
    boot_duel(md, layers)
    io.fix_empty_slots(md)
    if md.rw(io.MODE) != io.BATTLE:
        dozhat_do_boya(md)
    if md.rw(io.MODE) != io.BATTLE:
        return {'ошибка': 'не дошли до боя, режим=%04X' % md.rw(io.MODE)}

    if freeze_level:
        orig_step = md.step_frame

        def step_frozen():
            orig_step()
            for a in (io.P1, io.P2):
                md.ww(a + 0x8C, 0)
                if md.rw(a + 0x70) >= 30:
                    md.ww(a + 0x70, 0)

        md.step_frame = step_frozen

    pilots = [Pilot(md, 0, io.P1, head_a, attack_at=attack_a, genes=genes_a, name='первый'),
              Pilot(md, 1, io.P2, head_b, attack_at=attack_b, genes=genes_b, name='второй')]
    if mirno:
        for пл in pilots:
            пл.мирно = True
    died = [None, None]
    подряд = [0, 0]
    # ⚠️ Метка $1000 в +0x5C ненадёжна: игра ставит её и живому, когда числит
    # соперника выбывшим. Поэтому смерть определяем ПО ПОЛЮ — стопка достала
    # ряд -2, — а метку используем лишь как подсказку.
    # что считаем ради зрелища: цепочки от трёх (за них дают алмаз),
    # наложенные сопернику порчи и добытые особые камни
    комбо = [0, 0]
    порчи = [0, 0]
    алмазы = [0, 0]
    prev_chain = [0, 0]
    prev_curse = [[0] * 5, [0] * 5]
    prev_flag = [0, 0]
    addrs = (io.P1, io.P2)

    # ⭐ МЕТКА $1000 НА ЭКРАНЕ (жалоба владельца: «счёт вдруг стал 4096 и бесит глаз»).
    # Игра пишет $1000 в +0x5C, когда фигуре стало некуда опускаться ($006DC0) —
    # а это же поле рисуется большим белым числом ($00E054). Игрок метку
    # переживает и играет дальше, и счётчик групп продолжает расти ОТ 4096:
    # на записи это видно как 4096 → 4097 → 4098.
    # Держим теневой честный счёт и возвращаем его на экран. Прибавку после
    # метки сохраняем, поэтому опоздание на кадр-другой не теряет групп
    # (в одиночном режиме bot_io ловит ровно `== 0x1000` и на 4097 уже мажет).
    # Безопасно: метка влияет только на надпись WIN!/LOSE через +0xE1
    # (IGRA.md §8), настоящие победы считает $004390 по +0x88 — его не трогаем.
    # Счёт групп ведём НАКОПИТЕЛЬНО, по прибавкам, а не по последнему значению
    # ячейки. Причина: в конце раунда игра кладёт в +0x5C своё итоговое число
    # (наблюдение 24.08: после 24 групп там внезапно 608), и прибор, читающий
    # ячейку как есть, приносит эту чужую цифру за «собранные группы».
    gruppy = [0, 0]        # честно накопленные группы
    posl = [0, 0]          # прошлое чистое значение ячейки
    metok = [0, 0]
    SKACHOK = 9            # прибавка больше этой — не сбор групп, а чужая запись

    # ⭐ «НЕ ДОБИВАТЬ ЖИВЫХ» (derzhat_zhivymi). Игра считает игрока выбывшим по
    # счётчику снижения +0x4C >= 24, а он доходит до порога и когда фигуре
    # некуда опуститься ЛИШЬ НА МИГ (замер 24.08: ложная метка срабатывает
    # 27 и 103 раза за бой). Дальше по IGRA.md §8 идёт $00EDAA — «остался один
    # живой, ДОБИТЬ его» — и раунд закрывается на 4258 кадре, хотя не умер
    # никто. Из-за этого дуэль обрывалась на 30-44 группах.
    # Придерживаем счётчик у порога, но ТОЛЬКО пока стопка правда не достала
    # ряд смерти: настоящую гибель ловит проверка по полю ниже, она не
    # затрагивается. ⚠️ Нулём счётчик держать нельзя (IGRA.md:166) — ломается
    # автомат игры; поэтому откатываем к 4, как это делает bot_io в одиночном.
    realno_gibnet = [False, False]
    pauza = 0                  # кадров подряд вне боя (пересменок раундов)

    for f in range(max_frames):
        if derzhat_zhivymi:
            # Стираем ПОРЯДОК ВЫБЫВАНИЯ (+0x88) — по нему $004390 считает
            # победы, а $00EDAA решает «остался один, добить». Пока никто не
            # выбыл, добивать некого и раунд не закрывается.
            # ⚠️ Счётчик +0x4C НЕ трогаем: проба 24.08 показала, что придержка
            # у порога ломает автомат — бот умирал на 704 кадре вместо 4588.
            # Ровно этот приём (обнуление +0x88 обоим) работает в одиночном
            # режиме bot_io.enable_solo, где бот живёт 223 фигуры.
            for i, a in enumerate(addrs):
                if not realno_gibnet[i] and md.rw(a + 0x88):
                    md.ww(a + 0x88, 0)
        if chistit_metku:
            for i, a in enumerate(addrs):
                v = md.rw(a + 0x5C)
                if v >= 0x1000:
                    # метка выбывания: возвращаем на экран честное число
                    md.ww(a + 0x5C, gruppy[i])
                    metok[i] += 1
                    posl[i] = gruppy[i]
                else:
                    d = v - posl[i]
                    if 0 < d <= SKACHOK:
                        gruppy[i] += d          # обычный сбор групп
                    posl[i] = v                 # скачок или сброс просто принимаем
            # честный счёт наружу: живому стенду (tools/stend.py) нужны те же
            # числа, что и замерам, а не сырое +0x5C, которое врёт 4096
            md._gruppy = list(gruppy)
        if f % 2 == 0:
            for i, a in enumerate(addrs):
                ch = md.rw(a + 0x6C)
                if ch >= 3 and ch > prev_chain[i]:
                    комбо[i] += 1
                prev_chain[i] = ch
                fl = md.rb(a + 0x91)
                if fl and not prev_flag[i]:
                    алмазы[i] += 1
                prev_flag[i] = fl
                cur = [md.rw(a + 0xF0 + k * 2) for k in range(5)]
                for k in range(5):
                    if cur[k] and not prev_curse[i][k]:
                        порчи[1 - i] += 1      # порчу наложил СОПЕРНИК
                prev_curse[i] = cur
        if f % 4 == 0:
            for i, addr in enumerate(addrs):
                if died[i] is not None:
                    continue
                # Смерть — стопка, достающая ряд -2 (docs\IGRA.md, раздел 6),
                # и она должна ДЕРЖАТЬСЯ: во время каскада камни на миг
                # выпирают вверх, одиночного кадра для приговора мало.
                поле = io.field(md, addr)
                достала = any(0 < поле[rules.DEAD_ROW][c] < io.WALL
                              for c in range(io.COLS))
                подряд[i] = подряд[i] + 4 if достала else 0
                # признак настоящей гибели: он же снимает придержку +0x4C,
                # иначе по-настоящему заваленный игрок стал бы бессмертным
                realno_gibnet[i] = подряд[i] >= 60
                if подряд[i] >= 120:
                    died[i] = f
        # Бой кончается, когда кто-то проиграл. Смотреть, как победитель
        # доигрывает в одиночку, незачем — ни человеку, ни обучению.
        if any(d is not None for d in died):
            break
        if md.stopped:
            # объекты пилотов наружу не отдаём: внутри них эмулятор,
            # а его нельзя передать между процессами
            return {'ошибка': 'эмулятор сорвался', 'кадров': f,
                    'фигур': [pl.placed for pl in pilots],
                    'атак': [pl.attacks for pl in pilots],
                    'комбо3+': list(комбо), 'алмазов': list(алмазы),
                    'наложено порч': list(порчи)}
        if not io.in_battle(md):
            # ⭐ МАТЧ, А НЕ ОДИН РАУНД (mnogo_raundov). Версус в этой игре —
            # серия раундов: игра закрывает раунд сама ($00ECB0, режим $24),
            # в том числе по ложной метке выбывания. Раньше мы на этом
            # заканчивали бой и получали 30-44 группы. Теперь ждём, пока
            # начнётся следующий раунд, и продолжаем считать.
            if not mnogo_raundov:
                break
            pauza += 1
            if pauza > 5400:          # полторы минуты тишины — матч кончился
                break
            md.step_frame()
            continue
        pauza = 0
        io.fix_empty_slots(md)
        if ЧИСТИТЬ_ПРИЗРАКОВ:
            io.ubrat_prizrakov(md)
        if prostor:
            # ⚠️ ЛОМАЕТ КАРТИНКУ: буферы спрайтов уезжают, и падающие фигуры
            # перестают рисоваться. Для счёта годится, для ВИДЕО — выключать.
            io.dat_prostor_igrokam(md)
        for pl in pilots:
            pl.tick()
        md.step_frame()
        if on_frame:
            on_frame(md, f, pilots)
    if died[0] is None and died[1] is None:
        winner = 'ничья'
    elif died[0] is None:
        winner = 'первый'
    elif died[1] is None:
        winner = 'второй'
    elif died[0] == died[1]:
        winner = 'ничья'
    else:
        winner = 'второй' if died[0] < died[1] else 'первый'
    res = {'победил': winner, 'умерли на кадрах': died, 'кадров': md.frame,
           'снято меток 4096': metok, 'групп честных': gruppy,
           'комбо3+': комбо, 'наложено порч': порчи, 'алмазов': алмазы,
           'промахов': [pl.misses for pl in pilots],
           'фигур': [pl.placed for pl in pilots],
           'атак': [pl.attacks for pl in pilots],
           'слоёв': [md.rw(io.P1 + 0x7E), md.rw(io.P2 + 0x7E)],
           'групп': [io.groups(md, io.P1), io.groups(md, io.P2)],
           'побед': [md.rb(io.P1 + 0xD8), md.rb(io.P2 + 0xD8)],
           'режим': '%04X' % md.rw(io.MODE)}
    if not quiet:
        print(res)
    return res


if __name__ == '__main__':
    import time
    import train
    frames = int(sys.argv[1]) if len(sys.argv) > 1 else 20000
    layers = int(sys.argv[2]) if len(sys.argv) > 2 else 3
    head, meta = train.load()
    print('сеть: поколение %d, стойкость %.0f' % (meta['gen'], meta['fitness']))
    t0 = time.time()
    r = run_duel(head, head, layers=layers, max_frames=frames)
    print('время %.0f с' % (time.time() - t0))
