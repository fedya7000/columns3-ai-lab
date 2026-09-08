# Проверяет, сбрасывается ли счёт (+0x8C) между раундами и как копятся победы.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
prev_mode = md.rw(0xFF0406)
for i in range(40000):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    # старт жмём ТОЛЬКО между раундами, иначе это пауза ($3C)
    if md.rw(0xFF0406) != 0x20 and i % 8 < 3:
        md.press(0, 'start')
        md.press(1, 'start')
    else:
        md.release(1)
    md.step_frame()
    m = md.rw(0xFF0406)
    if m != prev_mode:
        print(f"кадр {md.frame:6}  режим ${prev_mode:04X} -> ${m:04X}   "
              f"P1[8C={md.rw(P1+0x8C):4} 5C={md.rw(P1+0x5C):5} побед={md.rb(P1+0xD8)} пораж={md.rb(P1+0xD9)}]  "
              f"P2[8C={md.rw(P2+0x8C):4} 5C={md.rw(P2+0x5C):5} побед={md.rb(P2+0xD8)} пораж={md.rb(P2+0xD9)}]")
        prev_mode = m
        if md.rb(P1 + 0xD8) + md.rb(P2 + 0xD8) >= 2:
            break
