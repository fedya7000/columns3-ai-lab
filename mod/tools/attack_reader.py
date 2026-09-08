# Кто читает биты кнопок АТАКИ (+0xAE, +0xAF структуры игрока).
# Боты специально жмут A и C, иначе код атаки просто не вызовется.
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

md = session.new()
hits = Counter()
targets = {0xFF10AD: 'AD поворот', 0xFF10AE: 'AE атака-1', 0xFF10AF: 'AF атака-2'}


def cb(m, a, size, pc):
    hits[(a, pc)] += 1


for a in targets:
    md.add_read_watch(a, a, cb)
session.boot_vs(md)

bots = [Bot(0, P1, 5), Bot(1, P2, 91)]
for i in range(4000):
    for b in bots:
        btns = b.decide(md)
        # каждые 40 кадров нарочно жмём кнопки атаки
        if i % 40 < 4:
            md.press(b.port, 'a', 'c')
        elif btns and i % 2 == 0:
            md.press(b.port, *btns)
        else:
            md.release(b.port)
    md.step_frame()
    if md.stopped:
        print("ОСТАНОВ:", md.log[-1].splitlines()[0])
        break

print("кто читает биты кнопок:")
for (a, pc), n in hits.most_common(14):
    print(f"  ${a:06X} ({targets.get(a,'?'):12}) <- PC=${pc:06X}  {n} раз")
