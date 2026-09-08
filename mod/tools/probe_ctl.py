# Сопоставление +0x60/62/64 с тем, что реально ложится в поле, и действие CYCLE.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session

P = 0xFF1000
ROW = 16


def cur(md):
    return (md.rw(P + 0x60), md.rw(P + 0x62), md.rw(P + 0x64))


def snap(md):
    base = md.rl(P + 6)
    return [[md.rw(base + r * ROW + c * 2) for c in range(6)] for r in range(-2, 13)]


def diff(a, b):
    """новые занятые клетки: (ряд, колонка, значение) сверху вниз"""
    out = []
    for r in range(len(a)):
        for c in range(6):
            if a[r][c] == 0 and b[r][c] != 0:
                out.append((r - 2, c, b[r][c]))
    return out


md = session.new()
session.boot_vs(md)
for _ in range(200):
    md.step_frame()

prev_n = md.rw(P + 0x70)
pending = None          # (номер, цвета при появлении, поле до)
CYCLES = {6: 1, 7: 2, 8: 3, 9: 4}   # на этих фигурах жмём CYCLE столько раз
done = 0
i = 0
while done < 8 and i < 4000:
    n = md.rw(P + 0x70)
    if pending and pending[0] == n and pending[3] > 0 and i - pending[4] > 6:
        for _ in range(pending[3]):
            md.press(0, 'b'); md.step_frame(); md.step_frame()
            md.release(0); md.step_frame(); md.step_frame()
        pending = (pending[0], pending[1], pending[2], 0, pending[4])
    md.step_frame(); i += 1
    n = md.rw(P + 0x70)
    if n != prev_n:
        if pending:
            new = diff(pending[2], snap(md))
            print('фигура %d: цвета при появлении=%s  CYCLE x%d -> в поле сверху вниз: %s'
                  % (pending[0], pending[1], CYCLES.get(pending[0], 0),
                     [v & 0xFF for _, _, v in new]))
            done += 1
        prev_n = n
        pending = (n, cur(md), snap(md), CYCLES.get(n, 0), i)
