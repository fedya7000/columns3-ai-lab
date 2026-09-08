# -*- coding: utf-8 -*-
"""СЛЕЖКА С РОЖДЕНИЯ МАШИНЫ.

Дважды уже попался на одном: ярлык, повешенный по ходу боя, показывает
«записей нет» — Unicorn кеширует оттранслированный код, и блоки, переведённые
ДО ярлыка, его не дёргают. Поэтому вешаем в самом __init__, до первого кадра.
"""
import sys
sys.path.insert(0, 'tools')
from unicorn.m68k_const import UC_M68K_REG_A0, UC_M68K_REG_D0
import bot_io as io
import duel
import md_machine
import train_duel as td

CEL = 0xFF16FA
DO = 1722
zapisi = []

if __name__ == '__main__':
    boec, geny, _ = td.load('build/net_duel.json')

    ishodnyj_init = md_machine.MD.__init__

    def init_s_yarlykom(self, *a, **kw):
        ishodnyj_init(self, *a, **kw)

        def cb(md, adr, size, value, pc):
            if adr <= CEL < adr + size:
                u = md.uc
                zapisi.append((md.frame, adr, size, value, pc,
                               u.reg_read(UC_M68K_REG_A0) & 0xFFFFFF,
                               u.reg_read(UC_M68K_REG_D0) & 0xFFFFFFFF))
        self.add_watch(0xFF1600, 0xFF1760, cb)

    md_machine.MD.__init__ = init_s_yarlykom
    try:
        def na_kadre(md, f, pilots):
            if f > DO:
                raise SystemExit
        try:
            duel.run_duel(boec, boec, layers=0, max_frames=DO + 20, genes_a=geny,
                          genes_b=geny, quiet=True, jitter=25, on_frame=na_kadre,
                          prostor=False)
        except SystemExit:
            pass
    finally:
        md_machine.MD.__init__ = ishodnyj_init

    okno = [z for z in zapisi if 210 <= z[0] <= 290]
    print('записей в $%06X за кадры 210..290: %d (всего за прогон %d)'
          % (CEL, len(okno), len(zapisi)))
    for fr, adr, size, value, pc, a0, d0 in okno:
        print('   кадр %-5d $%06X разм=%d знач=$%08X PC=$%06X a0=$%06X d0=$%08X'
              % (fr, adr, size, value, pc, a0, d0))
