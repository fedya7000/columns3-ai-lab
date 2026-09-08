# Партии на тренажёре: быстро, без эмулятора.
import os
import sys
import time

sys.path.insert(0, os.path.dirname(__file__))
import brain
import rules


def play_game(head, seed=0, max_pieces=1000, depth=2, layers=0):
    """Одна партия. Возвращает (сколько фигур уложено, сколько камней собрано)."""
    field = rules.empty_field(layers)
    dealer = rules.Dealer(seed)
    cur = dealer.piece()
    nxt = dealer.piece()
    placed = 0
    stones_total = 0
    while placed < max_pieces:
        col, rot, score = brain.best_move(field, cur, nxt, head, depth)
        if col is None:
            break
        r = rules.apply(field, col, rot, cur)
        if r is None:
            break
        field, stones, chain, groups = r
        stones_total += stones
        if rules.is_dead(field):
            break
        placed += 1
        cur, nxt = nxt, dealer.piece()
    return placed, stones_total


def evaluate(head, games=8, seed0=0, max_pieces=1000, depth=2):
    """Средняя стойкость по нескольким партиям — оценка для обучения."""
    total = 0
    worst = max_pieces
    for g in range(games):
        n, _ = play_game(head, seed0 + g, max_pieces, depth)
        total += n
        worst = min(worst, n)
    return total / games, worst


if __name__ == '__main__':
    depth = int(sys.argv[1]) if len(sys.argv) > 1 else 2
    games = int(sys.argv[2]) if len(sys.argv) > 2 else 5
    head = brain.Linear()
    t0 = time.time()
    results = []
    for g in range(games):
        n, stones = play_game(head, g, 1000, depth)
        results.append(n)
        print('партия %d: фигур=%4d  камней собрано=%4d' % (g, n, stones))
    dt = time.time() - t0
    print('черновая голова, глубина %d: в среднем %.0f фигур (худшая %d, лучшая %d)'
          % (depth, sum(results) / len(results), min(results), max(results)))
    print('скорость: %.0f фигур/с' % (sum(results) / dt))
