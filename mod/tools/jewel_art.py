# Показывает нынешние камни крупно и печатает палитру 2 —
# то, из чего придётся рисовать новые фигуры.
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

out = os.path.join(os.path.dirname(__file__), '..', 'shots', 'vram')
os.makedirs(out, exist_ok=True)
pal = md._palette()

print("палитра 2 (её используют камни): индекс -> цвет")
raw = md.cram
for i in range(16):
    w = (raw[(32 + i) * 2] << 8) | raw[(32 + i) * 2 + 1]
    b = (w >> 9) & 7; g = (w >> 5) & 7; r_ = (w >> 1) & 7
    print(f"  {i:2}: слово ${w:04X}  R{r_} G{g} B{b}  -> {pal[32+i]}")

# шесть камней 16x16, каждый = 4 тайла подряд (ТЛ, НЛ, ТП, НП)
SC = 12
img = Image.new('RGB', (6 * 16 * SC, 16 * SC), (0, 0, 0))
px = img.load()
for j in range(6):
    base_tile = 0x100 + j * 4
    for qy in range(2):
        for qx in range(2):
            t = base_tile + qx * 2 + qy
            for y in range(8):
                for x in range(8):
                    c = md._tile_px(t, x, y, 0, 0)
                    col = pal[32 + c] if c else (0, 0, 0)
                    X = (j * 16 + qx * 8 + x) * SC
                    Y = (qy * 8 + y) * SC
                    for dy in range(SC):
                        for dx in range(SC):
                            px[X + dx, Y + dy] = col
img.save(os.path.join(out, 'jewels_now.png'))
print("\nнынешние шесть камней -> shots/vram/jewels_now.png")

# сколько разных цветов реально используется в камнях
used = set()
for j in range(6):
    for t in range(0x100 + j * 4, 0x104 + j * 4):
        for y in range(8):
            for x in range(8):
                used.add(md._tile_px(t, x, y, 0, 0))
print("индексы палитры, задействованные в камнях:", sorted(used))
