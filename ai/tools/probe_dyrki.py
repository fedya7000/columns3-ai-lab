# Бывают ли в поле ДЫРКИ — пустая клетка, над которой лежит камень?
#
# Весь тренажёр построен на допущении, что дырок не бывает: после схлопывания
# гравитация уплотняет столбик. Если допущение неверно, врут и высоты, и
# укладка, и вся оценка поля.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io, duel, train_duel


def дырки(поле):
    """Пустые клетки, над которыми есть камень (стены не в счёт)."""
    найдено = []
    for c in range(io.COLS):
        видел_камень = False
        for r in range(io.TOTAL):
            v = поле[r][c]
            if 0 < v < io.WALL:
                видел_камень = True
            elif v == 0 and видел_камень:
                найдено.append((r - io.HIDDEN, c))
    return найдено


боец, гены, _ = train_duel.load()
всего = устойчивых = 0
примеры = []


def смотреть(md, f, pilots):
    global всего, устойчивых
    for имя, p in (('первый', io.P1), ('второй', io.P2)):
        д = дырки(io.field(md, p))
        if not д:
            continue
        всего += 1
        спокойно = io.settled(md, p)
        if спокойно:
            устойчивых += 1
            if len(примеры) < 3:
                примеры.append((f, имя, д, [row[:] for row in io.field(md, p)]))


r = duel.run_duel(боец, боец, layers=1, max_frames=400000, genes_a=гены,
                  genes_b=гены, quiet=True, jitter=130, on_frame=смотреть)
print('кадров с дырками всего: %d, из них при УСТОЯВШЕМСЯ поле: %d' % (всего, устойчивых))
for f, имя, д, поле in примеры:
    print()
    print('кадр %d, %s игрок, дырки в (ряд, колонка): %s' % (f, имя, д))
    for rr in range(io.TOTAL):
        s = ''.join('.' if v == 0 else ('#' if v == io.WALL else str(v)) for v in поле[rr])
        print('   %+3d %s' % (rr - io.HIDDEN, s))
