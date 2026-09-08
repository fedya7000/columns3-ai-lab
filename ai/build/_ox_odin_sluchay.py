# -*- coding: utf-8 -*-
"""Один провальный случай: печать поля, зеркала и всех признаков."""
import sys

sys.path.insert(0, 'tools')
import numpy as np

import brain as brains
import rules


rng = np.random.default_rng(11)


def sluch_pole():
    f = rules.empty_field(layers=int(rng.integers(0, 4)))
    for c in range(rules.COLS):
        h = int(rng.integers(0, 10))
        for r in range(rules.TOTAL - 1 - h, rules.TOTAL - 1):
            f[r * rules.COLS + c] = int(rng.integers(1, 7))
    return f


def zerkalo(f):
    g = f[:]
    for r in range(rules.TOTAL):
        for c in range(rules.COLS):
            g[r * rules.COLS + c] = f[r * rules.COLS + (rules.COLS - 1 - c)]
    return g


imena = ['выс%d' % c for c in range(6)] + ['пер%d' % i for i in range(5)] + \
        ['мах', 'мин', 'загруз', 'неровн', 'разброс', 'камни', 'цепочка',
         'группы', 'пары', 'достр', 'слои', 'запас'] + \
        ['цв%d' % k for k in range(1, 7)] + ['забить', 'цветов', 'свчлен']

for _ in range(300):
    f = sluch_pole()
    fa = np.array(brains.extract(f, 0, 0, 0))
    pf = zerkalo(f)
    fb = np.array(brains.extract(pf, 0, 0, 0))
    d = brains.zerkalo_priznakov(fa[None, :])[0] - fb
    if np.max(np.abs(d)) > 1e-9:
        print('ПРОБЛЕМНЫЙ СЛУЧАЙ:')
        print('исходное поле (снизу вверх):')
        for r in range(rules.TOTAL - 1, -1, -1):
            print('   ', f[r * rules.COLS:(r + 1) * rules.COLS])
        print('зеркало (снизу вверх):')
        for r in range(rules.TOTAL - 1, -1, -1):
            print('   ', pf[r * rules.COLS:(r + 1) * rules.COLS])
        print('дно по brain.wall_depth: %d / %d'
              % (brains.wall_depth(f), brains.wall_depth(pf)))
        print('высоты: %s / %s' % (brains.heights(f), brains.heights(pf)))
        for i in np.nonzero(np.abs(d) > 1e-9)[0][:8]:
            print('  %-8s зеркал.%+ .4f против.%+ .4f'
                  % (imena[i], brains.zerkalo_priznakov(fa[None, :])[0][i],
                     fb[i]))
        break
