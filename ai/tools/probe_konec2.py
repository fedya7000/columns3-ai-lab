# Чем кончается мирный бой: смертью, обрывом игры или упором в предел?
import os, sys, json
sys.path.insert(0, os.path.dirname(__file__))
import numpy as np
import brain, duel, rules, bot_io as io

d = json.load(open(os.path.join(os.path.dirname(__file__), '..', 'build', 'snapshot.json'),
                   encoding='utf-8'))
боец = brain.Net(np.asarray(d['weights']), d['n_in'], d['n_hidden'])
мир = [0] * duel.N_GENES
мир[11] = -9

for j in (17, 60, 130):
    хвост = []

    def смотреть(md, f, pilots):
        хвост.append((f, md.rw(io.MODE), pilots[0].placed, pilots[1].placed,
                      io.stack_top(md, io.P1), io.stack_top(md, io.P2)))
        if len(хвост) > 3:
            хвост.pop(0)

    r = duel.run_duel(боец, боец, layers=0, max_frames=200000, genes_a=мир,
                      genes_b=мир, quiet=True, jitter=j, on_frame=смотреть)
    f, режим, п1, п2, в1, в2 = хвост[-1]
    print('зерно %3d: фигур %s, кадров %d, победил %s, умерли %s'
          % (j, r.get('фигур'), r.get('кадров'), r.get('победил'), r.get('умерли на кадрах')))
    print('           в конце: режим=%04X, верх стопок %d и %d %s'
          % (режим, в1, в2, '| ОШИБКА: %s' % r['ошибка'] if 'ошибка' in r else ''))
