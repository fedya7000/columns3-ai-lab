# -*- coding: utf-8 -*-
"""
УМИРАЕТ ЛИ БОТ ПРИ ПУСТОЙ КОЛОНКЕ. В прогоне 24.08 игрок 2 завалился, имея
вторую колонку пустой во всю высоту — 19 у соседей и 0 у неё.

Одного случая мало. Гоняем несколько боёв на разных jitter и смотрим высоты
столбцов В МОМЕНТ СМЕРТИ. Если пустая колонка при смерти — регулярность,
значит бот systematically не умеет в неё класть, и это дороже любой башни:
он губит себя, имея свободное место.

Заодно смотрим, ОДНА И ТА ЖЕ колонка пустует или разные.
"""
import sys
from collections import Counter

sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel


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


boec, geny, _ = train_duel.load()
pustye = Counter()
smertey = 0
print('%-7s %-9s %-28s %s' % ('jitter', 'умер', 'высоты при смерти', 'пустых колонок'))
print('-' * 76)

for jit in (130, 47, 211, 300, 88, 170):
    snimok = {}

    def na_kadre(md, f, pilots, snimok=snimok):
        for i, p in enumerate((io.P1, io.P2)):
            snimok[i] = vysoty(md, p)

    r = duel.run_duel(boec, boec, layers=1, max_frames=3600, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=jit, on_frame=na_kadre)
    umerli = r.get('умерли на кадрах') or [None, None]
    for i in (0, 1):
        if umerli[i] is None:
            continue
        smertey += 1
        v = snimok.get(i, [])
        pusto = [c for c, h in enumerate(v) if h == 0]
        for c in pusto:
            pustye[c] += 1
        print('%-7d игрок %-3d %-28s %s'
              % (jit, i + 1, v, pusto if pusto else 'нет'))

print()
print('смертей всего: %d' % smertey)
print('какие колонки пустовали при смерти: %s'
      % (dict(pustye) if pustye else 'ни одной'))
