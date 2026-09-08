# Ищет НАКОПИТЕЛИ: ячейки RAM, которые за бой только растут (или растут почти
# всегда). Счёт, число собранных камней, длина цепочки — все такие.
#
# python counters.py [кадров]
import sys, os
import numpy as np
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import run_match

FRAMES = int(sys.argv[1]) if len(sys.argv) > 1 else 5000

md = session.new()
session.boot_vs(md)

N = 0x10000
prev = np.frombuffer(md.ram_snapshot(), dtype=np.uint8).copy()
up = np.zeros(N, dtype=np.uint32)     # сколько раз выросла
down = np.zeros(N, dtype=np.uint32)   # сколько раз упала
maxv = prev.copy()


def tick(md, i):
    global prev, up, down
    cur = np.frombuffer(md.ram_snapshot(), dtype=np.uint8)
    up += (cur > prev)
    down += (cur < prev)
    np.maximum(maxv, cur, out=maxv)
    prev = cur.copy()


run_match(md, FRAMES, tick)

print("=== ячейки, которые ТОЛЬКО РОСЛИ (ни одного падения) ===")
cand = [(int(up[a]), a) for a in range(N) if up[a] >= 3 and down[a] == 0]
cand.sort(reverse=True)
for n, a in cand[:40]:
    print(f"  $FF{a:04X}  выросла {n} раз, сейчас={prev[a]:3} (макс {maxv[a]})")

print("\n=== ячейки, которые росли МНОГО, а падали мало (счётчик со сбросом) ===")
cand2 = [(int(up[a]), int(down[a]), a) for a in range(N)
         if up[a] >= 5 and 0 < down[a] <= up[a] // 3]
cand2.sort(reverse=True)
for u, d, a in cand2[:30]:
    print(f"  $FF{a:04X}  рост {u}, падений {d}, сейчас={prev[a]:3} (макс {maxv[a]})")

np.savez(os.path.join(os.path.dirname(__file__), '..', 'docs', 'counters.npz'),
         up=up, down=down, maxv=maxv, last=prev)
