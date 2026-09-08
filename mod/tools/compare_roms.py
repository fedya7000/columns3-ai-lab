# Гоняет ДВА ROM одинаковым ботом и сравнивает числа игроков.
# Так проверяется, что правка (а) не сломала запуск, (б) дала ожидаемый эффект.
#
# python compare_roms.py <rom_A> <rom_B> [кадров]
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import run_match, P1, P2

A, B = sys.argv[1], sys.argv[2]
FRAMES = int(sys.argv[3]) if len(sys.argv) > 3 else 4000


def go(rom, tag):
    md = session.new(rom)
    session.boot_vs(md)
    if md.stopped:
        print(f"[{tag}] НЕ ЗАПУСТИЛСЯ: {md.log[-1] if md.log else '?'}")
        return None
    snaps = []

    def tick(m, i):
        if (i + 1) % 500 == 0:
            snaps.append((i + 1, m.rw(P1 + 0x5A), m.rw(P1 + 0x5C), m.rw(P1 + 0x8C),
                          m.rw(P2 + 0x5A), m.rw(P2 + 0x5C)))

    run_match(md, FRAMES, tick, seed=3)
    shot = os.path.join(os.path.dirname(__file__), '..', 'shots', f'cmp_{tag}.png')
    md.render(shot)
    print(f"[{tag}] режим на выходе={md.rw(0xFF0406):04X}, снимок {os.path.basename(shot)}")
    return snaps


sa = go(A, 'A')
sb = go(B, 'B')
if sa and sb:
    print("\nкадр |  A: 5A  5C  8C  | B: 5A  5C  8C")
    for x, y in zip(sa, sb):
        print(f"{x[0]:5} |   {x[1]:4}{x[2]:4}{x[3]:4}  |  {y[1]:4}{y[2]:4}{y[3]:4}")
