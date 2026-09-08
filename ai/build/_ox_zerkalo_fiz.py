# -*- coding: utf-8 -*-
"""Зеркальная асимметрия сети на ФИЗИЧЕСКИХ полях (камни стоят на полу/стене).

Считаем разницу оценки поля и его зеркала ПОЛНОСТЬЮ и по частям:
линейная часть vs скрытый слой. Плюс проверяем точность зеркала признаков.
"""
import sys

sys.path.insert(0, 'tools')
import numpy as np

import brain as brains
import rules
import train_duel


boec, _, _ = train_duel.load('build/_fiks_setka.json')
rng = np.random.default_rng(11)


def sluch_pole():
    L = int(rng.integers(0, 4))
    f = rules.empty_field(layers=L)
    verh = rules.TOTAL - L              # первый ряд стены
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


K = 400
lin_r = []
nelin_r = []
poln_r = []
osh_priznakov = 0.0
for _ in range(K):
    f = sluch_pole()
    fa = np.array(brains.extract(f, 0, 0, 0))
    pf = zerkalo(f)
    fb = np.array(brains.extract(pf, 0, 0, 0))
    osh_priznakov = max(osh_priznakov,
                        float(np.max(np.abs(
                            brains.zerkalo_priznakov(fa[None, :])[0] - fb))))
    d = fb - fa
    lr = float(d @ boec.lin)
    nr = float((np.tanh(fb @ boec.W1.T + boec.b1)
                - np.tanh(fa @ boec.W1.T + boec.b1)) @ boec.w2)
    lin_r.append(abs(lr))
    neliin = abs(nr)
    nelin_r.append(neliin)
    poln_r.append(abs(lr + nr))

print('пар полей: %d (физических)' % K)
print('точность зеркала признаков: макс ошибка %.3g' % osh_priznakov)
print('линейная часть:      средняя |разница| %.4f' % np.mean(lin_r))
print('скрытый слой:        средняя |разница| %.4f' % np.mean(nelin_r))
print('полная (до правки):  средняя |разница| %.4f' % np.mean(poln_r))
print('доля скрытого слоя: %.0f%%'
      % (100 * np.sum(nelin_r) / max(1e-9, np.sum(lin_r) + np.sum(nelin_r))))
