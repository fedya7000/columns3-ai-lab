# -*- coding: utf-8 -*-
"""Частота выбора ПУСТОЙ колонки в зависимости от её НОМЕРА: до/после.

Прямой аналог боевого перекоса (пустовали только колонки 1 и 5).
"""
import sys

sys.path.insert(0, 'tools')
import numpy as np

import brain as brains
import rules
import train_duel


boec, _, _ = train_duel.load('build/_fiks_setka.json')


class KakBylo(object):
    def __init__(self, src):
        self.src = src

    def value_batch(self, F):
        F = np.asarray(F)
        H = np.tanh(F @ self.src.W1.T + self.src.b1)
        return H @ self.src.w2 + self.src.b2 + F @ self.src.lin


kak_bylo = KakBylo(boec)
rng = np.random.default_rng(31)


def pole_s_pustoy(pk):
    f = rules.empty_field(layers=0)
    verh = rules.TOTAL
    for c in range(rules.COLS):
        if c == pk:
            continue
        h = int(rng.integers(3, 9))
        for r in range(verh - h, verh):
            f[r * rules.COLS + c] = int(rng.integers(1, 7))
    return f


N_PER_COL = 150
golovy = {'do': kak_bylo, 'posle': boec}
vybor = {imya: {k: 0 for k in range(6)} for imya in golovy}
for imya in golovy:
    rng_col = np.random.default_rng(555)     # одинаковые поля для обеих голов
    for pk in range(6):
        for _ in range(N_PER_COL):
            f = pole_s_pustoy(pk)
            cur = tuple(int(x) for x in rng_col.choice(rules.COLOR_SET_1ON1, 3))
            nxt = tuple(int(x) for x in rng_col.choice(rules.COLOR_SET_1ON1, 3))
            c1, _, _ = brains.best_move(f, cur, nxt, golovy[imya], depth=2)
            if c1 == pk:
                vybor[imya][pk] += 1

print('пустая колонка -> как часто голова кладёт ИМЕННО в неё:')
print('%-6s %s' % ('', ' '.join('кол%d' % k for k in range(6))))
for imya in golovy:
    print('%-6s %s' % (imya, ' '.join('%4d%%'
          % (100 * vybor[imya][k] / N_PER_COL) for k in range(6))))
