# Сверяет числа-кандидаты в RAM с тем, что НАРИСОВАНО на экране.
# Печатает значения и снимает кадр — числа на картинке читаются глазами.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import run_match, P1, P2

FRAMES = int(sys.argv[1]) if len(sys.argv) > 1 else 3000
CAND = [0x1070, 0x10A2, 0x105A, 0x105C, 0x108C, 0x1042, 0x105E,
        0x1470, 0x14A2, 0x145A, 0x145C, 0x148C]

md = session.new()
session.boot_vs(md)
shots = os.path.join(os.path.dirname(__file__), '..', 'shots', 'corr')
os.makedirs(shots, exist_ok=True)

STEP = max(1, FRAMES // 5)


def tick(md, i):
    if (i + 1) % STEP == 0:
        p = os.path.join(shots, f"c{i+1:05}.png")
        md.render(p)
        vals = '  '.join(f"{a:04X}={md.rw(0xFF0000 + a):5}" for a in CAND)
        print(f"кадр +{i+1:5} режим={md.rw(0xFF0406):04X}\n   {vals}\n   -> {os.path.basename(p)}")


run_match(md, FRAMES, tick)
