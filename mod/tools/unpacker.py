# Кто распаковывает графику в буфер $FFA000 и ОТКУДА берёт сжатые данные.
# Это ключ к системе локаций: адрес источника и есть «какой стенд грузим».
import sys, os
from collections import Counter
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait
from unicorn.m68k_const import UC_M68K_REG_A0, UC_M68K_REG_A1, UC_M68K_REG_A2, UC_M68K_REG_A3

md = session.new()
writers = Counter()
first = []


def cb(m, a, size, value, pc):
    writers[pc] += 1
    if len(first) < 6:
        u = m.uc
        first.append((m.frame, pc, a,
                      u.reg_read(UC_M68K_REG_A0), u.reg_read(UC_M68K_REG_A1),
                      u.reg_read(UC_M68K_REG_A2), u.reg_read(UC_M68K_REG_A3)))


md.add_watch(0xFFA000, 0xFFA00F, cb)       # начало буфера распаковки

_wait(md, 300)
_tap(md, 0, 'start'); _wait(md, 60)
_tap(md, 0, 'start'); _wait(md, 120)
_tap(md, 0, 'right'); _wait(md, 20)
_tap(md, 0, 'start'); _wait(md, 120)
_tap(md, 0, 'start'); _wait(md, 150)
_tap(md, 1, 'start'); _wait(md, 120)
_tap(md, 0, 'start'); _wait(md, 200)

print("кто писал в начало буфера $FFA000:")
for pc, n in writers.most_common(8):
    print(f"  PC=${pc:06X} — {n} раз")
print("\nпервые записи (регистры-адреса в этот момент):")
for fr, pc, a, a0, a1, a2, a3 in first:
    print(f"  кадр {fr:5} PC=${pc:06X} -> ${a:06X}   "
          f"a0=${a0:06X} a1=${a1:06X} a2=${a2:06X} a3=${a3:06X}")
