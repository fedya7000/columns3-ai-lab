# -*- coding: utf-8 -*-
"""Какой именно признак не зеркалится."""
import sys

sys.path.insert(0, 'tools')
import numpy as np

import brain as brains
import rules
import train_duel


boec, _, _ = train_duel.load('build/_fiks_setka.json')
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

хуже = {}
for _ in range(300):
    f = sluch_pole()
    fa = np.array(brains.extract(f, 0, 0, 0))
    fb = np.array(brains.extract(zerkalo(f), 0, 0, 0))
    d = brains.zerkalo_priznakov(fa[None, :])[0] - fb
    for i in np.nonzero(np.abs(d) > 1e-9)[0]:
        хуже.setdefault(int(i), []).append((float(fa[i]), float(fb[i])))
for i, prim in sorted(хуже.items()):
    print('%-8s расхождений %3d  примеры (fa, fb): %s'
          % (imena[i], len(prim), prim[:3]))
if not хуже:
    print('все признаки зеркалятся точно')
