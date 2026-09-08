# -*- coding: utf-8 -*-
"""Проверка симметризации на ФИЗИЧЕСКИХ полях.

Физическое поле: слои -- целые нижние ряды, камни лежат ТОЛЬКО над стеной
(в реальной игре иначе не бывает: слои добавляются целыми рядами).
Здесь же и замер симметрии оценки после правки brain.Net.value_batch.
"""
import sys

sys.path.insert(0, 'tools')
import numpy as np

import brain as brains
import rules
import train_duel


rng = np.random.default_rng(11)


def sluch_pole():
    """Слои 0..3 целыми рядами, столбики высотой 0..9 стоят НА стене."""
    L = int(rng.integers(0, 4))
    f = rules.empty_field(layers=L)
    verh = rules.TOTAL - L                # первый ряд стены
    for c in range(rules.COLS):
        h = int(rng.integers(0, 10))
        for r in range(verh - h, verh):   # ровно h камней, нижний НА стене
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

boec, _, _ = train_duel.load('build/_fiks_setka.json')

osh = []
raz = []
for _ in range(300):
    f = sluch_pole()
    fa = np.array(brains.extract(f, 0, 0, 0))
    pf = zerkalo(f)
    fb = np.array(brains.extract(pf, 0, 0, 0))
    osh.append(np.max(np.abs(brains.zerkalo_priznakov(fa[None, :])[0] - fb)))
    raz.append(abs(float(boec.value_batch(fb[None])[0]
                         - boec.value_batch(fa[None])[0])))
print('зеркало признаков на физических полях: макс ошибка %.3g' % max(osh))
print('оценка после правки: макс |V(Pf)-V(f)| = %.3g' % max(raz))
