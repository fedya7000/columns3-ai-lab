# Дамп куска RAM в бою + сравнение блоков двух игроков.
# python dumpblk.py <адр_hex> <длина_hex> [кадров_после_старта]
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session

A = int(sys.argv[1], 16)
L = int(sys.argv[2], 16)
NF = int(sys.argv[3]) if len(sys.argv) > 3 else 1800

md = session.new()
session.boot_vs(md)
for _ in range(NF):
    md.step_frame()
md.render(os.path.join(os.path.dirname(__file__), '..', 'shots', 'dumpblk.png'))

ram = md.ram_snapshot()


def dump(a, l, label):
    print(f"\n=== {label}  ${a:06X}..${a+l-1:06X} ===")
    off = a - 0xFF0000
    for r in range(0, l, 16):
        row = ram[off + r:off + r + 16]
        if all(b == 0 for b in row):
            continue
        print(f"{a+r:06X}: {row.hex(' ')}")


dump(A, L, "блок")
if A == 0xFF1000:
    dump(0xFF1400, L, "второй игрок")
    print("\n=== чем ОТЛИЧАЮТСЯ блоки игроков (смещение: P1 / P2) ===")
    o1, o2 = A - 0xFF0000, 0xFF1400 - 0xFF0000
    for i in range(L):
        if ram[o1 + i] != ram[o2 + i]:
            print(f"  +0x{i:03X}  P1=${ram[o1+i]:02X}  P2=${ram[o2+i]:02X}")
