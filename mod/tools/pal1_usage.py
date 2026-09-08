# Палитра 1: какие цвета, какие индексы занимает маскот, а какие — прочее.
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(600):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()

import struct
pal = md._palette()
print("палитра 1:")
for i in range(16):
    w = struct.unpack('>H', bytes(md.cram[(16 + i) * 2:(16 + i) * 2 + 2]))[0]
    print(f"  {i:2}: ${w:04X}  {pal[16 + i]}")

r = md.vdp_reg
planeA = (r[0x02] & 0x38) << 10
mascot, other = Counter(), Counter()
other_tiles = set()
for cy in range(28):
    for cx in range(40):
        a = planeA + (cy * 64 + cx) * 2
        w = (md.vram[a] << 8) | md.vram[a + 1]
        t, p = w & 0x7FF, (w >> 13) & 3
        if p != 1 or t == 0:
            continue
        bucket = mascot if 0x4F0 <= t <= 0x540 else other
        if bucket is other:
            other_tiles.add(t)
        for y in range(8):
            for x in range(8):
                bucket[md._tile_px(t, x, y, 0, 0)] += 1

print("\nиндексы, занятые МАСКОТОМ:", sorted(mascot))
print("индексы, занятые ПРОЧИМ палитры 1:", sorted(other))
print("прочие тайлы палитры 1:", sorted(f'${t:03X}' for t in other_tiles)[:20])
