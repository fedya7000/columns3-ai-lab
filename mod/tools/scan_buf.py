# Что такое буфер $FF0E00, с которым работают сканеры линий:
# копия поля или отметки к сбору? Сверяем его с настоящим полем.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, ROW, ROWS, COLS, field_base

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(900):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()

base = field_base(md, P1)
print("поле игрока 1 (ряды 0..12):")
for r in range(ROWS):
    print("   " + ' '.join(f"{md.rw(base + r*ROW + c*2):4X}" for c in range(8)))
print("\nбуфер $FF0E00 той же формы:")
for r in range(ROWS):
    print("   " + ' '.join(f"{md.rw(0xFF0E00 + r*ROW + c*2):4X}" for c in range(8)))
print("\nчто выше базы в буфере (ряды -2..-1):")
for r in (-2, -1):
    print("   " + ' '.join(f"{md.rw(0xFF0E00 + r*ROW + c*2):4X}" for c in range(8)))
