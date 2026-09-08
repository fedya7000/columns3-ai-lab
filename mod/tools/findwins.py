# Ищет счётчики побед/поражений: снимок RAM ДО конца раунда и ПОСЛЕ,
# затем разница в структурах игроков и в общей области.
import sys, os
import numpy as np
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
mode0 = md.rw(0xFF0406)
before = None
for i in range(20000):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    if before is None or md.rw(0xFF0406) == mode0:
        before = np.frombuffer(md.ram_snapshot(), dtype=np.uint8).copy()
    md.step_frame()
    if md.rw(0xFF0406) != mode0:
        for _ in range(400):
            md.step_frame()
        after = np.frombuffer(md.ram_snapshot(), dtype=np.uint8)
        d = np.nonzero(after != before)[0]
        print(f"конец раунда на кадре {md.frame}. изменилось байт: {len(d)}")
        print("\n— в структурах игроков (P1 $FF1000 / P2 $FF1400), только МАЛЫЕ числа —")
        for a in d:
            if 0x1000 <= a < 0x1200 or 0x1400 <= a < 0x1600:
                if after[a] <= 9 and before[a] <= 9 and after[a] != before[a]:
                    who = 'P1' if a < 0x1400 else 'P2'
                    off = a - (0x1000 if a < 0x1400 else 0x1400)
                    print(f"  {who} +0x{off:03X} (${0xFF0000+a:06X}): {before[a]} -> {after[a]}")
        print("\n— в общей области $FF0400..$FF0600 —")
        for a in d:
            if 0x0400 <= a < 0x0600 and after[a] <= 9:
                print(f"  $FF{a:04X}: {before[a]} -> {after[a]}")
        break
