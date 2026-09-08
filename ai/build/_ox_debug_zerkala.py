# -*- coding: utf-8 -*-
"""Отладка зеркального прибора: почему нули?"""
import sys

sys.path.insert(0, 'tools')
import numpy as np

import brain as brains
import rules
import train_duel


boec, _, _ = train_duel.load('build/_fiks_setka.json')

# одно несимметричное поле вручную
f = rules.empty_field(layers=0)
for r in range(rules.TOTAL - 10, rules.TOTAL - 1):
    f[r * rules.COLS + 5] = 3          # колонка 5 высотой 9
print('высоты:', brains.heights(f))

pf = f[:]
for r in range(rules.TOTAL):
    for c in range(rules.COLS):
        pf[r * rules.COLS + c] = f[r * rules.COLS + (rules.COLS - 1 - c)]
print('высоты зеркала:', brains.heights(pf))

fa = np.array(brains.extract(f, 0, 0, 0))
fb = np.array(brains.extract(pf, 0, 0, 0))
d = fb - fa
print('макс |fa-fb|:', np.max(np.abs(d)))
print('выс0', fa[0], 'выс5', fa[5])
print('зеркал(выс0)', brains.zerkalo_priznakov(fa[None, :])[0][0],
      'против fb выс0', fb[0])
lin_d = float(d @ np.asarray(boec.lin))
print('линейная разница: %.4f' % lin_d)
print('полная до правки: %.4f'
      % abs(float(np.tanh(fb @ boec.W1.T + boec.b1) @ boec.w2
                  + fb @ boec.lin + boec.b2)
            - float(np.tanh(fa @ boec.W1.T + boec.b1) @ boec.w2
                    + fa @ boec.lin + boec.b2)))
