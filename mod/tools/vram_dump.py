# Выгружает ВСЮ видеопамять листом тайлов + палитры.
# Нужно, чтобы найти тайлы камней и понять, что и где придётся перерисовывать.
#
# python vram_dump.py [кадров_в_бою]
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1
from PIL import Image

NF = int(sys.argv[1]) if len(sys.argv) > 1 else 400

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(NF):
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
TILES = 0x10000 // 32          # 2048 тайлов
COLS = 32
ROWS = (TILES + COLS - 1) // COLS
SC = 2

# лист тайлов в каждой из четырёх палитр
for p in range(4):
    img = Image.new('RGB', (COLS * 8, ROWS * 8), (24, 24, 24))
    px = img.load()
    for t in range(TILES):
        tx, ty = (t % COLS) * 8, (t // COLS) * 8
        for y in range(8):
            for x in range(8):
                c = md._tile_px(t, x, y, 0, 0)
                px[tx + x, ty + y] = pal[p * 16 + c] if c else (24, 24, 24)
    img = img.resize((COLS * 8 * SC, ROWS * 8 * SC), Image.NEAREST)
    img.save(os.path.join(out, f'tiles_pal{p}.png'))
    print(f"лист тайлов, палитра {p} -> tiles_pal{p}.png")

# сами палитры полосками
pimg = Image.new('RGB', (16 * 16, 4 * 16))
ppx = pimg.load()
for p in range(4):
    for i in range(16):
        for y in range(16):
            for x in range(16):
                ppx[i * 16 + x, p * 16 + y] = pal[p * 16 + i]
pimg.save(os.path.join(out, 'palettes.png'))
print("палитры -> palettes.png")
print(f"\nномер тайла = номер клетки на листе (32 в ряду). Всего {TILES} тайлов.")
md.render(os.path.join(out, 'screen.png'))
