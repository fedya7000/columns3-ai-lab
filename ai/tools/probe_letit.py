# Попадает ли ПАДАЮЩАЯ фигура в массив поля?
#
# В самом начале работы я это проверил и решил, что нет — поле было пустым.
# Но тогда я смотрел ровно один момент. Проверяю честно: считаю камни в поле
# и сравниваю с числом уложенных фигур.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io, duel, train, train_duel

боец, _ = train.load()
_, гены, _ = train_duel.load()
след = []


def смотреть(md, f, pilots):
    if f > 400 or f % 10:
        return
    поле = io.field(md, io.P1)
    камней = sum(1 for r in поле for v in r if 0 < v < io.WALL)
    висят = 0
    for c in range(io.COLS):
        видел = False
        for r in range(io.TOTAL):
            v = поле[r][c]
            if 0 < v < io.WALL:
                видел = True
            elif v == 0 and видел:
                висят += 1
    след.append((f, pilots[0].placed, камней, висят, io.piece_col(md, io.P1),
                 io.live_piece(md, io.P1)))


r = duel.run_duel(боец, боец, layers=0, max_frames=1200, genes_a=гены,
                  genes_b=гены, quiet=True, jitter=41, on_frame=смотреть)
print('%6s %8s %8s %8s %8s %s' % ('кадр', 'уложено', 'камней', 'пустот', 'колонка', 'в руках'))
for row in след:
    ожид = row[1] * 3
    метка = '   ← камней БОЛЬШЕ, чем уложено фигур' if row[2] > ожид else ''
    print('%6d %8d %8d %8d %8d %s%s' % (row[0], row[1], row[2], row[3], row[4], row[5], метка))
