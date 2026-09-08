# Кто ЧИТАЕТ указанные ячейки RAM во время боя.
# python whoreads.py <адрес_hex> [ещё...] [-f кадров]
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import run_match

args = [a for a in sys.argv[1:] if not a.startswith('-')]
FRAMES = 3000
if '-f' in sys.argv:
    FRAMES = int(sys.argv[sys.argv.index('-f') + 1])
    args = [a for a in args if a != str(FRAMES)]
ADDRS = [int(a, 16) for a in args]

md = session.new()
hits = {a: Counter() for a in ADDRS}


def cb(m, a, size, pc):
    for base in hits:
        if base <= a < base + 2:
            hits[base][pc] += 1


for a in ADDRS:
    md.add_read_watch(a, a + 1, cb)      # ХУК ДО загрузки — иначе не сработает
session.boot_vs(md)
run_match(md, FRAMES)

for a in ADDRS:
    print(f"\n=== ${a:06X} читают из: ===")
    if not hits[a]:
        print("   никто")
    for pc, n in hits[a].most_common(10):
        print(f"   PC=${pc:06X}   {n} раз")
