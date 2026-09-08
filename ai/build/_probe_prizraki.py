# -*- coding: utf-8 -*-
"""КЛЕТКИ-ПРИЗРАКИ: слово в поле НЕ ноль, а цвет (младший байт) ноль.

Игра держит такую клетку ЗАНЯТОЙ — камни на неё ложатся; рисовать в ней
нечего — на экране дыра. Наш field() маскирует & 0xFF и видит ПУСТО, то есть
бот планирует на карте, которой нет.

Считаем за всю партию: сколько призраков родилось, сколько живут, у кого.
"""
import sys
from collections import defaultdict

sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td

SID = int(sys.argv[1]) if len(sys.argv) > 1 else 25


def prizraki(md, p):
    b = io.field_base(md, p)
    if not b:
        return set()
    out = set()
    for r in range(-io.HIDDEN, io.ROWS):
        row = b + r * io.ROW
        for c in range(io.COLS):
            v = md.rw(row + c * 2)
            if v and (v & 0xFF) == 0:
                out.add((row + c * 2, v))   # адрес, чтобы сдвиг поля не путал
    return out


if __name__ == '__main__':
    boec, geny, _ = td.load('build/net_duel.json')
    zhivut = [dict(), dict()]        # адрес -> кадр рождения
    zhizni = [[], []]
    v_boyu = [0, 0]

    def na_kadre(md, f, pilots):
        for i, p in enumerate((io.P1, io.P2)):
            est = {a for a, v in prizraki(md, p)}
            if est:
                v_boyu[i] += 1
            for a in est - set(zhivut[i]):
                zhivut[i][a] = f
            for a in set(zhivut[i]) - est:
                zhizni[i].append(f - zhivut[i].pop(a))

    r = duel.run_duel(boec, boec, layers=0, max_frames=600000, genes_a=geny,
                      genes_b=geny, quiet=True, jitter=SID, on_frame=na_kadre,
                      prostor=False)
    kadrov = r.get('кадров', 0)
    g = r.get('групп честных') or [0, 0]
    print('сид %d: кадров %s, групп %s, победил %s' % (SID, kadrov, g, r.get('победил')))
    for i, imya in enumerate(('ЛЕВЫЙ', 'ПРАВЫЙ')):
        zh = zhizni[i] + [kadrov - v for v in zhivut[i].values()]
        dolgie = [x for x in zh if x >= 60]
        print('  %s: призраков всего %d, из них дольше секунды %d, '
              'самый живучий %d кадров, кадров с призраком на поле %d (%.0f %%)'
              % (imya, len(zh), len(dolgie), max(zh) if zh else 0,
                 v_boyu[i], 100.0 * v_boyu[i] / max(1, kadrov)))
