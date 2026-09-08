# Кто и когда пишет победы/поражения (+0xD8/+0xD9) и флаг победителя (+0xE1),
# и в каком порядке это идёт относительно метки «выбыл» ($1000 в +0x5C).
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
ev = []


def mk(tag, base):
    def cb(m, a, size, value, pc):
        ev.append((m.frame, tag, a, size, value, pc,
                   m.rw(P1 + 0x4C), m.rw(P2 + 0x4C)))
    return cb


for base, who in ((P1, 'P1'), (P2, 'P2')):
    md.add_watch(base + 0xD8, base + 0xD9, mk(f'{who}.побед/поражений', base))
    md.add_watch(base + 0xE1, base + 0xE1, mk(f'{who}.флагПобеды', base))
    md.add_watch(base + 0x5C, base + 0x5D, mk(f'{who}.счёт5C', base))

mode0 = md.rw(0xFF0406)
for i in range(20000):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()
    if md.rw(0xFF0406) != mode0:
        for _ in range(200):
            md.step_frame()
        break

print(f"событий: {len(ev)}; печатаю последние 25\n")
for fr, tag, a, sz, v, pc, s1, s2 in ev[-25:]:
    print(f"кадр {fr:6} {tag:18} ${a:06X} разм={sz} знач=${v:04X} PC=${pc:06X} "
          f"состояния 4C: P1={s1} P2={s2}")
print(f"\nитог: P1 побед={md.rb(P1+0xD8)} поражений={md.rb(P1+0xD9)} флаг={md.rb(P1+0xE1)}")
print(f"      P2 побед={md.rb(P2+0xD8)} поражений={md.rb(P2+0xD9)} флаг={md.rb(P2+0xE1)}")
