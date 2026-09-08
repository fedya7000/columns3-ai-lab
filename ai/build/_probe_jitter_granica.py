# -*- coding: utf-8 -*-
"""
ГРАНИЦА JITTER. Бои с большим jitter не доезжают до боя: режим остаётся
$0040 (меню), и fight() возвращает ошибку. В обучении jitter берётся как
rng.integers(400) — значит часть боёв каждого поколения впустую.

Меряем, с какого значения начинаются провалы, и какая доля диапазона 0..399
рабочая. От этого зависит, сколько машинного времени уходило в никуда.
"""
import sys
from multiprocessing import Pool

sys.path.insert(0, 'tools')
import numpy as np

import train_duel as td

ZNACHENIYA = list(range(0, 400, 20))

if __name__ == '__main__':
    boec, geny, _ = td.load()
    genom = np.concatenate([np.asarray(boec.w, dtype=np.float64),
                            np.asarray(geny, dtype=np.float64)])
    jobs = [(genom, genom, j, 1, 2400) for j in ZNACHENIYA]

    pool = Pool(17)
    try:
        out = pool.map(td.fight, jobs)
    finally:
        pool.close()
        pool.join()

    horosho = []
    print('%-8s %-34s %s' % ('jitter', 'исход', 'фигур'))
    print('-' * 60)
    for j, (sa, sb, w, r) in zip(ZNACHENIYA, out):
        ok = 'ошибка' not in r
        if ok:
            horosho.append(j)
        print('%-8d %-34s %s' % (j, str(w)[:34], r.get('фигур')))
    print()
    print('доехали до боя: %d из %d проб' % (len(horosho), len(ZNACHENIYA)))
    if horosho:
        print('рабочие значения: %s' % horosho)
        print('⚠️ обучение берёт jitter из 0..399 — впустую примерно %.0f %% боёв'
              % (100.0 * (len(ZNACHENIYA) - len(horosho)) / len(ZNACHENIYA)))
