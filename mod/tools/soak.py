# Долгий прогон: сколько раундов выдерживает ROM до сбоя.
# Гоняется с разными зёрнами бота, чтобы отличить настоящую поломку
# от случайного совпадения.
#
# python soak.py <rom> [раундов] [зёрна через запятую]
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

ROM = sys.argv[1]
WANT = int(sys.argv[2]) if len(sys.argv) > 2 else 6
SEEDS = [int(x) for x in sys.argv[3].split(',')] if len(sys.argv) > 3 else [5, 11, 23]

HINT = os.environ.get('NO_HINT') != '1'      # NO_HINT=1 — выключить прерывание строки

for seed in SEEDS:
    md = session.new(ROM, hint_enabled=HINT)
    session.boot_vs(md)
    bot = Bot(0, P1, seed)
    rounds = 0
    prev = 0x20
    crashed = None
    for i in range(120000):
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
            crashed = md.frame
            break
        m = md.rw(0xFF0406)
        if m == 0x24 and prev != 0x24:
            rounds += 1
        prev = m
        if rounds >= WANT:
            break
    tag = f"СБОЙ на кадре {crashed}" if crashed else "чисто"
    print(f"зерно {seed:3}: раундов {rounds}, кадров {md.frame}, {tag}")
    if crashed:
        print("   ", md.log[-1].splitlines()[0])
