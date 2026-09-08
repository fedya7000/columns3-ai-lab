# -*- coding: utf-8 -*-
"""Полный рейтинг вариантов на каждое решение, бой jitter=130 (смерть на 1616).

Печатаем для каждого решения топ-5 вариантов по очкам сети (depth=1, без шума)
и отдельно — лучший вариант в каждой ПУСТОЙ колонке с отставанием от лидера.
"""
import sys

sys.path.insert(0, 'tools')
import numpy as np

import bot_io as io
import brain as brains
import duel
import rules
import train_duel


boec, geny, _ = train_duel.load('build/_fiks_setka.json')

orig_decide = duel.Pilot._decide
zapisi = []


def otsenki(field, cur):
    out = []
    for col in range(rules.COLS):
        for rot in range(3):
            r = rules.apply(field, col, rot, cur)
            if r is None:
                continue
            f1, st, ch, gr = r
            if rules.is_dead(f1):
                continue
            f = np.array([brains.extract(f1, st, ch, gr)])
            out.append((col, float(boec.value_batch(f)[0])))
    return out


def podmena(self):
    md, p = self.md, self.p
    pole2d = io.field(md, p)
    field = [v for row in pole2d for v in row]
    cur = io.live_piece(md, p)
    ustoy = io.settled(md, p)
    hs = brains.heights(field)
    orig_decide(self)
    if any(v >= 7 for v in cur):
        return                      # золотую разбираем отдельно
    var = otsenki(field, cur)
    if not var:
        return
    sortirovka = sorted(var, key=lambda t: -t[1])
    lider = sortirovka[0][1]
    pustye = [(c, v) for c, v in var if hs[c] == 0]
    z = {'kadr': md.frame, 'igr': 1 if p == io.P1 else 2,
         'vys': list(hs), 'vybor': self.col, 'ustoy': ustoy,
         'top': sortirovka[:5],
         'pustye': sorted(pustye, key=lambda t: -t[1]),
         'otst': {c: round(lider - v, 3) for c, v in pustye}}
    zapisi.append(z)


duel.Pilot._decide = podmena

r = duel.run_duel(boec, boec, layers=1, max_frames=3600, genes_a=geny,
                  genes_b=geny, quiet=True, jitter=130)
print('итог:', r.get('умерли на кадрах'), 'решений:', len(zapisi))
print()
for z in zapisi:
    pust = ['%d(-%.3f)' % (c, z['otst'][c]) for c in sorted(z['otst'])]
    top = ['%d:%.3f' % (c, v) for c, v in z['top']]
    print('кадр %-5d игр %d выс %s выбор %s уст%d | top %s | пустые %s'
          % (z['kadr'], z['igr'], z['vys'], z['vybor'], 1 if z['ustoy'] else 0,
             ' '.join(top), ' '.join(pust) if pust else '-'))
