# Где на самом деле НАЧИНАЕТСЯ массив поля (сколько скрытых рядов над краем)
# и кто объявляет проигрыш (пишет состояние >= 24 в +0x4C).
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, ROW, COLS, ROWS, field_base

ROM = sys.argv[1] if len(sys.argv) > 1 else os.path.join(
    os.path.dirname(__file__), '..', 'rom', 'Columns III (USA).gen')

md = session.new(ROM)
ev = []


def cb(m, a, size, value, pc):
    ev.append((m.frame, size, value, pc))


md.add_watch(0xFF104C, 0xFF104D, cb)       # состояние игрока 1
session.boot_vs(md)
for _ in range(120):
    md.step_frame()

base = field_base(md, P1)
print(f"база поля (ряд 0) = ${base:06X}")
print("\nчто лежит ВЫШЕ базы (ряд: ячейки 0..7):")
for r in range(-10, 3):
    a = base + r * ROW
    cells = ' '.join(f"{md.rw(a + c * 2):4X}" for c in range(8))
    print(f"  ряд {r:+3}  ${a:06X}  {cells}")

bot = Bot(0, P1, 5)
for i in range(20000):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()
    if md.stopped or md.rw(P1 + 0x4C) >= 0x1C:
        break

print(f"\nкто писал в состояние игрока (+0x4C), последние 12:")
for fr, sz, v, pc in ev[-12:]:
    print(f"  кадр {fr:6}  значение={v:3}  PC=${pc:06X}")
