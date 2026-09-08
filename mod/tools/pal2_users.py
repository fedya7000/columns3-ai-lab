# Кто ещё на экране рисуется ПАЛИТРОЙ 2 (той же, что камни).
# Нужно знать до того, как перекраивать палитру под шесть планет.
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(900):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()

r = md.vdp_reg
planes = {'A': (r[0x02] & 0x38) << 10, 'B': (r[0x04] & 0x07) << 13}
PW = {0: 32, 1: 64, 2: 64, 3: 128}[r[0x10] & 3]

for name, base in planes.items():
    cnt = Counter()
    tiles_by_pal = {p: set() for p in range(4)}
    for i in range(0, 0x2000, 2):
        w = (md.vram[base + i] << 8) | md.vram[base + i + 1]
        t = w & 0x7FF
        p = (w >> 13) & 3
        if t:
            cnt[p] += 1
            tiles_by_pal[p].add(t)
    print(f"план {name}: клеток по палитрам {dict(cnt)}")
    t2 = sorted(tiles_by_pal[2])
    print(f"  тайлы палитры 2: {len(t2)} штук, диапазон "
          f"${min(t2):03X}..${max(t2):03X}" if t2 else "  палитра 2 не используется")
    if t2:
        # какие из них НЕ камни ($100..$117)
        other = [t for t in t2 if not (0x100 <= t <= 0x117)]
        print(f"  из них НЕ камни: {len(other)} -> "
              + (' '.join(f'${t:03X}' for t in other[:24]) if other else 'нет'))

# спрайты
spr = (r[0x05] & 0x7F) << 9
idx, sp = 0, Counter()
for _ in range(80):
    e = spr + idx * 8
    attr = (md.vram[e + 4] << 8) | md.vram[e + 5]
    if attr & 0x7FF:
        sp[(attr >> 13) & 3] += 1
    link = md.vram[e + 3] & 0x7F
    idx = link
    if link == 0:
        break
print(f"спрайты по палитрам: {dict(sp)}")
