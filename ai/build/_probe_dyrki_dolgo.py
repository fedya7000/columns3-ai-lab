# -*- coding: utf-8 -*-
"""
СКОЛЬКО ЖИВЁТ ДЫРА. Прошлый замер считал «сколько проб с дырами» и этим
успокоил — а владелец видит на записи, что дыры держатся ДОЛГО.

Здесь меряем длительность: идём КАЖДЫЙ кадр и складываем эпизоды —
непрерывные отрезки, где в кладке есть пустая клетка под камнем.
Показываем распределение длин, самый долгий эпизод и что при этом
говорил settled().

Мираж анимации — это десяток кадров. Всё, что живёт сотнями, — болезнь.
"""
import sys

sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel


def dyrki(md, p):
    if not io.field_base(md, p):
        return 0
    syroe = io.field_raw(md, p)
    n = 0
    for c in range(io.COLS):
        videl = False
        for r in range(io.TOTAL):
            v = syroe[r][c] & 0xFF
            if v and v != 0xFF:
                videl = True
            elif v == 0 and videl:
                n += 1
    return n


boec, geny, _ = train_duel.load()

epizody = [[], []]          # длины эпизодов в кадрах
tekushchiy = [0, 0]
nachalo = [0, 0]
maks_dyr = [0, 0]
sobrano = [0, 0]            # в скольких кадрах эпизода settled() был True


def na_kadre(md, f, pilots):
    for i, p in enumerate((io.P1, io.P2)):
        d = dyrki(md, p)
        if d:
            if not tekushchiy[i]:
                nachalo[i] = f
            tekushchiy[i] += 1
            maks_dyr[i] = max(maks_dyr[i], d)
            if io.settled(md, p):
                sobrano[i] += 1
        elif tekushchiy[i]:
            epizody[i].append((nachalo[i], tekushchiy[i]))
            tekushchiy[i] = 0


r = duel.run_duel(boec, boec, layers=1, max_frames=3600, genes_a=geny,
                  genes_b=geny, quiet=True, jitter=130, on_frame=na_kadre)

for i in (0, 1):
    if tekushchiy[i]:
        epizody[i].append((nachalo[i], tekushchiy[i]))
    e = sorted(epizody[i], key=lambda x: -x[1])
    vsego = sum(x[1] for x in e)
    print('игрок %d: эпизодов %d, всего %d кадров из %d (%.0f%% времени)'
          % (i + 1, len(e), vsego, r['кадров'], 100.0 * vsego / max(1, r['кадров'])))
    if e:
        for nach, dlina in e[:5]:
            print('   эпизод: кадры %d..%d — %d кадров (%.1f с)'
                  % (nach, nach + dlina, dlina, dlina / 60.0))
    print('   максимум дыр разом: %d, кадров с дырами ПРИ settled: %d'
          % (maks_dyr[i], sobrano[i]))
print('умерли:', r.get('умерли на кадрах'), ' фигур:', r.get('фигур'))
