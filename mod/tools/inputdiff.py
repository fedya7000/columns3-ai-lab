# Находит ячейки, которыми управляет ИГРОК: два одинаковых прогона,
# в одном на кадре T жмём кнопку. Разница в RAM = то, на что влияет ввод.
#
# python inputdiff.py <кнопка> [кадр_нажатия] [сколько_держать]
import sys, os
import numpy as np
sys.path.insert(0, os.path.dirname(__file__))
import session

BTN = sys.argv[1] if len(sys.argv) > 1 else 'left'
T = int(sys.argv[2]) if len(sys.argv) > 2 else 60
HOLD = int(sys.argv[3]) if len(sys.argv) > 3 else 6


def run(press):
    md = session.new()
    session.boot_vs(md)
    for i in range(T + HOLD + 10):
        if press and T <= i < T + HOLD:
            md.press(0, BTN)
        else:
            md.release(0)
        md.step_frame()
    return np.frombuffer(md.ram_snapshot(), dtype=np.uint8).copy()


a = run(False)
b = run(True)
d = np.nonzero(a != b)[0]
print(f"кнопка '{BTN}' на кадре {T}, держим {HOLD}: различий {len(d)}")
for i in d:
    if 0xEF90 <= i <= 0xEF93:
        continue                       # генератор случайных чисел — шум
    print(f"  $FF{i:04X}: без={a[i]:3}  с нажатием={b[i]:3}")
