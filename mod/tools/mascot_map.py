# Точная раскладка маскота: какие клетки плана A какими тайлами его рисуют.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1
from PIL import Image

ROM = sys.argv[1] if len(sys.argv) > 1 else os.path.join(
    os.path.dirname(__file__), '..', 'rom', 'Columns III (USA).gen')

md = session.new(ROM)
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
planeA = (r[0x02] & 0x38) << 10
pal = md._palette()

cells = []
for cy in range(28):
    for cx in range(40):
        a = planeA + (cy * 64 + cx) * 2
        w = (md.vram[a] << 8) | md.vram[a + 1]
        t = w & 0x7FF
        if 0x4F0 <= t <= 0x540:
            cells.append((cx, cy, t, (w >> 13) & 3, (w >> 11) & 1, (w >> 12) & 1))

print(f"клеток маскота: {len(cells)}")
for cx, cy, t, p, hf, vf in cells:
    print(f"  клетка ({cx:2},{cy:2})  тайл ${t:03X}  палитра {p}"
          + ("  отражён" if hf or vf else ""))

if cells:
    x0 = min(c[0] for c in cells); x1 = max(c[0] for c in cells)
    y0 = min(c[1] for c in cells); y1 = max(c[1] for c in cells)
    print(f"\nпрямоугольник: клетки ({x0},{y0})..({x1},{y1}) = "
          f"{x1-x0+1}x{y1-y0+1} клеток")
    SC = 12
    img = Image.new('RGB', ((x1 - x0 + 1) * 8 * SC, (y1 - y0 + 1) * 8 * SC), (16, 16, 24))
    px = img.load()
    for cx, cy, t, p, hf, vf in cells:
        for y in range(8):
            for x in range(8):
                c = md._tile_px(t, x, y, hf, vf)
                col = pal[p * 16 + c] if c else (16, 16, 24)
                for dy in range(SC):
                    for dx in range(SC):
                        px[((cx - x0) * 8 + x) * SC + dx, ((cy - y0) * 8 + y) * SC + dy] = col
    out = os.path.join(os.path.dirname(__file__), '..', 'shots', 'mascot')
    os.makedirs(out, exist_ok=True)
    img.save(os.path.join(out, 'mascot_real.png'))
    print("картинка -> shots/mascot/mascot_real.png")
