# -*- coding: utf-8 -*-
"""НЕ МЫ ЛИ ДЕЛАЕМ ПРИЗРАКОВ. fix_empty_slots каждый кадр пишет по четыре
длинных слова в слоты 2..МНИМЫХ-1 ($FF180E..$FF4C20). Слотов по разметке
СЕМЬ, а закрываем шестнадцать — с запасом «на всякий случай».
Гоняем один сид при разной глубине закрытия и смотрим призраков.
Меньше писанины и меньше призраков — виноваты мы."""
import sys
from multiprocessing import Pool
sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td

SIDY = [25, 130, 47]
GLUBINY = [2, 3]


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
    glub, jit = arg
    io.МНИМЫХ = glub
    boec, geny, _ = td.load('build/net_duel.json')
    bylo = [set(), set()]
    rozhd = [0, 0]

    def na_kadre(md, f, pilots):
        for i, p in enumerate((io.P1, io.P2)):
            est = prizrakov(md, p)
            rozhd[i] += len(est - bylo[i])
            bylo[i] = est

    r = duel.run_duel(boec, boec, layers=0, max_frames=600000, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=jit, on_frame=na_kadre,
                      prostor=False)
    g = r.get('групп честных') or [0, 0]
    return (glub, jit, r.get('кадров'), g, rozhd[:], r.get('ошибка', ''))


if __name__ == '__main__':
    zadachi = [(g, s) for g in GLUBINY for s in SIDY]
    with Pool(9) as pool:
        out = pool.map(odin, zadachi)
    print('%-10s %-6s %-8s %-10s %-14s %s' % ('закрыто', 'сид', 'кадров', 'групп', 'призраков Л/П', 'ошибка'))
    print('-' * 70)
    for glub, jit, k, g, rozhd, err in out:
        print('слоты 2..%-3d %-6d %-8s %-10s %-14s %s'
              % (glub - 1, jit, k, '%d/%d' % (g[0], g[1]),
                 '%d / %d' % (rozhd[0], rozhd[1]), err))
