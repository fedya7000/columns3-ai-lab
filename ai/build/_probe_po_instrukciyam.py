# -*- coding: utf-8 -*-
"""ПО ИНСТРУКЦИЯМ. Три прибора подряд соврали, что записи в $FF16FA нет:
слежка Unicorn пропускает даже ЗАВЕДОМО честную запись (подсадная на кадре
220 дала ноль). Поэтому идём способом, который на ярлыки не опирается:
вешаем ярлык на КАЖДУЮ инструкцию и после каждой сами читаем байт.
Та команда, после которой он стал $80, и есть виновник.
"""
import sys
sys.path.insert(0, 'tools')
from unicorn import UC_HOOK_CODE
from unicorn.m68k_const import UC_M68K_REG_A0, UC_M68K_REG_A1, UC_M68K_REG_A6, UC_M68K_REG_D0
import bot_io as io
import duel
import md_machine
import train_duel as td

CEL = 0xFF16FA
CEL_KADR = 1717
nashli = []
sledim = [False]
proshloe = [None]

if __name__ == '__main__':
    boec, geny, _ = td.load('build/net_duel.json')
    ishodnyj_init = md_machine.MD.__init__

    def init_s_shagom(self, *a, **kw):
        ishodnyj_init(self, *a, **kw)

        def na_instrukcii(uc, adres, razmer, ud):
            if not sledim[0]:
                return
            v = uc.mem_read(CEL, 1)[0]
            if proshloe[0] is None:
                proshloe[0] = v
                return
            if v != proshloe[0]:
                nashli.append((self.frame, proshloe[0], v, adres,
                               uc.reg_read(UC_M68K_REG_A0) & 0xFFFFFF,
                               uc.reg_read(UC_M68K_REG_A1) & 0xFFFFFF,
                               uc.reg_read(UC_M68K_REG_A6) & 0xFFFFFF,
                               uc.reg_read(UC_M68K_REG_D0) & 0xFFFFFFFF))
                proshloe[0] = v

        self.uc.hook_add(UC_HOOK_CODE, na_instrukcii)

    md_machine.MD.__init__ = init_s_shagom
    try:
        def na_kadre(md, f, pilots):
            # следим только вокруг нужного кадра: ярлык на каждую команду
            # замедляет эмулятор в десятки раз
            sledim[0] = (CEL_KADR - 3) <= f <= (CEL_KADR + 2)
            if f > CEL_KADR + 2:
                raise SystemExit
        try:
            duel.run_duel(boec, boec, layers=0, max_frames=CEL_KADR + 20,
                          genes_a=geny, genes_b=geny, quiet=True, jitter=25,
                          on_frame=na_kadre, prostor=False)
        except SystemExit:
            pass
    finally:
        md_machine.MD.__init__ = ishodnyj_init

    print('смен байта $%06X за кадры %d..%d: %d' % (CEL, CEL_KADR - 3, CEL_KADR + 2, len(nashli)))
    for fr, bylo, stalo, pc, a0, a1, a6, d0 in nashli:
        print('   кадр %-5d $%02X -> $%02X ПОСЛЕ команды на $%06X | a0=$%06X a1=$%06X a6=$%06X d0=$%08X'
              % (fr, bylo, stalo, pc, a0, a1, a6, d0))
