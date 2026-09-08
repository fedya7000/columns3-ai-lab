# -*- coding: utf-8 -*-
"""Контрольная сумма ПЗУ: считаем и чиним.

Сумма Mega Drive: сложение СЛОВ от $200 до конца, младшие 16 бит, лежит в $18E.
Многие игры её проверяют и при расхождении молча встают — снаружи выглядит
как «эмулятор работает, а игра не идёт».
"""
import struct
import sys

sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')


def сумма(rom):
    s = 0
    for i in range(0x200, len(rom) - 1, 2):
        s = (s + struct.unpack('>H', rom[i:i + 2])[0]) & 0xFFFF
    return s


for имя, путь in (('исходное', 'rom/Columns III (USA).gen'),
                  ('с заплаткой', 'build/c3_zvukovoe.gen')):
    rom = bytearray(open(путь, 'rb').read())
    в_шапке = struct.unpack('>H', rom[0x18E:0x190])[0]
    посчитана = сумма(rom)
    print('%-14s в шапке $%04X, посчитана $%04X — %s'
          % (имя, в_шапке, посчитана, 'сходится' if в_шапке == посчитана else 'РАСХОДИТСЯ'))

# чиним сумму у патченого
rom = bytearray(open('build/c3_zvukovoe.gen', 'rb').read())
rom[0x18E:0x190] = struct.pack('>H', сумма(rom))
open('build/c3_zvukovoe.gen', 'wb').write(bytes(rom))
print('сумма патченого исправлена на $%04X' % сумма(rom))
