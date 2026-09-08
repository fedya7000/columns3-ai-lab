# Проверка, что правка не сломала остальное:
#   1. ROM запускается (контрольная сумма принята игрой)
#   2. сюжетный режим 1P доходит до игры и идёт
#   3. бой 1on1 проходит несколько раундов без сбоев процессора
#
# python regress.py <rom>
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

ROM = sys.argv[1]
ok = True


def fail(msg):
    global ok
    ok = False
    print("  ПРОВАЛ:", msg)


# ---------- 1. запуск ----------
md = session.new(ROM)
for _ in range(400):
    md.step_frame()
if md.stopped:
    fail(f"не запустился: {md.log[-1]}")
else:
    print(f"1. запуск: дошёл до кадра {md.frame}, режим=${md.rw(0xFF0406):04X}  — ОК")

# ---------- 2. сюжетный режим ----------
md = session.new(ROM)
session.boot_1p(md)
reached = False
for i in range(6000):
    if i % 20 < 3 and md.rw(0xFF0406) != 0x20:
        md.press(0, 'start')
    else:
        md.release(0)
    md.step_frame()
    if md.stopped:
        fail(f"сюжетный режим упал: {md.log[-1]}")
        break
    if md.rw(0xFF0406) == 0x20 and i > 1200:
        reached = True
        break
if reached:
    for _ in range(600):
        md.step_frame()
    print(f"2. сюжетный режим: игра идёт, FF0418={md.rw(0xFF0418)} "
          f"(должно быть 0 — правило туда не лезет), исключений={len(md.exceptions)}  — ОК")
    md.render(os.path.join(os.path.dirname(__file__), '..', 'shots', 'regress_1p.png'))
elif ok:
    fail("сюжетный режим не дошёл до игры")

# ---------- 3. несколько раундов 1on1 ----------
md = session.new(ROM)
session.boot_vs(md)
bot = Bot(0, P1, 5)
rounds = 0
prev = 0x20
for i in range(40000):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    if md.rw(0xFF0406) != 0x20 and i % 8 < 3:
        md.press(0, 'start')
        md.press(1, 'start')
    else:
        md.release(1)
    md.step_frame()
    if md.stopped:
        fail(f"бой упал на кадре {md.frame}: {md.log[-1]}")
        break
    m = md.rw(0xFF0406)
    if m == 0x24 and prev != 0x24:
        rounds += 1
        print(f"   раунд {rounds}: очки P1={md.rw(P1+0xE4)} P2={md.rw(P2+0xE4)}   "
              f"табло {md.rb(P1+0xD8)}W-{md.rb(P2+0xD8)}W")
    prev = m
    if rounds >= 3:
        break
if rounds >= 2:
    print(f"3. бой 1on1: прошло раундов {rounds}, исключений={len(md.exceptions)}  — ОК")
elif ok:
    fail(f"за отведённое время прошло раундов только {rounds}")

print("\n" + ("ВСЁ ЗЕЛЁНОЕ" if ok else "ЕСТЬ ПРОВАЛЫ"))
