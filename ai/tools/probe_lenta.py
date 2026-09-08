# Записываем ленту фигур из настоящей игры и проигрываем её на тренажёре
# той же сетью. Если тренажёр на ЭТОЙ ленте тоже умирает — виновата раздача.
# Если живёт — значит расходятся не правила и не руки, а что-то ещё.
import os, sys, json
sys.path.insert(0, os.path.dirname(__file__))
import numpy as np
import brain, duel, rules, bot_io as io

d = json.load(open(os.path.join(os.path.dirname(__file__), '..', 'build', 'snapshot.json'),
                   encoding='utf-8'))
боец = brain.Net(np.asarray(d['weights']), d['n_in'], d['n_hidden'])
мир = [0] * duel.N_GENES
мир[11] = -9

лента = []
прошлое = [None]


def писать(md, f, pilots):
    c = io.live_piece(md, io.P1)
    if all(1 <= x <= 6 for x in c) and c != прошлое[0]:
        лента.append(c)
        прошлое[0] = c


r = duel.run_duel(боец, боец, layers=0, max_frames=400000, genes_a=мир, genes_b=мир,
                  quiet=True, jitter=130, on_frame=писать)
print('в игре уложено: %s, записано фигур в ленте: %d' % (r.get('фигур'), len(лента)))

поле = rules.empty_field(0)
n = 0
for i, cur in enumerate(лента):
    nxt = лента[i + 1] if i + 1 < len(лента) else None
    col, rot, _ = brain.best_move(поле, cur, nxt, боец, 1)
    if col is None:
        print('на тренажёре ходов нет на фигуре %d' % n); break
    res = rules.apply(поле, col, rot, cur)
    if res is None:
        print('на тренажёре фигура не влезла на %d' % n); break
    поле = res[0]
    if rules.is_dead(поле):
        print('на тренажёре ЗАВАЛИЛСЯ на фигуре %d' % n); break
    n += 1
else:
    print('на тренажёре прошёл всю ленту: %d фигур, живой' % n)
    print('высоты в конце: %s' % [sum(1 for r2 in range(rules.TOTAL)
                                      if поле[r2 * rules.COLS + c]) for c in range(rules.COLS)])
