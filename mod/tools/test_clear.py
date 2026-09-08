# Проверка, что линия, найденная В СКРЫТЫХ РЯДАХ, не только помечается,
# но и УБИРАЕТСЯ, а игра после этого продолжает идти.
#
# python test_clear.py <rom>
import sys, os, random
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, ROW, ROWS, field_base

ROM = sys.argv[1]
COLOR = 4
CASES = [
    ('вертикаль ЗА краем -2',  [(-2, 4), (-1, 4), (0, 4)]),
    ('горизонталь ЗА краем -1', [(-1, 3), (-1, 4), (-1, 5)]),
    ('диагональ ЗА краем -2',  [(-2, 3), (-1, 4), (0, 5)]),
    ('вертикаль в середине',   [(5, 4), (6, 4), (7, 4)]),
]

for name, cells in CASES:
    md = session.new(ROM)
    session.boot_vs(md)
    bot = Bot(0, P1, 5)
    for _ in range(120):
        md.step_frame()
    base = field_base(md, P1)

    def put(r, c, v):
        md.uc.mem_write(base + r * ROW + c * 2, bytes([v >> 8, v & 0xFF]))

    def get(r, c):
        return md.rw(base + r * ROW + c * 2)

    rng = random.Random(999)
    for (r, c) in cells:
        put(r, c, COLOR)
        for rr in range(r + 1, ROWS):
            if (rr, c) not in cells:
                put(rr, c, 1 + ((rr * 2 + c * 3 + rng.randint(0, 1)) % 3))

    marked = cleared = None
    for i in range(1500):
        b = bot.decide(md)
        if b and i % 2 == 0:
            md.press(0, *b)
        else:
            md.release(0)
        md.release(1)
        md.step_frame()
        if md.stopped:
            print(f" - {name:26} ОСТАНОВ  {md.log[-1].splitlines()[0]}")
            break
        if marked is None and any(get(r, c) & 0x8000 for (r, c) in cells):
            marked = i
        if marked is not None and cleared is None and \
                all(get(r, c) in (0,) or (get(r, c) & 0x8000) == 0 and get(r, c) != COLOR
                    for (r, c) in cells):
            cleared = i
            # ещё немного покрутить, чтобы убедиться, что игра жива
            for _ in range(240):
                md.step_frame()
                if md.stopped:
                    break
            break
    else:
        print(f" - {name:26} не дождались")
        continue
    if md.stopped:
        print(f" - {name:26} помечено={marked} УБРАНО={cleared}  ПОТОМ ОСТАНОВ")
    elif cleared is not None:
        print(f" + {name:26} помечено={marked} убрано={cleared}, игра идёт, "
              f"режим=${md.rw(0xFF0406):04X}")
    elif marked is not None:
        print(f" - {name:26} помечено={marked}, но НЕ УБРАНО")
