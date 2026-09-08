# -*- coding: utf-8 -*-
"""
ЧТО ПРОИСХОДИТ В ТЕ 7.5 СЕКУНДЫ. У игрока 2 дыры держались кадры 1169..1616,
и ровно на 1616 он умер. Надо понять: дыры — причина смерти или её симптом.

Смотрим по ходу эпизода:
  * дыр в кладке и говорит ли settled(), что поле устоялось;
  * +0x4C — счётчик снижения фигуры (24 = «некуда опускаться»);
  * +0x5C — счётчик групп, он же место метки $1000;
  * сколько фигур пилот уложил и сколько раз промахнулся;
  * высоты столбцов — растёт ли стопка.

Если пилот в это время не кладёт фигур и промахи копятся — он ослеп
и не мог играть. Если кладёт — дыры ему не мешали, и смерть от другого.
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
print('кадр   дыр settled  +4C  +5C  улож  промах  высоты')
print('-' * 78)


def na_kadre(md, f, pilots):
    if f < 1100 or f > 1640 or f % 30:
        return
    p = io.P2
    pl = pilots[1]
    print('%-6d %-3d %-8s %-4d %-4d %-5d %-7d %s'
          % (f, dyrki(md, p), io.settled(md, p), md.rw(p + 0x4C),
             md.rw(p + 0x5C), pl.placed, pl.misses, vysoty(md, p)))


r = duel.run_duel(boec, boec, layers=1, max_frames=1700, genes_a=geny,
                  genes_b=geny, quiet=True, jitter=130, on_frame=na_kadre)
print()
print('итог:', {k: r.get(k) for k in ('умерли на кадрах', 'фигур', 'промахов',
                                      'снято меток 4096')})
