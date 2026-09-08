# Что меняется в структуре игрока, когда крутишь золотую фигуру.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io, brain as brains, play_rom

md = session.new(); session.boot_vs(md); io.fix_empty_slots(md)
h1 = io.Hands(md, 0, io.P1); h2 = io.Hands(md, 1, io.P2); head = brains.Linear()
io.wait_ready(md, io.P1)


def dump():
    return bytearray(md.uc.mem_read(io.P1, 0x200))


def diff(a, b, skip=()):
    out = []
    for i in range(len(a)):
        if a[i] != b[i] and i not in skip:
            out.append('+0x%02X: %02X->%02X' % (i, a[i], b[i]))
    return out


for i in range(60):
    live = (md.rw(io.P1 + 0x100), md.rw(io.P1 + 0x120), md.rw(io.P1 + 0x140))
    if any((v & 0xFF) >= 7 for v in live):
        print('золотая поймана на ходу %d' % i)
        break
    play_rom.one_move(md, h1, io.P1, head, 1)
    if io.piece_ready(md, io.P2):
        play_rom.one_move(md, h2, io.P2, head, 1)
    play_rom.wait_stable(md, io.P1)

md.wb(io.P1 + 0x8B, 1)      # ← включаем особую обработку золотой фигуры
print('флаг +0x8B включён')
print('--- холостой такт (без кнопок), чтобы отделить шум ---')
a = dump()
for _ in range(4):
    md.step_frame()
b = dump()
noise = set(int(x.split(':')[0][3:], 16) for x in diff(a, b))
print('   шумят:', ' '.join('+0x%02X' % i for i in sorted(noise)) or 'ничего')

for k in range(3):
    a = dump()
    h1.tap('b')
    b = dump()
    print('поворот %d: %s' % (k + 1, ', '.join(diff(a, b, noise)) or 'ничего не изменилось'))

print('--- роняем ---')
a = dump()
before = sum(1 for r in io.field(md, io.P1) for v in r if 0 < v < 0xFF)
bef2 = sum(1 for r in io.field(md, io.P2) for v in r if 0 < v < 0xFF)
h1.slam()
for _ in range(200):
    md.step_frame()
after = sum(1 for r in io.field(md, io.P1) for v in r if 0 < v < 0xFF)
aft2 = sum(1 for r in io.field(md, io.P2) for v in r if 0 < v < 0xFF)
print('   своих камней %d -> %d, у соперника %d -> %d' % (before, after, bef2, aft2))
print('   свой потолок %d, врага %d' % (md.rw(io.P1 + 0x7E), md.rw(io.P2 + 0x7E)))
