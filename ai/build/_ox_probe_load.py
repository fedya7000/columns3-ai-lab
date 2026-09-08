import os, sys
sys.path.insert(0, 'tools')
import numpy as np
import brain, rules, train_duel

net, genes, meta = train_duel.load()
print('loaded: n_in=%d n_hidden=%d len(w)=%d' % (net.n_in, net.n_hidden, len(net.w)))
field = [0] * (rules.TOTAL * rules.COLS)
f = brain.extract(field, 0, 0, 0)
v = net.value(f)
print('net.value OK: %.4f' % v)
col, rot, val = brain.best_move(field, (1, 2, 3), None, net, depth=1)
print('best_move OK:', col, rot, round(val, 3))

# оценка поля с башней против ровного поля должна ПАДАТЬ
def pole(hs):
    f = [0] * (rules.TOTAL * rules.COLS)
    for c in range(rules.COLS):
        for k in range(hs[c]):
            f[(rules.TOTAL - 1 - k) * rules.COLS + c] = (c % 6) + 1
    return f

ровное = brain.extract(pole([3, 2, 3, 2, 3, 2]), 0, 0, 0)
башня = brain.extract(pole([10, 0, 1, 1, 1, 1]), 0, 0, 0)
print('оценка ровного поля %.3f > оценка башни %.3f -> %s'
      % (net.value(ровное), net.value(башня),
         net.value(ровное) > net.value(башня)))
