# Показывает, КАКОЙ КОД пишет в указанные ячейки RAM.
# Это главный мост между «нашёл переменную» и «нашёл подпрограмму».
#
# python whowrites.py <адрес_hex> [ещё_адреса...] [-f кадров]
import sys, os
from collections import defaultdict
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import run_match

args = [a for a in sys.argv[1:] if not a.startswith('-')]
FRAMES = 5000
if '-f' in sys.argv:
    FRAMES = int(sys.argv[sys.argv.index('-f') + 1])
    args = [a for a in args if a != str(FRAMES)]
ADDRS = [int(a, 16) for a in args]

md = session.new()
session.boot_vs(md)

hits = defaultdict(lambda: defaultdict(int))   # адрес -> pc -> сколько раз
samples = defaultdict(list)


def cb(md, a, size, value, pc):
    hits[a][pc] += 1
    if len(samples[a]) < 12:
        samples[a].append((md.frame, pc, size, value))


for a in ADDRS:
    md.add_watch(a, a + 1, cb)

run_match(md, FRAMES)

for a in ADDRS:
    print(f"\n=== в ${a:06X} писали из: ===")
    if not hits[a]:
        print("   никто (за этот прогон)")
    for pc, n in sorted(hits[a].items(), key=lambda x: -x[1]):
        print(f"   PC=${pc:06X}   {n} раз")
    print("   первые записи:")
    for fr, pc, sz, v in samples[a]:
        print(f"     кадр {fr}  PC=${pc:06X}  размер={sz}  значение={v}")
