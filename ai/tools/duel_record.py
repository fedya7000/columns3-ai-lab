# Снимаем поединок: кадры в shots\duel\.
import os, sys, time
sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io, duel, train

frames = int(sys.argv[1]) if len(sys.argv) > 1 else 12000
every = int(sys.argv[2]) if len(sys.argv) > 2 else 900
shots = os.path.join(os.path.dirname(__file__), '..', 'shots', 'duel')
os.makedirs(shots, exist_ok=True)
for f in os.listdir(shots):
    os.remove(os.path.join(shots, f))

head, meta = train.load()
print('сеть: поколение %d' % meta['gen'])


def snap(md, f, pilots):
    if f % every == 0:
        md.render(os.path.join(shots, 'd%05d.png' % f))
        print('кадр %5d | фигур %3d:%-3d | шкала %2d:%-2d | слои %2d:%-2d | атак %d:%d'
              % (f, pilots[0].placed, pilots[1].placed,
                 io.attack_gauge(md, io.P1), io.attack_gauge(md, io.P2),
                 io.layers(md, io.P1), io.layers(md, io.P2),
                 pilots[0].attacks, pilots[1].attacks))


t0 = time.time()
r = duel.run_duel(head, head, layers=3, max_frames=frames, on_frame=snap, quiet=True)
print(r)
print('время %.0f с, кадры в %s' % (time.time() - t0, os.path.abspath(shots)))
