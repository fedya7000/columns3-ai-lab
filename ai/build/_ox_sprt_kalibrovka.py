# -*- coding: utf-8 -*-
"""КАЛИБРОВКА перед постройкой SPRT-прибора (одноразовый зонд).

В документах и замерах дома НЕТ двух чисел, без которых прибор не построить:
  1. доля НИЧЬИХ в наших боях. В SPRT каждый исход входит со своим весом;
     если ничьих много, они размывают свидетельство, и порог различения
     придётся брать другой.
  2. цена одного боя на 6 ядрах (машина занята, больше нельзя) — чтобы
     планировать прогоны, а не угадывать.

Заодно, тем же прогоном, подбираем шум для «подсадной» (веса чемпиона +
гауссов шум): для проверки б) нужна соперница заведомо слабее, но не
растоптанная в ноль.
"""
import os
import sys
import time
from multiprocessing import Pool

sys.path.insert(0, 'tools')
import numpy as np

import train_duel as td

OUT_TXT = os.path.join('build', '_ox_sprt_kalibrovka.txt')
OCHKI = {'победа': 1.0, 'ничья': 0.5, 'поражение': 0.0}


def partiya(pool, ga, gb, n, seed, layers=1, frames=30000):
    """n боёв со СТРОГОЙ сменой сторон (грабли первого хода оплачены).

    Возвращает исходы глазами ПЕРВОГО генома: список 'победа'/'ничья'/
    'поражение' (бои с 'ошибка' выбрасываются и считаются отдельно),
    число сорванных боёв, время партии.
    """
    rng = np.random.default_rng(seed)
    jobs, storony = [], []
    for k in range(n):
        jit = int(rng.integers(td.JITTER_PREDEL))
        if k % 2 == 0:
            jobs.append((ga, gb, jit, layers, frames)); storony.append(0)
        else:
            jobs.append((gb, ga, jit, layers, frames)); storony.append(1)
    t0 = time.time()
    out = pool.map(td.fight, jobs)
    dt = time.time() - t0
    ishody, oshibki = [], 0
    for (_sa, _sb, w, r), st in zip(out, storony):
        if 'ошибка' in r:
            oshibki += 1
            continue
        if w is None or w == 'ничья':
            ishody.append('ничья')
        elif (w == 'первый' and st == 0) or (w == 'второй' and st == 1):
            ishody.append('победа')
        else:
            ishody.append('поражение')
    return ishody, oshibki, dt


if __name__ == '__main__':
    stroki = []
    boec, geny, meta = td.load()
    champ = np.concatenate([np.asarray(boec.w, dtype=np.float64),
                            np.asarray(geny, dtype=np.float64)])
    stroki.append('чемпион: поколение %s, счёт %.3f'
                  % (meta.get('gen'), meta.get('fitness', 0)))

    # подсадная: тот же чемпион, к весам сети добавлен шум. Гены не трогаем,
    # чтобы ухудшение было объяснимо именно навыками игры.
    pod = champ.copy()
    pod[:td.N_W] += np.random.default_rng(2024).normal(0.0, 0.25, td.N_W)

    pool = Pool(6)
    try:
        for imya, ga, gb, n, seed in (
                ('БЛИЗНЕЦЫ  ', champ, champ, 32, 999),
                ('ПОДСАДНАЯ ', champ, pod,   8, 555)):
            t0 = time.time()
            ish, osh, dt = partiya(pool, ga, gb, n, seed)
            ochki = sum(OCHKI[x] for x in ish) / max(len(ish), 1)
            gisto = {x: ish.count(x) for x in ('победа', 'ничья', 'поражение')}
            stroki.append('%s %d боёв (seed %d): %s' % (imya, n, seed, gisto))
            stroki.append('    очки %.3f | сорвано боёв %d | %.1f с/бой '
                          'на 6 ядрах | партия %.0f с'
                          % (ochki, osh, dt / max(n, 1), time.time() - t0))
    finally:
        pool.close()
        pool.join()
    with open(OUT_TXT, 'w', encoding='utf-8') as f:
        f.write('\n'.join(stroki) + '\n')
    print('\n'.join(stroki))
