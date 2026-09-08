# -*- coding: utf-8 -*-
"""
ГДЕ ПОТОЛОК ОБОРОНЫ. Первая развёртка показала: чем сильнее штраф за высоту и
награда за запас до смерти, тем длиннее бой (12 групп у базы -> 36 у плоского).
Давим дальше и ищем, где кривая перестаёт расти или ломается.

Владелец хочет 300-500 групп в дуэли. Одиночная игра в ПЗУ уже даёт 220,
значит бот умеет; вопрос в выживании под встречным мусором.
"""
import sys
import time

sys.path.insert(0, 'tools')
import numpy as np

import brain
import duel
import train_duel as td

MAX_H, ZAGRUZ, NEROVN, RAZBROS, ZAPAS = 11, 13, 14, 15, 22
KAMNEY, CEPOCHKA, MEST = 16, 17, 29

PROFILI = {
    'база':        {},
    'п1':          {MAX_H: -7.0, NEROVN: -4.5, ZAPAS: +3.5, ZAGRUZ: -3.0},
    'п2':          {MAX_H: -12.0, NEROVN: -6.0, ZAPAS: +6.0, ZAGRUZ: -4.0},
    'п3':          {MAX_H: -20.0, NEROVN: -8.0, ZAPAS: +10.0, ZAGRUZ: -6.0},
    'п3+жадный':   {MAX_H: -20.0, NEROVN: -8.0, ZAPAS: +10.0, ZAGRUZ: -6.0,
                    KAMNEY: +3.0, CEPOCHKA: +2.0, MEST: +1.5},
    'п4':          {MAX_H: -35.0, NEROVN: -12.0, ZAPAS: +18.0, ZAGRUZ: -8.0,
                    RAZBROS: -4.0},
}


def golova(pravki):
    w = np.asarray(brain.HAND_WEIGHTS, dtype=np.float64).copy()
    for i, v in pravki.items():
        w[i] = v
    return brain.Linear(w)


_, geny, _ = td.load()
SIDY = (130, 47, 200)

print('%-12s %-16s %-16s %-10s %s'
      % ('профиль', 'фигур (сумма)', 'ГРУПП (сумма)', 'смертей', 'кадров'))
print('-' * 74)
for imya, pravki in PROFILI.items():
    g = golova(pravki)
    figur = grupp = smertey = kadrov = 0
    for jit in SIDY:
        r = duel.run_duel(g, g, layers=0, max_frames=200000, genes_a=geny,
                          genes_b=geny, quiet=True, jitter=jit)
        if 'ошибка' in r:
            continue
        figur += sum(r.get('фигур') or [0, 0])
        grupp += sum(r.get('групп честных') or [0, 0])
        smertey += sum(1 for d in (r.get('умерли на кадрах') or []) if d is not None)
        kadrov += r.get('кадров', 0)
    print('%-12s %-16d %-16d %-10d %d' % (imya, figur, grupp, smertey, kadrov))
