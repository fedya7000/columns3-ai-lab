# Показывает, КАКОЙ КОД пишет в указанные ячейки RAM.
# Это главный мост между «нашёл переменную» и «нашёл подпрограмму».
#
# python whowrites.py <адрес_hex> [ещё_адреса...] [-f кадров]
#
# ⚠️ Починен 24.08: раньше тянул `from autoplay import run_match`, а модуля
# `autoplay` в проекте нет — инструмент не запускался вообще. Своя игра теперь
# внутри: два пилота из duel.py на уже доведённой до боя машине.
import os
import sys
from collections import defaultdict

sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io
import duel
import session
import train_duel as td

args = [a for a in sys.argv[1:] if not a.startswith('-')]
FRAMES = 5000
if '-f' in sys.argv:
    FRAMES = int(sys.argv[sys.argv.index('-f') + 1])
    args = [a for a in args if a != str(FRAMES)]
ADDRS = [int(a, 16) for a in args]

if not ADDRS:
    print('нужен адрес: python whowrites.py FF0406 [-f 8000]')
    raise SystemExit(2)


def run_match(md, frames):
    """Играть матч N кадров двумя ботами на УЖЕ доведённой до боя машине."""
    boec, geny, _ = td.load()
    pilots = [duel.Pilot(md, 0, io.P1, boec, genes=geny, name='первый'),
              duel.Pilot(md, 1, io.P2, boec, genes=geny, name='второй')]
    for _ in range(frames):
        if md.stopped:
            break
        io.fix_empty_slots(md)
        for pl in pilots:
            pl.tick()
        md.step_frame()
    return pilots


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
    print("\n=== в $%06X писали из: ===" % a)
    if not hits[a]:
        print("   никто (за этот прогон)")
    for pc, n in sorted(hits[a].items(), key=lambda x: -x[1]):
        print("   PC=$%06X   %d раз" % (pc, n))
    print("   первые записи:")
    for fr, pc, sz, v in samples[a]:
        print("     кадр %d  PC=$%06X  размер=%s  значение=%s" % (fr, pc, sz, v))
