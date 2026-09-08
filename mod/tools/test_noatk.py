# Проверка отвязки атаки: боты долбят A и C, смотрим признак «атака заявлена»
# (+0x80 структуры игрока). В бою 1on1 он обязан остаться нулём,
# в сюжетном режиме — вести себя как раньше.
#
# python test_noatk.py <rom>
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait
from autoplay import Bot, P1, P2

ROM = sys.argv[1]


def hammer(md, bots, frames):
    seen = set()
    for i in range(frames):
        for b in bots:
            btns = b.decide(md)
            if i % 12 < 5:
                md.press(b.port, 'a', 'c')       # нарочно жмём кнопки атаки
            elif btns and i % 2 == 0:
                md.press(b.port, *btns)
            else:
                md.release(b.port)
        md.step_frame()
        if md.stopped:
            print("   ОСТАНОВ:", md.log[-1].splitlines()[0])
            break
        seen.add((md.rw(P1 + 0x80), md.rw(P2 + 0x80)))
    return seen


print("=== бой 1 на 1 ===")
md = session.new(ROM)
session.boot_vs(md)
seen = hammer(md, [Bot(0, P1, 5), Bot(1, P2, 91)], 3000)
armed = sorted(v for pair in seen for v in pair)
print(f"   значения признака +0x80: {sorted(set(armed))}")
print("   " + ("АТАКА НЕ ЗАЯВЛЯЛАСЬ — отвязано" if set(armed) == {0}
               else "АТАКА ЗАЯВЛЯЛАСЬ — не отвязано"))

print("\n=== сюжетный режим 1P (должно работать как раньше) ===")
md = session.new(ROM)
session.boot_1p(md)
reached = False
for i in range(6000):
    if i % 20 < 3 and md.rw(0xFF0406) != 0x20:
        md.press(0, 'start')
    else:
        md.release(0)
    md.step_frame()
    if md.rw(0xFF0406) == 0x20 and i > 1200:
        reached = True
        break
if not reached:
    print("   до игры не дошло")
else:
    seen = hammer(md, [Bot(0, P1, 5)], 1500)
    armed = sorted(v for pair in seen for v in pair)
    print(f"   значения признака +0x80: {sorted(set(armed))}")
    print("   " + ("атака заявлялась — режим не тронут" if any(armed)
                   else "атака НЕ заявлялась (проверь, был ли повод)"))
