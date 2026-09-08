# Снимает дорогу до SOUND TEST по шагам — чтобы владельцу показать картинками,
# куда жать, а не описывать словами по памяти.
# Запуск: python tools\shot_soundtest.py build\c3_sailor.gen
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait

ROM = sys.argv[1]
out = os.path.join(os.path.dirname(__file__), '..', 'shots', 'soundtest')
os.makedirs(out, exist_ok=True)
md = session.new(ROM)
n = 0


def shot(tag):
    global n
    n += 1
    p = os.path.join(out, f'{n:02}_{tag}.png')
    md.render(p)
    print(f'  {os.path.basename(p)}')


_wait(md, 300)                      # логотип SEGA
_tap(md, 0, 'start'); _wait(md, 60)     # титульник
_tap(md, 0, 'start'); _wait(md, 120)    # -> выбор режима
shot('menu_rezhimov')

for i in range(3):
    _tap(md, 0, 'right'); _wait(md, 20)
    shot(f'vpravo_{i + 1}')

_tap(md, 0, 'down'); _wait(md, 20)
shot('vniz')

_tap(md, 0, 'start'); _wait(md, 150)
shot('posle_start')
