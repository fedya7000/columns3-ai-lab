# Подробный разбор одного случая из батареи: печатает поле по ходу,
# чтобы понять, почему линия не находится.
# python dbg_case.py <rom>
import sys, os, random
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, ROW, ROWS, COLS, field_base

ROM = sys.argv[1]
CELLS = [(0, 1), (0, 2), (0, 3)]      # горизонталь на краю экрана
COLOR = 4

md = session.new(ROM)
session.boot_vs(md)
bot = Bot(0, P1, 5)
for _ in range(120):
    md.step_frame()
base = field_base(md, P1)


def put(r, c, v):
    md.uc.mem_write(base + r * ROW + c * 2, bytes([v >> 8, v & 0xFF]))


def show(tag):
    print(f"--- {tag} (ряды -2..12) ---")
    for r in range(-2, ROWS):
        print("   " + ' '.join(f"{md.rw(base + r*ROW + c*2):4X}" for c in range(6)))


rng = random.Random(12345)
board = {}
for (r, c) in CELLS:
    board[(r, c)] = COLOR
    for rr in range(r + 1, ROWS):
        board[(rr, c)] = 1 + ((rr + 2 * c) % 3)
    # грубая забивка: важна не она, а факт что колонка полная
for (r, c), v in board.items():
    put(r, c, v)
show("выложено")

for i in range(900):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()
    if any(md.rw(base + r * ROW + c * 2) & 0x8000 for (r, c) in CELLS):
        print(f"\nПОМЕЧЕНО на кадре {i}")
        break
    if (i + 1) % 300 == 0:
        show(f"кадр {i+1}, режим=${md.rw(0xFF0406):04X}, состояние={md.rw(P1+0x4C)}")
else:
    show("конец")
    print("не нашло")
