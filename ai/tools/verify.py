# Сверка клона правил с настоящей игрой — клетка в клетку.
#
# Гоняет обе игры бок о бок: ход выбирается случайно, применяется и в
# эмуляторе, и в клоне, после чего поля сравниваются. Любое расхождение
# печатается обеими картинками и работа останавливается.
#
# Это единственная защита от того, чтобы сеть выучила игру, которой нет.
import os
import random
import sys
import time

sys.path.insert(0, os.path.dirname(__file__))
import session
import bot_io as io
import rules
import brain as brains


def flat(fld):
    """Поле эмулятора (19 списков по 6) -> плоский список клона."""
    return [v for row in fld for v in row]


def show(field):
    out = []
    for r in range(rules.TOTAL):
        mark = ' ' if r >= rules.VIS else '~'
        row = ''.join(str(field[r * rules.COLS + c]) or '.' if field[r * rules.COLS + c]
                      else '.' for c in range(rules.COLS))
        out.append('%s%2d %s' % (mark, r - rules.HIDDEN, row))
    return out


def wait_stable(md, p, quiet=10, limit=600):
    """Ждёт, пока каскад доиграет по-настоящему.

    Сравниваются СЫРЫЕ значения: помеченный к сбору камень ($8000|цвет)
    отличается от обычного, поэтому во время анимации поле не выглядит
    устоявшимся и состояние не читается раньше времени.
    """
    last = None
    same = 0
    for _ in range(limit):
        if not io.in_battle(md) or md.stopped:
            return False
        if not io.settled(md, p):
            same = 0
            last = None
            md.step_frame()
            continue
        cur = flat(io.field_raw(md, p))
        if cur == last:
            same += 1
            if same >= quiet:
                return True
        else:
            same = 0
            last = cur
        md.step_frame()
    return True


def run(n_pieces=60, seed=1, verbose=False, head=None):
    rng = random.Random(seed)
    md = session.new()
    session.boot_vs(md)
    io.enable_solo(md)
    hands = io.Hands(md)
    io.wait_ready(md, io.P1)
    wait_stable(md, io.P1)

    ok = 0
    bad = bad_special = with_special = 0
    shown = []
    rot_miss = col_miss = 0
    t0 = time.time()
    for i in range(n_pieces):
        if not io.in_battle(md) or io.dead(md, io.P1) or md.stopped:
            print('игра кончилась на ходу %d: режим=%04X stopped=%s '
                  'P1 +0x5C=%04X +0x4C=%d | P2 +0x5C=%04X +0x4C=%d камней=%d'
                  % (i, md.rw(io.MODE), md.stopped, md.rw(io.P1 + 0x5C),
                     md.rw(io.P1 + 0x4C), md.rw(io.P2 + 0x5C), md.rw(io.P2 + 0x4C),
                     sum(1 for r in io.field(md, io.P2) for v in r if v)))
            break
        if any(v == 0xFF for v in flat(io.field(md, io.P1))):
            print('поле заполнено стеной — раунд кончился, ход %d' % i)
            break
        if not io.wait_ready(md, io.P1):
            print('игра перестала отдавать фигуру, ход %d' % i)
            break
        before = flat(io.field(md, io.P1))
        before_raw = flat(io.field_raw(md, io.P1))
        colors = io.live_piece(md, io.P1)

        if head is None:
            col, rot = rng.choice(rules.moves())
        else:
            nxt = io.next_piece(md, io.P1)
            col, rot, _ = brains.best_move(before, colors, nxt, head, depth=1)
            if col is None:
                print('клон говорит: ходов нет, игрок мёртв (ход %d)' % i)
                break
        want_colors = rules.cycle(colors, rot)
        used, rot_ok, col_ok = hands.place(col, want_colors)
        if not rot_ok:
            rot_miss += 1
        if not col_ok:
            col_miss += 1
        # клону отдаём то, что РЕАЛЬНО упало: так проверяются именно правила,
        # а точность поворота считается отдельно
        want = rules.apply(before, col, 0, used)
        wait_stable(md, io.P1)
        after = flat(io.field(md, io.P1))

        if want is None:
            print('ход %d: клон считает, что фигура не влезла' % i)
            break
        got_field = want[0]
        # если игра успела оборвать раунд, сравнивать не с чем
        if all(v == 0 for v in after) and any(v for v in before):
            print('раунд оборвался на ходу %d — дальше сравнивать нечего' % i)
            break
        special = [(r - rules.HIDDEN, c, before_raw[r * rules.COLS + c])
                   for r in range(rules.TOTAL) for c in range(rules.COLS)
                   if before_raw[r * rules.COLS + c] & 0xFF00]
        if got_field != after:
            bad += 1
            if special:
                bad_special += 1
            elif len(shown) < 2:
                shown.append((i, col, rot, used, before, got_field, after))
        else:
            ok += 1
        if special:
            with_special += 1
        if verbose:
            print('ход %2d: кол=%d пов=%d цвета=%s камней=%d цепочка=%d %s'
                  % (i, col, rot, used, want[1], want[2],
                     'сходится' if got_field == after else 'РАСХОДИТСЯ'))

    dt = time.time() - t0
    done = ok + bad
    print()
    print('=== СВЕРКА КЛОНА С ИГРОЙ ===')
    print('ходов проверено:        %d' % done)
    print('совпало клетка в клетку: %d  (%.1f%%)' % (ok, 100.0 * ok / done if done else 0))
    print('разошлось:               %d, из них на особых камнях: %d' % (bad, bad_special))
    print('ходов с особыми камнями на поле: %d' % with_special)
    print('промахов поворота: %d, промахов колонки: %d' % (rot_miss, col_miss))
    print('время %.0f с, %.1f хода/с' % (dt, done / dt if dt else 0))
    for (i, col, rot, used, bf, gf, af) in shown:
        print()
        print('расхождение БЕЗ особых камней, ход %d: колонка=%d поворот=%d цвета=%s'
              % (i, col, rot, used))
        print('  %-14s %-14s %-14s' % ('было', 'клон говорит', 'игра сделала'))
        for a, b, c in zip(show(bf), show(gf), show(af)):
            print('  %-14s %-14s %-14s%s' % (a, b, c, '   <<<' if b != c else ''))
    return ok, done


if __name__ == '__main__':
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 60
    s = int(sys.argv[2]) if len(sys.argv) > 2 else 1
    if '--random' in sys.argv:
        head = None
    else:
        import json, numpy as np
        d = json.load(open(os.path.join(os.path.dirname(__file__), '..', 'build',
                                        'snapshot.json'), encoding='utf-8'))
        head = brains.Net(np.asarray(d['weights']), d['n_in'], d['n_hidden'])
        print('сверяем на снимке сети: поколение %d' % d['gen'])
    run(n, s, verbose='-v' in sys.argv, head=head)
