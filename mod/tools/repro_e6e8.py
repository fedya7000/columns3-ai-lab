# Воспроизводит сбой записи в ПЗУ на $00E6E8 и показывает, откуда взялся
# испорченный указатель a4.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2
from unicorn.m68k_const import UC_M68K_REG_A4, UC_M68K_REG_A6, UC_M68K_REG_D0

ROM = sys.argv[1]
SEED = int(sys.argv[2]) if len(sys.argv) > 2 else 23

md = session.new(ROM)
trail = []


def watch(m, pc):
    trail.append((m.frame, pc,
                  m.uc.reg_read(UC_M68K_REG_A4),
                  m.uc.reg_read(UC_M68K_REG_A6),
                  m.uc.reg_read(UC_M68K_REG_D0) & 0xFFFF))
    if len(trail) > 300:
        del trail[:150]


md.add_code_hook(0x00E6E8, watch)         # сама запись
md.add_code_hook(0x00E6C8, watch)         # чуть раньше по ходу

session.boot_vs(md)
bot = Bot(0, P1, SEED)
prev = 0x20
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
        print(md.log[-1])
        break

print("\nпоследние проходы через это место (кадр, PC, a4, a6, d0):")
for fr, pc, a4, a6, d0 in trail[-14:]:
    tag = 'ПЗУ!' if a4 < 0x400000 else ''
    print(f"  кадр {fr:6} PC=${pc:06X}  a4=${a4:08X} {tag:5} a6=${a6:06X} d0={d0}")
