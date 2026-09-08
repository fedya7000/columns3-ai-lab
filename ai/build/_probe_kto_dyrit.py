# -*- coding: utf-8 -*-
"""КТО ДЕЛАЕТ ДЫРУ. Дыра сидит по постоянному адресу $FF172A (нижний ряд
поля правого игрока, крайний правый столбец) с кадра ~3429 и живёт 175
кадров. Смотрим КАЖДУЮ запись в эту ячейку: кадр, PC, значение.

Отдельно печатаем значение ячейки на каждом кадре — если оно меняется БЕЗ
записи от процессора, значит поле не портили, а поехал указатель, и дыра
существует только в нашем чтении.
"""
import sys
sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td

ADR = 0xFF172A
OT, DO = 3300, 3620

if __name__ == '__main__':
    boec, geny, _ = td.load('build/net_duel.json')
    postavlen = [False]
    zapisi = []
    proshloe = [None]

    def cb(md, a, size, value, pc):
        zapisi.append((md.frame, pc, size, value))

    def na_kadre(md, f, pilots):
        if not postavlen[0]:
            md.add_watch(ADR, ADR + 2, cb)
            postavlen[0] = True
        if f > DO:
            raise SystemExit
        if f < OT:
            return
        v = md.rw(ADR)
        b = io.field_base(md, io.P2)
        if v != proshloe[0]:
            print('кадр %-5d $FF172A = $%04X   (база P2 $%06X, слои %d)'
                  % (f, v, b, io.layers(md, io.P2)))
            proshloe[0] = v

    try:
        duel.run_duel(boec, boec, layers=0, max_frames=DO + 20, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=25, on_frame=na_kadre,
                      prostor=False)
    except SystemExit:
        pass

    print()
    print('=== записи в $FF172A с кадра %d ===' % OT)
    n = 0
    for fr, pc, sz, v in zapisi:
        if fr < 3400:
            continue
        n += 1
        print('  кадр %-5d PC=$%06X  размер=%d  значение=$%04X' % (fr, pc, sz, v))
        if n > 60:
            print('  ...'); break
    print('всего записей за прогон: %d' % len(zapisi))
