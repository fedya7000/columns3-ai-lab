# Что внутри пункта TEST MODE меню режимов — не звуковой ли тест.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait

ROM = sys.argv[1] if len(sys.argv) > 1 else os.path.join(
    os.path.dirname(__file__), '..', 'rom', 'Columns III (USA).gen')

md = session.new(ROM)
shots = os.path.join(os.path.dirname(__file__), '..', 'shots', 'testmode')
os.makedirs(shots, exist_ok=True)
n = 0


def shot(tag):
    global n
    n += 1
    p = os.path.join(shots, f"{n:02}_{tag}.png")
    md.render(p)
    print(f"  {os.path.basename(p)}  режим=${md.rw(0xFF0406):04X}")


_wait(md, 300)
_tap(md, 0, 'start'); _wait(md, 60)
_tap(md, 0, 'start'); _wait(md, 120)     # меню режимов
# TEST MODE — последний пункт: сперва вправо до конца верхнего ряда, потом вниз
for _ in range(3):
    _tap(md, 0, 'right'); _wait(md, 20)
_tap(md, 0, 'down'); _wait(md, 20)
shot('kursor')
_tap(md, 0, 'start'); _wait(md, 150)
shot('voshli')
for k in range(6):
    _tap(md, 0, 'down'); _wait(md, 25)
    shot(f'vniz{k+1}')
