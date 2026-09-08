# -*- coding: utf-8 -*-
"""ВИНОВАТО ЛИ УДЕРЖАНИЕ «ВНИЗ». В фазе drop пилот жмёт 'down' КАЖДЫЙ кадр.
Все восемь призраков родились именно в этой фазе. Проверяем тремя прогонами
одного сида:
  А — как есть (держим вниз каждый кадр);
  Б — «вниз» через кадр (нажал/отпустил);
  В — «вниз» не жмём вовсе, фигура падает сама.
Если призраки исчезают — причина найдена. Правок в игре пока НИКАКИХ:
кнопка фильтруется снаружи, у самого эмулятора.
"""
import sys
sys.path.insert(0, 'tools')
import bot_io as io
import duel
import md_machine
import train_duel as td

SID = int(sys.argv[1]) if len(sys.argv) > 1 else 25
REZHIM = sys.argv[2] if len(sys.argv) > 2 else 'А'


def prizrakov(md, p):
    b = io.field_base(md, p)
    if not b:
        return set()
    return {b + r * io.ROW + c * 2
            for r in range(-io.HIDDEN, io.ROWS) for c in range(io.COLS)
            if (lambda v: v and (v & 0xFF) == 0)(md.rw(b + r * io.ROW + c * 2))}


if __name__ == '__main__':
    boec, geny, _ = td.load('build/net_duel.json')

    ishodnyj = md_machine.MD.press

    def press_filtr(self, port, *btns):
        if REZHIM != 'А' and 'down' in btns:
            ostatok = tuple(b for b in btns if b != 'down')
            if REZHIM == 'В' or (self.frame % 2):
                if not ostatok:
                    return self.release(port)
                return ishodnyj(self, port, *ostatok)
        return ishodnyj(self, port, *btns)

    md_machine.MD.press = press_filtr
    bylo = [set(), set()]
    rozhdeno = [0, 0]

    def na_kadre(md, f, pilots):
        for i, p in enumerate((io.P1, io.P2)):
            est = prizrakov(md, p)
            rozhdeno[i] += len(est - bylo[i])
            bylo[i] = est

    try:
        r = duel.run_duel(boec, boec, layers=0, max_frames=600000, genes_a=geny,
                          genes_b=geny, quiet=True, jitter=SID, on_frame=na_kadre,
                          prostor=False)
    finally:
        md_machine.MD.press = ishodnyj
    print('режим %s | сид %d | кадров %s | групп %s | призраков: левый %d, правый %d'
          % (REZHIM, SID, r.get('кадров'), r.get('групп честных'),
             rozhdeno[0], rozhdeno[1]))
