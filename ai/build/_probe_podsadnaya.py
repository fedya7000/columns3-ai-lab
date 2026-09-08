# -*- coding: utf-8 -*-
"""Подсадная проверка: тот же прибор на ИСХОДНОМ ПЗУ, где звуки заведомо есть.
Если и там ноль — врёт прибор, а не заплатка."""
import struct
import sys

sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
from unicorn.m68k_const import UC_M68K_REG_D7
import session

for имя, путь in (('исходное', 'rom/Columns III (USA).gen'),
                  ('с заплаткой', 'build/c3_zvukovoe.gen')):
    rom = open(путь, 'rb').read()
    вектор = struct.unpack('>I', rom[0x78:0x7C])[0]
    лог = []
    md = session.new(путь)
    md.add_code_hook(
        0x3D7A,
        lambda m, pc, л=лог: л.append((m.frame, m.uc.reg_read(UC_M68K_REG_D7) & 0xFF)))
    for _ in range(700):
        if md.stopped:
            break
        md.step_frame()
    print('%-14s вектор $78 = $%06X | сорвался: %-5s | звуков за 700 кадров: %d  %s'
          % (имя, вектор, md.stopped, len(лог),
             ', '.join('%d:$%02X' % x for x in лог[:5])))
