# -*- coding: utf-8 -*-
"""
Дыры в кладке: настоящие или мираж анимации, и виновата ли чистка метки 4096.

Дырой считаем пустую клетку, НАД которой лежит камень. По brain.py:8 таких
быть не должно вовсе: в Columns кладка сплошная.

Но bot_io.settled() знает, что сразу после схлопывания камни падают постепенно
и дыры зияют временно. Поэтому меряем ДВА числа:
  * дыры в ЛЮБОЙ момент — сюда попадает и мираж анимации;
  * дыры в УСТОЯВШЕМСЯ поле (settled) — вот этих быть не может, это болезнь.

И всё это дважды: с чисткой метки и без неё, на одном и том же бое.
Расходятся числа — виновата чистка. Совпадают — дыры были и до неё.
"""
import sys

sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel


def dyrki(md, p):
    """Сколько пустых клеток лежит ПОД камнями. Читаем сырое поле, как settled."""
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


def zamer(chistit, boec, geny, kadrov=2700, jitter=130):
    schet = {'любые': [0, 0], 'в устоявшемся': [0, 0], 'проб': 0}

    def na_kadre(md, f, pilots):
        if f % 10:                       # каждый десятый кадр — хватит
            return
        schet['проб'] += 1
        for i, p in enumerate((io.P1, io.P2)):
            d = dyrki(md, p)
            if d:
                schet['любые'][i] += 1
                if io.settled(md, p):
                    schet['в устоявшемся'][i] += 1

    r = duel.run_duel(boec, boec, layers=1, max_frames=kadrov, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=jitter,
                      on_frame=na_kadre, chistit_metku=chistit)
    return schet, r


boec, geny, _ = train_duel.load()
print('%-8s %-22s %-24s %s' % ('чистка', 'кадров с дырами', 'ИЗ НИХ в устоявшемся', 'проб'))
print('-' * 74)
for chistit in (False, True):
    s, r = zamer(chistit, boec, geny)
    print('%-8s %-22s %-24s %s'
          % (chistit, s['любые'], s['в устоявшемся'], s['проб']))
    print('         снято меток %s, умерли %s'
          % (r.get('снято меток 4096'), r.get('умерли на кадрах')))
