# Точный опыт: ловушки прямо на подпрограммы эффектов особого камня.
#
# Разбор кода: пуск по биту 1 в +0xA8 ($00EFA0 -> $00F086), выбор случайный из
# таблицы $00F138 (8 входов, 4 разные подпрограммы, значит по 25% на каждую).
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
from unicorn import UC_HOOK_CODE
from unicorn.m68k_const import UC_M68K_REG_A0, UC_M68K_REG_A6
import session, bot_io as io, brain as brains, play_rom

NAMES = {0xF0D8: 'сжечь ВСЁ поле + вернуть себе потолок',
         0xF11E: 'сопернику потолок ниже на 5',
         0xF126: 'сопернику разогнать падение',
         0xF130: 'сопернику поднять уровень'}

md = session.new(); session.boot_vs(md); io.fix_empty_slots(md)
events = []


def make(addr):
    def cb(uc, address, size, user):
        a0 = uc.reg_read(UC_M68K_REG_A0)
        a6 = uc.reg_read(UC_M68K_REG_A6)
        events.append((addr, a6, a0, md.frame))
    return cb


for a in NAMES:
    md.uc.hook_add(UC_HOOK_CODE, make(a), begin=a, end=a)

h1 = io.Hands(md, 0, io.P1); h2 = io.Hands(md, 1, io.P2); head = brains.Linear()
io.wait_ready(md, io.P1)
for _ in range(8):
    play_rom.one_move(md, h1, io.P1, head, 1)
    if io.piece_ready(md, io.P2):
        play_rom.one_move(md, h2, io.P2, head, 1)

seen = {}
for k in range(24):
    play_rom.one_move(md, h1, io.P1, head, 1)
    play_rom.wait_stable(md, io.P1)
    n0 = len(events)
    before = (md.rw(io.P2 + 0x78), md.rl(io.P2 + 0x44), md.rb(io.P2 + 0x8B),
              sum(1 for r in io.field_raw(md, io.P1) for v in r if v & 0x8000))
    md.wb(io.P1 + 0xA8, md.rb(io.P1 + 0xA8) | 2)
    for _ in range(6):
        md.step_frame()
    after = (md.rw(io.P2 + 0x78), md.rl(io.P2 + 0x44), md.rb(io.P2 + 0x8B),
             sum(1 for r in io.field_raw(md, io.P1) for v in r if v & 0x8000))
    for addr, a6, a0, fr in events[n0:]:
        name = NAMES[addr]
        seen[name] = seen.get(name, 0) + 1
        who = {io.P1: 'ЭТОТ игрок', io.P2: 'СОПЕРНИК'}
        print('$%04X  %s' % (addr, name))
        print('    a6=%s  a0=%s' % (who.get(a6, '%06X' % a6), who.get(a0, '%06X' % a0)))
        print('    у соперника +78=%s->%s  скорость=%s->%s  +8B=%s->%s | помечено у себя %s->%s'
              % (before[0], after[0], before[1], after[1], before[2], after[2],
                 before[3], after[3]))
print()
print('сколько раз какая сработала:', seen)
