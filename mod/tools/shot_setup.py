# Снимает экраны ДО начала боя: меню «best of» и «READY».
# Нужно проверить, что новый облик виден сразу, а не только с первого кадра боя.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait

ROM = sys.argv[1]
out = os.path.join(os.path.dirname(__file__), '..', 'shots', 'setup')
os.makedirs(out, exist_ok=True)
md = session.new(ROM)
n = 0


def shot(tag):
    global n
    n += 1
    p = os.path.join(out, f"{n:02}_{tag}.png")
    md.render(p)
    print(f"  {os.path.basename(p)}  режим=${md.rw(0xFF0406):04X} признак={md.rb(0xFF7F00)}")


_wait(md, 300)
_tap(md, 0, 'start'); _wait(md, 60)
_tap(md, 0, 'start'); _wait(md, 120)
_tap(md, 0, 'right'); _wait(md, 20)
_tap(md, 0, 'start'); _wait(md, 120)
shot('menu_best_of')
_tap(md, 0, 'start'); _wait(md, 150)
shot('ready')
_tap(md, 1, 'start'); _wait(md, 120)
shot('oba_gotovy')
_tap(md, 0, 'start'); _wait(md, 200)
shot('boy')
