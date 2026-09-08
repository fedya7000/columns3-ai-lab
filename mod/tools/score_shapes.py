# Бывают ли линии ДЛИННЕЕ трёх камней и цепочки глубже единицы.
# Нужно, чтобы честно сказать, за что именно даются очки.
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1
from unicorn.m68k_const import UC_M68K_REG_D1, UC_M68K_REG_D2, UC_M68K_REG_A6

ROM = sys.argv[1] if len(sys.argv) > 1 else os.path.join(
    os.path.dirname(__file__), '..', 'build', 'c3_turnir.gen')
pairs = Counter()
chains = Counter()

for seed in (5, 11, 23, 41):
    md = session.new(ROM)

    def on_score(m, pc):
        u = m.uc
        a6 = u.reg_read(UC_M68K_REG_A6)
        d1 = u.reg_read(UC_M68K_REG_D1) & 0xFFFF
        d2 = u.reg_read(UC_M68K_REG_D2) & 0xFFFF
        ch = m.rw(a6 + 0x6C)
        # хук стоит на ВХОДЕ в подпрограмму ($DF62), а бонус за цепочку
        # прибавляется позже ($DF7C) — значит здесь d1 это чистые камни
        pairs[(d2, d1)] += 1
        chains[ch] += 1

    md.add_code_hook(0x00DF62, on_score)
    session.boot_vs(md)
    bot = Bot(0, P1, seed)
    for i in range(12000):
        b = bot.decide(md)
        if b and i % 2 == 0:
            md.press(0, *b)
        else:
            md.release(0)
        md.release(1)
        md.step_frame()
        if md.stopped:
            break

print("групп x камней -> сколько раз встречалось:")
for (g, j), n in sorted(pairs.items()):
    mark = '   <-- линия ДЛИННЕЕ трёх' if j > g * 3 else ''
    print(f"  групп={g}  камней={j:3}  — {n:3} раз{mark}")
print("\nдлина цепочки -> сколько раз:")
for c, n in sorted(chains.items()):
    print(f"  цепочка {c}: {n} раз")
