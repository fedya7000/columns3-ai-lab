# -*- coding: utf-8 -*-
"""ДВЕ ПРОВЕРКИ ПО ЗАМЕЧАНИЯМ ВЛАДЕЛЬЦА 25.08.

1. «Следующая фигура не всегда та». Запоминаем, что io.next_piece обещал,
   и сверяем с фигурой, которая ПРИШЛА следующей. Цвета сравниваем как набор:
   поворот их переставляет, но не меняет.

2. «Почему ИИ не жмёт золотом на плиты». Считаем, сколько золотых фигур было
   за бой и что пилот ими выбрал: 9 — снять свои слои, 7 — дать слои врагу,
   8 — смести цвет.
"""
import sys
from collections import Counter

sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td

SID = int(sys.argv[1]) if len(sys.argv) > 1 else 25
ИМЕНА = {9: 'снять свои слои', 7: 'дать слои врагу', 8: 'смести цвет'}

выбор = Counter()
золотых = [0, 0]

if __name__ == '__main__':
    боец, гены, _ = td.load('build/net_duel.json')

    исходный = duel.Pilot._decide_gold

    def с_записью(self, cur):
        кол, want = исходный(self, cur)
        низ = want[2]
        выбор[низ] += 1
        золотых[0 if self.p == io.P1 else 1] += 1
        return кол, want
    duel.Pilot._decide_gold = с_записью

    обещано = [None, None]
    прошлое_число = [None, None]
    сверок = [0, 0]
    промахов = [0, 0]
    примеры = []

    def на_кадре(md, f, pilots):
        for i, p in enumerate((io.P1, io.P2)):
            n = io.placed(md, p)
            если_новая = прошлое_число[i] is not None and n != прошлое_число[i]
            if если_новая and обещано[i] is not None:
                пришла = io.live_piece(md, p)
                if all(1 <= c <= 6 for c in пришла) and all(1 <= c <= 6 for c in обещано[i]):
                    сверок[i] += 1
                    if sorted(пришла) != sorted(обещано[i]):
                        промахов[i] += 1
                        if len(примеры) < 6:
                            примеры.append('%s: обещали %s, пришла %s (кадр %d)'
                                           % (('ЛЕВЫЙ', 'ПРАВЫЙ')[i], обещано[i], пришла, md.frame))
            прошлое_число[i] = n
            обещано[i] = io.next_piece(md, p)

    try:
        r = duel.run_duel(боец, боец, layers=0, max_frames=40000, genes_a=гены,
                          genes_b=гены, quiet=True, jitter=SID, on_frame=на_кадре,
                          mnogo_raundov=True)
    finally:
        duel.Pilot._decide_gold = исходный

    г = r.get('групп честных') or [0, 0]
    print('сид %d: кадров %s, групп %s' % (SID, r.get('кадров'), г))
    print()
    print('--- 1. СЛЕДУЮЩАЯ ФИГУРА ---')
    for i, имя in enumerate(('ЛЕВЫЙ', 'ПРАВЫЙ')):
        с, пр = сверок[i], промахов[i]
        print('  %s: сверок %d, не совпало %d (%.0f %%)'
              % (имя, с, пр, 100.0 * пр / max(1, с)))
    for s in примеры:
        print('    ' + s)
    print()
    print('--- 2. ЗОЛОТАЯ ФИГУРА ---')
    print('  золотых пришло: левому %d, правому %d' % tuple(золотых))
    if not выбор:
        print('  ни одной золотой за бой')
    for низ, n in выбор.most_common():
        print('  %-18s %d раз (%.0f %%)'
              % (ИМЕНА.get(низ, низ), n, 100.0 * n / sum(выбор.values())))
