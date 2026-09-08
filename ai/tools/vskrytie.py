# Вскрытие: что именно происходит в последние секунды перед смертью.
#
# Пять раз подряд я угадывал причину короткого боя и пять раз мимо. Поэтому
# здесь ничего не угадывается: бой гоняется дважды одним и тем же зерном
# (игра детерминирована), первый раз — чтобы найти кадр смерти, второй — чтобы
# в окне перед ней записать каждый ход и снять кадры.
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io
import duel
import train_duel

ОКНО = 1200          # сколько кадров перед смертью разбираем
shots = os.path.join(os.path.dirname(__file__), '..', 'shots', 'smert')


def показать(поле):
    """Поле строками: точка пусто, цифра цвет, решётка стена."""
    строки = []
    for r in range(io.TOTAL):
        s = ''.join('.' if v == 0 else ('#' if v == io.WALL else str(v))
                    for v in поле[r])
        строки.append('%s%+3d %s' % ('~' if r < io.HIDDEN else ' ', r - io.HIDDEN, s))
    return строки


def main():
    боец, гены, _ = train_duel.load()
    jitter = int(sys.argv[1]) if len(sys.argv) > 1 else 130

    # --- проход первый: где умерли ---
    смерть = {}

    def искать(md, f, pilots):
        for имя, a in (('первый', io.P1), ('второй', io.P2)):
            if имя not in смерть and md.rw(a + 0x5C) == 0x1000:
                смерть[имя] = f

    r = duel.run_duel(боец, боец, layers=1, max_frames=400000, genes_a=гены,
                      genes_b=гены, quiet=True, jitter=jitter, on_frame=искать)
    print('бой: %s' % {k: r.get(k) for k in ('победил', 'фигур', 'атак', 'кадров')})
    if not смерть:
        print('никто не умер — разбирать нечего')
        return
    кто = min(смерть, key=смерть.get)
    кадр = смерть[кто]
    p = io.P1 if кто == 'первый' else io.P2
    номер = 0 if кто == 'первый' else 1
    print('первым умер %s на кадре %d' % (кто, кадр))
    print()

    # --- проход второй: подробности в окне перед смертью ---
    os.makedirs(shots, exist_ok=True)
    for f in os.listdir(shots):
        os.remove(os.path.join(shots, f))

    журнал = []
    прошлый = [None]

    def разбирать(md, f, pilots):
        if f < кадр - ОКНО or f > кадр:
            return
        pl = pilots[номер]
        # запись при каждой смене хода
        ключ = (pl.placed, pl.phase)
        if ключ != прошлый[0]:
            прошлый[0] = ключ
            if pl.phase == 'drop':
                поле = io.field(md, p)
                высоты = [io.height(поле, c) for c in range(io.COLS)]
                журнал.append(dict(
                    кадр=f, фигура=pl.placed, цель=pl.col,
                    сейчас=io.piece_col(md, p), дошёл=pl.reached,
                    цвета=io.live_piece(md, p), хочет=pl.want,
                    высоты=высоты, верх=io.stack_top(md, p),
                    слои=io.layers(md, p), шкала=io.attack_gauge(md, p),
                    порча=io.curses(md, p), скорость=md.rl(p + 0x44),
                    поле=[row[:] for row in поле]))
        if (кадр - f) % 120 == 0 and кадр - f <= 720:
            md.render(os.path.join(shots, 'm%05d.png' % f))

    duel.run_duel(боец, боец, layers=1, max_frames=400000, genes_a=гены,
                  genes_b=гены, quiet=True, jitter=jitter, on_frame=разбирать)

    print('последние ходы перед смертью (%s):' % кто)
    print('%7s %7s %5s %5s %6s %-12s %-12s %-22s %4s %5s %6s'
          % ('кадр', 'фигура', 'цель', 'встал', 'дошёл', 'цвета', 'хотел',
             'высоты', 'верх', 'слои', 'скор.'))
    for з in журнал[-14:]:
        print('%7d %7d %5s %5s %6s %-12s %-12s %-22s %4d %5d %6d'
              % (з['кадр'], з['фигура'], з['цель'], з['сейчас'],
                 'да' if з['дошёл'] else 'НЕТ', з['цвета'], з['хочет'],
                 з['высоты'], з['верх'], з['слои'], з['скорость']))
        если_порча = [i for i, t in enumerate(з['порча']) if t]
        if если_порча:
            print('        ↑ активна порча: %s' % если_порча)

    if журнал:
        print()
        print('поле за ход до смерти:')
        for s in показать(журнал[-1]['поле']):
            print('   ' + s)
    print()
    print('кадры в %s' % os.path.abspath(shots))


if __name__ == '__main__':
    main()
