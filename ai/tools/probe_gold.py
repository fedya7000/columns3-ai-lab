# Ловим золотую фигуру там, где игра выдаёт её сама, и пробуем крутить.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io, brain as brains, play_rom

shots = os.path.join(os.path.dirname(__file__), '..', 'shots')
md = session.new(); session.boot_vs(md); io.fix_empty_slots(md)
h1 = io.Hands(md, 0, io.P1); h2 = io.Hands(md, 1, io.P2); head = brains.Linear()
io.wait_ready(md, io.P1)

found = False
for i in range(60):
    live = (md.rw(io.P1 + 0x100), md.rw(io.P1 + 0x120), md.rw(io.P1 + 0x140))
    if any((v & 0xFF) >= 7 for v in live):
        print('ЗОЛОТАЯ на ходу %d: сырьём %04X %04X %04X  (+0x70=%d +0x8C=%d +0x8B=%d +0xAB=%d)'
              % (i, live[0], live[1], live[2], md.rw(io.P1 + 0x70),
                 md.rw(io.P1 + 0x8C), md.rb(io.P1 + 0x8B), md.rb(io.P1 + 0xAB)))
        found = True
        break
    play_rom.one_move(md, h1, io.P1, head, 1)
    if io.piece_ready(md, io.P2):
        play_rom.one_move(md, h2, io.P2, head, 1)
    play_rom.wait_stable(md, io.P1)

if not found:
    print('за 60 ходов золотая не выпала (+0x70=%d +0x8C=%d)'
          % (md.rw(io.P1 + 0x70), md.rw(io.P1 + 0x8C)))
else:
    md.render(os.path.join(shots, 'zoloto_0.png'))
    for k in range(4):
        h1.tap('b')
        live = (md.rw(io.P1 + 0x100), md.rw(io.P1 + 0x120), md.rw(io.P1 + 0x140))
        print('   поворот %d -> %04X %04X %04X  колонка=%d'
              % (k + 1, live[0], live[1], live[2], io.piece_col(md, io.P1)))
        md.render(os.path.join(shots, 'zoloto_%d.png' % (k + 1)))
