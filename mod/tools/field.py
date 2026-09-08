# Ищет в RAM массив ИГРОВОГО ПОЛЯ.
# Метод: на экране лежит столбик из N камней подряд по вертикали.
# Значит в памяти будут N ненулевых байт с ПОСТОЯННЫМ шагом (шаг = ширина ряда).
import sys, os
from collections import defaultdict
sys.path.insert(0, os.path.dirname(__file__))
import session

md = session.new()
session.boot_vs(md)
for _ in range(1800):
    md.step_frame()
md.render(os.path.join(os.path.dirname(__file__), '..', 'shots', 'field_state.png'))

ram = md.ram_snapshot()
base = 0xFF0000
nz = [i for i, v in enumerate(ram) if v != 0]
print(f"ненулевых байт в RAM: {len(nz)}")

# ищем цепочки с постоянным шагом
best = []
nzset = set(nz)
for stride in range(2, 40):
    for i in nz:
        if (i - stride) in nzset:
            continue                      # не начало цепочки
        run = 1
        j = i
        while (j + stride) in nzset:
            j += stride
            run += 1
        if run >= 5:
            vals = [ram[i + k * stride] for k in range(run)]
            if max(vals) <= 32:           # цвета камней — маленькие числа
                best.append((run, stride, i, vals))

best.sort(key=lambda x: (-x[0], x[1]))
print("\n=== цепочки ненулевых байт с постоянным шагом (кандидаты в ПОЛЕ) ===")
seen = set()
for run, stride, i, vals in best[:40]:
    key = (i // 0x400, stride)
    print(f"  ${base+i:06X} шаг={stride:2} длина={run:2} значения={vals}")
