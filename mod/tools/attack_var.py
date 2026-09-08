# Где хранится назначение кнопок ATTACK/CYCLE: меняем его в меню и смотрим,
# какая ячейка RAM поехала. Дальше по ней найдём код, читающий кнопку атаки.
import sys, os
import numpy as np
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait


def to_attack_row(md):
    _wait(md, 300)
    _tap(md, 0, 'start'); _wait(md, 60)
    _tap(md, 0, 'start'); _wait(md, 120)
    _tap(md, 0, 'right'); _wait(md, 20)
    _tap(md, 0, 'start'); _wait(md, 120)
    for _ in range(3):
        _tap(md, 0, 'down'); _wait(md, 15)
    _tap(md, 0, 'start'); _wait(md, 90)
    for _ in range(2):
        _tap(md, 0, 'down'); _wait(md, 20)


md = session.new()
to_attack_row(md)
before = np.frombuffer(md.ram_snapshot(), dtype=np.uint8).copy()
_tap(md, 0, 'a')
_wait(md, 30)
after = np.frombuffer(md.ram_snapshot(), dtype=np.uint8)
d = [int(a) for a in np.nonzero(after != before)[0] if not (0xEF90 <= a <= 0xEF93)]
print(f"после смены схемы изменилось {len(d)} байт:")
for a in d[:30]:
    print(f"  $FF{a:04X}: {before[a]:3} -> {after[a]:3}")
