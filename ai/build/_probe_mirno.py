# -*- coding: utf-8 -*-
"""СКОЛЬКО ПРОТЯНУТ БЕЗ ПОДЛЯН.

Мирный бой (слово владельца 26.08): бот не бьёт кнопкой и не дарит плиты
золотом. Плиты появляются только сами, и золотом их можно снять.
Сравниваем с обычным боем на ОДНИХ сидах: кадры, группы, кто умер.
Предела кадров нет — смотрим, докуда дойдут сами.
"""
import sys
from multiprocessing import Pool

sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
import numpy as np
import duel
import train_duel as td

СИДЫ = [25, 47, 65, 85, 105, 130, 145, 165, 185, 215, 33, 77]
ПРЕДЕЛ = 600000          # 2.7 часа игрового времени — фактически без предела


def odin(arg):
    мирно, jit = arg
    боец, гены, _ = td.load('build/net_duel.json')
    r = duel.run_duel(боец, боец, layers=0, max_frames=ПРЕДЕЛ, genes_a=гены,
                      genes_b=гены, quiet=True, jitter=jit, mirno=мирно,
                      mnogo_raundov=True)
    g = r.get('групп честных') or [0, 0]
    return (мирно, jit, r.get('кадров', 0), sum(g), r.get('победил', ''),
            'ошибка' in r)


if __name__ == '__main__':
    with Pool(12) as pool:
        итог = pool.map(odin, [(м, s) for м in (False, True) for s in СИДЫ])
    по = {False: {}, True: {}}
    for м, s, k, g, кто, срыв in итог:
        по[м][s] = (k, g, кто, срыв)

    print('%-6s %-22s %-22s' % ('сид', 'ОБЫЧНЫЙ бой', 'МИРНЫЙ бой'))
    print('%-6s %-22s %-22s' % ('', 'кадров / групп', 'кадров / групп'))
    print('-' * 54)
    for s in СИДЫ:
        a, b = по[False][s], по[True][s]
        print('%-6d %-22s %-22s'
              % (s, '%d / %d%s' % (a[0], a[1], ' СРЫВ' if a[3] else ''),
                 '%d / %d%s' % (b[0], b[1], ' СРЫВ' if b[3] else '')))
    for имя, м in (('ОБЫЧНЫЙ', False), ('МИРНЫЙ', True)):
        k = np.array([по[м][s][0] for s in СИДЫ], float)
        g = np.array([по[м][s][1] for s in СИДЫ], float)
        print()
        print('%s: кадров в среднем %.0f (это %.0f мин игры), групп в среднем %.0f, лучший бой %d кадров / %d групп'
              % (имя, k.mean(), k.mean() / 3600, g.mean(), k.max(), g.max()))
