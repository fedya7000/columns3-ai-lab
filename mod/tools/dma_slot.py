# Кто заполняет слоты заявок на DMA ($FF04A0..$FF04BF) и какими значениями.
# Ищем того, кто кладёт туда мусор перед сбоем.
#
# ВАЖНО: хуки ставятся ДО загрузки — движок кеширует оттранслированный код,
# и хук, поставленный позже, не увидит уже пройденные места.
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

ROM = sys.argv[1]
SEED = int(sys.argv[2]) if len(sys.argv) > 2 else 11

md = session.new(ROM)
ev = []


def cb(m, a, size, value, pc):
    ev.append((m.frame, a, size, value, pc))


md.add_watch(0xFF04A0, 0xFF04BF, cb)
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

print(f"\nзаписей в слоты: {len(ev)}")
print("кто пишет (PC -> сколько раз):")
for k, v in Counter(x[4] for x in ev).most_common(12):
    print(f"  PC=${k:06X}: {v}")

print("\nпоследние 16 записей перед сбоем:")
for fr, a, sz, v, pc in ev[-16:]:
    print(f"  кадр {fr:6}  ${a:06X} разм={sz} знач=${v:08X}  PC=${pc:06X}")
