# -*- coding: utf-8 -*-
"""КОГДА РОЖДАЕТСЯ ПРИЗРАК. Печатаем обстановку в кадр рождения: чья клетка,
где, что за слово, сколько слоёв, какая живая фигура, что жмёт пилот.
Слои важны: если призрак рождается ровно в кадр прихода слоя, виноват
подъём поля, а не наши кнопки.
"""
import sys
sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td

SID = int(sys.argv[1]) if len(sys.argv) > 1 else 25
PREDEL = int(sys.argv[2]) if len(sys.argv) > 2 else 600000


def karta(md, p):
    b = io.field_base(md, p)
    if not b:
        return {}
    out = {}
    for r in range(-io.HIDDEN, io.ROWS):
        for c in range(io.COLS):
            a = b + r * io.ROW + c * 2
            v = md.rw(a)
            if v and (v & 0xFF) == 0:
                out[a] = (r, c, v)
    return out


if __name__ == '__main__':
    boec, geny, _ = td.load('build/net_duel.json')
    bylo = [dict(), dict()]
    sloi = [0, 0]
    rozhdeno = [0, 0]

    def na_kadre(md, f, pilots):
        for i, p in enumerate((io.P1, io.P2)):
            est = karta(md, p)
            sl = io.layers(md, p)
            for a in set(est) - set(bylo[i]):
                r, c, v = est[a]
                rozhdeno[i] += 1
                if rozhdeno[i] <= 12:
                    print('кадр %-6d %s: призрак ряд %d стлб %d = $%04X | слои %d (было %d)'
                          ' | живая %s | пилот жмёт %s фаза %s'
                          % (f, ('ЛЕВЫЙ', 'ПРАВЫЙ')[i], r, c, v, sl, sloi[i],
                             io.live_piece(md, p), pilots[i].btns, pilots[i].phase))
            bylo[i] = est
            sloi[i] = sl

    r = duel.run_duel(boec, boec, layers=0, max_frames=PREDEL, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=SID, on_frame=na_kadre,
                      prostor=False)
    print('--- сид %d: кадров %s, групп %s, рождено призраков: левый %d, правый %d'
          % (SID, r.get('кадров'), r.get('групп честных'), rozhdeno[0], rozhdeno[1]))
