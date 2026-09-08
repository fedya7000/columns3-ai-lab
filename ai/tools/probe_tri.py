# Ловим ровно то, что видно на скриншоте: под камнем ТРИ пустых клетки подряд.
# И печатаем их сырые значения плюс снимаем сам кадр.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io, duel, train, train_duel

боец, _ = train.load()
_, гены, _ = train_duel.load()
поймано = []
shots = os.path.join(os.path.dirname(__file__), '..', 'shots')


def найти(поле):
    """Столбик, где под камнем идут 3+ пустых клетки подряд."""
    for c in range(io.COLS):
        видел = False
        подряд = 0
        начало = None
        for r in range(io.TOTAL):
            v = поле[r][c]
            if 0 < v < io.WALL:
                if подряд >= 3:
                    return начало, c, подряд
                видел = True
                подряд = 0
                начало = None
            elif v == 0 and видел:
                if подряд == 0:
                    начало = r
                подряд += 1
        if подряд >= 3 and видел:
            return начало, c, подряд
    return None


def смотреть(md, f, pilots):
    if поймано:
        return
    for i, p in enumerate((io.P1, io.P2)):
        н = найти(io.field(md, p))
        if н:
            r0, c, n = н
            поймано.append((f, i, r0, c, n, [row[:] for row in io.field_raw(md, p)]))
            md.render(os.path.join(shots, 'tri_pustyh.png'))
            return


r = duel.run_duel(боец, боец, layers=0, max_frames=60000, genes_a=гены,
                  genes_b=гены, quiet=True, jitter=41, on_frame=смотреть)
if not поймано:
    print('такого не встретилось')
else:
    f, i, r0, c, n, поле = поймано[0]
    print('кадр %d, игрок %d: колонка %d, %d пустых клеток подряд с ряда %+d'
          % (f, i + 1, c, n, r0 - io.HIDDEN))
    print()
    print('что в этой колонке НА САМОМ ДЕЛЕ (сырьё, с флагами):')
    for r2 in range(io.TOTAL):
        v = поле[r2][c]
        метка = ''
        if r0 <= r2 < r0 + n:
            метка = '   ← «пустая» клетка'
        if v & 0x8000:
            метка += '  [помечен к сбору]'
        print('   ряд %+3d: %04X%s' % (r2 - io.HIDDEN, v, метка))
