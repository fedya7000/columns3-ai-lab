# Перебирает все локации (STAGE) и снимает каждую в бою.
# $FF0500 — номер локации; листается влево/вправо на строке STAGE.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait

shots = os.path.join(os.path.dirname(__file__), '..', 'shots', 'stages')
os.makedirs(shots, exist_ok=True)


def to_config(md):
    _wait(md, 300)
    _tap(md, 0, 'start'); _wait(md, 60)
    _tap(md, 0, 'start'); _wait(md, 120)
    _tap(md, 0, 'right'); _wait(md, 20)
    _tap(md, 0, 'start'); _wait(md, 120)
    for _ in range(3):
        _tap(md, 0, 'down'); _wait(md, 15)
    _tap(md, 0, 'start'); _wait(md, 90)
    for _ in range(3):
        _tap(md, 0, 'down'); _wait(md, 15)


# сколько всего значений
md = session.new()
to_config(md)
vals = []
for i in range(10):
    vals.append(md.rb(0xFF0500))
    _tap(md, 0, 'right')
    _wait(md, 40)
print("номера локаций по кругу:", vals)
print("всего локаций:", len(set(vals)))

# снимок каждой локации в бою
for stage in sorted(set(vals)):
    md = session.new()
    to_config(md)
    for _ in range(20):
        if md.rb(0xFF0500) == stage:
            break
        _tap(md, 0, 'right')
        _wait(md, 40)
    got = md.rb(0xFF0500)
    _tap(md, 0, 'down'); _wait(md, 20)      # на EXIT
    _tap(md, 0, 'start'); _wait(md, 120)    # выйти из настроек
    _tap(md, 0, 'start'); _wait(md, 150)
    _tap(md, 1, 'start'); _wait(md, 120)
    _tap(md, 0, 'start'); _wait(md, 200)
    p = os.path.join(shots, f"stage{got}.png")
    md.render(p)
    print(f"локация {got}: режим=${md.rw(0xFF0406):04X} -> {os.path.basename(p)}")
