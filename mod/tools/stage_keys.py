# Какой кнопкой листается STAGE в меню CONFIGURATION и сколько локаций.
# Пробуем все кнопки по очереди, следим за изменениями RAM и снимаем экран.
import sys, os
import numpy as np
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait

shots = os.path.join(os.path.dirname(__file__), '..', 'shots', 'stagekeys')
os.makedirs(shots, exist_ok=True)


def to_config(md):
    _wait(md, 300)
    _tap(md, 0, 'start'); _wait(md, 60)
    _tap(md, 0, 'start'); _wait(md, 120)
    _tap(md, 0, 'right'); _wait(md, 20)
    _tap(md, 0, 'start'); _wait(md, 120)
    for _ in range(3):
        _tap(md, 0, 'down'); _wait(md, 15)
    _tap(md, 0, 'start'); _wait(md, 90)      # CONFIGURATION
    for _ in range(3):                        # курсор на строку STAGE
        _tap(md, 0, 'down'); _wait(md, 15)


for btn in ('a', 'b', 'c', 'up', 'down', 'left', 'right'):
    md = session.new()
    to_config(md)
    before = np.frombuffer(md.ram_snapshot(), dtype=np.uint8).copy()
    _tap(md, 0, btn)
    _wait(md, 30)
    after = np.frombuffer(md.ram_snapshot(), dtype=np.uint8)
    d = [int(a) for a in np.nonzero(after != before)[0]
         if not (0xEF90 <= a <= 0xEF93) and after[a] < 16 and before[a] < 16]
    md.render(os.path.join(shots, f"btn_{btn}.png"))
    print(f"кнопка {btn:5}: изменилось {len(d):3} мелких ячеек  "
          + ' '.join(f"$FF{a:04X}:{before[a]}->{after[a]}" for a in d[:8]))
