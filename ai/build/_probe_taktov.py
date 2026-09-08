# -*- coding: utf-8 -*-
"""ХВАТАЕТ ЛИ ЭМУЛЯТОРУ КОМАНД НА КАДР.

Гипотеза: instr_per_frame=13000 обрывает тяжёлый кадр на середине, и шаг
уплотнения не достаётся тому, кого игра считает ПОСЛЕДНИМ — второму игроку.
Тогда помеченная клетка ($80 при нулевом цвете) остаётся непереписанной
навсегда. Это объясняет всё разом: только правый, только при схлопываниях,
и ноль призраков, когда бот не давит «вниз».

Проверка: поднимаем потолок и считаем призраков.
"""
import os
import sys
from multiprocessing import Pool

sys.path.insert(0, 'tools')
import bot_io as io
import duel
import md_machine

SIDY = [25, 130, 165]
POTOLKI = [39000, 60000]


def prizrakov(md, p):
    b = io.field_base(md, p)
    if not b:
        return set()
    out = set()
    for r in range(-io.HIDDEN, io.ROWS):
        for c in range(io.COLS):
            a = b + r * io.ROW + c * 2
            v = md.rw(a)
            if v and (v & 0xFF) == 0:
                out.add(a)
    return out


def odin(arg):
    potolok, jit = arg
    ish = md_machine.MD.__init__

    def init_s_potolkom(self, rom_path, instr_per_frame=13000, **kw):
        ish(self, rom_path, instr_per_frame=potolok, **kw)
    md_machine.MD.__init__ = init_s_potolkom

    import train_duel as td
    boec, geny, _ = td.load('build/net_duel.json')
    bylo = [set(), set()]
    rozhd = [0, 0]
    kadrov_s = [0, 0]

    def na_kadre(md, f, pilots):
        for i, p in enumerate((io.P1, io.P2)):
            est = prizrakov(md, p)
            rozhd[i] += len(est - bylo[i])
            if est:
                kadrov_s[i] += 1
            bylo[i] = est

    try:
        r = duel.run_duel(boec, boec, layers=0, max_frames=600000, genes_a=geny,
                          genes_b=geny, quiet=True, jitter=jit, on_frame=na_kadre)
    finally:
        md_machine.MD.__init__ = ish
    k = max(1, r.get('кадров', 1))
    g = r.get('групп честных') or [0, 0]
    return (potolok, jit, sum(g), k, rozhd[:], 100.0 * kadrov_s[1] / k, 'ошибка' in r)


if __name__ == '__main__':
    zadachi = [(p, s) for p in POTOLKI for s in SIDY]
    with Pool(4) as pool:
        out = pool.map(odin, zadachi)
    print('%-8s %-6s %-8s %-8s %-14s %-12s %s'
          % ('потолок', 'сид', 'кадров', 'групп', 'призраков Л/П', 'доля кадров', 'срыв'))
    print('-' * 76)
    for potolok, jit, g, k, rozhd, dolya, sryv in out:
        print('%-8d %-6d %-8d %-8d %-14s %-12s %s'
              % (potolok, jit, k, g, '%d / %d' % (rozhd[0], rozhd[1]),
                 '%.0f %%' % dolya, 'ДА' if sryv else ''))
