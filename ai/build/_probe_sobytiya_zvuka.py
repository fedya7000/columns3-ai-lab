# -*- coding: utf-8 -*-
"""ДОХОДЯТ ЛИ СОБЫТИЯ ДО ЗВУКА. Повторяем ровно ту же выборку, что делает
эфир (_снять/_поймать_события), и считаем, сколько раз ДОЛЖЕН прозвучать
каждый сигнал за минуту боя. Если счёт нулевой — виноват разбор событий,
если счёт есть — виноват показ или кнопка."""
import sys
from collections import Counter
sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
import bot_io as io
import duel
import train_duel as td

ЗОЛОТО = {7, 8, 9}
счёт = Counter()
прошлые_группы = [0, 0]
было_золото = [False, False]
прошлое = {}


def на_кадре(md, f, pilots):
    if f % 2:
        return
    группы = list(getattr(md, '_gruppy', [0, 0]))
    for i in (0, 1):
        d = группы[i] - прошлые_группы[i]
        if 0 < d <= 9:
            счёт['группа'] += 1
        прошлые_группы[i] = группы[i]
    for i, p in enumerate((io.P1, io.P2)):
        зол = any(v in ЗОЛОТО for v in io.next_piece(md, p))
        if зол and not было_золото[i]:
            счёт['золото'] += 1
        было_золото[i] = зол
        новое = {'цепь': io.chain(md, p), 'слои': io.layers(md, p),
                 'атак': pilots[i].attacks}
        старое = прошлое.get(i)
        if старое:
            if новое['цепь'] >= 3 and новое['цепь'] > старое['цепь']:
                счёт['цепь'] += 1
            if новое['слои'] > старое['слои']:
                счёт['слой'] += 1
            if новое['атак'] > старое['атак']:
                счёт['удар'] += 1
        прошлое[i] = новое


боец, гены, _ = td.load('build/net_duel.json')
r = duel.run_duel(боец, боец, layers=0, max_frames=3600, genes_a=гены,
                  genes_b=гены, quiet=True, jitter=25, on_frame=на_кадре,
                  mnogo_raundov=True)
print('за 3600 кадров (минута игры) сигналов должно прозвучать:')
if not счёт:
    print('   НИ ОДНОГО — событий не видно, звучать нечему')
for имя, n in счёт.most_common():
    print('   %-8s %d раз' % (имя, n))
print()
print('групп за минуту:', r.get('групп честных'))
