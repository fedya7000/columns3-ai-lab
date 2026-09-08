# Сколько тайлов освобождается под новое небо: те, что рисуют стену и ирисы,
# и НЕ участвуют ни в поле, ни в панелях, ни в спрайтах.
import sys, os, json
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

md = session.new()
session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(400):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()

r = md.vdp_reg
planeA = (r[0x02] & 0x38) << 10
planeB = (r[0x04] & 0x07) << 13
pal = md._palette()

mask = json.load(open(os.path.join(os.path.dirname(__file__), '..',
                                   'shots', 'bg', 'planeb.json')))['mask']

sky, keep = set(), set()
for cy in range(28):
    for cx in range(40):
        a = planeB + (cy * 64 + cx) * 2
        t = ((md.vram[a] << 8) | md.vram[a + 1]) & 0x7FF
        (sky if mask[cy][cx] else keep).add(t)

# всё, что использует план A (поле, цифры, камни) — трогать нельзя
usedA = set()
for cy in range(32):
    for cx in range(64):
        a = planeA + (cy * 64 + cx) * 2
        usedA.add(((md.vram[a] << 8) | md.vram[a + 1]) & 0x7FF)

# спрайты
spr = (r[0x05] & 0x7F) << 9
used_spr = set()
idx = 0
for _ in range(80):
    e = spr + idx * 8
    attr = (md.vram[e + 4] << 8) | md.vram[e + 5]
    szb = md.vram[e + 2]
    t = attr & 0x7FF
    n = (((szb >> 2) & 3) + 1) * ((szb & 3) + 1)
    for k in range(n):
        used_spr.add(t + k)
    idx = md.vram[e + 3] & 0x7F
    if idx == 0:
        break

free = sorted(sky - keep - usedA - used_spr - {0})
print(f"тайлов у неба: {len(sky)}, у поля/панелей: {len(keep)}")
print(f"занято планом A: {len(usedA)}, спрайтами: {len(used_spr)}")
print(f"\nСВОБОДНО ПОД НЕБО: {len(free)} тайлов ({len(free)*32} байт)")
runs = []
cur = []
for t in free:
    if cur and t == cur[-1] + 1:
        cur.append(t)
    else:
        if cur:
            runs.append(cur)
        cur = [t]
if cur:
    runs.append(cur)
print("сплошными кусками:")
for rr in sorted(runs, key=lambda x: -len(x))[:10]:
    print(f"  ${rr[0]:03X}..${rr[-1]:03X}  ({len(rr)} шт)")
json.dump(free, open(os.path.join(os.path.dirname(__file__), '..',
                                  'shots', 'bg', 'free_tiles.json'), 'w'))
