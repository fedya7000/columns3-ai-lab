# Проверка одиночного режима: раунд не должен кончаться из-за второго игрока.
import os, sys, time
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io

md = session.new()
session.boot_vs(md)
io.enable_solo(md)
h = io.Hands(md)
t0 = time.time()
n = 0
while n < 120:
    if not io.in_battle(md) or md.stopped:
        print('бой прервался на фигуре %d, режим=%04X' % (n, md.rw(io.MODE)))
        break
    fld = io.field(md, io.P1)
    heights = [io.height(fld, c) for c in range(6)]
    col = heights.index(min(heights))
    if h.play(col, 0) is None:
        print('ход сорвался на фигуре %d, режим=%04X' % (n, md.rw(io.MODE)))
        break
    n += 1
    if n % 30 == 0:
        f2 = io.field(md, io.P2)
        busy2 = sum(1 for r in f2 for v in r if v)
        print('фигур=%3d  высоты=%s  завал=%2d  групп=%d  у игрока2 камней=%d  (%.0f кадр/с)'
              % (n, heights, md.rw(io.P1 + 0x4C), io.groups(md, io.P1), busy2,
                 md.frame / (time.time() - t0)))
print('итого фигур: %d, кадров: %d, время %.1f с' % (n, md.frame, time.time() - t0))
