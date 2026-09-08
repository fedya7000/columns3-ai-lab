# Ищет в структуре игрока байты, которых НИКТО не касается за весь раунд, —
# туда можно безопасно положить свои очки.
# Заодно проверяет, обнуляются ли они при подготовке нового раунда.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

md = session.new()
touched = set()


def cb(m, a, size, value, pc):
    # считаем ТОЛЬКО записи во время самой игры: между раундами игра чистит
    # структуру целиком, и это как раз то, что нам нужно (само обнулится)
    if m.rw(0xFF0406) != 0x20:
        return
    for k in range(size):
        touched.add((a + k) - 0xFF1000)


# хук ставим ДО загрузки: движок кеширует оттранслированный код, и хук,
# поставленный позже, не увидит уже пройденные места (проверено на $3980)
md.add_watch(0xFF1000, 0xFF13FF, cb)
session.boot_vs(md)

bot = Bot(0, P1, 5)
before_reset = None
after_reset = None
prev_mode = 0x20
for i in range(30000):
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
    m = md.rw(0xFF0406)
    if m != prev_mode:
        if m == 0x1C:                      # подготовка нового раунда
            before_reset = bytes(md.uc.mem_read(P1, 0x400))
        if prev_mode == 0x1C and m == 0x20:
            after_reset = bytes(md.uc.mem_read(P1, 0x400))
            break
        prev_mode = m

free = [o for o in range(0x400) if o not in touched]
print(f"тронуто байт: {len(touched)} из 1024")
# длинные непрерывные свободные куски
runs = []
cur = []
for o in free:
    if cur and o == cur[-1] + 1:
        cur.append(o)
    else:
        if len(cur) >= 4:
            runs.append(cur)
        cur = [o]
if len(cur) >= 4:
    runs.append(cur)
print("\nсвободные куски (>=4 байт):")
for r in sorted(runs, key=lambda x: -len(x))[:15]:
    tag = ''
    if before_reset and after_reset:
        z = all(after_reset[o] == 0 for o in r)
        tag = 'обнуляется при новом раунде' if z else 'НЕ обнуляется'
    print(f"  +0x{r[0]:03X}..+0x{r[-1]:03X}  ({len(r)} байт)  {tag}")
