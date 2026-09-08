import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io
from verify import wait_stable

md = session.new(); session.boot_vs(md); io.enable_solo(md)
h = io.Hands(md)
wait_stable(md, io.P1)
print('после wait_stable: живые=%s  колонка=%d  ptr=%06X'
      % (io.live_piece(md, io.P1), io.piece_col(md, io.P1), md.rl(io.P1 + 0x4E)))
for k in range(4):
    h.tap('b')
    print('  tap b #%d -> живые=%s ptr=%06X' % (k + 1, io.live_piece(md, io.P1), md.rl(io.P1 + 0x4E)))
print()
print('--- то же, но с более длинным нажатием ---')
for hold, gap in ((4, 4), (6, 6), (2, 8)):
    h.tap('b', hold, gap)
    print('  hold=%d gap=%d -> живые=%s' % (hold, gap, io.live_piece(md, io.P1)))
