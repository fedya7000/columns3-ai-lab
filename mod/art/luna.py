# ЛУНА — кошка из «Сейлор Мун» вместо петуха-маскота.
# Блок 32x32 точки (4x4 тайла), палитра 1. Четыре кадра: кошка моргает и
# водит хвостом, поэтому в игре она живая, а не истукан.
#
# Что в палитре 1 можно трогать (замер tools/pal1_usage.py):
#   индексы 6, 8, 9 занимает ТОЛЬКО маскот — их перекрашиваем;
#   7 (чёрный) и 15 (красный) общие с прочей графикой — берём как есть.
#
# Роли цветов:
#   7  чёрный        — тело и обводка
#   8  тёмно-синий   — освещённая шерсть и внутренность ушей
#   9  белый         — мордочка, грудка, лапки, блик в глазу
#   6  золотой       — полумесяц на лбу (перекрашен из оранжевого)
#   15 красный       — глаза и носик
import math

N = 32
BODY, FUR, WHITE, GOLD, RED = 7, 8, 9, 6, 15


def rgb(r, g, b):
    return (b << 9) | (g << 5) | (r << 1)


PALETTE1 = [None] * 16
PALETTE1[6] = rgb(7, 6, 0)     # золото полумесяца (было оранжевое)
PALETTE1[8] = rgb(1, 1, 3)     # тёмно-синяя шерсть (было светло-серое)


def _ell(x, y, cx, cy, rx, ry):
    return ((x - cx) / rx) ** 2 + ((y - cy) / ry) ** 2 <= 1.0


def build(blink=False, tail=0):
    img = [[0] * N for _ in range(N)]

    def put(x, y, c):
        if 0 <= x < N and 0 <= y < N:
            img[y][x] = c

    def fill(test, c):
        for y in range(N):
            for x in range(N):
                if test(x, y):
                    img[y][x] = c

    # --- уши: треугольники с тёмно-синей серединкой ---
    for apex in (9, 23):
        for dy in range(8):
            half = int(0.8 + dy * 0.62)
            for dx in range(-half, half + 1):
                put(apex + dx, 2 + dy, BODY)
        for dy in range(3, 8):
            half = int(dy * 0.34)
            for dx in range(-half, half + 1):
                put(apex + dx, 3 + dy, FUR)

    # --- голова ---
    fill(lambda x, y: _ell(x, y, 16, 13, 10.0, 8.2), BODY)

    # --- тело ---
    fill(lambda x, y: _ell(x, y, 16, 25, 8.5, 6.5), BODY)

    # --- хвост: дуга справа, рисуем ПОСЛЕ тела, иначе его не видно ---
    swing = (0.0, 0.35, 0.0, -0.35)[tail]
    for t in range(52):
        a = math.radians(120 - t * 3.4) + swing
        x = 25.5 + math.cos(a) * 5.6
        y = 26.0 + math.sin(a) * 7.4
        for dx in range(3):
            for dy in range(2):
                put(int(round(x)) + dx - 1, int(round(y)) + dy, BODY)

    # --- освещённая шерсть: ТОНКИЙ ободок сверху-слева, не капюшон ---
    for y in range(N):
        for x in range(N):
            if img[y][x] != BODY:
                continue
            if _ell(x, y, 16, 13, 10.0, 8.2) and not _ell(x, y, 16.9, 13.9, 9.6, 7.9):
                img[y][x] = FUR
            elif _ell(x, y, 16, 25, 8.5, 6.5) and not _ell(x, y, 16.8, 25.7, 8.2, 6.2):
                img[y][x] = FUR

    # --- белая грудка ---
    fill(lambda x, y: _ell(x, y, 16, 23.5, 3.6, 3.0) and y > 21, WHITE)

    # --- полумесяц на лбу, рожками вверх ---
    for y in range(2, 13):
        for x in range(8, 25):
            if (((x - 16) / 5.4) ** 2 + ((y - 8.2) / 4.0) ** 2 <= 1.0
                    and ((x - 16) / 5.4) ** 2 + ((y - 6.4) / 4.0) ** 2 > 1.0):
                put(x, y, GOLD)

    # --- глаза ---
    for cx in (11.5, 20.5):
        if blink:
            for dx in range(-2, 3):
                put(int(cx) + dx, 14, GOLD)          # прикрытое веко
        else:
            fill(lambda x, y, cx=cx: _ell(x, y, cx, 14.0, 1.7, 2.2), RED)
            put(int(cx), 13, WHITE)

    # --- мордочка, носик, ротик ---
    fill(lambda x, y: _ell(x, y, 16, 18.5, 3.2, 1.9), WHITE)
    put(16, 17, RED)
    put(15, 17, RED)
    put(16, 19, BODY)

    # --- лапки ---
    for cx in (11, 21):
        fill(lambda x, y, cx=cx: _ell(x, y, cx, 30.0, 2.8, 1.8), WHITE)

    return img


def frames():
    """Четыре кадра по кругу: обычный, моргание, обычный с хвостом вбок."""
    return [build(blink=False, tail=0),
            build(blink=True, tail=1),
            build(blink=False, tail=2),
            build(blink=False, tail=3)]


if __name__ == '__main__':
    import os
    from PIL import Image
    base = {7: (0, 0, 0), 9: (252, 252, 252), 15: (216, 0, 0)}

    def to_rgb(w):
        return ((w >> 1 & 7) * 36, (w >> 5 & 7) * 36, (w >> 9 & 7) * 36)

    pal = {i: (base.get(i, (200, 200, 220)) if PALETTE1[i] is None
               else to_rgb(PALETTE1[i])) for i in range(16)}
    fr = frames()
    SC = 8
    img = Image.new('RGB', (N * SC * len(fr), N * SC), (150, 120, 200))
    px = img.load()
    for k, art in enumerate(fr):
        for y in range(N):
            for x in range(N):
                c = art[y][x]
                if c:
                    for dy in range(SC):
                        for dx in range(SC):
                            px[(k * N + x) * SC + dx, y * SC + dy] = pal[c]
    d = os.path.join(os.path.dirname(__file__), '..', 'shots', 'mascot')
    os.makedirs(d, exist_ok=True)
    img.save(os.path.join(d, 'luna_preview.png'))
    print(f"кадров: {len(fr)} -> shots/mascot/luna_preview.png")
