# -*- coding: utf-8 -*-
"""РОЖДЕНИЕ ПРИЗРАКА ПОД ЛУПОЙ. Сид 25: первый призрак рождается на кадре
1717 у правого игрока (ряд 8, столбец 5). Ставим слежку на ЭТУ ячейку и
печатаем КАЖДУЮ запись в неё с кадра 1700: адрес, размер, значение, PC и
адресные регистры. Заодно то же самое для зеркальной ячейки ЛЕВОГО игрока —
у него призраков не бывает, и разница в коде должна быть видна.
"""
import sys
sys.path.insert(0, 'tools')
from unicorn.m68k_const import UC_M68K_REG_A0, UC_M68K_REG_D0
import bot_io as io
import duel
import train_duel as td

OT, DO = 1690, 1730
RYAD, STLB = 8, 5

if __name__ == '__main__':
    boec, geny, _ = td.load('build/net_duel.json')
    postavleno = [False]
    zhurnal = []

    def sdelat_cb(imya, celevoj):
        def cb(md, a, size, value, pc):
            if not (OT <= md.frame <= DO):
                return
            if not (a <= celevoj < a + size):
                return
            u = md.uc
            ar = ' '.join('a%d=%06X' % (i, u.reg_read(UC_M68K_REG_A0 + i) & 0xFFFFFF)
                          for i in (0, 1, 5, 6))
            d0 = u.reg_read(UC_M68K_REG_D0) & 0xFFFF
            zhurnal.append('кадр %-5d %-7s $%06X разм=%d знач=$%04X PC=$%06X d0=$%04X %s'
                           % (md.frame, imya, a, size, value, pc, d0, ar))
        return cb

    def na_kadre(md, f, pilots):
        if not postavleno[0] and f >= OT - 5:
            for imya, p in (('ЛЕВЫЙ', io.P1), ('ПРАВЫЙ', io.P2)):
                b = io.field_base(md, p)
                a = b + RYAD * io.ROW + STLB * 2
                # ⚠️ Точная слежка ловит ноль: игра пишет ДЛИННЫМ словом с
                # соседнего адреса, и Unicorn проверяет НАЧАЛО записи. Берём
                # весь ряд, а нужную ячейку отбираем в самом ярлыке.
                md.add_watch(b + RYAD * io.ROW, b + RYAD * io.ROW + 16, sdelat_cb(imya, a))
                print('слежу за %s: $%06X (база $%06X)' % (imya, a, b))
            postavleno[0] = True
        if f > DO:
            raise SystemExit

    try:
        duel.run_duel(boec, boec, layers=0, max_frames=DO + 20, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=25, on_frame=na_kadre,
                      prostor=False)
    except SystemExit:
        pass
    print()
    for s in zhurnal[:80]:
        print(s)
    print('всего записей: %d' % len(zhurnal))
