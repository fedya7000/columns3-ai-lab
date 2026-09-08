# Золотая фигура: три варианта, решает НИЖНИЙ сегмент, эффект — в момент касания.
#   значение 7 -> дать сопернику слои     ($00D790)
#   значение 8 -> убрать ВСЕ камни цвета, которого коснулась ($00D74C)
#   значение 9 -> убрать слои себе        ($00D7C4)
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io, brain as brains, play_rom


def colors(md, p):
    f = io.field(md, p)
    c = {}
    for r in f:
        for v in r:
            if 0 < v < 0xFF:
                c[v] = c.get(v, 0) + 1
    return c


md = session.new(); session.boot_vs(md); io.fix_empty_slots(md)
h1 = io.Hands(md, 0, io.P1); h2 = io.Hands(md, 1, io.P2); head = brains.Linear()
io.wait_ready(md, io.P1)
for i in range(60):
    live = (md.rw(io.P1 + 0x100), md.rw(io.P1 + 0x120), md.rw(io.P1 + 0x140))
    if any((v & 0xFF) >= 7 for v in live):
        break
    play_rom.one_move(md, h1, io.P1, head, 1)
    if io.piece_ready(md, io.P2):
        play_rom.one_move(md, h2, io.P2, head, 1)
    play_rom.wait_stable(md, io.P1)

print('золотая поймана: %04X %04X %04X' % live)
print('ждём, пока она станет управляемой...')
for k in range(90):
    md.step_frame()
    if md.rw(io.P1 + 0x76) == 0:
        break
c0 = io.piece_col(md, io.P1)
h1.tap('right')
c1 = io.piece_col(md, io.P1)
print('   проверка управления: колонка %d -> %d %s' % (c0, c1, '(слушается)' if c1 != c0 else '(НЕ слушается)'))
for k in range(3):
    h1.tap('b')
    print('   поворот %d: %04X %04X %04X'
          % (k + 1, md.rw(io.P1 + 0x100), md.rw(io.P1 + 0x120), md.rw(io.P1 + 0x140)))

low = md.rw(io.P1 + 0x140) & 0xFF
print('нижний сегмент = %d' % low)
a1, a2 = colors(md, io.P1), colors(md, io.P2)
p1, p2 = md.rw(io.P1 + 0x7E), md.rw(io.P2 + 0x7E)
q1, q2 = md.rw(io.P1 + 0x78), md.rw(io.P2 + 0x78)
h1.slam()
for _ in range(240):
    md.step_frame()
b1, b2 = colors(md, io.P1), colors(md, io.P2)
print('роняем:')
print('   свои камни по цветам:      %s -> %s' % (sorted(a1.items()), sorted(b1.items())))
print('   камни соперника по цветам: %s -> %s' % (sorted(a2.items()), sorted(b2.items())))
print('   слои: свои %d->%d (копится %d->%d), врага %d->%d (копится %d->%d)'
      % (p1, md.rw(io.P1 + 0x7E), q1, md.rw(io.P1 + 0x78),
         p2, md.rw(io.P2 + 0x7E), q2, md.rw(io.P2 + 0x78)))
