# ФОН ЛОКАЦИИ «СЕЙЛОР МУН»: ночное небо 320x224 в индексах палитры 0.
#
# Что можно, а что нельзя (замерено, см. docs/lokaciya.md):
#   индексы 1, 2, 3  — держат игровое поле, разметку и коробки панелей. НЕ ТРОГАТЬ.
#   индекс  14       — белый у спрайтов-петухов. Оставляем как есть, используем.
#   индексы 4..13, 15, 0 — свободны, ими и рисуем небо.
import math

W, H = 320, 224


def rgb(r, g, b):
    return (b << 9) | (g << 5) | (r << 1)


# новые цвета палитры 0; None = оставить как в игре
PALETTE0 = [
    rgb(1, 0, 2),   # 0  фон за краями экрана
    None,           # 1  ЧЁРНЫЙ поля — не трогать
    None,           # 2  разметка поля — не трогать
    None,           # 3  разметка поля — не трогать
    rgb(1, 0, 3),   # 4  небо: самый тёмный индиго
    rgb(2, 1, 4),   # 5
    rgb(3, 1, 5),   # 6
    rgb(4, 2, 6),   # 7
    rgb(5, 3, 7),   # 8
    rgb(6, 4, 7),   # 9  небо: розоватая дымка у низа
    rgb(7, 7, 4),   # 10 луна, светлая сторона
    rgb(6, 5, 2),   # 11 луна, тень
    rgb(3, 3, 6),   # 12 тусклая звезда
    rgb(7, 5, 7),   # 13 розовая искра
    None,           # 14 БЕЛЫЙ спрайтов — не трогать, но пользуемся
    rgb(4, 7, 7),   # 15 голубая искра
]

SKY_SHADES = [4, 5, 6, 7, 8, 9]        # сверху вниз
BANDS = [0, 40, 76, 110, 142, 176, 224]  # границы полос по вертикали


def _dither(x, y):
    """Шахматка для мягкого перехода между полосами."""
    return (x + y) & 1


def make_sky():
    img = [[0] * W for _ in range(H)]
    for y in range(H):
        # какая полоса и насколько близко к следующей
        k = 0
        while k < len(SKY_SHADES) - 1 and y >= BANDS[k + 1]:
            k += 1
        lo = SKY_SHADES[k]
        hi = SKY_SHADES[min(k + 1, len(SKY_SHADES) - 1)]
        b0, b1 = BANDS[k], BANDS[k + 1]
        # в последней четверти полосы подмешиваем следующий тон
        t = (y - b0) / max(1, (b1 - b0))
        mix = t > 0.72
        for x in range(W):
            img[y][x] = hi if (mix and _dither(x, y)) else lo
    return img


def put_star(img, x, y, kind):
    """Звёздочка: 0 — точка, 1 — крестик, 2 — крупная искра."""
    def st(dx, dy, c):
        X, Y = x + dx, y + dy
        if 0 <= X < W and 0 <= Y < H:
            img[Y][X] = c
    if kind == 0:
        st(0, 0, 12)
    elif kind == 1:
        st(0, 0, 14)
        st(-1, 0, 12); st(1, 0, 12); st(0, -1, 12); st(0, 1, 12)
    else:
        st(0, 0, 14)
        st(-1, 0, 14); st(1, 0, 14); st(0, -1, 14); st(0, 1, 14)
        st(-2, 0, 13); st(2, 0, 13); st(0, -2, 13); st(0, 2, 13)


def put_moon(img, cx, cy, r):
    """Полумесяц: круг минус сдвинутый круг."""
    for y in range(cy - r - 1, cy + r + 2):
        for x in range(cx - r - 1, cx + r + 2):
            if not (0 <= x < W and 0 <= y < H):
                continue
            d1 = math.hypot(x - cx, y - cy)
            d2 = math.hypot(x - (cx + r * 0.45), y - (cy - r * 0.18))
            if d1 <= r and d2 > r * 0.88:
                # тень по нижне-правому краю серпа
                img[y][x] = 11 if (d1 > r - 3) else 10


def put_ringed(img, cx, cy, r):
    """Планета с кольцом."""
    # кольцо позади
    for y in range(cy - 12, cy + 13):
        for x in range(cx - r * 2, cx + r * 2 + 1):
            if not (0 <= x < W and 0 <= y < H):
                continue
            e = ((x - cx) / (r * 1.9)) ** 2 + ((y - cy) / (r * 0.42)) ** 2
            if 0.62 <= e <= 1.0 and y <= cy:
                img[y][x] = 13
    # шар
    for y in range(cy - r - 1, cy + r + 2):
        for x in range(cx - r - 1, cx + r + 2):
            if not (0 <= x < W and 0 <= y < H):
                continue
            d = math.hypot(x - cx, y - cy)
            if d <= r:
                img[y][x] = 15 if d < r - 4 and (x - cx) + (y - cy) < 0 else 12
    # кольцо спереди
    for y in range(cy - 12, cy + 13):
        for x in range(cx - r * 2, cx + r * 2 + 1):
            if not (0 <= x < W and 0 <= y < H):
                continue
            e = ((x - cx) / (r * 1.9)) ** 2 + ((y - cy) / (r * 0.42)) ** 2
            if 0.62 <= e <= 1.0 and y > cy:
                img[y][x] = 13


# положения звёзд — фиксированный набор, чтобы картинка была повторяемой
STARS = [
    (10, 14, 1), (30, 26, 0), (46, 10, 0), (18, 44, 0), (40, 58, 1),
    (6, 70, 0), (52, 34, 0), (24, 88, 0), (44, 100, 0), (12, 108, 1),
    (156, 6, 2), (166, 18, 0), (146, 20, 0), (176, 10, 0),
    (272, 12, 1), (294, 26, 0), (310, 8, 0), (280, 46, 0), (302, 60, 1),
    (266, 74, 0), (316, 36, 0), (290, 92, 0), (270, 104, 0), (312, 110, 1),
    (8, 130, 0), (54, 122, 0), (50, 190, 0), (4, 206, 0),
    (268, 130, 0), (314, 124, 0), (266, 196, 0), (312, 208, 0),
    (152, 216, 0), (168, 210, 0),
]


def build():
    img = make_sky()
    for x, y, k in STARS:
        put_star(img, x, y, k)
    put_moon(img, 26, 152, 21)          # полумесяц слева внизу
    put_ringed(img, 292, 152, 15)       # планета с кольцом справа внизу
    return img


if __name__ == '__main__':
    import os
    from PIL import Image
    img = build()

    def to_rgb(w):
        return ((w >> 1 & 7) * 36, (w >> 5 & 7) * 36, (w >> 9 & 7) * 36)

    # для превью подставим настоящие цвета игры туда, где мы не трогаем
    keep = {1: (0, 0, 0), 2: (72, 72, 72), 3: (72, 72, 72), 14: (252, 252, 252)}
    pal = [keep[i] if PALETTE0[i] is None else to_rgb(PALETTE0[i]) for i in range(16)]
    out = Image.new('RGB', (W, H))
    px = out.load()
    for y in range(H):
        for x in range(W):
            px[x, y] = pal[img[y][x]]
    d = os.path.join(os.path.dirname(__file__), '..', 'shots', 'bg')
    os.makedirs(d, exist_ok=True)
    out.resize((W * 2, H * 2), Image.NEAREST).save(os.path.join(d, 'sky_preview.png'))
    print("превью неба -> shots/bg/sky_preview.png")
