# Почему один игрок укладывает 38 фигур за 70 тысяч кадров?
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io, duel, train, train_duel, rules

боец, meta = train.load()
_, гены, _ = train_duel.load()
след = []


def смотреть(md, f, pilots):
    if f % 3000 == 0:
        pl = pilots[1]
        поле = io.field(md, io.P2)
        мёртв = any(0 < поле[r][c] < io.WALL
                    for r in range(rules.DEAD_ROW + 1) for c in range(io.COLS))
        след.append((f, pl.placed, pl.phase, io.piece_ready(md, io.P2),
                     md.rw(io.P2 + 0x76), io.stack_top(md, io.P2),
                     io.layers(md, io.P2), мёртв, md.rw(io.MODE)))


r = duel.run_duel(боец, боец, layers=1, max_frames=120000, genes_a=гены,
                  genes_b=гены, quiet=True, jitter=130, on_frame=смотреть)
print('итог:', {k: r.get(k) for k in ('победил', 'фигур', 'кадров', 'умерли на кадрах')})
print()
print('%8s %7s %8s %7s %6s %6s %6s %7s %6s'
      % ('кадр', 'фигур2', 'фаза', 'готова', '+0x76', 'верх', 'слои', 'мёртв', 'режим'))
for row in след[:16]:
    print('%8d %7d %8s %7s %6d %6d %6d %7s %604X' % row)
