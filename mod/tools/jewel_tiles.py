# Какими ТАЙЛАМИ рисуется камень каждого цвета.
# Метод: снимаем карту экрана, вписываем в нижний ряд поля шесть разных цветов,
# ждём перерисовки и смотрим, какие клетки карты изменились и на что.
import sys, os
import struct
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, ROW, ROWS, field_base

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(200):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()

r = md.vdp_reg
planeA = (r[0x02] & 0x38) << 10
planeB = (r[0x04] & 0x07) << 13
print(f"план A = ${planeA:04X}, план B = ${planeB:04X}")


def snap():
    return bytes(md.vram)


base = field_base(md, P1)
before = snap()
# шесть разных цветов подряд — линий не даёт
for c in range(6):
    md.uc.mem_write(base + 12 * ROW + c * 2, bytes([0, c + 1]))
for _ in range(30):
    md.step_frame()
after = snap()

print("\nизменившиеся клетки карты экрана (адрес -> тайл, палитра):")
found = []
for a in range(0, 0x10000, 2):
    if before[a:a + 2] != after[a:a + 2]:
        w = (after[a] << 8) | after[a + 1]
        tile = w & 0x7FF
        pal = (w >> 13) & 3
        # интересуют только клетки внутри карт планов
        for name, base_addr in (('A', planeA), ('B', planeB)):
            if base_addr <= a < base_addr + 0x2000:
                found.append((a, name, tile, pal, (w >> 11) & 1, (w >> 12) & 1))
for a, name, tile, pal, hf, vf in found:
    print(f"  ${a:04X} план{name}  тайл ${tile:03X} ({tile:4})  палитра {pal}"
          + ("  отражён" if hf or vf else ""))

if found:
    tiles = sorted(set(t for _, _, t, _, _, _ in found))
    print(f"\nвсего разных тайлов: {len(tiles)} -> {[f'${t:03X}' for t in tiles]}")
    print("на шесть камней по 2x2 тайла ожидается 24 штуки (или меньше, если есть отражения)")
