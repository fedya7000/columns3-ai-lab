# Следит за палитрой 2 и режимом по ходу боя: когда именно срабатывает врезка.
import sys, os, struct
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

ROM = sys.argv[1]
md = session.new(ROM)
hits = []
md.add_code_hook(0x07A700, lambda m, pc: hits.append(m.frame))
session.boot_vs(md)
bot = Bot(0, P1, 5)
prev = None
for i in range(900):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()
    p2 = tuple(struct.unpack('>H', bytes(md.cram[k * 2:k * 2 + 2]))[0] for k in range(32, 48))
    if p2 != prev:
        print(f"кадр {md.frame:6} режим=${md.rw(0xFF0406):04X} признак=${md.rb(0xFF7F00):02X} "
              f"палитра2[3]=${p2[3]:04X} [7]=${p2[7]:04X} [9]=${p2[9]:04X} [11]=${p2[11]:04X}")
        prev = p2
print(f"\nврезка срабатывала на кадрах: {hits[:10]}  (всего {len(hits)})")
