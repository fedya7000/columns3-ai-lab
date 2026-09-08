# Список мелодий: объём данных у каждой записи звукового блока.
# Длина = расстояние до следующего указателя. Длинные записи — настоящие темы,
# короткие — джинглы и эффекты. Слушать всё равно ушами, но выбирать проще.
import sys, os, struct

ROM = os.path.join(os.path.dirname(__file__), '..', 'rom', 'Columns III (USA).gen')
rom = open(ROM, 'rb').read()

BLOB = 0x0764A0        # блок грузится в память Z80 по адресу $1000
BASE = 0x1000

ptrs = []
i = 0
while True:
    v = struct.unpack('<H', rom[BLOB + i:BLOB + i + 2])[0]
    if ptrs and v < ptrs[-1]:          # пошло вниз — таблица кончилась
        break
    ptrs.append(v)
    i += 2
print(f"записей в таблице: {len(ptrs)}  (таблица занимает {i} байт)")

sizes = []
for k, p in enumerate(ptrs):
    nxt = ptrs[k + 1] if k + 1 < len(ptrs) else BASE + 0xB58
    sizes.append((k, p, nxt - p))

print("\nномер | адрес Z80 | байт данных | звук, если номер = $80+индекс")
for k, p, n in sizes:
    sid = 0x80 + k
    bar = '#' * min(40, n // 8)
    mark = ''
    if sid == 0x8D:
        mark = '  <-- родная мелодия боя 1on1'
    print(f"  {k:2}  |   ${p:04X}   |   {n:5}   ${sid:02X} {bar}{mark}")

big = sorted(sizes, key=lambda x: -x[2])[:10]
print("\nсамые объёмные записи (скорее всего — полноценные темы):")
for k, p, n in big:
    print(f"  индекс {k:2} (звук ${0x80+k:02X}): {n} байт")
