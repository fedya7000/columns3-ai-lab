# -*- coding: utf-8 -*-
"""ЕСТЬ ЛИ У ВТОРОГО ИГРОКА СВОЙ ВОДИТЕЛЬ. Никто НЕ жмёт ни одной кнопки.
Если у кого-то фигура сама меняет столбец или поворот — ею правит код игры,
и тогда наш пилот дерётся с ним за одну и ту же фигуру."""
import sys
sys.path.insert(0, 'tools')
import bot_io as io
import session

if __name__ == '__main__':
    md = session.new()
    session.boot_vs(md)
    dvizhenij = [0, 0]
    povorotov = [0, 0]
    proshloe = [None, None]
    for _ in range(1200):
        if md.stopped or not io.in_battle(md):
            break
        io.fix_empty_slots(md)
        md.release(0)
        md.release(1)
        md.step_frame()
        for i, p in enumerate((io.P1, io.P2)):
            sost = (io.piece_col(md, p), io.live_piece(md, p))
            if proshloe[i] is not None and sost != proshloe[i]:
                if sost[0] != proshloe[i][0]:
                    dvizhenij[i] += 1
                if sost[1] != proshloe[i][1]:
                    povorotov[i] += 1
            proshloe[i] = sost
    print('кадров прожито: %d, в бою: %s' % (md.frame, io.in_battle(md)))
    for i, imya in enumerate(('ЛЕВЫЙ', 'ПРАВЫЙ')):
        print('  %s: смен столбца %d, смен поворота %d'
              % (imya, dvizhenij[i], povorotov[i]))
    print()
    print('смены столбца при молчащем джойстике = фигурой правит КТО-ТО ЕЩЁ')
