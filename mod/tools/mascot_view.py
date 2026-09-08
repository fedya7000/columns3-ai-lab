# Показывает тайлы маскота (петуха) крупно: видеопамять $A000 (левый)
# и $A300 (правый) — по 16 тайлов, это блок 4x4 клетки = 32x32 точки.
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

pal = md._palette()
out = os.path.join(os.path.dirname(__file__), '..', 'shots', 'mascot')
os.makedirs(out, exist_ok=True)

# какой палитрой рисуется маскот — берём из таблицы спрайтов
r = md.vdp_reg
spr = (r[0x05] & 0x7F) << 9
palnum = 0
idx = 0
for _ in range(80):
    e = spr + idx * 8
    attr = (md.vram[e + 4] << 8) | md.vram[e + 5]
    t = attr & 0x7FF
    if 0x500 <= t <= 0x52F:
        palnum = (attr >> 13) & 3
        print(f"маскот рисуется тайлом ${t:03X} палитрой {palnum}")
        break
    idx = md.vram[e + 3] & 0x7F
    if idx == 0:
        break

SC = 10
for name, first in (('levyy_A000', 0x500), ('pravyy_A300', 0x518)):
    img = Image.new('RGB', (4 * 8 * SC, 4 * 8 * SC), (16, 16, 24))
    px = img.load()
    for t in range(16):
        # порядок тайлов в блоке 4x4: по столбцам (как у спрайтов Mega Drive)
        cx, cy = t // 4, t % 4
        for y in range(8):
            for x in range(8):
                c = md._tile_px(first + t, x, y, 0, 0)
                col = pal[palnum * 16 + c] if c else (16, 16, 24)
                for dy in range(SC):
                    for dx in range(SC):
                        px[(cx * 8 + x) * SC + dx, (cy * 8 + y) * SC + dy] = col
    img.save(os.path.join(out, name + '.png'))
    print(f"тайлы ${first:03X}..${first+15:03X} -> {name}.png")

print("\nиспользуемые индексы палитры в маскоте:")
used = set()
for t in range(0x500, 0x510):
    for y in range(8):
        for x in range(8):
            used.add(md._tile_px(t, x, y, 0, 0))
print(sorted(used))
