# Кто вообще пишет в ПЗУ. Раньше я такие записи молча гасил, а они,
# оказывается, успевают испортить таблицы, которые игра читает в том же куске.
import os, sys, json
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import numpy as np
from unicorn import UC_HOOK_MEM_WRITE
from unicorn.m68k_const import UC_M68K_REG_A6
import brain, rules, session, bot_io as io, play_rom

d = json.load(open(os.path.join(os.path.dirname(__file__), '..', 'build', 'snapshot.json'),
                   encoding='utf-8'))
боец = brain.Net(np.asarray(d['weights']), d['n_in'], d['n_hidden'])

md = session.new(); session.boot_vs(md); io.enable_solo(md)
кто = Counter()
первые = {}


def probe(uc, access, address, size, value, user):
    pc = uc.reg_read(0x100 + 0) if False else None
    from unicorn.m68k_const import UC_M68K_REG_PC
    pc = uc.reg_read(UC_M68K_REG_PC)
    a6 = uc.reg_read(UC_M68K_REG_A6)
    кто[(pc, a6)] += 1
    if (pc, a6) not in первые:
        первые[(pc, a6)] = (address, md.frame)
    return True


md.uc.hook_add(UC_HOOK_MEM_WRITE, probe, begin=0, end=0x3FFFFF)
h = io.Hands(md, 0, io.P1)
io.wait_ready(md, io.P1); play_rom.wait_stable(md, io.P1)
for i in range(40):
    if md.stopped or not io.in_battle(md):
        print('обрыв на ходу %d' % i); break
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
print('всего записей в ПЗУ: %d' % sum(кто.values()))
print('%-12s %-12s %8s %10s %s' % ('код PC', 'a6 (слот)', 'сколько', 'куда', 'кадр'))
слоты = sorted({a6 for _, a6 in кто})
print('всего разных a6: %d' % len(слоты))
print('диапазон a6: $%06X .. $%06X' % (слоты[0], слоты[-1]))
print('все: %s' % ' '.join('%06X' % x for x in слоты))
