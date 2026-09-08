# -*- coding: utf-8 -*-
"""ИТОГ обучения на цель «группы»: новый чемпион против ПРИШПИЛЕННОГО эталона.
Меряем ГРУППЫ на одних и тех же сидах — это и есть цель владельца, а не победы.
Заодно печатаем длину боя в кадрах: по ней выбираю сид для видео."""
import sys
from multiprocessing import Pool

sys.path.insert(0, 'tools')
import numpy as np
import duel
import train_duel as td

SIDY = [5, 25, 47, 65, 85, 105, 130, 145, 165, 185, 200, 215]


def odin(arg):
    put, jit = arg
    boec, geny, _ = td.load(put)
    r = duel.run_duel(boec, boec, layers=0, max_frames=600000, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=jit)
    if 'ошибка' in r:
        return (put, jit, None, r.get('кадров', 0))
    g = r.get('групп честных') or [0, 0]
    return (put, jit, sum(g), r.get('кадров', 0))


if __name__ == '__main__':
    zadachi = [('build/net_duel.json', j) for j in SIDY] + \
              [('build/ETALON_ZAMEROV.json', j) for j in SIDY]
    with Pool(12) as pool:
        out = pool.map(odin, zadachi)

    for imya, put in (('НОВЫЙ (цель группы)', 'build/net_duel.json'),
                      ('ЭТАЛОН (gen 29)', 'build/ETALON_ZAMEROV.json')):
        stroki = [(j, g, k) for p, j, g, k in out if p == put]
        g = np.array([x[1] for x in stroki if x[1] is not None], dtype=float)
        print('%s: групп среднее %.0f, медиана %.0f, разброс %d..%d (боёв %d из %d)'
              % (imya, g.mean(), np.median(g), g.min(), g.max(), len(g), len(SIDY)))
        for j, gr, k in sorted(stroki, key=lambda x: -(x[1] or 0)):
            print('    сид %-4d групп %-5s кадров %d' % (j, gr, k))
        print()
