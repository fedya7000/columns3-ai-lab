# Пишет журнал изменений выбранных полей структуры игрока за долгий бой.
# Так видно смысл поля: когда растёт, когда сбрасывается, чем кончается раунд.
#
# python trackfields.py [кадров]
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import run_match, P1, P2

FRAMES = int(sys.argv[1]) if len(sys.argv) > 1 else 12000
# смещения в структуре игрока, за которыми следим
OFFS = [0x5A, 0x5C, 0x6C, 0x70, 0x76, 0x8C, 0xA2]
GLOB = [0xFF0406, 0xFF0418, 0xFF0500]

md = session.new()
session.boot_vs(md, best_of=0)
prev = None
log = []


def tick(md, i):
    global prev
    v = (tuple(md.rw(P1 + o) for o in OFFS)
         + tuple(md.rw(P2 + o) for o in OFFS)
         + tuple(md.rw(g) for g in GLOB))
    if v != prev:
        n = len(OFFS)
        p1 = ' '.join(f"{OFFS[k]:02X}={v[k]:4}" for k in range(n))
        p2 = ' '.join(f"{OFFS[k]:02X}={v[n+k]:4}" for k in range(n))
        g = ' '.join(f"{GLOB[k]:06X}={v[2*n+k]:4}" for k in range(len(GLOB)))
        log.append(f"к{md.frame:6}  P1[{p1}]  P2[{p2}]  {g}")
        prev = v


run_match(md, FRAMES, tick)
print(f"строк журнала: {len(log)}")
out = os.path.join(os.path.dirname(__file__), '..', 'docs', 'track.log')
open(out, 'w', encoding='utf-8').write('\n'.join(log))
print("журнал:", out)
for L in log[:15]:
    print(L)
print('...')
for L in log[-25:]:
    print(L)
