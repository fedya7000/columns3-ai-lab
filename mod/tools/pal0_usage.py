# Какие индексы палитры 0 заняты КОНСТРУКТИВНЫМИ тайлами (поле, разметка,
# коробки панелей) и спрайтами, а какие свободны под новое небо.
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

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
planeB = (r[0x04] & 0x07) << 13
pal = md._palette()

print("палитра 0:")
for i in range(16):
    print(f"  {i:2}: {pal[i]}")


def tile_max(t):
    mx = 0
    for y in range(8):
        for x in range(8):
            c = md._tile_px(t, x, y, 0, 0)
            col = pal[c]
            mx = max(mx, col[0], col[1], col[2])
    return mx


struct_idx, deco_idx = Counter(), Counter()
for cy in range(28):
    for cx in range(40):
        a = planeB + (cy * 64 + cx) * 2
        w = (md.vram[a] << 8) | md.vram[a + 1]
        t = w & 0x7FF
        bucket = deco_idx if tile_max(t) > 80 else struct_idx
        for y in range(8):
            for x in range(8):
                bucket[md._tile_px(t, x, y, 0, 0)] += 1

print("\nиндексы у КОНСТРУКТИВНЫХ тайлов (их менять нельзя):",
      sorted(struct_idx))
print("индексы у УКРАШЕНИЙ (стена, ирисы) — их можно переназначить:",
      sorted(deco_idx))

# спрайты палитры 0
spr = (r[0x05] & 0x7F) << 9
idx = 0
sprite_idx = Counter()
for _ in range(80):
    e = spr + idx * 8
    attr = (md.vram[e + 4] << 8) | md.vram[e + 5]
    t = attr & 0x7FF
    p = (attr >> 13) & 3
    szb = md.vram[e + 2]
    wc = ((szb >> 2) & 3) + 1
    hc = (szb & 3) + 1
    if t and p == 0:
        for k in range(wc * hc):
            for y in range(8):
                for x in range(8):
                    sprite_idx[md._tile_px(t + k, x, y, 0, 0)] += 1
    idx = md.vram[e + 3] & 0x7F
    if idx == 0:
        break
print("индексы у спрайтов палитры 0 (петухи и рамка):", sorted(sprite_idx))
