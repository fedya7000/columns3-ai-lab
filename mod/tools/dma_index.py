# Какой ИНДЕКС приходит в таблицу параметров DMA ($10944, запись 14 байт).
# Смотрим нормальный диапазон и тот индекс, что вылезает за таблицу.
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1
from unicorn.m68k_const import UC_M68K_REG_D1

ROM = sys.argv[1]
SEED = int(sys.argv[2]) if len(sys.argv) > 2 else 11

md = session.new(ROM)
idx = []


def on_lea(m, pc):
    # на $0107A2 в d1 уже лежит смещение в таблице (индекс * 14)
    off = m.uc.reg_read(UC_M68K_REG_D1) & 0xFFFF
    idx.append((m.frame, off))


md.add_code_hook(0x0107A2, on_lea)
session.boot_vs(md)
bot = Bot(0, P1, SEED)
for i in range(120000):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    if md.rw(0xFF0406) != 0x20 and i % 8 < 3:
        md.press(0, 'start')
        md.press(1, 'start')
    else:
        md.release(1)
    md.step_frame()
    if md.stopped:
        print("СБОЙ:", md.log[-1].splitlines()[0])
        break

offs = [o for _, o in idx]
print(f"\nобращений к таблице: {len(offs)}")
print("встречавшиеся смещения (смещение = индекс*14):")
for o, n in sorted(Counter(offs).items()):
    print(f"  смещение {o:6} (индекс {o/14:6.2f})  адрес ${0x10944+o:06X}  — {n} раз")
print("\nпоследние 6 обращений:", idx[-6:])
