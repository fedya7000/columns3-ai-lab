# -*- coding: utf-8 -*-
"""СИНТЕТИЧЕСКИЙ ПРИГОВОР ОЦЕНКЕ: выбирает ли сеть пустую колонку вообще.

Чистый тренажёр (rules.py), без эмулятора. Строим разумные середины игры:
ровная укладка плюс одна ПУСТАЯ колонка, соседям -- разные высоты. Фигура
случайная. Спрашиваем best_move depth=1 у ТРЁХ голов:
  * обученный чемпион (build/_fiks_setka.json);
  * черновик HAND_WEIGHTS;
  * тот же чемпион, но с обнулённой НЕЛИНЕЙНОЙ частью (только прямая связка).
Считаем, сколько раз выбрана пустая колонка.
"""
import sys
import json

sys.path.insert(0, 'tools')
import numpy as np

import brain as brains
import rules
import train_duel


boec, geny, _ = train_duel.load('build/_fiks_setka.json')

# только линейная часть чемпиона
lin_only = brains.Linear(w=np.asarray(boec.lin, dtype=np.float64))
rukami = brains.Linear()

print('линейная часть чемпиона vs HAND_WEIGHTS:')
imena = ['выс%d' % c for c in range(6)] + ['пер%d' % i for i in range(5)] + \
        ['мах', 'мин', 'загруз', 'неровн', 'разброс', 'камни', 'цепочка',
         'группы', 'пары', 'достр', 'слои', 'запас'] + \
        ['цв%d' % k for k in range(1, 7)] + ['забить', 'цветов', 'свчлен']
for i, (a, b) in enumerate(zip(boec.lin, brains.HAND_WEIGHTS)):
    znak = '' if abs(a - b) < 0.05 else '   <-- расходится'
    print('  %-8s обучено %+ .3f   руки %+ .3f%s' % (imena[i], a, b, znak))

rng = np.random.default_rng(7)

def sluchaynoe_pole(pusto_kol):
    """Разумная середина игры: столбики 3..8 камней, одна колонка пуста."""
    f = rules.empty_field(layers=1)
    for c in range(rules.COLS):
        if c == pusto_kol:
            continue
        h = int(rng.integers(3, 9))
        for r in range(rules.TOTAL - 1 - h, rules.TOTAL - 1):
            f[r * rules.COLS + c] = int(rng.integers(1, 7))
    return f

N = 400
schet = {'champion': 0, 'ruki': 0, 'lin': 0}
vsyo = {'champion': 0, 'ruki': 0, 'lin': 0}
for proba in range(N):
    pk = int(rng.integers(0, 6))
    f = sluchaynoe_pole(pk)
    cur = tuple(int(x) for x in rng.choice(rules.COLOR_SET_1ON1, 3))
    nxt = tuple(int(x) for x in rng.choice(rules.COLOR_SET_1ON1, 3))
    for imya, golova in (('champion', boec), ('ruki', rukami),
                         ('lin', lin_only)):
        col, rot, _ = brains.best_move(f, cur, nxt, golova, depth=2)
        vsyo[imya] += 1
        if col == pk:
            schet[imya] += 1

print()
for imya in ('champion', 'ruki', 'lin'):
    print('%-9s: пустая колонка выбрана %d из %d (%.0f%%)'
          % (imya, schet[imya], vsyo[imya],
             100.0 * schet[imya] / max(1, vsyo[imya])))
