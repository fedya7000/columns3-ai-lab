# Показывает диапазон тайлов блоками 16x16 (2x2 тайла, порядок ТЛ/НЛ/ТП/НП)
# в заданной палитре — чтобы разбирать наборы графики.
#
# python tiles_view.py <первый_тайл_hex> <сколько_блоков> [палитра] [имя]
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1
from PIL import Image

FIRST = int(sys.argv[1], 16)
N = int(sys.argv[2])
PAL = int(sys.argv[3]) if len(sys.argv) > 3 else 2
NAME = sys.argv[4] if len(sys.argv) > 4 else f"tiles_{FIRST:03X}"

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

pal = md._palette()
SC = 6
PERROW = 12
rows = (N + PERROW - 1) // PERROW
img = Image.new('RGB', (PERROW * 18 * SC, rows * 22 * SC), (20, 20, 20))
px = img.load()
for j in range(N):
    bt = FIRST + j * 4
    ox = (j % PERROW) * 18 * SC
    oy = (j // PERROW) * 22 * SC
    for qy in range(2):
        for qx in range(2):
            t = bt + qx * 2 + qy
            for yy in range(8):
                for xx in range(8):
                    c = md._tile_px(t, xx, yy, 0, 0)
                    col = pal[PAL * 16 + c] if c else (20, 20, 20)
                    X = ox + (qx * 8 + xx) * SC
                    Y = oy + (qy * 8 + yy) * SC
                    for dy in range(SC):
                        for dx in range(SC):
                            px[X + dx, Y + dy] = col
out = os.path.join(os.path.dirname(__file__), '..', 'shots', 'vram', NAME + '.png')
img.save(out)
print(f"блоков {N} начиная с ${FIRST:03X}, палитра {PAL} -> {os.path.basename(out)}")
print("подписи блоков (слева направо, сверху вниз):")
print('  ' + '  '.join(f"${FIRST + j*4:03X}" for j in range(min(N, 24))))
