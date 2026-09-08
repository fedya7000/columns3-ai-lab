# -*- coding: utf-8 -*-
"""РАЗЛОЖЕНИЕ ОЦЕНКИ ПО ПРИЗНАКАМ: почему пустая колонка проигрывает.

На каждом решении берём вариант-лидер и лучший вариант в пустой колонке,
считаем ДЕЛЬТУ признаков и раскладываем её по линейной части сети.
Нелинейную часть тоже показываем отдельно (разница полных очков минус
линейная дельта) — если она мала, виноват линейный хвост, и по нему видно,
КАКОЙ признак.
"""
import sys
import json

sys.path.insert(0, 'tools')
import numpy as np

import bot_io as io
import brain as brains
import duel
import rules
import train_duel


boec, geny, _ = train_duel.load('build/_fiks_setka.json')
IMENA = None


def imena_priznakov():
    n = ['высота колонки %d' % c for c in range(6)]
    n += ['перепад %d-%d' % (i, i + 1) for i in range(5)]
    n += ['мах высота', 'мин высота', 'загрузка', 'неровность', 'разброс',
          'камней собрано', 'цепочка', 'групп', 'пары цветов',
          'достраиваемые', 'поджатость слоями', 'запас до смерти']
    n += ['доля цвета %d' % k for k in range(1, 7)]
    n += ['чем можно забить', 'сколькими цветами', 'свободный член']
    assert len(n) == brains.N_FEATURES, len(n)
    return n


def varianty(field, cur):
    out = []
    for col in range(rules.COLS):
        for rot in range(3):
            r = rules.apply(field, col, rot, cur)
            if r is None:
                continue
            f1, st, ch, gr = r
            if rules.is_dead(f1):
                continue
            feats = np.array(brains.extract(f1, st, ch, gr))
            out.append((col, rot, f1, feats))
    return out


orig_decide = duel.Pilot._decide
sluchai = []


def podmena(self):
    md, p = self.md, self.p
    pole2d = io.field(md, p)
    field = [v for row in pole2d for v in row]
    cur = io.live_piece(md, p)
    hs = brains.heights(field)
    orig_decide(self)
    if any(v >= 7 for v in cur):
        return
    var = varianty(field, cur)
    if not var:
        return
    ochki = [(c, float(boec.value_batch(feat[None])[0]))
             for c, _, _, feat in var]
    lider_ochki = max(v for _, v in ochki)
    pustye = [t for t in var if hs[t[0]] == 0]
    if not pustye:
        return
    # лучший среди пустых
    best_p = max(pustye, key=lambda t: float(boec.value_batch(t[3][None])[0]))
    best_p_ochki = float(boec.value_batch(best_p[3][None])[0])
    lider = max(var, key=lambda t: float(boec.value_batch(t[3][None])[0]))
    d = lider[3] - best_p[3]
    lin = boec.lin
    vklad = d * lin                      # вклад каждого признака в дельту
    porjadok = np.argsort(-np.abs(vklad))[:6]
    sluchai.append({
        'kadr': md.frame, 'igr': 1 if p == io.P1 else 2,
        'vys': list(hs),
        'lider_kol': int(lider[0]), 'lider_ochki': lider_ochki,
        'pustaya_kol': int(best_p[0]), 'pustaya_ochki': best_p_ochki,
        'raznica': round(lider_ochki - best_p_ochki, 3),
        'vklady': [(IMENA[i], round(float(d[i]), 3), round(float(vklad[i]), 3))
                   for i in porjadok if abs(vklad[i]) > 1e-9],
        'nelineynaya': round((lider_ochki - best_p_ochki)
                             - float(d @ lin), 3),
    })


duel.Pilot._decide = podmena
IMENA = imena_priznakov()

r = duel.run_duel(boec, boec, layers=1, max_frames=3600, genes_a=geny,
                  genes_b=geny, quiet=True, jitter=130)
print('итог:', r.get('умерли на кадрах'), 'случаев с пустой колонкой:',
      len(sluchai))
print()
for s in sluchai:
    print('кадр %-5d игр %d выс %s | лидер кол %d (%.3f) vs пустая кол %d '
          '(%.3f), разница %.3f (нелин %.3f)'
          % (s['kadr'], s['igr'], s['vys'], s['lider_kol'], s['lider_ochki'],
             s['pustaya_kol'], s['pustaya_ochki'], s['raznica'],
             s['nelineynaya']))
    for imya, d, v in s['vklady']:
        print('     %-22s дельта %+ .3f  вклад %+ .3f' % (imya, d, v))
