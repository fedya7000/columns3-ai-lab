# -*- coding: utf-8 -*-
"""ЗЕРКАЛЬНЫЙ ТЕСТ СЕТИ: различает ли она колонки НЕлинейной частью.

Игра симметрична зеркально: поле f и его отражение Pf (колонки 0..5 задом
наперёд) равноправны. Симметричная голова обязана давать V(Pf) - V(f) ровно
таким, каким его даёт линейная часть: lin @ (feat(Pf) - feat(f)).
Если ПОЛНАЯ разница систематически больше линейной -- виноват и скрытый слой,
и тогда чинить один только линейный хвост недостаточно.
"""
import sys

sys.path.insert(0, 'tools')
import numpy as np

import brain as brains
import rules
import train_duel


boec, _, _ = train_duel.load('build/_fiks_setka.json')
rng = np.random.default_rng(11)


def sluchaynoe_pole():
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


K = 300
raznicy = []
for _ in range(K):
    f = sluchaynoe_pole()
    cur = tuple(int(x) for x in rng.choice(rules.COLOR_SET_1ON1, 3))
    nxt = tuple(int(x) for x in rng.choice(rules.COLOR_SET_1ON1, 3))
    fa = np.array(brains.extract(f, 0, 0, 0))
    fb = np.array(brains.extract(zerkalo(f), 0, 0, 0))
    polnaya = float(boec.value_batch(fb[None])[0]
                    - boec.value_batch(fa[None])[0])
    lineynaya = float((fb - fa) @ boec.lin)
    raznicy.append((polnaya, lineynaya, polnaya - lineynaya))

p = np.array([r[2] for r in raznicy])
l = np.array([abs(r[1]) for r in raznicy])
print('пар полей: %d' % K)
print('полная зеркальная разница: средняя |.| %.4f, макс |.| %.4f'
      % (np.mean(np.abs(p)), np.max(np.abs(p))))
print('из неё линейная часть:     средняя |.| %.4f' % np.mean(l))
print('НЕЛИНЕЙНЫЙ остаток:        средняя |.| %.4f, макс %.4f'
      % (np.mean(np.abs(p)), np.max(np.abs(p))))
print('доля нелинейного остатка в полной разнице: %.0f%%'
      % (100 * np.sum(np.abs(p)) / max(1e-9, np.sum(l + np.abs(p)))))
