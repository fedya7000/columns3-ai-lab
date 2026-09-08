# Три варианта одиночного режима — какой не ломает игру.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io, rules, brain as brains
from verify import flat, wait_stable


def make(mode):
    md = session.new(); session.boot_vs(md)
    orig = md.step_frame

    def neutral():
        io.fix_empty_slots(md)
        md.ww(io.P2 + 0x5A, 0)
        md.ww(io.P2 + 0x9E, 0)
        if mode in ('чистка', 'чистка+бессмертие'):
            base = io.field_base(md, io.P2)
            if base:
                top = base - io.HIDDEN * io.ROW
                blk = bytearray(md.uc.mem_read(top, io.TOTAL * io.ROW))
                dirty = False
                for r in range(io.TOTAL):
                    for c in range(io.COLS):
                        i = r * io.ROW + c * 2
                        if blk[i] or blk[i + 1]:
                            blk[i] = blk[i + 1] = 0; dirty = True
                if dirty:
                    md.uc.mem_write(top, bytes(blk))
        if mode in ('бессмертие', 'чистка+бессмертие'):
            md.ww(io.P2 + 0x4C, 0)

    def step():
        orig(); neutral()
    md.step_frame = step
    neutral()
    return md


for mode in ('бессмертие', 'чистка', 'чистка+бессмертие'):
    md = make(mode)
    h = io.Hands(md); head = brains.Linear()
    io.wait_ready(md, io.P1); wait_stable(md, io.P1)
    n = 0
    for i in range(40):
        if md.stopped or not io.in_battle(md):
            break
        if not io.wait_ready(md, io.P1):
            break
        fld = flat(io.field(md, io.P1)); cols = io.live_piece(md, io.P1)
        col, rot, _ = brains.best_move(fld, cols, io.next_piece(md, io.P1), head, 1)
        h.place(col, rules.cycle(cols, rot)); wait_stable(md, io.P1)
        n = i + 1
    print('%-20s ходов=%2d  режим=%04X stopped=%-5s ПЗУ=%d  камней у P2=%d'
          % (mode, n, md.rw(io.MODE), md.stopped, md.rom_write_count,
             sum(1 for r in io.field(md, io.P2) for v in r if v)))
