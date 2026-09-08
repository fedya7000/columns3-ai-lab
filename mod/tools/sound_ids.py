# Какие звуки/мелодии игра запускает и когда.
# $3D7A — постановка номера звука в очередь (номер приходит в d7).
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait
from autoplay import Bot, P1
from unicorn.m68k_const import UC_M68K_REG_D7

md = session.new()
log = []


def on_snd(m, pc):
    from unicorn.m68k_const import UC_M68K_REG_A7
    d7 = m.uc.reg_read(UC_M68K_REG_D7) & 0xFF
    ret = m.rl(m.uc.reg_read(UC_M68K_REG_A7))     # адрес возврата = кто позвал
    log.append((m.frame, d7, m.rw(0xFF0406), ret))


md.add_code_hook(0x3D7A, on_snd)
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(1200):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()

print("звуки по ходу (кадр, номер, режим):")
seen = set()
for fr, d7, mode, ret in log:
    if (d7, mode) in seen:
        continue
    seen.add((d7, mode))
    print(f"  к{fr:6}  номер=${d7:02X} ({d7:3})  режим=${mode:04X}  позвал ${ret-6:06X}")
print(f"\nвсего вызовов: {len(log)}")
print("частота номеров:", {f'${k:02X}': v for k, v in Counter(x[1] for x in log).most_common(12)})
