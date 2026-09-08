# Партия в НАСТОЯЩЕМ ПЗУ: бот играет за первого игрока в эмуляторе.
#
# Одиночного режима в игре нет, поэтому берём бой 1on1 и делаем его безобидным
# самым честным способом: второй игрок ТОЖЕ играет ботом (значит структура
# игрока живая и игра идёт как обычно), а его шкала атаки обнуляется, чтобы
# он не сыпал сопернику мусор. Больше в ОЗУ не правится ничего, ПЗУ не
# трогается вовсе.
import os
import sys
import time

sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io
import brain as brains
import rules
import session


def flat(fld):
    return [v for row in fld for v in row]


def wait_stable(md, p, quiet=10, limit=600):
    """Ждёт, пока каскад доиграет: сырое поле не меняется и нет пометок к сбору."""
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


def calm(md, freeze_level=True):
    """Гасит атаку обоих игроков, чинит буферы пустых слотов, держит уровень.

    Уровень игра поднимает при 20 собранных группах (+0x8C) или 35 уложенных
    фигурах (+0x70) — код $00D314. При этом она ускоряет падение и подсовывает
    служебную фигуру-метку (7,8,9), которая ботом не управляется. Для ровного
    забега уровень держим постоянным.
    """
    orig = md.step_frame

    def keep():
        io.fix_empty_slots(md)
        for p in (io.P1, io.P2):
            md.ww(p + 0x5A, 0)
            md.ww(p + 0x9E, 0)
            if freeze_level:
                md.ww(p + 0x8C, 0)
                if md.rw(p + 0x70) >= 30:
                    md.ww(p + 0x70, 0)

    def step():
        orig()
        keep()

    md.step_frame = step
    keep()
    return md


def one_move(md, hands, p, head, depth=1):
    """Один ход игрока. Возвращает True, если ход состоялся."""
    if not io.wait_ready(md, p):
        return False
    field = io.field_predicted(md, p)
    rules.gravity(field)
    rules.resolve(field)
    cur = io.live_piece(md, p)
    nxt = io.next_piece(md, p)
    col, rot, _ = brains.best_move(field, cur, nxt, head, depth)
    if col is None:
        return False
    hands.place(col, rules.cycle(cur, rot))
    return True


def play(head, partner=None, max_pieces=500, depth=1, on_move=None, quiet=True):
    """Гоняет партию. Возвращает (уложено фигур, собрано групп, почему кончилось)."""
    md = session.new()
    session.boot_vs(md)
    io.enable_solo(md)
    h1 = io.Hands(md, 0, io.P1)
    h2 = io.Hands(md, 1, io.P2)
    io.wait_ready(md, io.P1)
    wait_stable(md, io.P1)

    placed = 0
    for i in range(max_pieces):
        if md.stopped:
            return placed, io.groups(md, io.P1), 'эмулятор сорвался: %s' % (md.log[-1][:60] if md.log else '?')
        if not io.in_battle(md):
            return placed, io.groups(md, io.P1), 'раунд кончился'
        # Смерть определяем ПО ПОЛЮ: стопка достала ряд -2. Метке $1000 в
        # +0x5C верить нельзя — в одиночном режиме игра ставит её и живому.
        if rules.is_dead(flat(io.field(md, io.P1))):
            return placed, io.groups(md, io.P1), 'первый игрок завалился'
        if not one_move(md, h1, io.P1, head, depth):
            return placed, io.groups(md, io.P1), 'ход не состоялся'
        if partner is not None and io.piece_ready(md, io.P2):
            one_move(md, h2, io.P2, partner, 1)
        wait_stable(md, io.P1)
        placed += 1
        if on_move:
            on_move(md, placed)
        if not quiet and placed % 25 == 0:
            f1 = io.field(md, io.P1)
            print('  фигур=%3d  высоты=%s  групп=%d'
                  % (placed, [io.height(f1, c) for c in range(6)], io.groups(md, io.P1)))
    return placed, io.groups(md, io.P1), 'дошли до предела'


if __name__ == '__main__':
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 150
    t0 = time.time()
    placed, groups, why = play(brains.Linear(), max_pieces=n, quiet=False)
    print('уложено фигур: %d, собрано групп: %d — %s (%.0f с)'
          % (placed, groups, why, time.time() - t0))
