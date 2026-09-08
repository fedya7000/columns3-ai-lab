# Показывает нарисованные фигуры крупно — чтобы СМОТРЕТЬ на них до сборки ROM.
# Рядом рисует их же в мелком масштабе: так видно, читается ли знак в игре.
import sys, os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'art'))
from jewels_sm import all_jewels, PALETTE2
from PIL import Image, ImageDraw

out = os.path.join(os.path.dirname(__file__), '..', 'shots', 'art')
os.makedirs(out, exist_ok=True)


def to_rgb(word):
    b = (word >> 9) & 7
    g = (word >> 5) & 7
    r = (word >> 1) & 7
    return (r * 36, g * 36, b * 36)


pal = [to_rgb(w) for w in PALETTE2]
jew = all_jewels()

BIG, SMALL = 14, 2
W = len(jew) * 16 * BIG
img = Image.new('RGB', (W, 16 * BIG + 16 * SMALL + 30), (16, 16, 24))
px = img.load()
for j, (name, art) in enumerate(jew):
    for y in range(16):
        for x in range(16):
            c = art[y][x]
            col = pal[c] if c else (16, 16, 24)
            for dy in range(BIG):
                for dx in range(BIG):
                    px[(j * 16 + x) * BIG + dx, y * BIG + dy] = col
    # мелко — как оно будет в игре
    for y in range(16):
        for x in range(16):
            c = art[y][x]
            col = pal[c] if c else (16, 16, 24)
            for dy in range(SMALL):
                for dx in range(SMALL):
                    X = j * 16 * BIG + 20 + x * SMALL + dx
                    Y = 16 * BIG + 10 + y * SMALL + dy
                    if X < W:
                        px[X, Y] = col

d = ImageDraw.Draw(img)
for j, (name, _) in enumerate(jew):
    d.text((j * 16 * BIG + 6, 16 * BIG + 10 + 16 * SMALL + 4), name, fill=(220, 220, 220))
p = os.path.join(out, 'jewels_preview.png')
img.save(p)
print("превью фигур ->", p)

# полоска палитры
pimg = Image.new('RGB', (16 * 24, 24))
pp = pimg.load()
for i in range(16):
    for y in range(24):
        for x in range(24):
            pp[i * 24 + x, y] = pal[i]
pimg.save(os.path.join(out, 'palette2_preview.png'))
print("палитра ->", os.path.join(out, 'palette2_preview.png'))
