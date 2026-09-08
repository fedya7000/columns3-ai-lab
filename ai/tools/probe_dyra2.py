# Ловим ДОЛГУЮ дырку и смотрим, что вокруг неё — с флагами, без масок.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io, duel, train, train_duel

боец, _ = train.load()
_, гены, _ = train_duel.load()
живут = {}
пойманное = []


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
    if пойманное:
        return
    for i, p in enumerate((io.P1, io.P2)):
        for r, c in дырки(io.field(md, p)):
            k = (i, r, c)
            живут[k] = живут.get(k, 0) + 1
            if живут[k] == 150:          # держится две с половиной секунды
                пойманное.append((f, i, r, c, [row[:] for row in io.field_raw(md, p)],
                                  md.rw(p + 0x76), md.rl(p + 6)))


r = duel.run_duel(боец, боец, layers=0, max_frames=60000, genes_a=гены,
                  genes_b=гены, quiet=True, jitter=41, on_frame=смотреть)
if not пойманное:
    print('долгих дырок не поймали')
else:
    f, i, rr, cc, поле, з, база = пойманное[0]
    print('кадр %d, игрок %d, дырка в ряду %+d колонке %d, +0x76=%d, поле=%06X'
          % (f, i + 1, rr - io.HIDDEN, cc, з, база))
    print('поле СЫРЬЁМ (с флагами):')
    for r2 in range(io.TOTAL):
        s = ' '.join('%04X' % v for v in поле[r2])
        метка = ' <<<' if r2 == rr else ''
        print('   %+3d %s%s' % (r2 - io.HIDDEN, s, метка))
