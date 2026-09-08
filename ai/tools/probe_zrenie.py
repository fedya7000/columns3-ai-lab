# Совпадает ли то, что бот ВИДИТ в бою, с тем, что должно получаться?
# После каждого хода берём поле, которое бот прочитал в прошлый раз, применяем
# к нему выбранный ход и сравниваем с тем, что бот читает теперь.
import os, sys, json
sys.path.insert(0, os.path.dirname(__file__))
import numpy as np
import brain, duel, rules, session, bot_io as io

d = json.load(open(os.path.join(os.path.dirname(__file__), '..', 'build', 'snapshot.json'),
                   encoding='utf-8'))
боец = brain.Net(np.asarray(d['weights']), d['n_in'], d['n_hidden'])
мир = [0] * duel.N_GENES
мир[11] = -9

md = session.new(); duel.wait(md, 130); duel.boot_duel(md, 0); io.fix_empty_slots(md)
pl = duel.Pilot(md, 0, io.P1, боец, genes=мир, noise=0.0)
p2 = duel.Pilot(md, 1, io.P2, боец, genes=мир, noise=0.0, seed=999)

прошлое = None
сошлось = разошлось = 0
первое = None
исходный = pl._decide


def следить():
    global прошлое, сошлось, разошлось, первое
    было = io.field_predicted(md, io.P1)
    rules.gravity(было)
    rules.resolve(было)
    if прошлое is not None:
        ждали, ход = прошлое
        if ждали == было:
            сошлось += 1
        else:
            разошлось += 1
            if первое is None:
                первое = (ход, ждали, было)
    исходный()
    r = rules.apply(было, pl.col, 0, pl.want)
    прошлое = (r[0], (pl.col, pl.want)) if r else None


pl._decide = следить
for f in range(120000):
    if md.stopped or not io.in_battle(md):
        break
    if pl.placed >= 80:
        break
    io.fix_empty_slots(md)
    pl.tick(); p2.tick()
    md.step_frame()

print('уложено фигур: %d' % pl.placed)
print('поле после хода совпало с ожиданием: %d, разошлось: %d' % (сошлось, разошлось))
if первое:
    ход, ждали, было = первое
    print()
    print('первое расхождение, ход %s:' % (ход,))
    print('%-14s %-14s' % ('ждали', 'увидели'))
    for r2 in range(rules.TOTAL):
        a = ''.join('.' if ждали[r2*6+c]==0 else ('#' if ждали[r2*6+c]==9 else str(ждали[r2*6+c])) for c in range(6))
        b = ''.join('.' if было[r2*6+c]==0 else ('#' if было[r2*6+c]==9 else str(было[r2*6+c])) for c in range(6))
        print('%+3d %-14s %-14s%s' % (r2-6, a, b, '  <<<' if a != b else ''))
