# Насколько быстро можно жать, чтобы игра ещё считала нажатия.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io

md = session.new(); session.boot_vs(md); io.enable_solo(md)
io.wait_ready(md, io.P1)

print('%6s %6s %10s %10s' % ('нажим', 'пауза', 'сдвигов', 'кадров на сдвиг'))
for hold in (1, 2, 3):
    for gap in (1, 2):
        io.wait_ready(md, io.P1)
        c0 = io.piece_col(md, io.P1)
        сдвиги = 0
        кадров = 0
        for _ in range(5):
            цель = io.piece_col(md, io.P1)
            md.press(0, 'right')
            for _ in range(hold):
                md.step_frame(); кадров += 1
            md.release(0)
            for _ in range(gap):
                md.step_frame(); кадров += 1
            if io.piece_col(md, io.P1) != цель:
                сдвиги += 1
            if io.piece_col(md, io.P1) >= 5:
                break
        print('%6d %6d %10d %10.1f' % (hold, gap, сдвиги, кадров / max(сдвиги, 1)))
        # вернуть фигуру влево
        for _ in range(6):
            md.press(0, 'left'); md.step_frame(); md.step_frame()
            md.release(0); md.step_frame(); md.step_frame()

print()
print('можно ли крутить и двигать ОДНОВРЕМЕННО:')
io.wait_ready(md, io.P1)
c0 = io.piece_col(md, io.P1); l0 = io.live_piece(md, io.P1)
md.press(0, 'right', 'b')
md.step_frame(); md.step_frame()
md.release(0)
md.step_frame(); md.step_frame()
print('   было колонка=%d цвета=%s' % (c0, l0))
print('   стало колонка=%d цвета=%s' % (io.piece_col(md, io.P1), io.live_piece(md, io.P1)))
