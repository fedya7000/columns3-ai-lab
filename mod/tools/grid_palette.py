# Какие индексы палитры занимает СЕТКА пустого поля.
# Нужно, чтобы новая палитра не испортила разметку поля.
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2, ROW, ROWS, COLS, field_base

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(400):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()

r = md.vdp_reg
planeA = (r[0x02] & 0x38) << 10
PW = {0: 32, 1: 64, 2: 64, 3: 128}[r[0x10] & 3]
X0, Y0 = 7, 1                      # привязка сетки поля игрока 1 (найдена ранее)


def cell_tile(cx, cy):
    a = planeA + ((cy % 32) * PW + (cx % PW)) * 2
    w = (md.vram[a] << 8) | md.vram[a + 1]
    return w & 0x7FF, (w >> 13) & 3


def tile_indices(t):
    c = Counter()
    for y in range(8):
        for x in range(8):
            c[md._tile_px(t, x, y, 0, 0)] += 1
    return c


for who, x0 in (('игрок 1', X0), ('игрок 2', X0 + 32)):
    base = field_base(md, P1 if who.endswith('1') else P2)
    # берём заведомо ПУСТУЮ клетку — верхний ряд
    empty_r, empty_c = 0, 0
    if md.rw(base + empty_r * ROW + empty_c * 2) != 0:
        empty_r = 1
    t, p = cell_tile(x0 + empty_c * 2, Y0 + empty_r * 2)
    print(f"{who}: пустая клетка -> тайл ${t:03X}, палитра {p}")
    if t:
        print(f"   индексы в тайле: {dict(tile_indices(t))}")
