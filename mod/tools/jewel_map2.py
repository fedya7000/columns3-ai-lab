# Соответствие ЦВЕТ КАМНЯ -> ТАЙЛЫ, через подбор привязки сетки поля к экрану.
#
# Запись в массив поля экран не перерисовывает, поэтому идём от обратного:
# берём НАСТОЯЩУЮ картину боя и ищем такое начало сетки на карте экрана,
# при котором «одинаковый цвет -> одинаковые тайлы» выполняется для всех клеток.
import sys, os
from collections import defaultdict, Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, ROW, ROWS, COLS, field_base

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(1500):                      # дать боту навалить разных камней
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()

r = md.vdp_reg
planeA = (r[0x02] & 0x38) << 10
sz = r[0x10]
PW = {0: 32, 1: 64, 2: 64, 3: 128}[sz & 3]
print(f"план A = ${planeA:04X}, ширина карты {PW} клеток")

base = field_base(md, P1)
field = [[md.rw(base + rr * ROW + cc * 2) for cc in range(COLS)] for rr in range(ROWS)]
filled = [(rr, cc) for rr in range(ROWS) for cc in range(COLS) if 0 < field[rr][cc] < 0xFF]
print(f"занятых клеток поля: {len(filled)}")


def tile_at(cx, cy):
    a = planeA + ((cy % 32) * PW + (cx % PW)) * 2
    w = (md.vram[a] << 8) | md.vram[a + 1]
    return w & 0x7FF, (w >> 13) & 3


best = None
for y0 in range(0, 32):
    for x0 in range(0, PW):
        m = defaultdict(set)
        ok = True
        for rr, cc in filled:
            t, p = tile_at(x0 + cc * 2, y0 + rr * 2)
            if t == 0:
                ok = False
                break
            m[field[rr][cc]].add(t)
        if not ok:
            continue
        # хорошая привязка: у каждого цвета РОВНО один верхне-левый тайл
        score = sum(1 for v in m.values() if len(v) == 1)
        if len(m) >= 4 and (best is None or score > best[0]):
            best = (score, x0, y0, dict(m))

if not best:
    print("привязку подобрать не удалось")
    sys.exit(1)

score, x0, y0, m = best
print(f"\nпривязка: начало сетки поля игрока 1 = клетка ({x0}, {y0}); "
      f"цветов совпало однозначно: {score} из {len(m)}")
print("\nцвет | верхне-левый тайл | четыре тайла камня | адрес в видеопамяти")
for color in sorted(m):
    tl = sorted(m[color])
    if len(tl) == 1:
        t = tl[0]
        print(f"  {color}  |  ${t:03X} ({t:4})     | ${t:03X}..${t+3:03X}        | ${t*32:04X}..${t*32+127:04X}")
    else:
        print(f"  {color}  |  неоднозначно: {[f'${t:03X}' for t in tl]}")
