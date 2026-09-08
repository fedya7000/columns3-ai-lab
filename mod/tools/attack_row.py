# Можно ли переназначить кнопки ATTACK/CYCLE в меню CONFIGURATION:
# встаём на эту строку и пробуем все кнопки, снимая экран.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait

shots = os.path.join(os.path.dirname(__file__), '..', 'shots', 'attack')
os.makedirs(shots, exist_ok=True)


def to_attack_row(md):
    _wait(md, 300)
    _tap(md, 0, 'start'); _wait(md, 60)
    _tap(md, 0, 'start'); _wait(md, 120)
    _tap(md, 0, 'right'); _wait(md, 20)
    _tap(md, 0, 'start'); _wait(md, 120)
    for _ in range(3):
        _tap(md, 0, 'down'); _wait(md, 15)
    _tap(md, 0, 'start'); _wait(md, 90)     # CONFIGURATION
    for _ in range(2):                       # курсор на строку ATTACK/CYCLE
        _tap(md, 0, 'down'); _wait(md, 20)


for btn in ('a', 'b', 'c', 'left', 'right', 'up'):
    md = session.new()
    to_attack_row(md)
    md.render(os.path.join(shots, f"before_{btn}.png"))
    for k in range(3):
        _tap(md, 0, btn)
        _wait(md, 25)
        md.render(os.path.join(shots, f"after_{btn}_{k}.png"))
    print(f"кнопка {btn}: снимки after_{btn}_0..2.png")
