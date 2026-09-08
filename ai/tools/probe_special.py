# Живой опыт: что делает особый камень.
#
# Флаг +0x91 = 1 заставляет игру выдать особый камень на СРЕДНИЙ камень
# следующей фигуры (код $00D4AE). Дальше просто ждём и смотрим, что изменилось
# у обоих игроков.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io, rules, brain as brains, play_rom


def state(md, p):
    f = io.field(md, p)
    return {
        'камней': sum(1 for r in f for v in r if 0 < v < 0xFF),
        'потолок +7E': md.rw(p + 0x7E),
        'копится +78': md.rw(p + 0x78),
        'скорость +44': md.rl(p + 0x44),
        'уровень +8B': md.rb(p + 0x8B),
        'поле +06': md.rl(p + 6),
    }


def diff(a, b):
    return {k: (a[k], b[k]) for k in a if a[k] != b[k]}


runs = int(sys.argv[1]) if len(sys.argv) > 1 else 4
for attempt in range(runs):
    md = session.new(); session.boot_vs(md)
    io.fix_empty_slots(md)
    h1 = io.Hands(md, 0, io.P1); h2 = io.Hands(md, 1, io.P2)
    head = brains.Linear()
    io.wait_ready(md, io.P1)
    # разложим немного камней, чтобы поле не было пустым
    for _ in range(6 + attempt * 3):
        play_rom.one_move(md, h1, io.P1, head, 1)
        if io.piece_ready(md, io.P2):
            play_rom.one_move(md, h2, io.P2, head, 1)
    md.wb(io.P1 + 0x91, 1)                 # ← выдать особый камень
    # флаг съедается при ВЫДАЧЕ следующей фигуры, поэтому ждём её появления
    got = False
    for k in range(5):
        io.wait_ready(md, io.P1)
        raw = md.rw(io.P1 + 0x100), md.rw(io.P1 + 0x120), md.rw(io.P1 + 0x140)
        if any(v & 0x4000 for v in raw):
            print('попытка %d: особый камень в руках — %04X %04X %04X'
                  % (attempt, *raw))
            got = True
            break
        play_rom.one_move(md, h1, io.P1, head, 1)
        if io.piece_ready(md, io.P2):
            play_rom.one_move(md, h2, io.P2, head, 1)
    if not got:
        print('попытка %d: особый камень так и не выдали' % attempt)
        continue
    play_rom.one_move(md, h1, io.P1, head, 1)   # уронить особую
    play_rom.wait_stable(md, io.P1)
    t = md.rw(io.P1 + 0x94)
    print('   легла: таймер +94=%d, колонка +96=%d' % (t, md.rw(io.P1 + 0x96)))
    if t == 0 or t > 5000:
        print('   таймер не завёлся')
        continue
    before1, before2 = state(md, io.P1), state(md, io.P2)
    fired = False
    for i in range(1200):
        md.step_frame()
        if md.rw(io.P1 + 0x94) == 0 and not fired:
            fired = True
            for _ in range(30):
                md.step_frame()
            break
    print('   сработало через %d кадров' % i)
    print('   у СЕБЯ изменилось:      %s' % diff(before1, state(md, io.P1)))
    print('   у СОПЕРНИКА изменилось: %s' % diff(before2, state(md, io.P2)))
    print()
