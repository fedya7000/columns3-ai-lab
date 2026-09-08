# Карта курсора в меню CONFIGURATION: снимок после КАЖДОГО «вниз»,
# чтобы точно знать, сколько нажатий нужно до строки STAGE.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait

shots = os.path.join(os.path.dirname(__file__), '..', 'shots', 'cursor')
os.makedirs(shots, exist_ok=True)

md = session.new()
_wait(md, 300)
_tap(md, 0, 'start'); _wait(md, 60)
_tap(md, 0, 'start'); _wait(md, 120)
_tap(md, 0, 'right'); _wait(md, 20)
_tap(md, 0, 'start'); _wait(md, 120)
for _ in range(3):
    _tap(md, 0, 'down'); _wait(md, 15)
_tap(md, 0, 'start'); _wait(md, 90)

for k in range(9):
    md.render(os.path.join(shots, f"down{k}.png"))
    print(f"после {k} нажатий 'вниз' -> down{k}.png  ($FF0500={md.rb(0xFF0500)})")
    _tap(md, 0, 'down')
    _wait(md, 25)
