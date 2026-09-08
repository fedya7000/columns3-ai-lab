# Ловит МОМЕНТ СХЛОПЫВАНИЯ камней и печатает, что в этот миг изменилось в RAM.
# Так находится счёт, счётчик комбо и всё, что начисляется за сбор.
#
# python hunt.py [кадров]
import sys, os
import numpy as np
sys.path.insert(0, os.path.dirname(__file__))
import session

P1, P2 = 0xFF1000, 0xFF1400
ROW, COLS, ROWS = 16, 6, 13
FRAMES = int(sys.argv[1]) if len(sys.argv) > 1 else 20000

md = session.new()
session.boot_vs(md)
print(f"бой начался на кадре {md.frame}")


def count_jewels(md, p):
    base = md.rl(p + 6)
    n = 0
    for r in range(ROWS):
        for c in range(COLS):
            v = md.rw(base + r * ROW + c * 2)
            if 0 < v < 0xFF:
                n += 1
    return n


prev_ram = np.frombuffer(md.ram_snapshot(), dtype=np.uint8).copy()
prev_n1 = count_jewels(md, P1)
events = 0
# ячейки, менявшиеся при КАЖДОМ схлопывании — они и есть начисление
hit_counts = {}

for i in range(FRAMES):
    md.step_frame()
    if md.stopped:
        print("ОСТАНОВ:", md.log[-1])
        break
    n1 = count_jewels(md, P1)
    cur = np.frombuffer(md.ram_snapshot(), dtype=np.uint8)
    if n1 < prev_n1:                       # камней стало МЕНЬШЕ — схлопывание
        events += 1
        diff = np.nonzero(cur != prev_ram)[0]
        # отсеиваем само поле и заведомый шум (генератор случайных чисел, таймеры)
        interesting = [int(a) for a in diff
                       if not (0x1200 <= a < 0x1400) and not (0x1600 <= a < 0x1800)
                       and not (0xEF90 <= a <= 0xEF93)]
        if events <= 12:
            print(f"\n--- схлопывание #{events} на кадре {md.frame}: камней {prev_n1} -> {n1} ---")
            for a in interesting[:60]:
                print(f"   $FF{a:04X}: {prev_ram[a]:3} -> {cur[a]:3}")
        for a in interesting:
            hit_counts[a] = hit_counts.get(a, 0) + 1
    prev_n1 = n1
    prev_ram = cur.copy()

print(f"\n===== схлопываний поймано: {events} =====")
print("ячейки, менявшиеся ЧАЩЕ ВСЕГО в момент схлопывания:")
for a, c in sorted(hit_counts.items(), key=lambda x: -x[1])[:40]:
    print(f"  $FF{a:04X}  в {c} из {events} случаев   сейчас={prev_ram[a]}")
