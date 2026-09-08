# -*- coding: utf-8 -*-
"""ПРИЁМКА ПОТОЛКА 39000 на двенадцати сидах: призраков должно быть НОЛЬ,
срывов ноль. Кадры ограничиваем 60000 — иначе честные бои идут по семьдесят
тысяч кадров и замер не кончится; упёршиеся в предел помечаем.
"""
import sys
from multiprocessing import Pool
sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td

SIDY = [5, 25, 47, 65, 85, 105, 130, 145, 165, 185, 200, 215]
PREDEL = 60000


def prizrakov(md, p):
    b = io.field_base(md, p)
    if not b:
        return set()
    out = set()
    for r in range(-io.HIDDEN, io.ROWS):
        for c in range(io.COLS):
            a = b + r * io.ROW + c * 2
            v = md.rw(a)
            if v and (v & 0xFF) == 0:
                out.add(a)
    return out


def odin(jit):
    boec, geny, _ = td.load('build/net_duel.json')
    bylo = [set(), set()]
    rozhd = [0, 0]

    def na_kadre(md, f, pilots):
        for i, p in enumerate((io.P1, io.P2)):
            est = prizrakov(md, p)
            rozhd[i] += len(est - bylo[i])
            bylo[i] = est

    r = duel.run_duel(boec, boec, layers=0, max_frames=PREDEL, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=jit, on_frame=na_kadre)
    g = r.get('групп честных') or [0, 0]
    return (jit, r.get('кадров', 0), sum(g), rozhd[:], 'ошибка' in r)


if __name__ == '__main__':
    with Pool(12) as pool:
        out = pool.map(odin, SIDY)
    print('%-6s %-9s %-8s %-14s %s' % ('сид', 'кадров', 'групп', 'призраков Л/П', 'срыв'))
    print('-' * 56)
    vsego = 0
    for jit, k, g, rozhd, sryv in out:
        vsego += rozhd[1]
        print('%-6d %-9s %-8d %-14s %s'
              % (jit, ('%d предел' % k) if k >= PREDEL else k, g,
                 '%d / %d' % (rozhd[0], rozhd[1]), 'ДА' if sryv else ''))
    gr = [x[2] for x in out]
    print()
    print('призраков всего: %d   срывов: %d из %d' % (vsego, sum(1 for x in out if x[4]), len(out)))
    print('групп: сумма %d, среднее %.0f, лучший %d' % (sum(gr), sum(gr) / len(gr), max(gr)))
