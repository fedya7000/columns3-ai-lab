# Ищет байты RAM, в которые за весь сеанс (меню + два раунда) никто не пишет.
# Туда можно безопасно положить свои переменные.
import sys, os
import numpy as np
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

md = session.new()
written = np.zeros(0x10000, dtype=bool)   # писали НЕнулевое значение
zeroed = np.zeros(0x10000, dtype=bool)    # писали ноль (это не мешает — само чистится)


def cb(m, a, size, value, pc):
    lo = a - 0xFF0000
    if value:
        written[lo:lo + size] = True
    else:
        zeroed[lo:lo + size] = True


session.boot_vs(md)                        # слежку ставим ПОСЛЕ загрузки:
md.add_watch(0xFF0000, 0xFFFFFF, cb)       # на старте игра чистит всю память
bot = Bot(0, P1, 5)
for i in range(14000):
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
        print("ОСТАНОВ:", md.log[-1])
        break

free = np.nonzero(~written)[0]
print(f"нетронутых байт: {len(free)} из 65536")
runs = []
cur = []
for o in free:
    if cur and o == cur[-1] + 1:
        cur.append(int(o))
    else:
        if len(cur) >= 16:
            runs.append(cur)
        cur = [int(o)]
if len(cur) >= 16:
    runs.append(cur)
print("\nсвободные куски (>=16 байт), самые большие:")
for r in sorted(runs, key=lambda x: -len(x))[:20]:
    print(f"  $FF{r[0]:04X}..$FF{r[-1]:04X}   {len(r)} байт")
