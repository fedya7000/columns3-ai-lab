# -*- coding: utf-8 -*-
"""ГДЕ ЛЕЖИТ ПОЛЕ и НЕ ТОПЧЕМ ЛИ МЫ ЕГО САМИ.

fix_empty_slots пишет КАЖДЫЙ КАДР по четыре длинных слова в слоты 2..15
($FF1800..$FF4C00). Если поле игрока лежит в этом же куске памяти — дыры
делаем мы сами, а не игра. Проверяется арифметикой, без гаданий.
"""
import sys
sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td

NASHI = []
for i in range(2, io.МНИМЫХ):
    s = 0xFF1000 + 0x400 * i
    NASHI += [s + 0x0E, s + 0x16, s + 0x1C, s + 0x20]

if __name__ == '__main__':
    boec, geny, _ = td.load('build/net_duel.json')
    vidno = {}

    def na_kadre(md, f, pilots):
        if f > 3600:
            raise SystemExit
        if f % 300 and f not in (3429, 3540):
            return
        stroka = []
        for imya, p in (('P1', io.P1), ('P2', io.P2)):
            b = io.field_base(md, p)
            if not b:
                stroka.append('%s: базы нет' % imya); continue
            ot, do = b - io.HIDDEN * io.ROW, b + io.ROWS * io.ROW
            bity = [a for a in NASHI if ot <= a < do + 4]
            stroka.append('%s: база $%06X, поле $%06X..$%06X, слои %s, наших записей внутри %d'
                          % (imya, b, ot, do, io.layers(md, p), len(bity)))
            if bity:
                stroka.append('   ⚠️ ПОПАДАНИЕ: ' + ' '.join('$%06X' % a for a in bity[:8]))
        print('кадр %-5d %s' % (f, ' | '.join(stroka)))

    try:
        duel.run_duel(boec, boec, layers=0, max_frames=3700, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=25, on_frame=na_kadre,
                      prostor=False)
    except SystemExit:
        pass
    print()
    print('наши записи идут по адресам $%06X..$%06X (слоты 2..%d)'
          % (min(NASHI), max(NASHI), io.МНИМЫХ - 1))
