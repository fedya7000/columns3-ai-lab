# Подробный журнал того, что происходит ПОСЛЕ выбывания одного игрока:
# очки обоих, состояния, режим. Нужен, чтобы понять, почему очки падают.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

ROM = sys.argv[1]
TARGET = int(sys.argv[2]) if len(sys.argv) > 2 else 40

md = session.new(ROM)
session.boot_vs(md)
bot = Bot(0, P1, 5)
planted = False
hits = []


def cb(m, a, size, value, pc):
    hits.append((m.frame, a, size, value, pc))


md.add_watch(P1 + 0x8C, P1 + 0x8D, cb)

for i in range(30000):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()
    if not planted and md.rw(P2 + 0x4C) >= 0x1C:
        md.uc.mem_write(P2 + 0x8C, bytes([TARGET >> 8, TARGET & 0xFF]))
        planted = True
        print(f"кадр {md.frame}: игрок 2 выбыл, планка {TARGET}")
    if planted:
        if md.frame % 120 == 0:
            print(f"  кадр {md.frame}: режим=${md.rw(0xFF0406):04X}  "
                  f"P1[очки={md.rw(P1+0x8C):4} 5C={md.rw(P1+0x5C):5} состояние={md.rw(P1+0x4C):3}]  "
                  f"P2[очки={md.rw(P2+0x8C):4} состояние={md.rw(P2+0x4C):3}]")
        if md.rw(0xFF0406) != 0x20:
            print(f"кадр {md.frame}: РАУНД КОНЧИЛСЯ, P1 очки={md.rw(P1+0x8C)} P2 очки={md.rw(P2+0x8C)}")
            break

print("\n=== записи в очки игрока 1 (последние 20) ===")
for fr, a, sz, v, pc in hits[-20:]:
    print(f"  кадр {fr:6} ${a:06X} разм={sz} знач={v:5} PC=${pc:06X}")
