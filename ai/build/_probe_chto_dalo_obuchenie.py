# -*- coding: utf-8 -*-
"""ЧТО ДАЛИ 12 ЧАСОВ. Гейт мерит победы и стоит на 0.52 — но цель владельца
ГРУППЫ. Сравниваем нынешнего чемпиона с тем, что был ДО запуска, парно на
одних сидах."""
import os
import sys
from multiprocessing import Pool

sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
import numpy as np
import duel
import train_duel as td

СИДЫ = list(range(5, 236, 5))          # 47 сидов
ФАЙЛЫ = [('ДО (12 часов назад)', 'build/net_duel_pered_progonom_20.json'),
         ('ПОСЛЕ (сейчас)',      'build/net_duel.json')]


def odin(arg):
    н, jit = arg
    боец, гены, _ = td.load(ФАЙЛЫ[н][1])
    r = duel.run_duel(боец, боец, layers=0, max_frames=12000, genes_a=гены,
                      genes_b=гены, quiet=True, jitter=jit)
    g = r.get('групп честных') or [0, 0]
    return (н, jit, sum(g))


if __name__ == '__main__':
    with Pool(12) as pool:
        итог = pool.map(odin, [(н, s) for н in (0, 1) for s in СИДЫ])
    по = {0: {}, 1: {}}
    for н, s, g in итог:
        по[н][s] = g
    a = np.array([по[0][s] for s in СИДЫ], float)
    b = np.array([по[1][s] for s in СИДЫ], float)
    d = b - a
    ош = d.std(ddof=1) / np.sqrt(len(d))
    for н, (имя, _) in enumerate(ФАЙЛЫ):
        v = (a, b)[н]
        print('%-22s групп в среднем %.0f, медиана %.0f, лучший %d'
              % (имя, v.mean(), np.median(v), v.max()))
    print()
    print('разница парная: %+.1f ± %.1f групп на сид' % (d.mean(), ош))
    print('сидов лучше %d, хуже %d, поровну %d'
          % (int((d > 0).sum()), int((d < 0).sum()), int((d == 0).sum())))
    print('ВЕРДИКТ: %s' % ('обучение дало прирост' if d.mean() > 2 * ош
                           else ('обучение сделало ХУЖЕ' if d.mean() < -2 * ош
                                 else 'за 12 часов НИЧЕГО — разница в пределах шума')))
