# Заходим в бой СО СЛОЯМИ и проверяем золотую фигуру.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io, brain as brains, play_rom

shots = os.path.join(os.path.dirname(__file__), '..', 'shots')


def tap(md, port, *b, hold=4, gap=6):
    md.press(port, *b)
    for _ in range(hold):
        md.step_frame()
    md.release(port)
    for _ in range(gap):
        md.step_frame()


def wait(md, n):
    for _ in range(n):
        md.step_frame()


md = session.new()
wait(md, 300)
tap(md, 0, 'start'); wait(md, 60)
tap(md, 0, 'start'); wait(md, 120)
tap(md, 0, 'right'); wait(md, 20)
tap(md, 0, 'start'); wait(md, 120)
for _ in range(3):
    tap(md, 0, 'down'); wait(md, 10)
tap(md, 0, 'start'); wait(md, 120)          # CONFIGURATION
for _ in range(3):
    tap(md, 0, 'a'); wait(md, 8)            # LAYERS 1P = 3
tap(md, 0, 'right'); wait(md, 10)           # перейти к 2P
for _ in range(3):
    tap(md, 0, 'a'); wait(md, 8)
md.render(os.path.join(shots, 'layers_set.png'))
print('в настройках: $FF0460=%d $FF0461=%d' % (md.rb(0xFF0460), md.rb(0xFF0461)))
tap(md, 0, 'start'); wait(md, 90)
print('после START: режим=%04X' % md.rw(io.MODE))
md.render(os.path.join(shots, 'layers_next.png'))
tap(md, 0, 'start'); wait(md, 150)
tap(md, 1, 'start'); wait(md, 120)
tap(md, 0, 'start'); wait(md, 120)
print('в бою? режим=%04X  $FF0444=%d  слои игрока +7E=%d/%d'
      % (md.rw(io.MODE), md.rb(0xFF0444), md.rw(io.P1 + 0x7E), md.rw(io.P2 + 0x7E)))
md.render(os.path.join(shots, 'layers_battle.png'))

print()
print('--- доводим до боя ---')
tap(md, 0, 'start'); wait(md, 150)      # BEST OF 3
tap(md, 0, 'start'); wait(md, 150)
tap(md, 1, 'start'); wait(md, 120)
tap(md, 0, 'start'); wait(md, 150)
print('режим=%04X  слои +7E: P1=%d P2=%d' % (md.rw(io.MODE), md.rw(io.P1 + 0x7E), md.rw(io.P2 + 0x7E)))
md.render(os.path.join(shots, 'layers_battle.png'))
if md.rw(io.MODE) == 0x20:
    io.fix_empty_slots(md)
    h1 = io.Hands(md, 0, io.P1); h2 = io.Hands(md, 1, io.P2); head = brains.Linear()
    io.wait_ready(md, io.P1)
    for i in range(70):
        live = (md.rw(io.P1 + 0x100), md.rw(io.P1 + 0x120), md.rw(io.P1 + 0x140))
        if any((v & 0xFF) >= 7 for v in live):
            print('ЗОЛОТАЯ на ходу %d: %04X %04X %04X' % (i, *live))
            wait(md, 40)
            c0 = io.piece_col(md, io.P1)
            h1.tap('right')
            print('   управление: колонка %d -> %d' % (c0, io.piece_col(md, io.P1)))
            for k in range(3):
                h1.tap('b')
                print('   поворот %d: %04X %04X %04X'
                      % (k + 1, md.rw(io.P1 + 0x100), md.rw(io.P1 + 0x120), md.rw(io.P1 + 0x140)))
            md.render(os.path.join(shots, 'zoloto_sloi.png'))

            def colors(p):
                c = {}
                for row in io.field(md, p):
                    for v in row:
                        if 0 < v < 0xFF:
                            c[v] = c.get(v, 0) + 1
                return dict(sorted(c.items()))

            # доворачиваем так, чтобы ВНИЗУ оказалась восьмёрка
            for _ in range(3):
                if (md.rw(io.P1 + 0x140) & 0xFF) == 8:
                    break
                h1.tap('b')
            low = md.rw(io.P1 + 0x140) & 0xFF
            print('   внизу оказалось: %d' % low)
            a1, a2 = colors(io.P1), colors(io.P2)
            s1, s2 = md.rw(io.P1 + 0x7E), md.rw(io.P2 + 0x7E)
            h1.slam()
            wait(md, 260)
            print('   свои камни:      %s -> %s' % (a1, colors(io.P1)))
            print('   камни соперника: %s -> %s' % (a2, colors(io.P2)))
            print('   слои: свои %d -> %d, врага %d -> %d'
                  % (s1, md.rw(io.P1 + 0x7E), s2, md.rw(io.P2 + 0x7E)))
            md.render(os.path.join(shots, 'zoloto_posle.png'))
            break
        play_rom.one_move(md, h1, io.P1, head, 1)
        if io.piece_ready(md, io.P2):
            play_rom.one_move(md, h2, io.P2, head, 1)
        play_rom.wait_stable(md, io.P1)
    else:
        print('золотая не выпала за 70 ходов')
