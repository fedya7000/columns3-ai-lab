# -*- coding: utf-8 -*-
"""ТРИ РЕЖИМА НА ОДНИХ СИДАХ, со СРЫВАМИ в отчёте.

  ПРЕЖДЕ  — как было утром (призрак читается как пустота, чистки нет);
  ЧТЕНИЕ  — бот видит призрака твёрдым, но клетка живёт;
  ЧИСТКА  — плюс гасим засидевшегося призрака.

Срыв эмулятора считаем отдельно: партия со срывом — это не «мало групп»,
это негодный прогон, и прятать его в среднем нельзя.
"""
import os
import sys
from multiprocessing import Pool

sys.path.insert(0, 'tools')
import numpy as np

SIDY = [5, 25, 47, 65, 85, 105, 130, 145, 165, 185, 200, 215]
REZHIMY = [('ПРЕЖДЕ', '0', '0'), ('ЧТЕНИЕ', '1', '0'), ('ЧИСТКА', '1', '1')]


def odin(arg):
    imya, prizraki, chistka, jit = arg
    os.environ['OX_PRIZRAKI'] = prizraki
    os.environ['OX_CHISTKA'] = chistka
    import importlib
    import bot_io as io; importlib.reload(io)
    import duel; importlib.reload(duel)
    import train_duel as td; importlib.reload(td)
    boec, geny, _ = td.load('build/net_duel.json')
    r = duel.run_duel(boec, boec, layers=0, max_frames=600000, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=jit)
    g = r.get('групп честных') or [0, 0]
    return (imya, jit, sum(g), r.get('кадров', 0), 'ошибка' in r)


if __name__ == '__main__':
    zadachi = [(i, p, c, s) for i, p, c in REZHIMY for s in SIDY]
    with Pool(12) as pool:
        out = pool.map(odin, zadachi)

    print('%-6s %-12s %-12s %s' % ('сид', 'ПРЕЖДЕ', 'ЧТЕНИЕ', 'ЧИСТКА'))
    print('-' * 50)
    for s in SIDY:
        yach = []
        for imya, _, _ in REZHIMY:
            g, k, sryv = next((x[2], x[3], x[4]) for x in out if x[0] == imya and x[1] == s)
            yach.append('%d%s' % (g, ' СРЫВ' if sryv else ''))
        print('%-6d %-12s %-12s %s' % (s, yach[0], yach[1], yach[2]))
    print()
    for imya, _, _ in REZHIMY:
        stroki = [x for x in out if x[0] == imya]
        g = np.array([x[2] for x in stroki], dtype=float)
        sryvov = sum(1 for x in stroki if x[4])
        print('%-8s групп в сумме %4d, в среднем %5.1f, лучший %3d, СРЫВОВ %d из %d'
              % (imya, g.sum(), g.mean(), g.max(), sryvov, len(stroki)))
