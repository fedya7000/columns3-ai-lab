# -*- coding: utf-8 -*-
"""
РАСПРЕДЕЛЕНИЕ ГРУПП ПО СИДАМ. Замер 24.08 показал разброс 10..125 групп на
десяти сидах — то есть везение с сидом сильнее любого эффекта, который мы
ловили на трёх. Все прежние сравнения «до/после» на 47/130/200 наполовину
мерили сид, а не правку.

Гоним много сидов и смотрим ЧЕСТНУЮ картину: среднее, разброс, сколько боёв
срывается, и как часто бывают длинные партии (те, ради которых всё затеяно).
"""
import sys
from multiprocessing import Pool

sys.path.insert(0, 'tools')
import numpy as np

import duel
import train_duel as td

BOEC = 'build/ETALON_ZAMEROV.json'
SIDY = list(range(5, 230, 10))          # 23 сида по всему рабочему диапазону


def odin(jit):
    boec, geny, _ = td.load(BOEC)
    r = duel.run_duel(boec, boec, layers=0, max_frames=600000, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=jit)
    if 'ошибка' in r:
        return (jit, None, r['ошибка'][:24], r.get('кадров', 0))
    g = r.get('групп честных') or [0, 0]
    return (jit, sum(g), None, r.get('кадров', 0))


if __name__ == '__main__':
    with Pool(6) as pool:                # 10 ядер заняты обучением
        out = pool.map(odin, SIDY)

    horosho = [(j, g, k) for j, g, e, k in out if g is not None]
    sryvy = [(j, e) for j, g, e, k in out if g is None]

    print('%-8s %-9s %s' % ('jitter', 'групп', 'кадров'))
    print('-' * 34)
    for j, g, k in sorted(horosho, key=lambda x: -x[1]):
        print('%-8d %-9d %d' % (j, g, k))
    for j, e in sryvy:
        print('%-8d СРЫВ: %s' % (j, e))

    g = np.array([x[1] for x in horosho], dtype=float)
    print()
    print('боёв прошло: %d из %d (срывов %d = %.0f %%)'
          % (len(g), len(SIDY), len(sryvy), 100.0 * len(sryvy) / len(SIDY)))
    if len(g):
        print('групп: среднее %.0f, медиана %.0f, разброс %d..%d, сигма %.0f'
              % (g.mean(), np.median(g), g.min(), g.max(), g.std()))
        print('боёв длиннее 100 групп: %d (%.0f %%)'
              % (int((g >= 100).sum()), 100.0 * (g >= 100).mean()))
        print('боёв короче 30 групп:   %d (%.0f %%)'
              % (int((g < 30).sum()), 100.0 * (g < 30).mean()))
        print()
        print('⚠️ чтобы заметить прирост в 10 %% при таком разбросе, нужно'
              ' примерно %d сидов на замер' % int((2 * g.std() / (0.1 * g.mean())) ** 2))
