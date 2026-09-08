# -*- coding: utf-8 -*-
"""ПРИГОВОР ПО КАЖДОЙ КОЛОНКЕ: какую пустую колонку какая голова выбирает.

Разбивка синтетического теста по номеру пустой колонки + три починки:
  champ      -- обученный чемпион как есть;
  sym_lin    -- чемпион с шестью весами высот, выровненными по среднему;
  nohidden   -- у чемпиона нелинейная часть спит (осталась прямая связка);
  ruki       -- черновая голова (санити-чек: должна быть симметричной).
"""
import sys

sys.path.insert(0, 'tools')
import numpy as np

import brain as brains
import rules
import train_duel


boec, geny, _ = train_duel.load('build/_fiks_setka.json')

# починка 1: шесть весов высот -- по среднему
lin = np.asarray(boec.lin, dtype=np.float64).copy()
sred = float(lin[0:6].mean())
print('веса высот чемпиона:', np.round(lin[0:6], 3), ' среднее %.3f' % sred)
lin_sym = lin.copy()
lin_sym[0:6] = sred


class Podmena(object):
    """Чемпион с заменённой линейной частью."""

    def __init__(self, src, lin):
        self.src = src
        self.lin = lin

    def value_batch(self, F):
        H = np.tanh(np.asarray(F) @ self.src.W1.T + self.src.b1)
        return H @ self.src.w2 + self.src.b2 + np.asarray(F) @ self.lin


champ = boec
sym_lin = Podmena(boec, lin_sym)
nohidden = Podmena(boec, lin)
rukami = brains.Linear()

golovy = {'champ': champ, 'sym_lin': sym_lin, 'nohidden': nohidden,
          'ruki': rukami}

rng = np.random.default_rng(7)


def sluchaynoe_pole(pusto_kol):
    f = rules.empty_field(layers=1)
    for c in range(rules.COLS):
        if c == pusto_kol:
            continue
        h = int(rng.integers(3, 9))
        for r in range(rules.TOTAL - 1 - h, rules.TOTAL - 1):
            f[r * rules.COLS + c] = int(rng.integers(1, 7))
    return f


N = 600
schet = {imya: {c: 0 for c in range(6)} for imya in golovy}
vsyo = {imya: {c: 0 for c in range(6)} for imya in golovy}
for proba in range(N):
    pk = proba % 6                    # поровну на каждую колонку
    f = sluchaynoe_pole(pk)
    cur = tuple(int(x) for x in rng.choice(rules.COLOR_SET_1ON1, 3))
    nxt = tuple(int(x) for x in rng.choice(rules.COLOR_SET_1ON1, 3))
    for imya, golova in golovy.items():
        col, rot, _ = brains.best_move(f, cur, nxt, golova, depth=2)
        vsyo[imya][pk] += 1
        if col == pk:
            schet[imya][pk] += 1

print()
print('%-9s %s' % ('голова', ' '.join('кол%d' % c for c in range(6))))
for imya in golovy:
    print('%-9s %s' % (imya, ' '.join('%4d%%' % (100.0 * schet[imya][c]
                                                  / max(1, vsyo[imya][c]))
                                       for c in range(6))))
