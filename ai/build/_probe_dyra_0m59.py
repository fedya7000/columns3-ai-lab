# -*- coding: utf-8 -*-
"""ФИГУРА ЛОЖИТСЯ НА ПУСТОТУ (глаз владельца, 0:59 записи vsya_igra.mp4).

0:59 при съёмке кадр-в-кадр = кадр 3540. Снимаем окно 3400..3650:
   - PNG каждого кадра — чтобы посмотреть глазами;
   - поле ПРАВОГО игрока (P2) текстом, но печатаем только КАДРЫ СМЕНЫ,
     иначе 250 одинаковых картинок;
   - ДЫРА = пустая клетка, под которой... нет: пустая клетка, НАД которой
     лежит камень. В устоявшемся поле такого быть не может — камень обязан
     упасть. Считаем дыры и отдельно помечаем, устоялось ли поле.
"""
import os
import shutil
import sys

sys.path.insert(0, 'tools')
import bot_io as io
import duel
import md_machine
import train_duel as td

OT, DO = 3400, 3660
KADRY = 'shots/kadry_dyra'
ZNAK = {0: '.', io.WALL: '#'}


def risunok(fld):
    return [''.join(ZNAK.get(v, str(v)) if v < 10 else '?' for v in row) for row in fld]


def dyry(fld):
    """Пустые клетки, над которыми (выше по столбцу) есть камень."""
    n = []
    for c in range(io.COLS):
        kamen = False
        for r in range(io.TOTAL):
            v = fld[r][c]
            if v == io.WALL:
                break
            if v:
                kamen = True
            elif kamen:
                n.append((r, c))
    return n


if __name__ == '__main__':
    boec, geny, meta = td.load('build/net_duel.json')
    if os.path.isdir(KADRY):
        shutil.rmtree(KADRY)
    os.makedirs(KADRY)

    proshloe = [None]

    def na_kadre(md, f, pilots):
        if not (OT <= f <= DO):
            return
        md.render(os.path.join(KADRY, 'k%06d.png' % f))
        p = io.P2
        fld = io.field(md, p)
        kart = risunok(fld)
        if kart == proshloe[0]:
            return
        proshloe[0] = kart
        d = dyry(fld)
        ust = io.settled(md, p)
        zhiv = io.live_piece(md, p)
        print('--- кадр %d  устоялось=%s  дыр=%d %s  живая фигура=%s'
              % (f, ust, len(d), d if d else '', zhiv))
        for i, s in enumerate(kart):
            print('   %3d |%s|' % (i - io.HIDDEN, s))

    duel.run_duel(boec, boec, layers=0, max_frames=DO + 20, genes_a=geny,
                  genes_b=geny, quiet=True, jitter=25, on_frame=na_kadre,
                  prostor=False)
