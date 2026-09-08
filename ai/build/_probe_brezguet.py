# -*- coding: utf-8 -*-
"""
БРЕЗГУЕТ ЛИ БОТ КОЛОНКОЙ. Смерть — событие редкое, ждать её дорого. Но само
поведение видно каждый кадр: если бот systematically не кладёт в какую-то
колонку, она будет стоять пустой, пока соседние растут.

Считаем ПЕРЕКОС: кадры, где хоть одна колонка пуста (0), а самая высокая
доросла до 8 и выше. В нормальной игре такого почти не бывает — ровная
укладка это первое, чему учит оценка поля.

Отдельно считаем, КАКАЯ колонка пустует: одна и та же во всех боях — значит
дело в коде (чтение поля, перебор ходов), разные — значит дело в оценке.
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
kakaya = Counter()
itogo = {'проб': 0, 'перекос': 0}

print('%-7s %-9s %-12s %-12s %s' % ('jitter', 'игрок', 'проб', 'с перекосом', 'колонки'))
print('-' * 70)

for jit in (130, 47, 211, 300):
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

    duel.run_duel(boec, boec, layers=1, max_frames=3600, genes_a=geny,
                  genes_b=geny, quiet=True, jitter=jit, on_frame=na_kadre)
    for i in (0, 1):
        s = schet[i]
        doly = 100.0 * s['перекос'] / max(1, s['проб'])
        print('%-7d игрок %-3d %-12d %-12s %s'
              % (jit, i + 1, s['проб'], '%d (%.0f%%)' % (s['перекос'], doly),
                 dict(s['kol']) if s['kol'] else '—'))
        itogo['проб'] += s['проб']
        itogo['перекос'] += s['перекос']
        kakaya.update(s['kol'])

print()
print('ВСЕГО: проб %d, с перекосом %d (%.0f%%)'
      % (itogo['проб'], itogo['перекос'],
         100.0 * itogo['перекос'] / max(1, itogo['проб'])))
print('какая колонка пустует: %s' % dict(kakaya))
