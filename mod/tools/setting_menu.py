# Заходит в пункт SETTING меню боя 1on1 и снимает экраны,
# заодно печатает $FF4100 — подозреваемый выключатель особых камней.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait

md = session.new()
shots = os.path.join(os.path.dirname(__file__), '..', 'shots', 'setting')
os.makedirs(shots, exist_ok=True)
n = 0


def shot(tag):
    global n
    n += 1
    p = os.path.join(shots, f"{n:02}_{tag}.png")
    md.render(p)
    print(f"  {os.path.basename(p)}  режим=${md.rw(0xFF0406):04X}  FF4100={md.rb(0xFF4100)}")


_wait(md, 300)
_tap(md, 0, 'start')
_wait(md, 60)
_tap(md, 0, 'start')
_wait(md, 120)
_tap(md, 0, 'right')          # 1P MODE -> 1on1 MODE
_wait(md, 20)
_tap(md, 0, 'start')
_wait(md, 120)
shot('menu_best_of')
for _ in range(3):            # BEST OF 3 -> 5 -> 7 -> SETTING
    _tap(md, 0, 'down')
    _wait(md, 15)
shot('kursor_na_setting')
_tap(md, 0, 'start')
_wait(md, 90)
shot('setting_otkryt')
for k in range(6):
    _tap(md, 0, 'down')
    _wait(md, 15)
    shot(f'setting_vniz_{k+1}')
