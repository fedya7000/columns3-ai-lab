# Ловит момент, когда указатель скрипта анимации (+0xB4) становится мусорным.
# Хуки ставятся ДО загрузки: движок кеширует оттранслированный код.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2
from unicorn.m68k_const import UC_M68K_REG_A6, UC_M68K_REG_D0, UC_M68K_REG_A0

ROM = sys.argv[1]
SEED = int(sys.argv[2]) if len(sys.argv) > 2 else 3

md = session.new(ROM)
w = []


def cb(m, a, size, value, pc):
    w.append((m.frame, a, size, value, pc,
              m.uc.reg_read(UC_M68K_REG_A6),
              m.uc.reg_read(UC_M68K_REG_D0) & 0xFFFF,
              m.uc.reg_read(UC_M68K_REG_A0)))
    if len(w) > 400:
        del w[:200]


for base in (0xFF10B4, 0xFF14B4, 0xFF18B4, 0xFF1CB4):
    md.add_watch(base, base + 3, cb)

session.boot_vs(md)
bot = Bot(0, P1, SEED)
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
    if md.stopped:
        print("СБОЙ:", md.log[-1].splitlines()[0])
        break

print("\nпоследние записи в +0xB4 (кадр, адрес, значение, откуда, a6, d0, a0):")
for fr, a, sz, v, pc, a6, d0, a0 in w[-16:]:
    bad = '  <-- НЕ СКРИПТ' if not (0x10896 <= v <= 0x10945) else ''
    print(f"  к{fr:6} ${a:06X} разм={sz} знач=${v:08X} PC=${pc:06X} "
          f"a6=${a6:06X} d0={d0:5} a0=${a0:08X}{bad}")
