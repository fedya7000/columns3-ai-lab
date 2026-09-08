# Кто пишет в $FF0406 (номер режима) мусор и обрывает раунд.
import os, sys, json
sys.path.insert(0, os.path.dirname(__file__))
import numpy as np
import brain, rules, session, bot_io as io, play_rom

d = json.load(open(os.path.join(os.path.dirname(__file__), '..', 'build', 'snapshot.json'),
                   encoding='utf-8'))
боец = brain.Net(np.asarray(d['weights']), d['n_in'], d['n_hidden'])

md = session.new(); session.boot_vs(md); io.enable_solo(md)
записи = []


from unicorn.m68k_const import UC_M68K_REG_A0, UC_M68K_REG_A6


def cb(md_, a, size, value, pc):
    записи.append((md.frame, a, size, value, pc,
                   md.uc.reg_read(UC_M68K_REG_A6),
                   md.uc.reg_read(UC_M68K_REG_A0)))


md.add_watch(0xFF0406, 0xFF0407, cb)
h = io.Hands(md, 0, io.P1)
io.wait_ready(md, io.P1); play_rom.wait_stable(md, io.P1)
for i in range(40):
    if md.stopped or not io.in_battle(md):
        print('обрыв на ходу %d, режим=%04X' % (i, md.rw(io.MODE)))
        break
    if not io.wait_ready(md, io.P1):
        break
    поле = io.field_predicted(md, io.P1)
    cur = io.live_piece(md, io.P1)
    col, rot, _ = brain.best_move(поле, cur, io.next_piece(md, io.P1), боец, 1)
    if col is None:
        break
    h.place(col, rules.cycle(cur, rot))
    play_rom.wait_stable(md, io.P1)
print()
print('последние записи в $FF0406:')
for fr, a, sz, v, pc, a6, a0 in записи[-6:]:
    print('   кадр %6d  адрес $%06X  значение %04X  PC=$%06X  a6=$%06X  a0=$%06X'
          % (fr, a, v, pc, a6, a0))
    print('        у этого слота +0x0E = $%08X' % md.rl(a6 + 0x0E))
