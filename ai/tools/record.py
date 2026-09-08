# Съёмка: обученная сеть играет в НАСТОЯЩЕМ ПЗУ, кадры сохраняются в shots\.
import os, sys, time
sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io, play_rom, train, brain

pieces = int(sys.argv[1]) if len(sys.argv) > 1 else 300
every = int(sys.argv[2]) if len(sys.argv) > 2 else 25
head = brain.Linear() if '--черновик' in sys.argv else train.load()[0]
shots = os.path.join(os.path.dirname(__file__), '..', 'shots')
os.makedirs(shots, exist_ok=True)


def snap(md, n):
    if n % every == 0:
        md.render(os.path.join(shots, 'igra_%05d.png' % n))
        f1 = io.field(md, io.P1)
        print('  фигур=%4d  высоты=%s  групп=%d'
              % (n, [io.height(f1, c) for c in range(6)], io.groups(md, io.P1)))


t0 = time.time()
placed, groups, why = play_rom.play(head, partner=None, max_pieces=pieces, on_move=snap)
print('уложено фигур: %d, собрано групп: %d — %s (%.0f с)'
      % (placed, groups, why, time.time() - t0))
print('кадры в %s' % os.path.abspath(shots))
