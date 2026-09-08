# Следит за указателем списка спрайтов (+0x0E) обоих игроков и за полем +0x02,
# от которого зависит, какую таблицу берёт построитель списка.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

ROM = sys.argv[1]
SEED = int(sys.argv[2]) if len(sys.argv) > 2 else 23

md = session.new(ROM)
hits = []


def cb(m, a, size, value, pc):
    hits.append((m.frame, a, size, value, pc))


md.add_watch(0xFF100E, 0xFF1011, cb)
md.add_watch(0xFF140E, 0xFF1411, cb)
session.boot_vs(md)
bot = Bot(0, P1, SEED)
prev = None
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
    cur = (md.rl(P1 + 0x0E), md.rl(P2 + 0x0E), md.rw(P1 + 0x02), md.rw(P2 + 0x02))
    if cur != prev:
        print(f"к{md.frame:6}  P1[+0E=${cur[0]:08X} +02={cur[2]}]  "
              f"P2[+0E=${cur[1]:08X} +02={cur[3]}]")
        prev = cur
    if md.stopped:
        print("СБОЙ:", md.log[-1].splitlines()[0])
        break
print("\nзаписи в +0x0E:", len(hits))
for h in hits[-6:]:
    print(f"  к{h[0]:6} ${h[1]:06X} разм={h[2]} знач=${h[3]:08X} PC=${h[4]:06X}")
