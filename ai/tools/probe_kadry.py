# Смотрим на одну колонку кадр за кадром: висят камни или падают?
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io, duel, train, train_duel

боец, _ = train.load()
_, гены, _ = train_duel.load()
строки = []


def смотреть(md, f, pilots):
    if 130 <= f <= 185:
        поле = io.field_raw(md, io.P1)
        строки.append((f, [поле[r][1] for r in range(io.HIDDEN, io.TOTAL)],
                       io.placed(md, io.P1), md.rw(io.P1 + 0x6C)))


duel.run_duel(боец, боец, layers=0, max_frames=400, genes_a=гены,
              genes_b=гены, quiet=True, jitter=41, on_frame=смотреть)
print('колонка 1 у первого игрока, ряды +0..+12 (сырьё):')
print('%6s  %-42s %7s %6s' % ('кадр', 'ряды +6..+12', 'уложено', 'цепочка'))
for f, кол, ул, ц in строки:
    if f % 3:
        continue
    хвост = ' '.join('%04X' % v for v in кол[6:])
    print('%6d  %-42s %7d %6d' % (f, хвост, ул, ц))
