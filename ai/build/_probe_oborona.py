# -*- coding: utf-8 -*-
"""
ДЛИННЫЙ БОЙ. Владелец хочет дуэль на 300-500 групп, сейчас выходит 44.

Замер показал: в ОДИНОЧНОЙ игре оба бота бессмертны (2000 фигур подряд без
смерти), а в дуэли умирают после ~55 фигур. Значит убивает не укладка,
а чужая порча: стопка стоит на 7, прилетает 9 рядов мусора — и потолок.

Отсюда гипотеза: бот играет слишком «жадно» — держит стопку высокой, потому
что за камни и цепочки платят, а за запас до смерти платят мало. Под порчей
такой стиль смертелен.

Проверяем профили весов: base — как есть, дальше всё более осторожные.
Смотрим на ГРУППЫ (то самое число, которое владелец хочет видеть большим)
и на длину боя.
"""
import sys
import time

sys.path.insert(0, 'tools')
import numpy as np

import brain
import duel
import train_duel as td

# индексы признаков (см. brain.extract)
MAX_H, NEROVN, ZAPAS, ZAGRUZ = 11, 14, 22, 13

PROFILI = {
    'база':            {},
    'осторожный':      {MAX_H: -4.5, NEROVN: -2.2, ZAPAS: +2.0},
    'очень осторожный': {MAX_H: -7.0, NEROVN: -3.0, ZAPAS: +3.5},
    'плоский':         {MAX_H: -7.0, NEROVN: -4.5, ZAPAS: +3.5, ZAGRUZ: -3.0},
}


def golova(pravki):
    w = np.asarray(brain.HAND_WEIGHTS, dtype=np.float64).copy()
    for i, v in pravki.items():
        w[i] = v
    return brain.Linear(w)


_, geny, _ = td.load()

print('%-18s %-8s %-8s %-14s %-16s %s'
      % ('профиль', 'кадров', 'секунд', 'фигур', 'ГРУПП', 'умерли'))
print('-' * 84)
for imya, pravki in PROFILI.items():
    g = golova(pravki)
    for jit in (130, 47):
        n0 = time.time()
        r = duel.run_duel(g, g, layers=0, max_frames=120000, genes_a=geny,
                          genes_b=geny, quiet=True, jitter=jit)
        if 'ошибка' in r:
            print('%-18s ОШИБКА: %s' % (imya, r['ошибка']))
            continue
        print('%-18s %-8s %-8.0f %-14s %-16s %s'
              % (imya if jit == 130 else '', r.get('кадров'), time.time() - n0,
                 r.get('фигур'), r.get('групп честных'),
                 r.get('умерли на кадрах')))
