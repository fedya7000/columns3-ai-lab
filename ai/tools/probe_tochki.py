# Дырки: они мимолётные (камень летит) или ОСТАЮТСЯ?
# Меряем не «устоялось ли», а сколько кадров подряд дырка держится
# на одном и том же месте. Кольцевых определений — никаких.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io, duel, train, train_duel

боец, _ = train.load()
_, гены, _ = train_duel.load()
живут = {}          # (игрок, ряд, колонка) -> сколько кадров подряд держится
рекорды = []


def дырки(поле):
    из = []
    for c in range(io.COLS):
        видел = False
        for r in range(io.TOTAL):
            v = поле[r][c]
            if 0 < v < io.WALL:
                видел = True
            elif v == 0 and видел:
                из.append((r, c))
    return из


def смотреть(md, f, pilots):
    сейчас = set()
    for i, p in enumerate((io.P1, io.P2)):
        for r, c in дырки(io.field(md, p)):
            сейчас.add((i, r, c))
    for ключ in сейчас:
        живут[ключ] = живут.get(ключ, 0) + 1
    for ключ in list(живут):
        if ключ not in сейчас:
            рекорды.append(живут.pop(ключ))


r = duel.run_duel(боец, боец, layers=0, max_frames=60000, genes_a=гены,
                  genes_b=гены, quiet=True, jitter=41, on_frame=смотреть)
рекорды += list(живут.values())
рекорды.sort(reverse=True)
print('бой: %s' % {k: r.get(k) for k in ('фигур', 'кадров')})
print('всего дырок появлялось: %d' % len(рекорды))
print('самые долгоживущие (кадров подряд): %s' % рекорды[:12])
долгие = [x for x in рекорды if x > 60]
print('дырок, проживших больше секунды (60 кадров): %d' % len(долгие))
