# Где в видеопамяти свободные тайлы (сплошные нули) — туда лягут тайлы неба.
# Карты планов и таблица спрайтов в расчёт не берутся: они выше $A000.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(600):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()

LIMIT = 0xA000 // 32          # тайлы ниже карт планов
empty = [t for t in range(LIMIT) if not any(md.vram[t * 32:(t + 1) * 32])]
print(f"пустых тайлов ниже $A000: {len(empty)} из {LIMIT}")

runs = []
cur = []
for t in empty:
    if cur and t == cur[-1] + 1:
        cur.append(t)
    else:
        if len(cur) >= 8:
            runs.append(cur)
        cur = [t]
if len(cur) >= 8:
    runs.append(cur)
print("\nсплошные свободные куски (>=8 тайлов):")
for r in sorted(runs, key=lambda x: -len(x))[:12]:
    print(f"  тайлы ${r[0]:03X}..${r[-1]:03X}  ({len(r)} шт, видеопамять "
          f"${r[0]*32:04X}..${(r[-1]+1)*32-1:04X})")
