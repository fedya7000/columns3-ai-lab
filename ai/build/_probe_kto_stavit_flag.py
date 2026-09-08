# -*- coding: utf-8 -*-
"""КТО СТАВИТ ФЛАГ $8000 НА ПУСТУЮ КЛЕТКУ.

⚠️ Урок прошлой пробы: слежку надо ставить С ПЕРВОГО КАДРА — Unicorn кеширует
оттранслированный код, и ярлык, повешенный на 1685-м кадре, не ловит НИЧЕГО.
Прошлый вывод «записей нет» был враньём прибора, а не фактом.

Следим за ВСЕЙ областью поля правого игрока, а нужную ячейку отбираем внутри.
"""
import sys
sys.path.insert(0, 'tools')
from unicorn.m68k_const import UC_M68K_REG_A0, UC_M68K_REG_D0
import bot_io as io
import duel
import train_duel as td

OT, DO = 1714, 1720
CEL = 0xFF16FA          # ряд 8, столбец 5 при базе $FF1670

if __name__ == '__main__':
    boec, geny, _ = td.load('build/net_duel.json')
    postavleno = [False]
    zhurnal = []

    def cb(md, a, size, value, pc):
        if not (OT <= md.frame <= DO):
            return
        if not (0xFF16F0 <= a <= 0xFF1700):
            return
        u = md.uc
        ar = ' '.join('a%d=%06X' % (i, u.reg_read(UC_M68K_REG_A0 + i) & 0xFFFFFF)
                      for i in (0, 1, 2, 6))
        zhurnal.append('кадр %-5d $%06X разм=%d знач=$%08X PC=$%06X d0=$%08X %s'
                       % (md.frame, a, size, value, pc,
                          u.reg_read(UC_M68K_REG_D0), ar))

    def na_kadre(md, f, pilots):
        if not postavleno[0]:
            md.add_watch(0xFF1600, 0xFF1760, cb)     # всё поле правого
            postavleno[0] = True
        if f > DO:
            raise SystemExit

    try:
        duel.run_duel(boec, boec, layers=0, max_frames=DO + 20, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=25, on_frame=na_kadre,
                      prostor=False)
    except SystemExit:
        pass
    for s in zhurnal[:120]:
        print(s)
    print('всего записей в $%06X за кадры %d..%d: %d' % (CEL, OT, DO, len(zhurnal)))
