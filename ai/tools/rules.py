# Быстрый клон правил Columns III — тренажёр для обучения без эмулятора.
#
# Зачем: эмулятор даёт около 5 фигур в секунду, сети нужны миллионы.
# Здесь те же правила, но без процессора, графики и звука.
#
# ⚠️ Всё, что здесь написано, обязано совпадать с настоящей игрой клетка в
# клетку. Проверяется файлом verify.py — гоняет обе игры бок о бок.
#
# Устройство поля (docs\IGRA.md, раздел 3):
#   плоский список из 19*6 чисел, индекс = ряд*6 + колонка;
#   ряд 0..5   — шесть СКРЫТЫХ рядов над экраном;
#   ряд 6..18  — тринадцать видимых рядов, 18 — самый низ;
#   значение   — 0 пусто, 1..6 цвет.
#
# Главная причуда игры: сканеры линий стартуют с первого ВИДИМОГО ряда и
# скрытых не видят вовсе. Здесь это ряд 6.
import random

COLS = 6
ROWS = 13
HIDDEN = 6
TOTAL = HIDDEN + ROWS       # 19
SIZE = TOTAL * COLS         # 114
VIS = HIDDEN                # индекс первого видимого ряда
DEAD_ROW = 4                # стопка достала ряд -2 — проигрыш
WALL = 9                    # стена или СЛОЙ: место занято, но в линию не идёт

# ⚠️ Слои (см. docs\IGRA.md, раздел 5в) поднимают дно поля, и снизу появляется
# сплошной ряд стены. Если считать её обычными камнями, выходит шесть
# одинаковых подряд — и тренажёр решает, что этот ряд сейчас схлопнется.
# Тогда бот планирует по полю, которого нет. Поэтому всё, что больше 6,
# считается занятым, но в линиях НЕ участвует.

# Набор цветов боя 1on1: таблица $D5CC, запись 2 (docs\IGRA.md, раздел 5).
COLOR_SET_1ON1 = [1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 1, 2, 3, 4,
                  5, 6, 1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 1, 2]


def empty_field(layers=0):
    """Пустое поле. layers — сколько нижних рядов занято слоями (0..5).

    Слои поднимают дно: играть остаётся 13 - layers рядов. Сеть, выученная на
    полном поле, в мелком ошибается — она считает высоту от старого дна.
    """
    f = [0] * SIZE
    for r in range(TOTAL - layers, TOTAL):
        for c in range(COLS):
            f[r * COLS + c] = WALL
    return f


def cycle(colors, k):
    """Поворот кнопкой B: (верх, середина, низ) -> (низ, верх, середина)."""
    a, b, c = colors
    for _ in range(k % 3):
        a, b, c = c, a, b
    return (a, b, c)


def column_height(field, c):
    """Столбики всегда сплошные: дырок в них не бывает, гравитация их убирает."""
    h = 0
    i = (TOTAL - 1) * COLS + c
    while i >= 0 and field[i]:
        h += 1
        i -= COLS
    return h


def drop(field, col, colors):
    """Кладёт фигуру в колонку. Возвращает новое поле или None, если не влезает."""
    h = column_height(field, col)
    bottom = TOTAL - 1 - h
    if bottom - 2 < 0:
        return None
    out = field[:]
    out[(bottom - 2) * COLS + col] = colors[0]
    out[(bottom - 1) * COLS + col] = colors[1]
    out[bottom * COLS + col] = colors[2]
    return out


def find_matches(field):
    """Клетки, попавшие в линию из трёх и более. Только видимые ряды."""
    marked = set()
    # горизонталь
    for r in range(VIS, TOTAL):
        base = r * COLS
        c = 0
        while c < COLS:
            v = field[base + c]
            if v and v <= 6:
                e = c + 1
                while e < COLS and field[base + e] == v:
                    e += 1
                if e - c >= 3:
                    marked.update(range(base + c, base + e))
                c = e
            else:
                c += 1
    # вертикаль
    for c in range(COLS):
        r = VIS
        while r < TOTAL:
            v = field[r * COLS + c]
            if v and v <= 6:
                e = r + 1
                while e < TOTAL and field[e * COLS + c] == v:
                    e += 1
                if e - r >= 3:
                    marked.update((k * COLS + c) for k in range(r, e))
                r = e
            else:
                r += 1
    # обе диагонали
    for dc in (1, -1):
        for r in range(VIS, TOTAL):
            for c in range(COLS):
                v = field[r * COLS + c]
                if not v or v > 6:
                    continue
                pr, pc = r - 1, c - dc
                if VIS <= pr < TOTAL and 0 <= pc < COLS and field[pr * COLS + pc] == v:
                    continue            # не начало отрезка
                n, nr, nc = 0, r, c
                while (VIS <= nr < TOTAL and 0 <= nc < COLS
                       and field[nr * COLS + nc] == v):
                    n += 1
                    nr += 1
                    nc += dc
                if n >= 3:
                    nr, nc = r, c
                    for _ in range(n):
                        marked.add(nr * COLS + nc)
                        nr += 1
                        nc += dc
    return marked


def gravity(field):
    """Камни падают вниз по всей высоте, включая скрытые ряды."""
    for c in range(COLS):
        write = TOTAL - 1
        for r in range(TOTAL - 1, -1, -1):
            v = field[r * COLS + c]
            if v:
                if write != r:
                    field[write * COLS + c] = v
                    field[r * COLS + c] = 0
                write -= 1


def resolve(field):
    """Схлопывает всё, что схлопывается, с каскадом. Меняет поле на месте.

    Возвращает (сколько камней собрано, длина цепочки, сколько групп).
    """
    stones = 0
    chain = 0
    groups = 0
    while True:
        marked = find_matches(field)
        if not marked:
            break
        chain += 1
        stones += len(marked)
        groups += _count_groups(field, marked)
        for i in marked:
            field[i] = 0
        gravity(field)
    return stones, chain, groups


def _count_groups(field, marked):
    """Сколько отдельных групп схлопнулось: связные куски одного цвета."""
    seen = set()
    n = 0
    for start in marked:
        if start in seen:
            continue
        n += 1
        v = field[start]
        stack = [start]
        seen.add(start)
        while stack:
            i = stack.pop()
            r, c = divmod(i, COLS)
            for dr in (-1, 0, 1):
                for dc in (-1, 0, 1):
                    if dr == 0 and dc == 0:
                        continue
                    nr, nc = r + dr, c + dc
                    if not (0 <= nr < TOTAL and 0 <= nc < COLS):
                        continue
                    j = nr * COLS + nc
                    if j in marked and j not in seen and field[j] == v:
                        seen.add(j)
                        stack.append(j)
    return n


def is_dead(field):
    """Проигрыш: стопка достала ряд -2 (индекс 4)."""
    for i in range(0, (DEAD_ROW + 1) * COLS):
        if field[i]:
            return True
    return False


def moves():
    """Все 18 ходов: колонка 0..5 на поворот 0..2."""
    return [(c, r) for c in range(COLS) for r in range(3)]


def apply(field, col, rot, colors):
    """Полный ход: поворот, падение, схлопывания.

    Возвращает (новое поле, камней, цепочка, групп) или None, если фигура не влезла.
    """
    f = drop(field, col, cycle(colors, rot))
    if f is None:
        return None
    stones, chain, groups = resolve(f)
    return f, stones, chain, groups


class Dealer:
    """Выдача фигур с тем же распределением цветов, что у игры."""

    def __init__(self, seed=0, color_set=None):
        self.rng = random.Random(seed)
        self.set = color_set or COLOR_SET_1ON1

    def piece(self):
        s = self.set
        return (self.rng.choice(s), self.rng.choice(s), self.rng.choice(s))
