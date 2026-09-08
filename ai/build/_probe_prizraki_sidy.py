# -*- coding: utf-8 -*-
"""ПРИЗРАКИ ПО СИДАМ: всегда ли страдает ПРАВЫЙ? Если да — беда структурная
(что-то в обработке второго игрока), а не везение сида."""
import sys
from multiprocessing import Pool
sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td

SIDY = [5, 25, 47, 65, 85, 105, 130, 145, 165, 185, 200, 215]


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
    kadrov_s = [0, 0]

    def na_kadre(md, f, pilots):
        for i, p in enumerate((io.P1, io.P2)):
            est = prizrakov(md, p)
            rozhd[i] += len(est - bylo[i])
            if est:
                kadrov_s[i] += 1
            bylo[i] = est

    r = duel.run_duel(boec, boec, layers=0, max_frames=600000, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=jit, on_frame=na_kadre,
                      prostor=False)
    k = r.get('кадров', 1) or 1
    g = r.get('групп честных') or [0, 0]
    return (jit, k, g, rozhd[:], [100.0 * x / k for x in kadrov_s])


if __name__ == '__main__':
    with Pool(12) as pool:
        out = pool.map(odin, SIDY)
    print('%-6s %-8s %-12s %-16s %s' % ('сид', 'кадров', 'групп', 'призраков Л/П', 'доля кадров с призраком Л/П'))
    print('-' * 78)
    vsego = [0, 0]
    for jit, k, g, rozhd, dolya in sorted(out):
        vsego[0] += rozhd[0]; vsego[1] += rozhd[1]
        print('%-6d %-8d %-12s %-16s %.0f %% / %.0f %%'
              % (jit, k, '%d/%d' % (g[0], g[1]), '%d / %d' % (rozhd[0], rozhd[1]),
                 dolya[0], dolya[1]))
    print()
    print('ИТОГО призраков: левый %d, правый %d' % (vsego[0], vsego[1]))
