# -*- coding: utf-8 -*-
"""ПРИЗРАКИ ПРИВЯЗАНЫ К ПОРТУ ИЛИ К ИГРЕ БОТА.

У пилотов разные «руки»: seed = 9161 + порт*7919. Меняем руки местами.
  - призраки остались у ПРАВОГО  -> дело в самом игроке 2 (структура/порт);
  - призраки уехали к ЛЕВОМУ     -> дело в том, КАК бот играет, порт ни при чём.
"""
import sys
from multiprocessing import Pool
sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td

SIDY = [25, 130, 165]


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
    jit, menyat = arg
    if menyat:
        ish = duel.Pilot.__init__

        def init_naoborot(self, md, port, p, head, *a, **kw):
            kw['seed'] = 9161 + (1 - port) * 7919      # руки местами
            ish(self, md, port, p, head, *a, **kw)
        duel.Pilot.__init__ = init_naoborot

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
    return (jit, menyat, r.get('кадров'), g, rozhd[:])


if __name__ == '__main__':
    zadachi = [(s, m) for m in (False, True) for s in SIDY]
    with Pool(6) as pool:
        out = pool.map(odin, zadachi)
    print('%-22s %-6s %-8s %-10s %s' % ('руки', 'сид', 'кадров', 'групп', 'призраков Л / П'))
    print('-' * 66)
    for jit, menyat, k, g, rozhd in out:
        print('%-22s %-6d %-8s %-10s %d / %d'
              % ('ПОМЕНЯНЫ' if menyat else 'как обычно', jit, k,
                 '%d/%d' % (g[0], g[1]), rozhd[0], rozhd[1]))
