# -*- coding: utf-8 -*-
"""
ПОДТВЕРЖДЕНИЕ ЧЕМПИОНА. Прогон объявил 0.64, но это МАКСИМУМ из тридцати
замеров, а максимум завышен по построению: при разбросе ±0.037 лучший из
тридцати ничейных бойцов выдаст около 0.58 просто по везению.

Поэтому судим отдельно и длиннее: новый чемпион (net_duel.json) против
старого (net_duel_pered_progonom.json), 48 боёв, стороны поровну.
Три независимых замера — чтобы видеть разброс, а не одно число.

Выше 0.5 устойчиво — новичок правда сильнее. Около 0.5 — 0.64 было везением.
"""
import sys
from multiprocessing import Pool

sys.path.insert(0, 'tools')
import numpy as np

import train_duel as td


def genom(put):
    b, g, m = td.load(put)
    return np.concatenate([np.asarray(b.w, dtype=np.float64),
                           np.asarray(g, dtype=np.float64)]), m


if __name__ == '__main__':
    novyj, m_n = genom('build/net_duel.json')
    staryj, m_s = genom('build/net_duel_pered_progonom.json')
    print('новый:  поколение %s, объявленный счёт %.3f' % (m_n.get('gen'), m_n.get('fitness', 0)))
    print('старый: поколение %s, объявленный счёт %.3f' % (m_s.get('gen'), m_s.get('fitness', 0)))
    print()

    pool = Pool(10)
    rng = np.random.default_rng(1234)
    try:
        zamery = []
        for n in range(3):
            z = td.protiv_etalona(pool, novyj, staryj, 48, 1, 30000, rng)
            zamery.append(z)
            print('замер %d: новый против старого = %.3f (48 боёв)' % (n + 1, z))
        sr = float(np.mean(zamery))
        print()
        print('среднее %.3f, разброс ±%.3f' % (sr, float(np.std(zamery))))
        print('ВЕРДИКТ: %s' % ('новичок сильнее' if sr > 0.55 else
                               ('разница в пределах шума' if sr > 0.45
                                else 'новичок СЛАБЕЕ, чемпиона вернуть')))
    finally:
        pool.close()
        pool.join()
