# -*- coding: utf-8 -*-
"""ТО ЖЕ самое, но сравниваем ДО и ПОСЛЕ на одинаковых пробах.

kak_bylo -- точная копия прежнего value_batch (без зеркалирования).
"""
import sys

sys.path.insert(0, 'tools')
import numpy as np

import brain as brains
import rules
import train_duel


boec, _, _ = train_duel.load('build/_fiks_setka.json')


class KakBylo(object):
    """Прежнее поведение: оценка без зеркального усреднения."""

    def __init__(self, src):
        self.src = src

    def value_batch(self, F):
        F = np.asarray(F)
        H = np.tanh(F @ self.src.W1.T + self.src.b1)
        return H @ self.src.w2 + self.src.b2 + F @ self.src.lin


kak_bylo = KakBylo(boec)
rukami = brains.Linear()
rng = np.random.default_rng(21)


def sluch_pole():
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
golovy = {'do': kak_bylo, 'posle': boec, 'ruki': rukami}
soglasny = {imya: 0 for imya in golovy}
pustaya_vzyata = {imya: 0 for imya in golovy}   # из двух членов пары хотя бы раз
for proba in range(N):
    f = sluch_pole()
    pk = next(c for c in range(rules.COLS) if brains.heights(f)[c] == 0)
    pf = zerkalo(f)
    cur = tuple(int(x) for x in rng.choice(rules.COLOR_SET_1ON1, 3))
    nxt = tuple(int(x) for x in rng.choice(rules.COLOR_SET_1ON1, 3))
    for imya, golova in golovy.items():
        c1, _, _ = brains.best_move(f, cur, nxt, golova, depth=2)
        c2, _, _ = brains.best_move(pf, cur, nxt, golova, depth=2)
        if c2 == rules.COLS - 1 - c1:
            soglasny[imya] += 1
        if c1 == pk or c2 == rules.COLS - 1 - pk:
            pustaya_vzyata[imya] += 1

print('пар полей: %d' % N)
for imya in ('do', 'posle', 'ruki'):
    print('%-5s: зеркальных выборов %3d/%d (%2.0f%%), '
          'пустая взята хоть в одной руке %3d'
          % (imya, soglasny[imya], N, 100.0 * soglasny[imya] / N,
             pustaya_vzyata[imya]))
