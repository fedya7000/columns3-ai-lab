# Свободны ли 32 байта ПОД буфером сканеров ($FF0DE0..$FF0DFF) и НАД ним
# ($FF0EE0..$FF0EFF): туда надо будет продлить копию поля на два скрытых ряда.
import sys, os
import numpy as np
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

md = session.new()
touched = {}


def cb(m, a, size, value, pc):
    for k in range(size):
        touched.setdefault(a + k, set()).add(pc)


md.add_watch(0xFF0D80, 0xFF0F3F, cb)
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(1500):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()

for lo, hi, name in ((0xFF0DC0, 0xFF0E00, 'ПОД буфером'),
                     (0xFF0E00, 0xFF0EE0, 'сам буфер (14 рядов)'),
                     (0xFF0EE0, 0xFF0F20, 'НАД буфером')):
    used = [a for a in range(lo, hi) if a in touched]
    print(f"{name} ${lo:06X}..${hi-1:06X}: тронуто {len(used)} из {hi-lo} байт")
    if used:
        pcs = set()
        for a in used:
            pcs |= touched[a]
        print(f"   первые адреса: {[f'${a:06X}' for a in used[:8]]}")
        print(f"   пишет код: {[f'${p:06X}' for p in sorted(pcs)[:8]]}")
