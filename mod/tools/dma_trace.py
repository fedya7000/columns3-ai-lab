# Ловит вызовы подпрограммы DMA ($3980) и печатает, с какими регистрами
# и откуда её позвали — чтобы понять, кто приносит мусор перед сбоем.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

ROM = sys.argv[1]
SEED = int(sys.argv[2]) if len(sys.argv) > 2 else 5

md = session.new(ROM)
calls = []


def on_dma(m, pc):
    d, a = m.regs()
    ret = m.rl(a[7])                       # адрес возврата лежит на вершине стека
    calls.append((m.frame, d[1], d[2], d[3], ret, a[7]))


md.add_code_hook(0x3980, on_dma)       # ХУК СТАВИМ ДО ЗАГРУЗКИ: движок кеширует
session.boot_vs(md)                    # уже оттранслированный код
bot = Bot(0, P1, SEED)
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
        print("СБОЙ:", md.log[-1].splitlines()[0])
        break

print(f"\nвсего вызовов DMA: {len(calls)}")
print("последние 12 (кадр, d1, d2, d3, откуда позвали, стек):")
for fr, d1, d2, d3, ret, sp in calls[-12:]:
    print(f"  кадр {fr:6}  d1={d1:08X} d2={d2:08X} d3={d3:08X}  возврат=${ret:06X}  a7=${sp:08X}")

# сколько разных мест зовут
from collections import Counter
c = Counter(x[4] for x in calls)
print("\nкто зовёт (адрес возврата -> сколько раз):")
for k, v in c.most_common(10):
    print(f"  ${k:06X}: {v}")
