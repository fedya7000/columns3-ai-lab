# Что происходит на 35-й фигуре, когда раунд обрывается.
import os, sys, json
sys.path.insert(0, os.path.dirname(__file__))
import numpy as np
import brain, rules, session, bot_io as io, play_rom

d = json.load(open(os.path.join(os.path.dirname(__file__), '..', 'build', 'snapshot.json'),
                   encoding='utf-8'))
боец = brain.Net(np.asarray(d['weights']), d['n_in'], d['n_hidden'])

md = session.new(); session.boot_vs(md); io.enable_solo(md)
print('заморозка уровня включена: %s' % getattr(md, '_freeze_level', None))
h = io.Hands(md, 0, io.P1)
io.wait_ready(md, io.P1); play_rom.wait_stable(md, io.P1)
for i in range(40):
    if md.stopped or not io.in_battle(md):
        print('ОБРЫВ перед ходом %d: режим=%04X stopped=%s' % (i, md.rw(io.MODE), md.stopped))
        break
    if not io.wait_ready(md, io.P1):
        print('нет фигуры на ходу %d' % i); break
    поле = io.field_predicted(md, io.P1)
    cur = io.live_piece(md, io.P1)
    col, rot, _ = brain.best_move(поле, cur, io.next_piece(md, io.P1), боец, 1)
    if col is None:
        print('ходов нет на %d' % i); break
    h.place(col, rules.cycle(cur, rot))
    play_rom.wait_stable(md, io.P1)
    f1 = io.field(md, io.P1)
    if i >= 28:
        print('ход %2d: режим=%04X P1 +70=%2d +8C=%3d +5C=%5d +4C=%2d высоты=%s | P2 +4C=%2d +5C=%04X камней=%d'
              % (i, md.rw(io.MODE), md.rw(io.P1+0x70), md.rw(io.P1+0x8C), md.rw(io.P1+0x5C),
                 md.rw(io.P1+0x4C), [io.height(f1,c) for c in range(6)],
                 md.rw(io.P2+0x4C), md.rw(io.P2+0x5C),
                 sum(1 for r in io.field(md,io.P2) for v in r if 0<v<io.WALL)))
