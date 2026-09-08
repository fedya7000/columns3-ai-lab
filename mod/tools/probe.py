# Ищет в RAM «интересные» ячейки во время боя: что меняется, что только растёт,
# что похоже на отдельные цифры счёта (значения всегда 0..9).
#
# python probe.py <кадров>
import sys, os, time
import numpy as np
sys.path.insert(0, os.path.dirname(__file__))
import session

FRAMES = int(sys.argv[1]) if len(sys.argv) > 1 else 900

t0 = time.time()
md = session.new()
session.boot_vs(md)
print(f"вошли в бой за {md.frame} кадров ({time.time()-t0:.1f} с)")

snap = np.frombuffer(md.ram_snapshot(), dtype=np.uint8).copy()
changes = np.zeros(len(snap), dtype=np.uint32)
minv = snap.copy()
maxv = snap.copy()
last = snap.copy()

t1 = time.time()
for i in range(FRAMES):
    md.step_frame()
    if md.stopped:
        print("ОСТАНОВ:", md.log[-1])
        break
    cur = np.frombuffer(md.ram_snapshot(), dtype=np.uint8)
    diff = cur != last
    changes += diff
    np.minimum(minv, cur, out=minv)
    np.maximum(maxv, cur, out=maxv)
    last = cur.copy()
dt = time.time() - t1
print(f"прогон {md.frame} кадров, замер {FRAMES} кадров за {dt:.1f} с "
      f"({FRAMES/max(dt,0.001):.1f} кадр/с)")

base = 0xFF0000
idx = np.nonzero(changes)[0]
print(f"\nменялось байт: {len(idx)}")

# --- кандидаты в цифры счёта: всегда 0..9 и менялись ---
dig = [i for i in idx if maxv[i] <= 9]
print(f"\n=== кандидаты в ЦИФРЫ (значения 0..9), {len(dig)} шт ===")
runs = []
cur_run = []
for i in dig:
    if cur_run and i == cur_run[-1] + 1:
        cur_run.append(i)
    else:
        if cur_run:
            runs.append(cur_run)
        cur_run = [i]
if cur_run:
    runs.append(cur_run)
for r in sorted(runs, key=lambda x: -len(x))[:25]:
    print(f"  ${base+r[0]:06X}..${base+r[-1]:06X}  длина={len(r):2}  "
          f"смен={[int(changes[i]) for i in r][:8]}  макс={[int(maxv[i]) for i in r][:8]}")

# --- самые «живые» ячейки ---
print("\n=== 30 самых часто меняющихся байт ===")
for i in sorted(idx, key=lambda x: -changes[x])[:30]:
    print(f"  ${base+i:06X} смен={changes[i]:5} диапазон={minv[i]}..{maxv[i]}")

np.savez(os.path.join(os.path.dirname(__file__), '..', 'docs', 'probe.npz'),
         changes=changes, minv=minv, maxv=maxv, last=last)
print("\nсохранено в docs/probe.npz")
