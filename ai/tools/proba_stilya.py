# Ищем склонность к цепочкам, которая НЕ убивает игру.
#
# Комбо строится тем, что игрок НЕ схлопывает сейчас, а копит совпадение,
# которое потом рухнет каскадом. Перекрутишь — перестанет чистить поле и
# завалится. Здесь перебираем несколько настроек и смотрим сразу два числа:
# сколько живёт и сколько цепочек от трёх успевает собрать.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import numpy as np
import brain, rules, train

head, _ = train.load()
LIN = 352 + 16 + 16 + 1
base = np.asarray(head.w, dtype=np.float64)


def проба(mc, ma, ms, games=3, cap=3000):
    w = base.copy()
    w[LIN + 17] *= mc      # длина цепочки
    w[LIN + 20] *= ma      # достраиваемые линии
    w[LIN + 16] *= ms      # собранные камни
    net = brain.Net(w)
    жизнь, комбо3 = [], []
    for g in range(games):
        field = rules.empty_field()
        dealer = rules.Dealer(g)
        cur, nxt = dealer.piece(), dealer.piece()
        n = k = 0
        while n < cap:
            col, rot, _ = brain.best_move(field, cur, nxt, net, 1)
            if col is None:
                break
            r = rules.apply(field, col, rot, cur)
            if r is None:
                break
            field, st, ch, gr = r
            if ch >= 3:
                k += 1
            if rules.is_dead(field):
                break
            n += 1
            cur, nxt = nxt, dealer.piece()
        жизнь.append(n)
        комбо3.append(k)
    return sum(жизнь) / games, sum(комбо3) / games


print('%-28s %10s %12s' % ('настройка', 'фигур', 'комбо 3+ '))
for mc, ma, ms, имя in (
        (1.0, 1.0, 1.0, 'как есть'),
        (2.0, 1.5, 0.8, 'слегка любит цепочки'),
        (3.0, 2.0, 0.6, 'заметно любит'),
        (4.0, 3.0, 0.4, 'сильно любит (было)'),
        (6.0, 4.0, 0.2, 'одержим цепочками'),
        (2.0, 3.0, 0.9, 'копит заготовки')):
    ж, к = проба(mc, ma, ms)
    print('%-28s %10.0f %12.1f' % (имя, ж, к))
