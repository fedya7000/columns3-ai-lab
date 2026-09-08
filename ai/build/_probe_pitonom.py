# -*- coding: utf-8 -*-
"""КТО ПИШЕТ МИМО ПРОЦЕССОРА. Записи процессора в клетку нет, а она меняется.
Значит пишет питон: uc.mem_write ярлыков не дёргает вовсе. Оборачиваем его и
печатаем стек вызова для любой записи, накрывающей $FF16FA."""
import sys
import traceback
sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td

CEL = 0xFF16FA
DO = 1722

if __name__ == '__main__':
    boec, geny, _ = td.load('build/net_duel.json')
    obernuto = [False]
    nashli = []

    def na_kadre(md, f, pilots):
        if not obernuto[0]:
            ishodnyj = md.uc.mem_write

            def mem_write_s_yarlykom(address, data):
                a = address & 0xFFFFFF
                if a <= CEL < a + len(data) and len(nashli) < 6:
                    nashli.append((md.frame, a, len(data), bytes(data[:8]),
                                   ''.join(traceback.format_stack(limit=6)[:-1])))
                return ishodnyj(address, data)

            md.uc.mem_write = mem_write_s_yarlykom
            obernuto[0] = True
        if f > DO:
            raise SystemExit

    try:
        duel.run_duel(boec, boec, layers=0, max_frames=DO + 20, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=25, on_frame=na_kadre,
                      prostor=False)
    except SystemExit:
        pass

    print('записей ПИТОНОМ, накрывающих $%06X: %d' % (CEL, len(nashli)))
    for fr, a, n, dan, stek in nashli:
        print('--- кадр %d: $%06X, %d байт, данные %s' % (fr, a, n, dan.hex()))
        print(stek)
