# -*- coding: utf-8 -*-
"""ГЛАВНЫЙ ЗАМЕР до/после В БОЮ: перекос «пустая колонка, соседи высокие».

Тот же критерий, что в _probe_brezguet.py: кадр плох, если min(высоты)==0,
а max>=8. Сеть заморожена (build/_fiks_setka.json), чтобы обучение не мешало
сравнивать. Головы:
  do     -- прежняя оценка без зеркалирования;
  posle  -- новая симметричная оценка (brain.Net.value_batch).
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


class KakBylo(object):
    def __init__(self, src):
        self.src = src

    def value_batch(self, F):
        F = np.asarray(F)
        H = np.tanh(F @ self.src.W1.T + self.src.b1)
        return H @ self.src.w2 + self.src.b2 + F @ self.src.lin


golovy = {'do': KakBylo(boec), 'posle': boec}


def vysoty(md, p):
    if not io.field_base(md, p):
        return []
    syroe = io.field_raw(md, p)
    out = []
    for c in range(io.COLS):
        h = 0
        for r in range(io.TOTAL):
            v = syroe[r][c] & 0xFF
            if v and v != 0xFF:
                h = io.TOTAL - r
                break
        out.append(h)
    return out


JITTERS = (130, 47, 211, 300)
itog = {}
for imya, golova in golovy.items():
    prob = perekos = 0
    kakaia = Counter()
    smerti = []
    umera_v_pustuju = 0
    for jit in JITTERS:
        snimok = {}

        def na_kadre(md, f, pilots, snimok=snimok):
            if f % 20:
                return
            for i, p in enumerate((io.P1, io.P2)):
                v = vysoty(md, p)
                if not v:
                    continue
                snimok[i] = v

        r = duel.run_duel(golova, golova, layers=1, max_frames=3600,
                          genes_a=geny, genes_b=geny, quiet=True, jitter=jit,
                          on_frame=na_kadre)
        umerli = r.get('умерли на кадрах') or [None, None]
        for i in (0, 1):
            v = snimok.get(i, [])
            smerti.append((jit, i + 1, umerli[i], v))
            if umerli[i] is not None and 0 in v:
                umera_v_pustuju += 1
    # второй проход -- считаем перекосы теми же боями нельзя, нужен отдельный
    # прогон со счётчиком; объединять нельзя, поэтому отдельный цикл ниже
    itog[imya] = {'smerti': smerti, 'umerla_v_pustuju': umera_v_pustuju}

for imya, golova in golovy.items():
    prob = perekos = 0
    kakaia = Counter()
    for jit in JITTERS:
        schet = [{'проб': 0, 'перекос': 0, 'kol': Counter()} for _ in range(2)]

        def na_kadre(md, f, pilots, schet=schet):
            if f % 20:
                return
            for i, p in enumerate((io.P1, io.P2)):
                v = vysoty(md, p)
                if not v:
                    continue
                schet[i]['проб'] += 1
                if max(v) >= 8 and min(v) == 0:
                    schet[i]['перекос'] += 1
                    for c, h in enumerate(v):
                        if h == 0:
                            schet[i]['kol'][c] += 1

        duel.run_duel(golova, golova, layers=1, max_frames=3600,
                      genes_a=geny, genes_b=geny, quiet=True, jitter=jit,
                      on_frame=na_kadre)
        for i in (0, 1):
            prob += schet[i]['проб']
            perekos += schet[i]['перекос']
            kakaia.update(schet[i]['kol'])
    itog[imya]['prob'] = prob
    itog[imya]['perekos'] = perekos
    itog[imya]['kakaia'] = dict(kakaia)

print()
for imya in ('do', 'posle'):
    d = itog[imya]
    print('%-5s: проб %d, с перекосом %d (%.1f%%), пустели %s, '
          'умерших с пустой колонкой %d'
          % (imya, d['prob'], d['perekos'],
             100.0 * d['perekos'] / max(1, d['prob']), d['kakaia'],
             d['umerla_v_pustuju']))
    for zapis in d['smerti']:
        print('      jitter %-4d игрок %d умер на %s высоты %s'
              % (zapis[0], zapis[1], zapis[2], zapis[3]))
