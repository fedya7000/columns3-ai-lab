# Не портится ли число игроков ($FF0422) и что вообще меняется в общей области
# при работе графической врезки.
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

ROM = sys.argv[1]
SEED = int(sys.argv[2]) if len(sys.argv) > 2 else 23

md = session.new(ROM)
writes = Counter()
first = []


def cb(m, a, size, value, pc):
    from unicorn.m68k_const import UC_M68K_REG_A6, UC_M68K_REG_A0
    writes[(a, pc)] += 1
    first.append((m.frame, a, size, value, pc,
                  m.uc.reg_read(UC_M68K_REG_A6), m.uc.reg_read(UC_M68K_REG_A0)))


md.add_watch(0xFF0420, 0xFF0423, cb)
session.boot_vs(md)
bot = Bot(0, P1, SEED)
seen = set()
for i in range(60000):
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
    seen.add(md.rw(0xFF0422))
    if md.stopped:
        print("СБОЙ:", md.log[-1].splitlines()[0])
        break

print(f"\nвстречавшиеся значения числа игроков $FF0422: {sorted(seen)}")
print("все записи в $FF0420..$FF0423 (кадр, адрес, значение, откуда, a6, a0):")
for fr, a, sz, v, pc, a6, a0 in first:
    mark = '  <-- МУСОР' if a == 0xFF0422 and v not in (0, 1, 2, 3, 4, 5, 6) else ''
    print(f"  к{fr:6} ${a:06X} разм={sz} знач={v:6} PC=${pc:06X} "
          f"a6=${a6:06X} a0=${a0:08X}{mark}")
