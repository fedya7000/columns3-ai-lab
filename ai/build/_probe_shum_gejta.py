# -*- coding: utf-8 -*-
"""
ШУМ В ГЕЙТЕ. Три прогона подряд (30 поколений каждый) не дали бойца сильнее
эталона. Прежде чем гонять четвёртый, надо понять: гейт вообще что-нибудь
меряет — или это подбрасывание монетки?

Проверка простая. Берём ЧЕМПИОНА и судим его против ЭТАЛОНА, где эталон —
он же сам. Честная мера обязана дать 0.5. Повторяем несколько раз и смотрим
разброс: если один и тот же боец против самого себя получает то 0.19,
то 0.44 — значит отбор ведёт не сила, а случай, и никакое число поколений
не поможет.

Заодно меряем, что даёт УДВОЕНИЕ числа боёв: шум должен падать.
"""
import sys
from multiprocessing import Pool

sys.path.insert(0, 'tools')
import numpy as np

import train_duel as td


def razbros(zamery):
    if len(zamery) < 2:
        return 0.0
    return float(np.std(zamery))


if __name__ == '__main__':
    boec, geny, meta = td.load()
    genom = np.concatenate([np.asarray(boec.w, dtype=np.float64),
                            np.asarray(geny, dtype=np.float64)])
    print('чемпион: поколение %s, счёт %.3f' % (meta.get('gen'), meta.get('fitness', 0)))
    print('судим его ПРОТИВ САМОГО СЕБЯ — честная мера обязана дать 0.5')
    print()
    pool = Pool(17)
    rng = np.random.default_rng(7)
    try:
        for boev in (8, 16, 32):
            zamery = []
            for _ in range(5):
                z = td.protiv_etalona(pool, genom, genom, boev, 1, 30000, rng)
                zamery.append(round(z, 3))
            print('боёв в замере %-3d -> %s' % (boev, zamery))
            print('    среднее %.3f (ждём 0.5), разброс ±%.3f'
                  % (float(np.mean(zamery)), razbros(zamery)))
    finally:
        pool.close()
        pool.join()
