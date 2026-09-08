# -*- coding: utf-8 -*-
"""ВСЕ записи в ряд поля, где родится призрак — без фильтров по кадрам.

Проверяем прямо: есть ли ВООБЩЕ запись от процессора в $FF16FA к кадру 1717.
Если нет — клетку меняет не игра, а мы сами из питона (наши md.ww/md.wl
ярлыков не дёргают) или эмулятор.
"""
import sys
sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td

CEL = 0xFF16FA
DO = 1722

if __name__ == '__main__':
    boec, geny, _ = td.load('build/net_duel.json')
    postavleno = [False]
    zapisi = []
    znachenie = []

    def cb(md, a, size, value, pc):
        if a <= CEL < a + size:
            zapisi.append((md.frame, a, size, value, pc))

    def na_kadre(md, f, pilots):
        if not postavleno[0]:
            md.add_watch(0xFF1600, 0xFF1760, cb)
            postavleno[0] = True
        znachenie.append((f, md.rw(CEL)))
        if f > DO:
            raise SystemExit

    try:
        duel.run_duel(boec, boec, layers=0, max_frames=DO + 20, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=25, on_frame=na_kadre,
                      prostor=False)
    except SystemExit:
        pass

    print('записи ПРОЦЕССОРА в $%06X за кадры 1690..1725:' % CEL)
    for fr, a, size, value, pc in [z for z in zapisi if 1690 <= z[0] <= 1725]:
        print('   кадр %-5d $%06X разм=%d знач=$%08X PC=$%06X' % (fr, a, size, value, pc))
    print('всего записей процессора: %d' % len(zapisi))
    print()
    print('значение ячейки по кадрам (только смены):')
    proshloe = None
    for f, v in znachenie:
        if v != proshloe:
            print('   кадр %-5d = $%04X' % (f, v))
            proshloe = v
