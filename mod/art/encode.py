# Кодирование картинок в формат тайлов Mega Drive + кадры приземления.
#
# Формат тайла: 8x8 точек, 32 байта, по строкам, два пикселя в байте
# (старший полубайт — левая точка).
#
# Порядок тайлов в камне 16x16 (проверен по карте экрана):
#   база+0 — верх-лево, база+1 — низ-лево, база+2 — верх-право, база+3 — низ-право
import os, sys, struct

sys.path.insert(0, os.path.dirname(__file__))
from jewels_sm import all_jewels, PALETTE2


def tile_bytes(img, x0, y0):
    """Один тайл 8x8 из картинки индексов."""
    out = bytearray()
    for y in range(8):
        for x in range(0, 8, 2):
            hi = img[y0 + y][x0 + x] & 0xF
            lo = img[y0 + y][x0 + x + 1] & 0xF
            out.append((hi << 4) | lo)
    return bytes(out)


def block16(img):
    """Камень 16x16 -> 4 тайла (128 байт) в порядке игры."""
    return (tile_bytes(img, 0, 0) + tile_bytes(img, 0, 8)
            + tile_bytes(img, 8, 0) + tile_bytes(img, 8, 8))


def squash(img, factor):
    """Сплющивает камень по вертикали и прижимает к низу — кадр приземления."""
    h = max(3, int(round(16 * factor)))
    out = [[0] * 16 for _ in range(16)]
    top = 16 - h
    for y in range(h):
        src = min(15, int(y * 16 / h))
        for x in range(16):
            out[top + y][x] = img[src][x]
    return out


# пять кадров приземления: удар и отскок
SQUASH_FRAMES = [1.0, 0.80, 0.60, 0.80, 1.0]


def build_all():
    jew = all_jewels()
    assert len(jew) == 6, "камней должно быть шесть"

    main = b''.join(block16(art) for _, art in jew)          # 6 * 128 = 768
    anim = b''
    for _, art in jew:                                        # 6 цветов * 5 кадров
        for f in SQUASH_FRAMES:
            anim += block16(squash(art, f) if f < 1.0 else art)
    pal = b''.join(struct.pack('>H', w) for w in PALETTE2)    # 32 байта

    assert len(main) == 768, len(main)
    assert len(anim) == 6 * 5 * 128 == 3840, len(anim)
    assert len(pal) == 32, len(pal)
    return main, anim, pal


if __name__ == '__main__':
    m, a, p = build_all()
    print(f"тайлы камней      : {len(m)} байт")
    print(f"кадры приземления : {len(a)} байт")
    print(f"палитра           : {len(p)} байт")
    print(f"всего             : {len(m)+len(a)+len(p)} байт")
