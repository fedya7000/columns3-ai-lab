# Отчего боец умирает в бою на 94-й фигуре, если в одиночку живёт вечно?
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io, duel, train

head, _ = train.load()
след = []


def watch(md, f, pilots):
    if f % 600 == 0:
        след.append((f, pilots[0].placed, md.rl(io.P1 + 0x44), md.rb(io.P1 + 0xB0),
                     io.stack_top(md, io.P1), io.layers(md, io.P1)))


r = duel.run_duel(head, head, layers=1, max_frames=90000,
                  genes_a=[0, 0, 0, 0, 0, 0, -9], genes_b=[0, 0, 0, 0, 0, 0, -9],
                  quiet=True, jitter=11, on_frame=watch)
print('%7s %7s %10s %8s %10s %7s' % ('кадр', 'фигур', 'скорость', 'набор', 'верх стопки', 'слои'))
for row in след:
    print('%7d %7d %10d %8d %10d %7d' % row)
print()
print('итог:', {k: r.get(k) for k in ('победил', 'фигур', 'кадров', 'слоёв')})
