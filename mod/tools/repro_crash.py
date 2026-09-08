# Воспроизводит сбой и печатает состояние: регистры, регистры VDP,
# и кто последним настраивал источник DMA.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

ROM = sys.argv[1]
md = session.new(ROM)
session.boot_vs(md)
bot = Bot(0, P1, 5)
hist = []

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
    hist.append((md.frame, md.rw(0xFF0406), md.rw(P1 + 0x4C), md.rw(P2 + 0x4C),
                 md.rw(P1 + 0xE4), md.rw(P2 + 0xE4)))
    md.step_frame()
    if md.stopped:
        print(md.log[-1])
        r = md.vdp_reg
        print(f"\nрегистры DMA VDP: длина={r[0x13] | (r[0x14] << 8)}  "
              f"источник=${((r[0x15] | (r[0x16] << 8) | ((r[0x17] & 0x7F) << 16)) << 1):06X}  "
              f"режим источника=${r[0x17]:02X}")
        print("\nпоследние кадры (кадр, режим, состояние P1, состояние P2, очки P1, очки P2):")
        for h in hist[-12:]:
            print(f"  {h[0]:6}  ${h[1]:04X}  {h[2]:3} {h[3]:3}   {h[4]:4} {h[5]:4}")
        break
else:
    print("сбоя не случилось за отведённые кадры")
