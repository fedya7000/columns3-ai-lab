# Какое чтение поля вернее: сырое, с гравитацией, или с досчётом каскада?
import os, sys, json
sys.path.insert(0, os.path.dirname(__file__))
import numpy as np
import brain, rules, session, bot_io as io, play_rom

d = json.load(open(os.path.join(os.path.dirname(__file__), '..', 'build', 'snapshot.json'),
                   encoding='utf-8'))
боец = brain.Net(np.asarray(d['weights']), d['n_in'], d['n_hidden'])


def прогон(способ, предел=400):
    md = session.new(); session.boot_vs(md); io.enable_solo(md)
    h = io.Hands(md, 0, io.P1)
    io.wait_ready(md, io.P1); play_rom.wait_stable(md, io.P1)
    n = 0
    for _ in range(предел):
        if md.stopped or not io.in_battle(md):
            return n, 'раунд оборвался'
        if not io.wait_ready(md, io.P1):
            return n, 'нет фигуры'
        if способ == 'сырое':
            поле = [v for row in io.field(md, io.P1) for v in row]
        elif способ == 'сырое+гравитация':
            поле = [v for row in io.field(md, io.P1) for v in row]
            rules.gravity(поле)
        elif способ == 'предсказанное':
            поле = io.field_predicted(md, io.P1)
            rules.gravity(поле)
        else:
            поле = io.field_predicted(md, io.P1)
            rules.gravity(поле); rules.resolve(поле)
        if rules.is_dead(поле):
            return n, 'завалился'
        cur = io.live_piece(md, io.P1)
        nxt = io.next_piece(md, io.P1)
        if not all(1 <= c <= 6 for c in nxt):
            nxt = None
        col, rot, _ = brain.best_move(поле, cur, nxt, боец, 1)
        if col is None:
            return n, 'ходов нет'
        h.place(col, rules.cycle(cur, rot))
        play_rom.wait_stable(md, io.P1)
        n += 1
    return n, 'дошёл до предела'


for способ in ('сырое', 'сырое+гравитация', 'предсказанное', 'предсказанное+каскад'):
    n, почему = прогон(способ)
    print('%-24s %4d фигур — %s' % (способ, n, почему))
