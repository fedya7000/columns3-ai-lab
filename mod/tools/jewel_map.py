# Точное соответствие ЦВЕТ КАМНЯ -> ЧЕТЫРЕ ТАЙЛА.
#
# Шум отсекаем так: сперва ОДИН раз находим адреса четырёх клеток экрана,
# которыми рисуется одна клетка поля (пересечение двух диффов: положили камень /
# убрали камень). Дальше просто ЧИТАЕМ эти четыре адреса для каждого цвета.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, ROW, field_base

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(200):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()

base = field_base(md, P1)
ROWCELL, COLCELL = 12, 0
CELL = base + ROWCELL * ROW + COLCELL * 2


def put(v):
    md.uc.mem_write(CELL, bytes([0, v]))


def snap():
    return bytes(md.vram[0xC000:0xE000])


def step(n=4):
    for _ in range(n):
        md.step_frame()


put(0); step(8)
a0 = snap()
put(3); step(8)
a1 = snap()
put(0); step(8)
a2 = snap()

ch1 = {i for i in range(0, 0x2000, 2) if a0[i:i+2] != a1[i:i+2]}
ch2 = {i for i in range(0, 0x2000, 2) if a1[i:i+2] != a2[i:i+2]}
cells = sorted(ch1 & ch2)
print(f"клетки экрана, рисующие одну клетку поля: {[f'$C{c:03X}' for c in cells]}")
if len(cells) != 4:
    print("ОЖИДАЛИСЬ ЧЕТЫРЕ (камень 2x2 тайла) — замер ненадёжен")

print("\nцвет | тайлы четырёх клеток | палитра")
for color in range(1, 7):
    put(color); step(8)
    v = snap()
    tiles, pals = [], set()
    for c in cells:
        w = (v[c] << 8) | v[c + 1]
        tiles.append(w & 0x7FF)
        pals.add((w >> 13) & 3)
    print(f"  {color}  | " + ' '.join(f"${t:03X}" for t in tiles)
          + f" | {sorted(pals)}  (в видеопамяти ${min(tiles)*32:04X})")
    put(0); step(6)
