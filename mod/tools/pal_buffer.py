# Где в RAM лежит рабочая копия палитры 2 (её игра шлёт в CRAM каждый кадр).
# Ищем в памяти те же 32 байта, что видны в CRAM.
import sys, os, struct
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(200):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()

pal2 = bytes(md.cram[64:96])
print("палитра 2 в CRAM:", ' '.join(f"{pal2[i]:02X}" for i in range(32)))

ram = md.ram_snapshot()
hits = []
start = 0
while True:
    i = ram.find(pal2, start)
    if i < 0:
        break
    hits.append(i)
    start = i + 1
print(f"\nнайдено копий в RAM: {len(hits)}")
for h in hits:
    print(f"  $FF{h:04X}")

# заодно вся CRAM целиком — вдруг буфер хранит все четыре палитры подряд
full = bytes(md.cram[:128])
j = ram.find(full)
print(f"\nвся CRAM (128 байт) целиком найдена в RAM по: "
      + (f"$FF{j:04X}" if j >= 0 else "не найдена"))
