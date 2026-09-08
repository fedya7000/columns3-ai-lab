# -*- coding: utf-8 -*-
"""ПОЧЕМУ БОТ НЕ КЛАДЁТ В КОЛОНКУ: лог каждого решения пилота.

Перехватываем Pilot._decide() и на каждое решение пишем:
  * высоты столбцов, как их видит бот (io.field -> brains.heights);
  * было ли поле устоявшимся (io.settled) и есть ли в нём дыры;
  * колонку, которую выбрал перебор;
  * очки вариантов: выбранная колонка против колонок 1 и 5 (если они свободны).

Очки считаем тем же перебором depth=1 (без второй фигуры), чтобы разложить
решение по слагаемым. Если колонка 1/5 вообще не попадает в список кандидатов
(rules.apply вернул None или is_dead) — это видно отдельно.
"""
import sys
from collections import Counter

sys.path.insert(0, 'tools')
import numpy as np

import bot_io as io
import brain as brains
import duel
import rules
import train_duel


boec, geny, _ = train_duel.load('build/_fiks_setka.json')

orig_decide = duel.Pilot._decide
zhurnal = []          # строки лога
schet = Counter()


def otsenko_variantov(field, cur):
    """Очки всех 18 ходов depth=1, как их видит сеть."""
    out = {}
    for col in range(rules.COLS):
        for rot in range(3):
            r = rules.apply(field, col, rot, cur)
            if r is None:
                out[(col, rot)] = None      # не влезает
                continue
            f1, st, ch, gr = r
            if rules.is_dead(f1):
                out[(col, rot)] = 'SMERT'
                continue
            f = np.array([brains.extract(f1, st, ch, gr)])
            out[(col, rot)] = float(boec.value_batch(f)[0])
    return out


def podmena(self):
    md, p = self.md, self.p
    pole2d = io.field(md, p)
    field = [v for row in pole2d for v in row]
    cur = io.live_piece(md, p)
    ustoy = io.settled(md, p)
    # дыры в сыром виде: пусто ПОД камнем
    dyr = 0
    for c in range(io.COLS):
        videl = False
        for r in range(io.TOTAL):
            v = field[r * io.COLS + c]
            if v and v != io.WALL:
                videl = True
            elif v == 0 and videl:
                dyr += 1
    hs = brains.heights(field)

    # как решает оригинал
    orig_decide(self)

    zapis = {'kadry': md.frame, 'igrok': 1 if p == io.P1 else 2,
             'vysoty': list(hs), 'ustoy': ustoy, 'dyr': dyr,
             'vybor': self.col}
    if not any(v >= 7 for v in cur):
        var = otsenko_variantov(field, cur)
        zapis['ochki'] = {str(k): v for k, v in var.items()}
        # статистика по колонкам
        for col in range(6):
            ochki = [v for (c, _), v in var.items() if c == col
                     and isinstance(v, float)]
            dostup = len([1 for (c, _), v in var.items() if c == col
                          and v != 'SMERT' and v is not None])
            schet['kol%d_kandidatov' % col] += dostup
            if hs[col] == 0 and dostup == 0:
                schet['kol%d_pusta_i_net_hoda' % col] += 1
        if self.col is not None:
            luchshie = [v for k, v in var.items()
                        if isinstance(v, float) and k[0] == self.col]
            if hs[self.col] == 0:
                schet['vybor_v_pustuju'] += 1
            else:
                schet['vybor_v_nepustuju'] += 1
        # если колонка 1 или 5 пуста и доступна — сколько не хватило до выбора
        for col in (1, 5):
            if hs[col] == 0:
                dostupnye = [(k, v) for k, v in var.items()
                             if k[0] == col and isinstance(v, float)]
                if dostupnye:
                    best_c = max(v for _, v in dostupnye)
                    vse_luchshie = max(v for v in var.values()
                                       if isinstance(v, float))
                    zapis['pusta_%d_best' % col] = best_c
                    zapis['luchshiy_ochki'] = vse_luchshie
                    schet['pustaya_%d_byla_dostupna' % col] += 1
                    if best_c >= vse_luchshie:
                        schet['BUG_vybral_by'] += 1
                        print('!! пустая колонка %d имела лучший очки '
                              '(%.3f vs %.3f), кадр %d игрок %d, высоты %s'
                              % (col, best_c, vse_luchshie, zapis['kadry'],
                                 zapis['igrok'], zapis['vysoty']))
    zhurnal.append(zapis)


duel.Pilot._decide = podmena


def itog_po_boju(r, jit):
    print('jitter %-4d итог %s' % (jit, r.get('умерли на кадрах')))


for jit in (130, 47):
    r = duel.run_duel(boec, boec, layers=1, max_frames=3600, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=jit)
    itog_po_boju(r, jit)

print()
print('решений записано:', len(zhurnal))
print('выборов в пустую/непустую:',
      dict(schet))
print()
# сводка по решениям при НЕустоявшемся поле с дырами
neust = [z for z in zhurnal if not z['ustoy'] and z['dyr']]
print('решений при неустоявшемся поле с дырами: %d из %d'
      % (len(neust), len(zhurnal)))
if neust:
    primery = neust[-3:]
    for z in primery:
        print('  кадр %d игрок %d высоты %s дyr %d выбор %s pusta1=%s'
              % (z['kadry'], z['igrok'], z['vysoty'], z['dyr'], z['vybor'],
                 z.get('pusta_1_best')))
# и решения при устоявшемся поле
ust = [z for z in zhurnal if z['ustoy']]
print('решений при устоявшемся поле: %d' % len(ust))
