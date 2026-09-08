# Падает ли игра БЕЗ наших правок ОЗУ? Оба игрока ведутся ботом.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io, rules, brain as brains
from verify import flat, wait_stable

solo = '--solo' in sys.argv
md = session.new(); session.boot_vs(md)
if solo:
    io.enable_solo(md, freeze_level=True)
h1 = io.Hands(md, 0, io.P1)
h2 = io.Hands(md, 1, io.P2)
head = brains.Linear()
io.wait_ready(md, io.P1); wait_stable(md, io.P1)
for i in range(40):
    if md.stopped or not io.in_battle(md):
        print('оборвалось на ходу %d: stopped=%s режим=%04X ПЗУ_записей=%d'
              % (i, md.stopped, md.rw(io.MODE), md.rom_write_count))
        break
    if not io.wait_ready(md, io.P1):
        print('нет фигуры на ходу %d' % i); break
    fld = flat(io.field(md, io.P1)); cols = io.live_piece(md, io.P1)
    col, rot, _ = brains.best_move(fld, cols, io.next_piece(md, io.P1), head, 1)
    h1.place(col, rules.cycle(cols, rot))
    if not solo and io.piece_ready(md, io.P2):
        f2 = flat(io.field(md, io.P2)); c2 = io.live_piece(md, io.P2)
        col2, rot2, _ = brains.best_move(f2, c2, io.next_piece(md, io.P2), head, 1)
        if col2 is not None:
            h2.place(col2, rules.cycle(c2, rot2))
    wait_stable(md, io.P1)
else:
    print('прошли 40 ходов без обрыва')
print('режим=%04X stopped=%s записей в ПЗУ=%d слот3 +0x5C=%04X игроков=%d'
      % (md.rw(io.MODE), md.stopped, md.rom_write_count,
         md.rw(io.SLOTS[2] + 0x5C), md.rw(0xFF0422)))
