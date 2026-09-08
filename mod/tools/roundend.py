# Проверяет разбор конца раунда: кто объявлен победителем и что лежит
# в слотах игроков, которых в бою НЕТ (в 1on1 заняты только два первых).
#
# P1 ведёт бот, P2 не делает ничего — значит P2 обязан завалиться первым.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

SLOTS = [0xFF1000, 0xFF1400, 0xFF1800, 0xFF1C00, 0xFF2000]

md = session.new()
session.boot_vs(md)
print(f"игроков в бою (FF0422) = {md.rw(0xFF0422)}")
print("до раунда: " + '  '.join(f"${s:06X}: 5C={md.rw(s+0x5C):5} E1={md.rb(s+0xE1)} 4C={md.rw(s+0x4C):3}"
                                for s in SLOTS))

bot = Bot(0, P1, 5)
mode0 = md.rw(0xFF0406)
shots = os.path.join(os.path.dirname(__file__), '..', 'shots')
reported = False
for i in range(20000):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)                       # второй игрок бездействует
    md.step_frame()
    if md.stopped:
        print("ОСТАНОВ:", md.log[-1])
        break
    m = md.rw(0xFF0406)
    if m != mode0 and not reported:
        print(f"\nраунд кончился на кадре {md.frame}, режим {mode0:04X} -> {m:04X}")
        for s in SLOTS:
            print(f"  ${s:06X}: 5C={md.rw(s+0x5C):5}  8C={md.rw(s+0x8C):5}  "
                  f"5A={md.rw(s+0x5A):3}  4C={md.rw(s+0x4C):3}  E1(победитель)={md.rb(s+0xE1)}")
        md.render(os.path.join(shots, 'roundend.png'))
        reported = True
        mode0 = m
        stop_at = md.frame + 400
    if reported and md.frame > stop_at:
        md.render(os.path.join(shots, 'roundend2.png'))
        print("\nчерез 400 кадров после конца раунда:")
        for s in SLOTS:
            print(f"  ${s:06X}: 5C={md.rw(s+0x5C):5}  E1={md.rb(s+0xE1)}")
        print(f"  победы: FF0500={md.rw(0xFF0500)}  FF0502={md.rw(0xFF0502)}")
        break
