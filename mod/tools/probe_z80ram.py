# ДИАГНОЗ: доехала ли своя мелодия в память Z80 и стоит ли переход в канале.
# Память Z80 у нас отображена в $A00000, так что после загрузки её видно прямо.
# Запуск: python tools\probe_z80ram.py build\c3_sailor.gen
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _wait

ROM = sys.argv[1]
md = session.new(ROM)
session.boot_vs(md)
_wait(md, 200)

Z = 0xA00000


def dump(z80addr, n, tag):
    b = bytes(md.rb(Z + z80addr + i) for i in range(n))
    print(f'  Z80 ${z80addr:04X} {tag}:')
    for i in range(0, n, 16):
        print('     ' + b[i:i + 16].hex(' '))
    return b


print('=== что лежит в памяти Z80 после загрузки ===')
dump(0x1000, 16, 'начало таблицы мелодий')
a = dump(0x138F, 32, 'запись мелодии $8D (шапка + данные)')
b = dump(0x1B58, 32, 'ХВОСТ — сюда я клал свою мелодию')

print('\n=== выводы ===')
print(f'  канал 1 начинается с: {a[16:19].hex(" ")}  '
      f'{"ПЕРЕХОД НА МЕСТЕ" if a[16] == 0xF6 else "перехода НЕТ"}')
nonempty = any(x not in (0x00, 0xFF) for x in b)
print(f'  хвост $1B58: {"мелодия доехала" if nonempty else "ПУСТО — блок НЕ скопирован так далеко"}')
