# -*- coding: utf-8 -*-
"""ВИДЕО ВСЕЙ ИГРЫ, без единой склейки.

Ловушка, на которой попалась первая попытка: duel.run_duel зовёт on_frame
ТОЛЬКО пока io.in_battle(md) — межраундовые заставки и загрузка проходят
мимо, и запись молча склеивается (8194 кадра вместо 9799, минус 27 секунд).
Поэтому кадр снимаем не колбэком боя, а перехватом самого шага машины:
что нарисовал эмулятор, то и в файле.
"""
import os
import shutil
import sys

sys.path.insert(0, 'tools')
import duel
import md_machine
import bot_io as io
import train_duel as td
import video as vid

SID = int(sys.argv[1]) if len(sys.argv) > 1 else 25
IMYA = sys.argv[2] if len(sys.argv) > 2 else 'vsya_igra'

VYHOD = 'shots'
KADRY = os.path.join(VYHOD, 'kadry_vsya')

if __name__ == '__main__':
    boec, geny, meta = td.load('build/net_duel.json')
    print('боец: поколение %s, сид %d' % (meta.get('gen'), SID))
    if os.path.isdir(KADRY):
        shutil.rmtree(KADRY)
    os.makedirs(KADRY)

    schet = [0]
    pervyj_boj = [None]
    shag_ishodnyj = md_machine.MD.step_frame

    def shag_s_zapisyu(self):
        shag_ishodnyj(self)
        if pervyj_boj[0] is None and io.in_battle(self):
            pervyj_boj[0] = schet[0]
        self.render(os.path.join(KADRY, 'k%06d.png' % schet[0]))
        schet[0] += 1

    md_machine.MD.step_frame = shag_s_zapisyu
    try:
        r = duel.run_duel(boec, boec, layers=0, max_frames=600000, genes_a=geny,
                          genes_b=geny, quiet=True, jitter=SID, prostor=False)
    finally:
        md_machine.MD.step_frame = shag_ishodnyj

    g = r.get('групп честных') or [0, 0]
    print('бой: кадров %s, групп %s (итого %d), победил %s, фигур %s'
          % (r.get('кадров'), g, sum(g), r.get('победил'), r.get('фигур')))
    print('снято кадров: %d (бой начался на кадре %s)' % (schet[0], pervyj_boj[0]))

    put = os.path.join(VYHOD, '%s.mp4' % IMYA)
    razmer = vid.собрать_mp4(KADRY, put, fps=60, увеличение=2)
    if razmer is None:
        print('ffmpeg не собрал'); sys.exit(1)
    shutil.rmtree(KADRY)
    print('готово: %s, %.1f МБ, %.0f секунд'
          % (os.path.abspath(put), razmer / 1e6, schet[0] / 60.0))
