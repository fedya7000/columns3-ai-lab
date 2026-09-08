# -*- coding: utf-8 -*-
"""
ОТЧЕГО БОТ УМИРАЕТ В ДУЭЛИ. Владелец хочет бои на 300-500 групп, сейчас
выходит 44 при layers=0: кто-то заваливается после ~52 фигур.

Вопрос не «слабо играет», а ЧТО ИМЕННО убивает. Снимаем последние секунды
жизни проигравшего: высоты столбцов, дыры, входящую порчу, слои снизу,
сколько фигур успел положить между атаками.

Если стопка растёт РОВНО и всё равно достаёт до потолка — это скилл.
Если растёт рывком после чужой атаки — убивает порча, и надо смотреть, умеет
ли бот её учитывать.
"""
import sys

sys.path.insert(0, 'tools')
import bot_io as io
import duel
import train_duel as td


def vysoty(md, p):
    if not io.field_base(md, p):
        return []
    s = io.field_raw(md, p)
    out = []
    for c in range(io.COLS):
        h = 0
        for r in range(io.TOTAL):
            v = s[r][c] & 0xFF
            if v and v != 0xFF:
                h = io.TOTAL - r
                break
        out.append(h)
    return out


istoriya = []


def na_kadre(md, f, pilots):
    if f % 60:
        return
    zapis = {'кадр': f}
    for i, p in enumerate((io.P1, io.P2)):
        v = vysoty(md, p)
        zapis[i] = {
            'высоты': v,
            'макс': max(v) if v else 0,
            'фигур': pilots[i].placed,
            'порча': [md.rw(p + 0xF0 + k * 2) for k in range(5)],
            'шкала': md.rw(p + 0x5A),
        }
    istoriya.append(zapis)


boec, geny, _ = td.load()
r = duel.run_duel(boec, boec, layers=0, max_frames=60000, genes_a=geny,
                  genes_b=geny, quiet=True, jitter=130, on_frame=na_kadre)

umerli = r.get('умерли на кадрах') or [None, None]
print('итог: победил %s, умерли %s, фигур %s, групп %s'
      % (r.get('победил'), umerli, r.get('фигур'), r.get('групп честных')))
print()

kto = 0 if umerli[0] is not None else (1 if umerli[1] is not None else None)
if kto is None:
    print('никто не умер — смотреть нечего')
else:
    kadr_smerti = umerli[kto]
    print('ПРОИГРАВШИЙ — игрок %d, умер на кадре %d' % (kto + 1, kadr_smerti))
    print()
    print('%-8s %-6s %-8s %-30s %s' % ('кадр', 'макс', 'фигур', 'высоты', 'порча'))
    print('-' * 76)
    for z in istoriya:
        if z['кадр'] < kadr_smerti - 1500:
            continue
        d = z[kto]
        print('%-8d %-6d %-8d %-30s %s'
              % (z['кадр'], d['макс'], d['фигур'], d['высоты'],
                 [x for x in d['порча'] if x] or '—'))
