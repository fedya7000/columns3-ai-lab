# -*- coding: utf-8 -*-
"""Поведенческий приговор: поле и его зеркало обязаны давать зеркальные выборы.

Для каждой пробы берём случайное поле с пустой колонкой и его ЗЕРКАЛО.
Симметричная голова обязана выбрать зеркальную колонку. Считаем долю
согласованных пар и частоту выбора пустой колонки.
"""
import sys

sys.path.insert(0, 'tools')
import numpy as np

import brain as brains
import rules


rukami = brains.Linear()
rng = np.random.default_rng(21)


def sluch_pole():
    # без слоёв: тогда "пустая" колонка честно имеет высоту 0
    f = rules.empty_field(layers=0)
    verh = rules.TOTAL
    pusto = int(rng.integers(0, rules.COLS))
    for c in range(rules.COLS):
        if c == pusto:
            continue
        h = int(rng.integers(1, 9))
        for r in range(verh - h, verh):
            f[r * rules.COLS + c] = int(rng.integers(1, 7))
    return f


def zerkalo(f):
    g = f[:]
    for r in range(rules.TOTAL):
        for c in range(rules.COLS):
            g[r * rules.COLS + c] = f[r * rules.COLS + (rules.COLS - 1 - c)]
    return g


N = 400
soglasny = {'champ': 0, 'ruki': 0}
v_pustuju = {'champ': [0, 0], 'ruki': [0, 0]}
for proba in range(N):
    f = sluch_pole()
    pk = next(c for c in range(rules.COLS)
              if brains.heights(f)[c] == 0)
    pf = zerkalo(f)
    cur = tuple(int(x) for x in rng.choice(rules.COLOR_SET_1ON1, 3))
    nxt = tuple(int(x) for x in rng.choice(rules.COLOR_SET_1ON1, 3))
    for imya, golova in (('champ', None), ('ruki', rukami)):
        if golova is None:
            import train_duel
            golova, _, _ = train_duel.load('build/_fiks_setka.json')
        c1, _, _ = brains.best_move(f, cur, nxt, golova, depth=2)
        c2, _, _ = brains.best_move(pf, cur, nxt, golova, depth=2)
        if c2 == rules.COLS - 1 - c1:
            soglasny[imya] += 1
        if c1 == pk:
            v_pustuju[imya][0] += 1
        if c2 == rules.COLS - 1 - pk:
            v_pustuju[imya][1] += 1

print('пар полей: %d' % N)
for imya in ('champ', 'ruki'):
    print('%-6s: зеркальных выборов %d/%d (%.0f%%), '
          'пустая взята %d раз на поле и %d на зеркале'
          % (imya, soglasny[imya], N,
             100.0 * soglasny[imya] / N,
             v_pustuju[imya][0], v_pustuju[imya][1]))
