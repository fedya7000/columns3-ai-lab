# Живые цвета падающей фигуры лежат в блоке +0x100/+0x120/+0x140 (код $00D2AE).
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io

md = session.new(); session.boot_vs(md)
for _ in range(200):
    md.step_frame()
P = io.P1
live = lambda: (md.rw(P + 0x100) & 0xFF, md.rw(P + 0x120) & 0xFF, md.rw(P + 0x140) & 0xFF)
h = io.Hands(md)
print('спавн +60/62/64 =', io.cur_piece(md, P), '  живые +100/120/140 =', live())
for k in range(3):
    h._tap('b')
    print('после CYCLE #%d: живые = %s   спавн = %s' % (k + 1, live(), io.cur_piece(md, P)))
fb = io.field(md, P); col = io.piece_col(md, P)
h.play(col, 0)
fa = io.field(md, P)
print('легло сверху вниз:', [fa[i][col] for i in range(len(fa)) if fb[i][col] == 0 and fa[i][col] != 0])

print()
print('--- какое поле показывает СЛЕДУЮЩУЮ фигуру ---')
for k in range(4):
    a = live(); b = io.cur_piece(md, P); c = io.next_piece(md, P)
    h.play(k % 6, 0)
    for _ in range(6):
        md.step_frame()
    print('текущая=%s  +60/62/64=%s  +CE/D0/D2=%s  ->  следующая оказалась %s'
          % (a, b, c, live()))
