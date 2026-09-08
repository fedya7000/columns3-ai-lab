# Флаг +0x8B («уровень поднят») — что он ломает.
#
# Код $00D2E0: если +0x8B стоит, у ТОЛЬКО ЧТО ВЫДАННОЙ фигуры снимается
# флаг особого камня ($4000) и гасится его таймер +0x94.
# Код $00D286: если +0x8B стоит и фигура ЗОЛОТАЯ (первый цвет = 7), она
# не кладётся и счётчик фигур не растёт — то есть не засчитывается.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io, brain as brains, play_rom


def try_special(flag_8b):
    md = session.new(); session.boot_vs(md); io.fix_empty_slots(md)
    h1 = io.Hands(md, 0, io.P1); h2 = io.Hands(md, 1, io.P2); head = brains.Linear()
    io.wait_ready(md, io.P1)
    for _ in range(8):
        play_rom.one_move(md, h1, io.P1, head, 1)
        if io.piece_ready(md, io.P2):
            play_rom.one_move(md, h2, io.P2, head, 1)
    md.wb(io.P1 + 0x91, 1)                    # заказать особый камень
    md.wb(io.P1 + 0x8B, 1 if flag_8b else 0)  # ← испытуемый флаг
    for k in range(5):
        md.wb(io.P1 + 0x8B, 1 if flag_8b else 0)
        io.wait_ready(md, io.P1)
        raw = (md.rw(io.P1 + 0x100), md.rw(io.P1 + 0x120), md.rw(io.P1 + 0x140))
        nxt = (md.rw(io.P1 + 0xCE), md.rw(io.P1 + 0xD0), md.rw(io.P1 + 0xD2))
        if any(v & 0x4000 for v in nxt):
            # дождаться, пока ЭТА фигура окажется в руках
            play_rom.one_move(md, h1, io.P1, head, 1)
            md.wb(io.P1 + 0x8B, 1 if flag_8b else 0)
            io.wait_ready(md, io.P1)
            live = (md.rw(io.P1 + 0x100), md.rw(io.P1 + 0x120), md.rw(io.P1 + 0x140))
            return live, nxt
        play_rom.one_move(md, h1, io.P1, head, 1)
    return None, None


for flag in (False, True):
    raw, nxt = try_special(flag)
    print('+0x8B = %d:' % flag)
    if raw is None:
        print('   особый камень так и не выдали')
    else:
        print('   следующая сырьём: %04X %04X %04X' % nxt)
        print('   в руках сырьём:   %04X %04X %04X   %s'
              % (raw + ('ОСОБЫЙ НА МЕСТЕ' if any(v & 0x4000 for v in raw)
                        else '← флаг $4000 СНЯТ, камень испорчен',)))
