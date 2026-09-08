# Чем сюжетный режим 1P отличается от боя 1on1: смотрим $FF0418 и $FF0422
# в момент, когда идёт САМА игра (режим $0020).
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session

md = session.new()
session.boot_1p(md)
seen = set()
for i in range(6000):
    # в сюжете много экранов с текстом — жмём старт, пока не начнётся игра
    if i % 20 < 3 and md.rw(0xFF0406) != 0x20:
        md.press(0, 'start')
    else:
        md.release(0)
    md.step_frame()
    if md.stopped:
        print("ОСТАНОВ:", md.log[-1])
        break
    key = (md.rw(0xFF0406), md.rw(0xFF0418), md.rw(0xFF0422))
    if key not in seen:
        seen.add(key)
        print(f"кадр {md.frame:6}  режим=${key[0]:04X}  FF0418={key[1]}  FF0422(игроков)={key[2]}")
    if md.rw(0xFF0406) == 0x20 and i > 1500:
        md.render(os.path.join(os.path.dirname(__file__), '..', 'shots', 'mode1p.png'))
        print(f"\nСЮЖЕТНЫЙ РЕЖИМ, идёт игра: FF0418={md.rw(0xFF0418)}  FF0422={md.rw(0xFF0422)}")
        break
