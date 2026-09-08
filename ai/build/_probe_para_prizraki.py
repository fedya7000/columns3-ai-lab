# -*- coding: utf-8 -*-
"""ПАРА НА ОДНИХ СИДАХ: видим призраков против не видим.

Разброс по сидам огромный (17..138 у одного бойца), поэтому судим не по
трём сидам и не по среднему из десяти, а по СОРОКА и по паре на КАЖДОМ:
один и тот же сид играется дважды, различие — только выключатель.
"""
import os
import sys
from multiprocessing import Pool

sys.path.insert(0, 'tools')
import numpy as np

SIDY = list(range(5, 236, 3))          # 77 живых сидов: выше 235 бой не начинается


def odin(arg):
    vidim, jit = arg
    os.environ['OX_PRIZRAKI'] = '1' if vidim else '0'
    import importlib
    import bot_io as io
    importlib.reload(io)
    import duel
    importlib.reload(duel)
    import train_duel as td
    importlib.reload(td)
    boec, geny, _ = td.load('build/net_duel.json')
    r = duel.run_duel(boec, boec, layers=0, max_frames=600000, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=jit)
    g = r.get('групп честных') or [0, 0]
    return (vidim, jit, sum(g), r.get('кадров', 0), 'ошибка' in r)


if __name__ == '__main__':
    zadachi = [(v, s) for v in (False, True) for s in SIDY]
    with Pool(17) as pool:
        out = pool.map(odin, zadachi)

    par = {}
    for vidim, jit, g, k, sryv in out:
        par.setdefault(jit, {})[vidim] = (g, k, sryv)

    do = np.array([par[j][False][0] for j in SIDY], dtype=float)
    posle = np.array([par[j][True][0] for j in SIDY], dtype=float)
    sryv_do = sum(par[j][False][2] for j in SIDY)
    sryv_posle = sum(par[j][True][2] for j in SIDY)

    print('%-6s %-10s %-10s %s' % ('сид', 'НЕ видим', 'ВИДИМ', 'разница'))
    print('-' * 40)
    for j in SIDY:
        a, b = par[j][False][0], par[j][True][0]
        print('%-6d %-10d %-10d %+d' % (j, a, b, b - a))
    print()
    print('групп в среднем: НЕ видим %.1f, ВИДИМ %.1f (%+.0f %%)'
          % (do.mean(), posle.mean(), 100.0 * (posle.mean() / max(do.mean(), 1e-9) - 1)))
    print('медиана: %.0f -> %.0f' % (np.median(do), np.median(posle)))
    print('лучший бой: %d -> %d' % (do.max(), posle.max()))
    print('сорванных прогонов: %d -> %d' % (sryv_do, sryv_posle))
    raznica = posle - do
    luchshe = int((raznica > 0).sum()); huzhe = int((raznica < 0).sum())
    print('сидов стало лучше %d, хуже %d, поровну %d' % (luchshe, huzhe, len(SIDY) - luchshe - huzhe))
    # знаковый критерий: при честной монете столько же побед выпадает редко
    sr = raznica.mean(); sig = raznica.std(ddof=1) / np.sqrt(len(raznica))
    print('разница парная: %+.1f групп на сид, ошибка среднего ±%.1f -> %s'
          % (sr, sig, 'правка помогает' if sr > 2 * sig else 'в пределах шума'))
