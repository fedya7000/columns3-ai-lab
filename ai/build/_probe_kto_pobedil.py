# -*- coding: utf-8 -*-
"""
ЧТО ВОЗВРАЩАЕТ БОЙ. Чемпион против самого себя даёт 0.25 вместо 0.5, и
списать это на незаконченные бои не вышло — правка ничего не изменила.
Значит смотрим сырьё: какие исходы вообще приходят и с какой стороны.

Если при равных бойцах «первый» побеждает намного чаще «второго» — дело в
преимуществе стороны, и тогда мена сторон поровну его не убирает, потому
что jitter у пары одинаковый и обе половины играют ОДИН И ТОТ ЖЕ бой.
"""
import sys
from collections import Counter
from multiprocessing import Pool

sys.path.insert(0, 'tools')
import numpy as np

import train_duel as td

if __name__ == '__main__':
    boec, geny, _ = td.load()
    genom = np.concatenate([np.asarray(boec.w, dtype=np.float64),
                            np.asarray(geny, dtype=np.float64)])
    rng = np.random.default_rng(7)

    jobs, storony, jittery = [], [], []
    for k in range(16):
        jit = int(rng.integers(400))
        if k % 2 == 0:
            jobs.append((genom, genom, jit, 1, 30000))
            storony.append(0)
        else:
            jobs.append((genom, genom, jit, 1, 30000))
            storony.append(1)
        jittery.append(jit)

    pool = Pool(16)
    try:
        out = pool.map(td.fight, jobs)
    finally:
        pool.close()
        pool.join()

    ischody = Counter()
    print('%-4s %-8s %-10s %-10s %s' % ('№', 'jitter', 'сторона', 'победил', 'фигур'))
    print('-' * 56)
    for k, ((sa, sb, w, r), st, jit) in enumerate(zip(out, storony, jittery)):
        ischody[str(w)] += 1
        print('%-4d %-8d %-10d %-10s %s' % (k, jit, st, w, r.get('фигур')))
    print()
    print('исходы:', dict(ischody))
    print('⚠️ обе половины пары играют один и тот же бой: бойцы одинаковые,')
    print('   поэтому смена местами НЕ создаёт зеркальный бой — jitter другой.')
