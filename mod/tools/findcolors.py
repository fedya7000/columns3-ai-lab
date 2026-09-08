# Ищет, ГДЕ в структуре игрока лежат цвета трёх камней падающей фигуры.
# Метод: ловим кадр приземления (в поле появились 3 новых камня),
# берём их цвета и ищем эту тройку в снимке структуры, снятом ДО приземления.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import P1, ROW, COLS, ROWS, field_base, cell, run_match

md = session.new()
session.boot_vs(md)

state = {'prev': None, 'prev_struct': None, 'votes': {}}


def snapshot_field(md):
    base = field_base(md, P1)
    return [md.rw(base + r * ROW + c * 2) for r in range(ROWS) for c in range(COLS)]


state['landings'] = 0


def tick(md, i):
    cur = snapshot_field(md)
    ram_now = md.ram_snapshot()
    prev = state['prev']
    if prev is not None:
        new = [cur[k] for k in range(len(cur))
               if prev[k] == 0 and 0 < cur[k] < 0xFF]
        if len(new) == 3 and state['prev_struct'] is not None:
            state['landings'] += 1
            s = state['prev_struct']
            # ищем тройку цветов по ВСЕЙ RAM: и словами, и байтами
            for off in range(0, len(s) - 6):
                if off % 2 == 0:
                    trio = [(s[off + k * 2] << 8) | s[off + k * 2 + 1] for k in range(3)]
                    if trio == new or trio == new[::-1]:
                        state['votes'][('w', off)] = state['votes'].get(('w', off), 0) + 1
                trio_b = [s[off], s[off + 1], s[off + 2]]
                if trio_b == new or trio_b == new[::-1]:
                    state['votes'][('b', off)] = state['votes'].get(('b', off), 0) + 1
    state['prev'] = cur
    state['prev_struct'] = ram_now


run_match(md, 2000, tick)
print(f"приземлений поймано: {state['landings']}")
print("адреса, где тройка цветов совпадала чаще всего:")
for (kind, off), n in sorted(state['votes'].items(), key=lambda x: -x[1])[:15]:
    print(f"  $FF{off:04X}  {'словами' if kind=='w' else 'байтами'}  совпало {n} из {state['landings']}")
