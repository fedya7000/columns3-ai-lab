# Сколько локаций (STAGE) в игре: жмём вправо на строке STAGE и следим за $FF0500.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait

md = session.new()
shots = os.path.join(os.path.dirname(__file__), '..', 'shots', 'stage')
os.makedirs(shots, exist_ok=True)

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

seen = []
for i in range(14):
    v = md.rw(0xFF0500)
    seen.append(v)
    if i < 8:
        md.render(os.path.join(shots, f"stage_{i}_val{v}.png"))
    _tap(md, 0, 'right')
    _wait(md, 20)
print("значения $FF0500 по кругу:", seen)
print("разных локаций:", len(set(seen)))
