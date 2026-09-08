# Диапазон номера состояния анимации маскота (+0xB8) и что он вытаскивает
# из таблицы скриптов на $10812. Ищем выход за таблицу.
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2
from unicorn.m68k_const import UC_M68K_REG_D0, UC_M68K_REG_A6

ROM = sys.argv[1] if len(sys.argv) > 1 else os.path.join(
    os.path.dirname(__file__), '..', 'rom', 'Columns III (USA).gen')

rom = open(ROM, 'rb').read()
# таблица указателей начинается на $10812, первый скрипт — на $10896
n_entries = (0x10896 - 0x10812) // 4
print(f"в таблице скриптов {n_entries} записей ($10812..${0x10812 + n_entries*4 - 1:05X})")

md = session.new(ROM)
seen = Counter()
bad = []


def on_load(m, pc):
    # $010698: move.l (a0,d0.w), $b4(a6) — d0 уже равен номер*4
    d0 = m.uc.reg_read(UC_M68K_REG_D0) & 0xFFFF
    idx = d0 // 4
    seen[idx] += 1
    if idx >= n_entries:
        bad.append((m.frame, idx))


md.add_code_hook(0x010698, on_load)
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(20000):
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

print(f"\nвстречавшиеся номера состояния: {sorted(seen)}")
print(f"выходов за таблицу: {len(bad)}", bad[:6] if bad else '')
print(f"максимум: {max(seen) if seen else '-'}")
