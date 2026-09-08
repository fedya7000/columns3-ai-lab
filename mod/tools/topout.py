# На какой ВЫСОТЕ игра объявляет проигрыш: снимаем поле в тот кадр,
# когда состояние игрока становится 24 ($18).
# Игрок 1 бездействует — камни валятся в одну колонку и заваливают её.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import P1, P2, ROW, ROWS, field_base

ROM = sys.argv[1] if len(sys.argv) > 1 else os.path.join(
    os.path.dirname(__file__), '..', 'rom', 'Columns III (USA).gen')

md = session.new(ROM)
session.boot_vs(md)
base = field_base(md, P1)
snap = None
for i in range(20000):
    md.release(0)
    md.release(1)
    md.step_frame()
    if md.stopped:
        print("ОСТАНОВ:", md.log[-1].splitlines()[0])
        break
    st = md.rw(P1 + 0x4C)
    if st >= 0x18 and snap is None:
        snap = [[md.rw(base + r * ROW + c * 2) for c in range(6)] for r in range(-6, ROWS)]
        print(f"кадр {md.frame}: состояние игрока 1 стало {st} — проигрыш объявлен")
        break

if snap:
    print("\nполе в этот миг (ряд: шесть колонок), 0 = пусто:")
    for k, row in enumerate(snap):
        r = k - 6
        mark = '  <= край экрана' if r == 0 else ('  (скрытый ряд)' if r < 0 else '')
        print(f"  ряд {r:+3}  " + ' '.join(f"{v:3}" for v in row) + mark)
    filled = [k - 6 for k, row in enumerate(snap) if any(v not in (0, 0xFF) for v in row)]
    if filled:
        print(f"\nсамый верхний занятый ряд: {min(filled)}")
