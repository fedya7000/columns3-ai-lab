# Сколько проходов делает цикл построителя списка спрайтов ($00CEAE)
# и с какой таблицей (a1). Шесть записей — норма, больше — перебор.
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1
from unicorn.m68k_const import UC_M68K_REG_A0, UC_M68K_REG_A1, UC_M68K_REG_A6

ROM = sys.argv[1]
SEED = int(sys.argv[2]) if len(sys.argv) > 2 else 29

md = session.new(ROM)
runs = []
cur = {'n': 0}


def on_head(m, pc):
    u = m.uc
    cur['n'] += 1
    cur['a1'] = u.reg_read(UC_M68K_REG_A1)
    cur['a0'] = u.reg_read(UC_M68K_REG_A0)
    cur['a6'] = u.reg_read(UC_M68K_REG_A6)
    cur['fr'] = m.frame


def on_entry(m, pc):
    if cur['n']:
        runs.append((cur['fr'], cur['n'], cur.get('a1', 0), cur.get('a0', 0), cur.get('a6', 0)))
        if len(runs) > 200:
            del runs[:100]
    cur['n'] = 0


md.add_code_hook(0x00CEAE, on_head)
md.add_code_hook(0x00CE52, on_entry)
session.boot_vs(md)
bot = Bot(0, P1, SEED)
for i in range(60000):
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

print("\nчисло проходов цикла (норма 7: шесть записей + признак конца):")
print(Counter(r[1] for r in runs).most_common(8))
print("\nпоследние прогоны (кадр, проходов, a1 в конце, a0 в конце, a6):")
for fr, n, a1, a0, a6 in runs[-8:]:
    print(f"  к{fr:6} проходов={n:4} a1=${a1:06X} a0=${a0:08X} a6=${a6:06X}")
