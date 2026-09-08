# -*- coding: utf-8 -*-
"""СЫРОЕ ПОЛЕ вокруг дыры. Ячейка дыры держит $8000: старший байт $80 стоит,
цвет нулевой. field() маскирует & 0xFF и объявляет такую клетку ПУСТОЙ.
Печатаем поле обоих игроков словами как есть — видно, сколько таких клеток
и где они."""
import sys
sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td

KADRY = (3300, 3420, 3440, 3540, 3600, 3800, 4200)

if __name__ == '__main__':
    boec, geny, _ = td.load('build/net_duel.json')

    def na_kadre(md, f, pilots):
        if f > max(KADRY):
            raise SystemExit
        if f not in KADRY:
            return
        print('=========== кадр %d' % f)
        for imya, p in (('ЛЕВЫЙ P1', io.P1), ('ПРАВЫЙ P2', io.P2)):
            syroe = io.field_raw(md, p)
            print('  %s  слои %d  устоялось %s  живая %s'
                  % (imya, io.layers(md, p), io.settled(md, p), io.live_piece(md, p)))
            for i, row in enumerate(syroe):
                if all(v == 0 for v in row):
                    continue
                print('    %3d | %s' % (i - io.HIDDEN,
                                        ' '.join('%04X' % v for v in row)))
    try:
        duel.run_duel(boec, boec, layers=0, max_frames=max(KADRY) + 20, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=25, on_frame=na_kadre,
                      prostor=False)
    except SystemExit:
        pass
