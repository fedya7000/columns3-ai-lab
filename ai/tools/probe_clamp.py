# Придержать второму игроку только сам момент объявления завала.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io, rules, brain as brains
from verify import flat, wait_stable

md = session.new(); session.boot_vs(md)
orig = md.step_frame


def neutral():
    io.fix_empty_slots(md)
    md.ww(io.P2 + 0x5A, 0)
    md.ww(io.P2 + 0x9E, 0)
    md.ww(io.P1 + 0x8C, 0)
    md.ww(io.P2 + 0x8C, 0)
    if md.rw(io.P2 + 0x70) >= 30:
        md.ww(io.P2 + 0x70, 0)
    if md.rw(io.P2 + 0x4C) >= 16:      # только у самого порога, не каждый кадр
        md.ww(io.P2 + 0x4C, 4)
    if md.rw(io.P2 + 0x5C) == 0x1000:  # если всё же пометили — снять метку
        md.ww(io.P2 + 0x5C, 0)
    base = io.field_base(md, io.P2)
    if base:
        top = base - io.HIDDEN * io.ROW
        blk = bytearray(md.uc.mem_read(top, io.TOTAL * io.ROW))
        dirty = False
        for r in range(io.TOTAL):
            for c in range(io.COLS):
                i = r * io.ROW + c * 2
                if blk[i] or blk[i + 1]:
                    blk[i] = blk[i + 1] = 0
                    dirty = True
        if dirty:
            md.uc.mem_write(top, bytes(blk))


def step():
    orig(); neutral()


md.step_frame = step; neutral()
h = io.Hands(md); head = brains.Linear()
io.wait_ready(md, io.P1); wait_stable(md, io.P1)
n = 0
for i in range(300):
    if md.stopped or not io.in_battle(md):
        print('обрыв на ходу %d: режим=%04X stopped=%s' % (i, md.rw(io.MODE), md.stopped)); break
    if not io.wait_ready(md, io.P1):
        print('нет фигуры на ходу %d' % i); break
    fld = flat(io.field(md, io.P1)); cols = io.live_piece(md, io.P1)
    col, rot, _ = brains.best_move(fld, cols, io.next_piece(md, io.P1), head, 1)
    h.place(col, rules.cycle(cols, rot)); wait_stable(md, io.P1)
    n = i + 1
    if n % 30 == 0:
        f1 = io.field(md, io.P1)
        print('ход %3d: макс высота P1=%d  P2 +4C=%d +5C=%04X  ПЗУ=%d'
              % (n, max(io.height(f1, c) for c in range(6)),
                 md.rw(io.P2 + 0x4C), md.rw(io.P2 + 0x5C), md.rom_write_count))
print('прошло ходов: %d' % n)
