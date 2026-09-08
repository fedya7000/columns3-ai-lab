# Ловит НАСТОЯЩИЙ сбор камней (исчезло 3 и больше за раз) во время игры бота
# и печатает, что в этот миг изменилось в RAM. Отсюда — счёт и комбо.
#
# python hunt2.py [кадров]
import sys, os
import numpy as np
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import P1, P2, ROW, COLS, ROWS, field_base, run_match

FRAMES = int(sys.argv[1]) if len(sys.argv) > 1 else 4000

md = session.new()
session.boot_vs(md)


def count(md, p):
    base = field_base(md, p)
    n = 0
    for r in range(ROWS):
        for c in range(COLS):
            v = md.rw(base + r * ROW + c * 2)
            if 0 < v < 0xFF:
                n += 1
    return n


st = {'prev_ram': np.frombuffer(md.ram_snapshot(), dtype=np.uint8).copy(),
      'n1': count(md, P1), 'n2': count(md, P2), 'events': 0, 'votes': {},
      'mode': md.rw(0xFF0406)}

SKIP = [(0x1200, 0x1400), (0x1600, 0x1800), (0xEF90, 0xEF94),
        (0x0080, 0x0160), (0x8000, 0x9000)]   # поля, ГПСЧ, таблица спрайтов


def skip(a):
    return any(lo <= a < hi for lo, hi in SKIP)


def tick(md, i):
    mode = md.rw(0xFF0406)
    cur = np.frombuffer(md.ram_snapshot(), dtype=np.uint8)
    n1, n2 = count(md, P1), count(md, P2)
    # настоящий сбор: пропало >=3 у ОДНОГО игрока, и режим прежний (не конец раунда)
    if mode == st['mode'] and st['n1'] - n1 >= 3:
        st['events'] += 1
        d = np.nonzero(cur != st['prev_ram'])[0]
        interesting = [int(a) for a in d if not skip(a)]
        if st['events'] <= 8:
            print(f"\n--- СБОР #{st['events']} на кадре {md.frame}: "
                  f"камней P1 {st['n1']} -> {n1} (пропало {st['n1']-n1}) ---")
            for a in interesting[:50]:
                print(f"   $FF{a:04X}: {st['prev_ram'][a]:3} -> {cur[a]:3}")
        for a in interesting:
            st['votes'][a] = st['votes'].get(a, 0) + 1
    st['n1'], st['n2'] = n1, n2
    st['prev_ram'] = cur.copy()
    st['mode'] = mode


run_match(md, FRAMES, tick)
print(f"\n===== сборов поймано: {st['events']} =====")
for a, c in sorted(st['votes'].items(), key=lambda x: -x[1])[:35]:
    print(f"  $FF{a:04X}  в {c} из {st['events']} сборов")
