# -*- coding: utf-8 -*-
"""НАСТОЯЩИЕ ЦВЕТА КАМНЕЙ. В эфире я раскрасил камни от балды, и владелец
справедливо сказал «цвета я хз какие». Берём их у самой игры: ищем, где на
экране нарисовано поле, и смотрим, каким цветом рисуется камень значения v.

Ищем перебором: у верного положения сетки клетки ОДНОГО значения красятся
ОДНИМ цветом, а пустые — фоном. У неверного цвета мешаются.
"""
import sys
from collections import Counter
sys.path.insert(0, 'tools')
import numpy as np
import bot_io as io, duel, train_duel as td

кадр = {}


def на_кадре(md, f, pilots):
    if f == 2500:
        кадр['img'] = np.asarray(md.render_np(scale=1))
        кадр['поля'] = [io.field(md, io.P1), io.field(md, io.P2)]
        кадр['слои'] = [io.layers(md, io.P1), io.layers(md, io.P2)]
        raise SystemExit


боец, гены, _ = td.load('build/net_duel.json')
try:
    duel.run_duel(боец, боец, layers=0, max_frames=4000, genes_a=гены, genes_b=гены,
                  quiet=True, jitter=25, on_frame=на_кадре, mnogo_raundov=True)
except SystemExit:
    pass

img = кадр['img']
H, W = img.shape[:2]
лучшее = None
for кто, поле in enumerate(кадр['поля']):
    for клетка in (8, 16):
        ш, в = io.COLS * клетка, io.ROWS * клетка
        for x0 in range(0, W - ш + 1, 2):
            for y0 in range(0, H - в + 1, 2):
                по_значению = {}
                for r in range(io.ROWS):
                    for c in range(io.COLS):
                        v = поле[io.HIDDEN + r][c]
                        px = img[y0 + r * клетка + клетка // 2,
                                 x0 + c * клетка + клетка // 2]
                        по_значению.setdefault(v, []).append(tuple(int(t) for t in px))
                if len(по_значению) < 3:
                    continue
                очки, всего = 0, 0
                цвета = {}
                for v, сп in по_значению.items():
                    ц, n = Counter(сп).most_common(1)[0]
                    цвета[v] = ц
                    очки += n
                    всего += len(сп)
                # разные значения обязаны иметь РАЗНЫЕ цвета
                if len(set(цвета.values())) < len(цвета):
                    continue
                доля = очки / всего
                if лучшее is None or доля > лучшее[0]:
                    лучшее = (доля, кто, клетка, x0, y0, цвета)

доля, кто, клетка, x0, y0, цвета = лучшее
print('лучшая сетка: игрок %d, клетка %d px, угол (%d, %d), совпало %.0f %% клеток'
      % (кто + 1, клетка, x0, y0, 100 * доля))
print('слои у игроков:', кадр['слои'])
print('цвета по значению камня:')
for v in sorted(цвета):
    r, g, b = цвета[v]
    имя = 'ПУСТО' if v == 0 else ('СТЕНА/СЛОЙ' if v == io.WALL else 'камень %d' % v)
    print('   %-12s #%02x%02x%02x' % (имя, r, g, b))
