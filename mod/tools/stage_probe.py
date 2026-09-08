# Что такое STAGE в меню CONFIGURATION: сколько их, какая ячейка RAM за это
# отвечает и что меняется в бою.
import sys, os
import numpy as np
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait

md = session.new()
shots = os.path.join(os.path.dirname(__file__), '..', 'shots', 'stage')
os.makedirs(shots, exist_ok=True)

_wait(md, 300)
_tap(md, 0, 'start')
_wait(md, 60)
_tap(md, 0, 'start')
_wait(md, 120)
_tap(md, 0, 'right')
_wait(md, 20)
_tap(md, 0, 'start')
_wait(md, 120)
for _ in range(3):
    _tap(md, 0, 'down')
    _wait(md, 15)
_tap(md, 0, 'start')          # вошли в CONFIGURATION
_wait(md, 90)

# ищем строку STAGE: ходим курсором вниз и на каждой позиции жмём вправо,
# запоминая, какие ячейки RAM меняются
for pos in range(7):
    before = np.frombuffer(md.ram_snapshot(), dtype=np.uint8).copy()
    _tap(md, 0, 'right')
    _wait(md, 20)
    after = np.frombuffer(md.ram_snapshot(), dtype=np.uint8)
    d = [int(a) for a in np.nonzero(after != before)[0]
         if not (0xEF90 <= a <= 0xEF93) and after[a] < 32]
    p = os.path.join(shots, f"pos{pos}.png")
    md.render(p)
    print(f"позиция {pos}: изменилось {len(d)} ячеек -> "
          + ' '.join(f"$FF{a:04X}:{before[a]}->{after[a]}" for a in d[:6]))
    _tap(md, 0, 'down')
    _wait(md, 15)
