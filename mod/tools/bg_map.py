# Разбор ФОНА локации: карта плана B, сколько уникальных тайлов,
# и отдельная картинка одного только фона (без поля и спрайтов).
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1
from PIL import Image

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
planeB = (r[0x04] & 0x07) << 13
PW = {0: 32, 1: 64, 2: 64, 3: 128}[r[0x10] & 3]
PH = {0: 32, 1: 64, 2: 64, 3: 128}[(r[0x10] >> 4) & 3]
print(f"план A=${planeA:04X}  план B=${planeB:04X}  карта {PW}x{PH}")
print(f"размер экрана: {'320x224 (40x28 клеток)' if (r[0x0C] & 0x81) == 0x81 else '256x224'}")
print(f"прокрутка: режим гориз.=${r[0x0B] & 3:X}, таблица гориз.=${(r[0x0D] & 0x3F) << 10:04X}")

# горизонтальная прокрутка планов (первые значения)
hs = (r[0x0D] & 0x3F) << 10
ha = (md.vram[hs] << 8) | md.vram[hs + 1]
hb = (md.vram[hs + 2] << 8) | md.vram[hs + 3]
va = (md.vsram[0] << 8) | md.vsram[1]
vb = (md.vsram[2] << 8) | md.vsram[3]
print(f"смещение: A(гор={ha} верт={va})  B(гор={hb} верт={vb})")


def cell(base, cx, cy):
    a = base + ((cy % PH) * PW + (cx % PW)) * 2
    w = (md.vram[a] << 8) | md.vram[a + 1]
    return w & 0x7FF, (w >> 13) & 3, (w >> 11) & 1, (w >> 12) & 1


tiles = Counter()
pals = Counter()
for cy in range(28):
    for cx in range(40):
        t, p, hf, vf = cell(planeB, cx, cy)
        tiles[t] += 1
        pals[p] += 1
print(f"\nплан B на видимом экране: уникальных тайлов {len(tiles)}, палитры {dict(pals)}")
print(f"самые частые тайлы: {[f'${t:03X}x{n}' for t, n in tiles.most_common(6)]}")
nz = [t for t in tiles if t]
if nz:
    print(f"диапазон непустых тайлов: ${min(nz):03X}..${max(nz):03X}")

# картинка одного фона
pal = md._palette()
img = Image.new('RGB', (320, 224), (0, 0, 0))
px = img.load()
for cy in range(28):
    for cx in range(40):
        t, p, hf, vf = cell(planeB, cx, cy)
        for y in range(8):
            for x in range(8):
                c = md._tile_px(t, x, y, hf, vf)
                px[cx * 8 + x, cy * 8 + y] = pal[p * 16 + c]
img = img.resize((640, 448), Image.NEAREST)
out = os.path.join(os.path.dirname(__file__), '..', 'shots', 'bg')
os.makedirs(out, exist_ok=True)
img.save(os.path.join(out, 'plane_b.png'))
print("картинка фона -> shots/bg/plane_b.png")

# и план A отдельно
img2 = Image.new('RGB', (320, 224), (0, 0, 0))
px2 = img2.load()
for cy in range(28):
    for cx in range(40):
        t, p, hf, vf = cell(planeA, cx, cy)
        for y in range(8):
            for x in range(8):
                c = md._tile_px(t, x, y, hf, vf)
                px2[cx * 8 + x, cy * 8 + y] = pal[p * 16 + c] if c else (20, 0, 40)
img2 = img2.resize((640, 448), Image.NEAREST)
img2.save(os.path.join(out, 'plane_a.png'))
print("картинка плана A -> shots/bg/plane_a.png")
