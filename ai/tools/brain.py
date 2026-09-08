# Голова бота: признаки поля, оценка и перебор ходов.
#
# Устройство, общее для черновой оценки и для нейросети:
#   поле -> ПРИЗНАКИ (числа) -> ОЦЕНКА (одно число) -> перебор берёт максимум.
# Черновик считает оценку линейно по своим весам, сеть — маленькой MLP.
# Признаки у обоих одни и те же, поэтому их можно честно сравнивать.
#
# Особенность Columns, важная для признаков: дырок под камнями НЕ бывает.
# После каждого схлопывания гравитация уплотняет столбики, поэтому колонка
# всегда сплошная. Значит главный признак тетриса — «дырки» — здесь не нужен,
# зато решают ровность поля и соседство одинаковых цветов.
import math

import numpy as np

import rules

COLS = rules.COLS
TOTAL = rules.TOTAL
VIS = rules.VIS
MAXH = TOTAL - rules.DEAD_ROW - 1     # 14 — предельная высота, дальше смерть

N_HIDDEN = 32          # было 16
N_FEATURES = 32        # было 22, см. extract


def heights(field):
    hs = []
    for c in range(COLS):
        h = 0
        i = (TOTAL - 1) * COLS + c
        while i >= 0 and field[i]:
            h += 1
            i -= COLS
        hs.append(h)
    return hs


def _pairs_and_triples(field):
    """Соседство одинаковых цветов: сколько пар и сколько почти-линий.

    Пара — два одинаковых камня рядом по любому из четырёх направлений.
    Почти-линия — два одинаковых в линию, и третья клетка в ней ещё пуста,
    то есть сбор реально можно достроить.
    """
    pairs = 0
    almost = 0
    for r in range(VIS, TOTAL):
        for c in range(COLS):
            v = field[r * COLS + c]
            if not v:
                continue
            for dr, dc in ((0, 1), (1, 0), (1, 1), (1, -1)):
                nr, nc = r + dr, c + dc
                if not (VIS <= nr < TOTAL and 0 <= nc < COLS):
                    continue
                if field[nr * COLS + nc] != v:
                    continue
                pairs += 1
                # можно ли достроить до трёх с любого конца
                for er, ec in ((r - dr, c - dc), (nr + dr, nc + dc)):
                    if VIS <= er < TOTAL and 0 <= ec < COLS and field[er * COLS + ec] == 0:
                        almost += 1
    return pairs, almost


def wall_depth(field):
    """Сколько нижних рядов занято слоями или полом.

    ⚠️ Без этого высота колонки считается ОТ ПОЛА ЭКРАНА, а не от дна игры:
    при семи слоях бот видел стопку высотой 10, хотя настоящих камней было три.
    В бою слои доходят до семи и больше — и оценка поля врала почти втрое
    ровно тогда, когда точность нужнее всего (вскрытие: tools\vskrytie.py).
    """
    n = 0
    i = (TOTAL - 1) * COLS
    while i >= 0 and field[i] == rules.WALL:
        n += 1
        i -= COLS
    return n


def _gotovye(field, дно):
    """Сколько мест, куда ОДИН камень достроит линию из трёх.

    Это самый прямой ответ на вопрос «насколько поле заряжено»: не просто
    «есть ли рядом одинаковые», а «сколькими способами прямо сейчас можно
    забить». Считаем только по клеткам, куда камень реально может лечь —
    прямо на верхушку столбика, иначе это мечты, а не ход.
    """
    мест = 0
    цветов = 0
    for цвет in range(1, 7):
        нашли = False
        for c in range(COLS):
            # верхушка столбика: первая занятая сверху, кладём НАД ней
            r = 0
            while r < TOTAL and not field[r * COLS + c]:
                r += 1
            r -= 1
            if r < VIS:
                continue
            i = r * COLS + c
            старое = field[i]
            field[i] = цвет
            есть = False
            for dr, dc in ((0, 1), (1, 0), (1, 1), (1, -1)):
                n = 1
                for знак in (1, -1):
                    nr, nc = r + dr * знак, c + dc * знак
                    while (VIS <= nr < TOTAL and 0 <= nc < COLS
                           and field[nr * COLS + nc] == цвет):
                        n += 1
                        nr += dr * знак
                        nc += dc * знак
                if n >= 3:
                    есть = True
                    break
            field[i] = старое
            if есть:
                мест += 1
                нашли = True
        if нашли:
            цветов += 1
    return мест, цветов


def extract(field, stones, chain, groups):
    """Признаки поля. Числа держим примерно в пределах [-3, 3]."""
    дно = wall_depth(field)
    глубина = max(1, MAXH - дно)                    # сколько играбельного осталось
    hs = [h - дно for h in heights(field)]
    mx = max(hs)
    mn = min(hs)
    total = sum(hs)
    bump = sum(abs(hs[i] - hs[i + 1]) for i in range(COLS - 1))
    pairs, almost = _pairs_and_triples(field)

    f = [h / глубина for h in hs]                   # 6 — высоты колонок
    f += [(hs[i + 1] - hs[i]) / глубина for i in range(COLS - 1)]   # 5 — перепады
    f.append(mx / глубина)                          # предельная высота
    f.append(mn / глубина)
    f.append(total / (COLS * глубина))              # средняя загрузка
    f.append(bump / (COLS * глубина))               # неровность
    f.append((mx - mn) / глубина)                   # разброс
    f.append(min(stones, 12) / 6.0)                 # собрано камней
    f.append(min(chain, 5) / 2.0)                   # длина цепочки
    f.append(min(groups, 6) / 3.0)                  # сколько групп
    f.append(min(pairs, 40) / 20.0)                 # соседство цветов
    f.append(min(almost, 40) / 20.0)                # достраиваемые линии

    # --- добавлено: то, чего сети не хватало ---
    f.append(дно / 13.0)                            # насколько поле поджато слоями
    f.append((глубина - mx) / глубина)              # запас до смерти
    цвета = [0] * 7
    for v in field:
        if 0 < v <= 6:
            цвета[v] += 1
    всего_камней = max(1, sum(цвета))
    f += [цвета[k] / всего_камней for k in range(1, 7)]   # 6 — доли цветов
    мест, цв = _gotovye(field, дно)
    f.append(min(мест, 12) / 6.0)                   # сколькими способами можно забить
    f.append(цв / 6.0)                              # сколькими разными цветами

    f.append(1.0)                                   # свободный член
    return f


# ------------------------------------------------------------------ оценки

class Linear:
    """Черновая голова: оценка = сумма признаков с весами. Веса выставлены руками."""

    def __init__(self, w=None):
        self.w = np.asarray(w if w is not None else HAND_WEIGHTS, dtype=np.float64)

    def value(self, f):
        return float(np.dot(self.w, f))

    def value_batch(self, F):
        """Оценка сразу для всех вариантов: F — таблица (сколько вариантов) x признаки."""
        return F @ self.w


class MLP:
    """Сеть: признаки -> скрытый слой (tanh) -> одно число.

    Все веса лежат одним плоским списком, чтобы обучение поколениями могло
    их просто перемешивать.
    """

    def __init__(self, weights, n_in=N_FEATURES, n_hidden=16):
        self.n_in, self.n_hidden = n_in, n_hidden
        w = np.asarray(weights, dtype=np.float64)
        self.w = w
        o = n_in * n_hidden
        self.W1 = w[:o].reshape(n_hidden, n_in)     # скрытый слой
        self.b1 = w[o:o + n_hidden]
        self.w2 = w[o + n_hidden:o + 2 * n_hidden]  # выходной слой
        self.b2 = w[-1]

    @staticmethod
    def size(n_in=N_FEATURES, n_hidden=16):
        return n_in * n_hidden + n_hidden + n_hidden + 1

    def value(self, f):
        h = np.tanh(self.W1 @ np.asarray(f) + self.b1)
        return float(h @ self.w2 + self.b2)

    def value_batch(self, F):
        H = np.tanh(F @ self.W1.T + self.b1)
        return H @ self.w2 + self.b2


# Зеркалирование в пространстве признаков (см. extract): высоты идут
# колонками 0..5, перепады — парами соседних. Всё остальное (максимум,
# минимум, загрузка, неровность, разброс, сборы, доли цветов, забитые места)
# при отражении поля не меняется.
_ZERK_H = [5, 4, 3, 2, 1, 0]
_ZERK_D = [10, 9, 8, 7, 6]


def zerkalo_priznakov(F):
    """Отражение поля колонками задом наперёд, но в пространстве признаков.

    Зачем: игра симметрична зеркально, а обученная сеть — НЕТ (замер
    build/_ox_zerkalo.py: зеркальный остаток скрытого слоя 0.58 против 0.47
    у линейной части). Отсюда табу на колонки 1 и 5: бот доигрывался до
    смерти с пустой колонкой во всю высоту. Оценка усредняется с оценкой
    зеркального поля — это чинит ЛЮБУЮ несимметрию (и скрытого слоя, и
    прямой связки) без переобучения, потому что признаки отражаются точно.
    """
    F = np.asarray(F)
    G = F.copy()
    G[..., 0:6] = F[..., _ZERK_H]
    G[..., 6:11] = -F[..., _ZERK_D]
    return G


class Net:
    """Сеть с прямой связкой: скрытый слой tanh ПЛЮС прямой линейный ход.

    Зачем прямая связка: она позволяет начать обучение ровно с черновой
    головы. Ставим линейную часть равной подобранным руками весам, а выход
    скрытого слоя — в ноль, и сеть в первом же поколении играет не хуже
    черновика. Дальше отбор наращивает нелинейную часть — то есть сеть может
    только улучшать, а не начинать с нуля и годами догонять.

    Все веса лежат одним плоским списком, чтобы отбор просто их перемешивал.

    ⭐ Оценка СИММЕТРИЧНА: усредняется с оценкой зеркального поля
    (zerkalo_priznakov). Без этого сеть различает зеркальные позиции, которых
    игра не различает, и запрещает себе колонки без всякой причины.
    """

    def __init__(self, weights, n_in=N_FEATURES, n_hidden=N_HIDDEN):
        self.n_in, self.n_hidden = n_in, n_hidden
        w = np.asarray(weights, dtype=np.float64)
        self.w = w
        o = n_in * n_hidden
        self.W1 = w[:o].reshape(n_hidden, n_in)
        self.b1 = w[o:o + n_hidden]
        self.w2 = w[o + n_hidden:o + 2 * n_hidden]
        self.b2 = w[o + 2 * n_hidden]
        self.lin = w[o + 2 * n_hidden + 1:]

    @staticmethod
    def size(n_in=N_FEATURES, n_hidden=N_HIDDEN):
        return n_in * n_hidden + n_hidden + n_hidden + 1 + n_in

    @staticmethod
    def seed_weights(n_in=N_FEATURES, n_hidden=N_HIDDEN, rng=None, spread=0.15):
        """Стартовые веса: линейная часть — черновик, нелинейная — почти ноль."""
        rng = rng or np.random.default_rng(0)
        w = np.zeros(Net.size(n_in, n_hidden))
        o = n_in * n_hidden
        w[:o] = rng.normal(0, spread, o)      # скрытый слой — случайные признаки
        w[o + 2 * n_hidden + 1:] = HAND_WEIGHTS
        return w

    def value(self, f):
        f = np.asarray(f)
        h = np.tanh(self.W1 @ f + self.b1)
        return float(h @ self.w2 + self.b2 + f @ self.lin)

    def value_batch(self, F):
        F = np.asarray(F)
        H = np.tanh(F @ self.W1.T + self.b1)
        G = zerkalo_priznakov(F)
        Hg = np.tanh(G @ self.W1.T + self.b1)
        return (0.5 * (H @ self.w2 + F @ self.lin
                       + Hg @ self.w2 + G @ self.lin))


# Руками подобранные веса черновика. Знаки важнее величин:
# высоко — плохо, неровно — плохо, собрал — хорошо, цвета рядом — хорошо.
HAND_WEIGHTS = (
    [-0.35] * 6 +                    # высоты колонок
    [0.0] * 5 +                      # перепады сами по себе безразличны
    [-2.2,                           # максимальная высота — главный враг
     0.25,                           # ровное дно чуть лучше
     -1.6,                           # общая загрузка
     -1.1,                           # неровность
     -0.5,                           # разброс
     1.4,                            # собранные камни
     1.0,                            # цепочка
     0.3,                            # группы
     0.22,                           # соседство цветов
     0.35,                           # достраиваемые линии
     -0.4,                           # поджатость слоями
     0.8,                            # запас до смерти
     0.0, 0.0, 0.0, 0.0, 0.0, 0.0,   # доли цветов — пусть решает отбор
     0.6,                            # сколькими способами можно забить
     0.3,                            # сколькими разными цветами
     0.0]                            # свободный член
)


# ------------------------------------------------------------------ перебор

DEATH = -1e9


def best_move(field, cur, nxt, brain, depth=2, noise=0.0, rng=None):
    """Перебирает все 18 ходов (и все 18 ответов на следующую фигуру).

    Признаки всех вариантов считаются впрок и оцениваются ОДНИМ вызовом:
    для сети это разница между 18 крошечными умножениями матриц и одним,
    то есть между «медленно» и «быстро».

    noise — капелька случайности в оценке. Нужна не для ума, а против
    ЗЕРКАЛА: в бою игра выдаёт обоим ОДНУ И ТУ ЖЕ ленту фигур, и два
    одинаковых бота ходят пиксель в пиксель одинаково, пока что-нибудь не
    нарушит симметрию. С шумом они расходятся с первого же спорного хода,
    а на явно лучший ход он не влияет — слишком мал.

    Возвращает (колонка, поворот, оценка). Если ходов нет — (None, None, DEATH).
    """
    first = []
    for col in range(COLS):
        for rot in range(3):
            r = rules.apply(field, col, rot, cur)
            if r is None:
                continue
            f1, stones, chain, groups = r
            if rules.is_dead(f1):
                continue
            first.append((col, rot, f1, stones, chain, groups))

    if not first:
        for col in range(COLS):
            for rot in range(3):
                if rules.apply(field, col, rot, cur) is not None:
                    return (col, rot, DEATH)
        return (None, None, DEATH)

    if depth <= 1 or nxt is None:
        F = np.array([extract(f1, st, ch, gr) for _, _, f1, st, ch, gr in first])
        vals = brain.value_batch(F)
        if noise and rng is not None:
            vals = vals + noise * rng.standard_normal(len(vals))
        k = int(np.argmax(vals))
        return (first[k][0], first[k][1], float(vals[k]))

    feats = []
    owner = []
    for idx, (_, _, f1, stones, chain, groups) in enumerate(first):
        for c2 in range(COLS):
            for r2 in range(3):
                r = rules.apply(f1, c2, r2, nxt)
                if r is None:
                    continue
                f2, s2, ch2, g2 = r
                if rules.is_dead(f2):
                    continue
                feats.append(extract(f2, s2 + stones, max(ch2, chain), g2 + groups))
                owner.append(idx)
    if not feats:
        # любой ответ ведёт к смерти — выбираем лучший ход на один шаг
        F = np.array([extract(f1, st, ch, gr) for _, _, f1, st, ch, gr in first])
        vals = brain.value_batch(F)
        k = int(np.argmax(vals))
        return (first[k][0], first[k][1], DEATH)

    vals = brain.value_batch(np.array(feats))
    if noise and rng is not None:
        vals = vals + noise * rng.standard_normal(len(vals))
    best_by_first = {}
    for v, idx in zip(vals, owner):
        if idx not in best_by_first or v > best_by_first[idx]:
            best_by_first[idx] = v
    idx = max(best_by_first, key=best_by_first.get)
    return (first[idx][0], first[idx][1], float(best_by_first[idx]))
