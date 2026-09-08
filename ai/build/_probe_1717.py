# -*- coding: utf-8 -*-
"""ЧТО ИМЕННО ПРОИСХОДИТ НА КАДРЕ 1717. Записей в ячейку нет — значит
менялось что-то другое. Печатаем покадрово: базу поля, слои и весь столбец 5
правого игрока словами."""
import sys
sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td

OT, DO = 1710, 1722

if __name__ == '__main__':
    boec, geny, _ = td.load('build/net_duel.json')

    def na_kadre(md, f, pilots):
        if f > DO:
            raise SystemExit
        if f < OT:
            return
        p = io.P2
        b = io.field_base(md, p)
        stolb = [md.rw(b + r * io.ROW + 5 * 2) for r in range(2, io.ROWS)]
        print('кадр %-5d база $%06X слои %d живая %s | столбец 5 (ряды 2..12): %s'
              % (f, b, io.layers(md, p), io.live_piece(md, p),
                 ' '.join('%04X' % v for v in stolb)))

    try:
        duel.run_duel(boec, boec, layers=0, max_frames=DO + 20, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=25, on_frame=na_kadre,
                      prostor=False)
    except SystemExit:
        pass
