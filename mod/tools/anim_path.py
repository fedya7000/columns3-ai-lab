# Каким путём в номер кадра анимации попадает $FF.
# Ставим метки на разветвления обработчика скрипта анимации.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1
from unicorn.m68k_const import UC_M68K_REG_D0, UC_M68K_REG_D1, UC_M68K_REG_A0, UC_M68K_REG_A6

ROM = sys.argv[1]
SEED = int(sys.argv[2]) if len(sys.argv) > 2 else 11

md = session.new(ROM)
trail = []


def mk(tag):
    def h(m, pc):
        u = m.uc
        trail.append((m.frame, tag,
                      u.reg_read(UC_M68K_REG_D0) & 0xFFFF,
                      u.reg_read(UC_M68K_REG_D1) & 0xFFFF,
                      u.reg_read(UC_M68K_REG_A0),
                      u.reg_read(UC_M68K_REG_A6)))
        if len(trail) > 4000:
            del trail[:2000]
    return h


md.add_code_hook(0x010744, mk('шаг НАЗАД ($FE)'))
md.add_code_hook(0x010754, mk('начать ЗАНОВО ($FF)'))
md.add_code_hook(0x01075C, mk('кадр выбран'))

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

print("\nпоследние 14 шагов обработчика анимации:")
for fr, tag, d0, d1, a0, a6 in trail[-14:]:
    print(f"  кадр {fr:6}  {tag:22}  d0(номер кадра)={d0:5}  d1(значение)={d1:5}  "
          f"скрипт=${a0:06X}  игрок=${a6:06X}")
