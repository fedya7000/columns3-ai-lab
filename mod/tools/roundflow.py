# Кто и когда обрывает раунд: следим за записями в $FF0406 (номер режима)
# и за полем +0x4C (высота завала) обоих игроков.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
log = []


def on_mode(m, a, size, value, pc):
    log.append((m.frame, pc, size, value))


md.add_watch(0xFF0406, 0xFF0407, on_mode)

mode0 = md.rw(0xFF0406)
print(f"режим боя = ${mode0:04X}")
prev4c = (md.rw(P1 + 0x4C), md.rw(P2 + 0x4C))
for i in range(20000):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)                       # второй бездействует — завалится первым
    md.step_frame()
    cur = (md.rw(P1 + 0x4C), md.rw(P2 + 0x4C))
    if cur != prev4c and (cur[0] >= 20 or cur[1] >= 20):
        print(f"кадр {md.frame}: высота завала P1={cur[0]} P2={cur[1]} режим=${md.rw(0xFF0406):04X}")
    prev4c = cur
    if md.rw(0xFF0406) != mode0:
        print(f"\nРАУНД ОБОРВАН на кадре {md.frame}, режим -> ${md.rw(0xFF0406):04X}")
        print(f"  P1: 4C={md.rw(P1+0x4C)} 8C={md.rw(P1+0x8C)} D8={md.rb(P1+0xD8)}")
        print(f"  P2: 4C={md.rw(P2+0x4C)} 8C={md.rw(P2+0x8C)} D8={md.rb(P2+0xD8)}")
        break

print("\n=== записи в $FF0406 (последние 20) ===")
for fr, pc, sz, v in log[-20:]:
    print(f"  кадр {fr:6}  PC=${pc:06X}  размер={sz}  значение=${v:04X}")
