# Какими тайлами рисуется ПАДАЮЩАЯ фигура (она идёт спрайтами)
# и что за 20 «не-камней» палитры 2.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1
from PIL import Image

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

r = md.vdp_reg
spr = (r[0x05] & 0x7F) << 9
print("таблица спрайтов:")
idx = 0
for _ in range(80):
    e = spr + idx * 8
    y = ((md.vram[e] << 8) | md.vram[e + 1]) & 0x3FF
    szb = md.vram[e + 2]
    link = md.vram[e + 3] & 0x7F
    attr = (md.vram[e + 4] << 8) | md.vram[e + 5]
    x = ((md.vram[e + 6] << 8) | md.vram[e + 7]) & 0x1FF
    tile = attr & 0x7FF
    pal = (attr >> 13) & 3
    w = ((szb >> 2) & 3) + 1
    h = (szb & 3) + 1
    if tile:
        print(f"  спрайт {idx:2}: тайл ${tile:03X} палитра {pal} размер {w}x{h} "
              f"экран ({x-128},{y-128})")
    idx = link
    if link == 0:
        break

# нарисуем группы «не-камней» палитры 2, чтобы понять, что это
pal = md._palette()
groups = [0x1EC, 0x200, 0x214, 0x228, 0x23C]
SC = 10
img = Image.new('RGB', (len(groups) * 16 * SC, 16 * SC), (0, 0, 0))
px = img.load()
for j, base_tile in enumerate(groups):
    for qy in range(2):
        for qx in range(2):
            t = base_tile + qx * 2 + qy
            for yy in range(8):
                for xx in range(8):
                    c = md._tile_px(t, xx, yy, 0, 0)
                    col = pal[32 + c] if c else (0, 0, 0)
                    X = (j * 16 + qx * 8 + xx) * SC
                    Y = (qy * 8 + yy) * SC
                    for dy in range(SC):
                        for dx in range(SC):
                            px[X + dx, Y + dy] = col
out = os.path.join(os.path.dirname(__file__), '..', 'shots', 'vram', 'pal2_others.png')
img.save(out)
print(f"\nпять групп «не-камней» палитры 2 -> {os.path.basename(out)}")
