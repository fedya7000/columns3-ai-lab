# Какие клетки фона можно перерисовывать, а какие обязаны остаться.
#
# Оставляем ВСЁ тёмное: это игровые поля с разметкой и коробки панелей.
# Заменяем светлое: жёлтую стену и ирисы — на них и ляжет новое небо.
import sys, os, json
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
planeB = (r[0x04] & 0x07) << 13
PW = 64
pal = md._palette()

W, H = 40, 28
name = [[0] * W for _ in range(H)]
bright = [[0] * W for _ in range(H)]
for cy in range(H):
    for cx in range(W):
        a = planeB + (cy * PW + cx) * 2
        w = (md.vram[a] << 8) | md.vram[a + 1]
        name[cy][cx] = w
        t, p, hf, vf = w & 0x7FF, (w >> 13) & 3, (w >> 11) & 1, (w >> 12) & 1
        # берём САМУЮ яркую точку тайла: поле и коробки почти чёрные,
        # а у ирисов есть сочная зелень — по среднему их не различить
        mx = 0
        for y in range(8):
            for x in range(8):
                c = md._tile_px(t, x, y, hf, vf)
                col = pal[p * 16 + c]
                mx = max(mx, col[0], col[1], col[2])
        bright[cy][cx] = mx

THRESH = 80          # ярче — перерисовываем
mask = [[1 if bright[cy][cx] > THRESH else 0 for cx in range(W)] for cy in range(H)]

print("карта: '#' — перерисовываем (небо), '.' — оставляем (поле и панели)")
for cy in range(H):
    print(f"  {cy:2} " + ''.join('#' if mask[cy][cx] else '.' for cx in range(W)))
n = sum(sum(row) for row in mask)
print(f"\nклеток под небо: {n} из {W*H}")

out = os.path.join(os.path.dirname(__file__), '..', 'shots', 'bg')
os.makedirs(out, exist_ok=True)
json.dump({'name': name, 'mask': mask},
          open(os.path.join(out, 'planeb.json'), 'w'))
print("карта плана B сохранена -> shots/bg/planeb.json")

img = Image.new('RGB', (W * 8, H * 8))
px = img.load()
for cy in range(H):
    for cx in range(W):
        col = (40, 40, 120) if mask[cy][cx] else (10, 10, 10)
        for y in range(8):
            for x in range(8):
                px[cx * 8 + x, cy * 8 + y] = col
img.resize((W * 16, H * 16), Image.NEAREST).save(os.path.join(out, 'mask.png'))
print("картинка маски -> shots/bg/mask.png")
