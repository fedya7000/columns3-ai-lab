# Кто заваливается первым и почему раунд обрывается на 42-м ходу.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io, rules, brain as brains
from verify import flat, wait_stable

md = session.new(); session.boot_vs(md); io.enable_solo(md, freeze_level=True)
h = io.Hands(md); head = brains.Linear()
io.wait_ready(md, io.P1); wait_stable(md, io.P1)
for i in range(46):
    if md.stopped or not io.in_battle(md):
        print('ОБРЫВ на ходу %d: режим=%04X' % (i, md.rw(io.MODE))); break
    if not io.wait_ready(md, io.P1):
        print('нет фигуры на ходу %d' % i); break
    fld = flat(io.field(md, io.P1)); cols = io.live_piece(md, io.P1)
    col, rot, _ = brains.best_move(fld, cols, io.next_piece(md, io.P1), head, 1)
    h.place(col, rules.cycle(cols, rot)); wait_stable(md, io.P1)
    f1 = io.field(md, io.P1)
    hs = [io.height(f1, c) for c in range(6)]
    if i >= 34 or i % 10 == 0:
        print('ход %2d: высоты P1=%s макс=%d | P1 +4C=%2d +5C=%04X | P2 +4C=%2d +5C=%04X камней=%d'
              % (i, hs, max(hs), md.rw(io.P1 + 0x4C), md.rw(io.P1 + 0x5C),
                 md.rw(io.P2 + 0x4C), md.rw(io.P2 + 0x5C),
                 sum(1 for r in io.field(md, io.P2) for v in r if v)))
