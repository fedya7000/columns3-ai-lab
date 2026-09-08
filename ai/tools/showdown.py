# Сравнение обученной сети с черновой головой на тренажёре.
import os, sys, time
sys.path.insert(0, os.path.dirname(__file__))
import brain, simulate, train

games = int(sys.argv[1]) if len(sys.argv) > 1 else 10
cap = int(sys.argv[2]) if len(sys.argv) > 2 else 30000
depth = int(sys.argv[3]) if len(sys.argv) > 3 else 1

net, meta = train.load()
print('сеть: поколение %d, стойкость на обучении %.0f, планка %d'
      % (meta['gen'], meta['fitness'], meta['cap']))
print('партий: %d, предел %d фигур, глубина перебора %d' % (games, cap, depth))
print()
rows = []
for name, head in (('черновая голова', brain.Linear()), ('сеть', net)):
    t0 = time.time()
    res = [simulate.play_game(head, 1000 + g, cap, depth)[0] for g in range(games)]
    rows.append((name, res, time.time() - t0))
    print('%-16s среднее %7.0f   худшая %6d   лучшая %6d   (%.0f с)'
          % (name, sum(res) / len(res), min(res), max(res), time.time() - t0))
a = sum(rows[0][1]) / games
b = sum(rows[1][1]) / games
print()
print('сеть держится в %.2f раза дольше черновика' % (b / a if a else 0))
print('по партиям:')
for g in range(games):
    print('   зерно %4d: черновик %6d   сеть %6d' % (1000 + g, rows[0][1][g], rows[1][1][g]))
