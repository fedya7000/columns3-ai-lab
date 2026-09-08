# Стенд: меряем ОДНУ И ТУ ЖЕ сеть в разных обвязках, по нескольку прогонов.
#
# Зачем: одиночные замеры в этой игре скачут в разы (раздача решает многое),
# и на них легко принять шум за улучшение. Здесь каждый вариант гоняется
# несколько раз и печатается среднее с разбросом.
#
# Сравниваем три вещи, чтобы понять, где теряются фигуры:
#   одиночка через Hands — старая обвязка, ходит по очереди и ждёт покоя;
#   одиночка через Pilot — тот же режим, но покадровый пилот из боя;
#   мирный бой           — два пилота, атаки запрещены.
# Если Pilot в одиночке хуже Hands — виноват пилот. Если одинаково, а бой всё
# равно короче — виноват соперник, то есть сама игра.
import os
import sys
import time

sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io
import duel
import play_rom
import rules
import session
import train


def одиночка_hands(боец, зерно, предел=600):
    md = session.new()
    session.boot_vs(md)
    io.enable_solo(md)
    h = io.Hands(md, 0, io.P1)
    io.wait_ready(md, io.P1)
    play_rom.wait_stable(md, io.P1)
    n = 0
    for _ in range(предел):
        if md.stopped or not io.in_battle(md):
            break
        if rules.is_dead(io.field_predicted(md, io.P1)):
            break
        if not play_rom.one_move(md, h, io.P1, боец, 1):
            break
        play_rom.wait_stable(md, io.P1)
        n += 1
    return n


def одиночка_pilot(боец, зерно, предел=600, ждать=False, вместе=True, hold=2, gap=1):
    """Тот же одиночный режим, но ведёт покадровый пилот из боя."""
    md = session.new()
    session.boot_vs(md)
    io.enable_solo(md)
    pl = duel.Pilot(md, 0, io.P1, боец, genes=duel.DEFAULT_GENES, ждать=ждать,
                    вместе=вместе, hold=hold, gap=gap)
    io.wait_ready(md, io.P1)
    подряд = 0
    for f in range(предел * 200):
        if md.stopped or not io.in_battle(md):
            break
        if f % 4 == 0:
            поле = io.field(md, io.P1)
            достала = any(0 < поле[rules.DEAD_ROW][c] < io.WALL for c in range(io.COLS))
            подряд = подряд + 4 if достала else 0
            if подряд >= 120:
                break
        if pl.placed >= предел:
            break
        io.fix_empty_slots(md)
        pl.tick()
        md.step_frame()
    return pl.placed


def мирный_бой(боец, зерно, предел=600):
    мир = [0] * duel.N_GENES
    мир[11] = -9
    r = duel.run_duel(боец, боец, layers=0, max_frames=предел * 200,
                      genes_a=мир, genes_b=мир, quiet=True, jitter=зерно)
    ф = r.get('фигур', [0, 0])
    return sum(ф) / 2.0


ВАРИАНТЫ = [
    ('Hands (уровень заморожен)', одиночка_hands),
    ('Pilot (уровень заморожен)', одиночка_pilot),
]


def main():
    прогонов = int(sys.argv[1]) if len(sys.argv) > 1 else 3
    боец, м = train.load()
    print('сеть: поколение %d, стойкость на обучении %.0f'
          % (м.get('gen', -1), м.get('fitness', 0)))
    print()
    print('%-20s %8s %8s %8s %8s' % ('обвязка', 'среднее', 'худший', 'лучший', 'секунд'))
    for имя, фн in ВАРИАНТЫ:
        t0 = time.time()
        рез = [фн(боец, 17 + 43 * i) for i in range(прогонов)]
        print('%-20s %8.0f %8.0f %8.0f %8.0f'
              % (имя, sum(рез) / len(рез), min(рез), max(рез), time.time() - t0))


if __name__ == '__main__':
    main()
