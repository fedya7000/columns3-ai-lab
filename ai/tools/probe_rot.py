# Точное соответствие: живые цвета до падения -> что легло в поле.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io, rules
from verify import flat, wait_stable

md = session.new(); session.boot_vs(md); io.enable_solo(md)
h = io.Hands(md)
wait_stable(md, io.P1)
for k in range(9):
    col = k % 6
    rot = k % 3
    before = io.field(md, io.P1)
    spawn = io.live_piece(md, io.P1)
    for _ in range(rot):
        h.tap('b')
    live = io.live_piece(md, io.P1)          # ЖИВЫЕ цвета уже после поворотов
    if h.play(col, 0) is None:
        print('сорвалось'); break
    wait_stable(md, io.P1)
    after = io.field(md, io.P1)
    landed = [after[r][col] for r in range(rules.TOTAL)
              if before[r][col] == 0 and after[r][col] != 0]
    print('пов=%d  спавн=%s -> живые=%s   легло сверху вниз=%s'
          % (rot, spawn, live, landed))
