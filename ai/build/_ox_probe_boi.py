import os, sys, time
sys.path.insert(0, 'tools')
import bot_io as io, duel, train_duel

net, genes, meta = train_duel.load()
print('гены:', [round(g, 2) for g in genes])
t0 = time.time()
r = duel.run_duel(net, net, layers=3, max_frames=9000,
                  genes_a=genes, genes_b=genes, quiet=True, jitter=41)
print({k: r.get(k) for k in ('победил', 'умерли на кадрах', 'фигур', 'атак',
                             'комбо3+', 'слоёв', 'режим', 'кадров')})
print('время %.0f с' % (time.time() - t0))
