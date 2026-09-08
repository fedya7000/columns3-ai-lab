# -*- coding: utf-8 -*-
"""КАЖДАЯ КНОПКА — ОТДЕЛЬНЫМ ЗАХОДОМ, от чистого входа в SOUND TEST.

Прошлый прогон жал всё подряд в одном заходе: курсор уезжал, и «тишина»
у кнопок означала лишь то, что они жались не на том пункте.
"""
import sys
sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
from unicorn.m68k_const import UC_M68K_REG_D7
import session
from session import _tap, _wait


def заход(кнопка, раз=5):
    звуки = []
    md = session.new()
    md.add_code_hook(0x3D7A,
                     lambda m, pc: звуки.append(m.uc.reg_read(UC_M68K_REG_D7) & 0xFF))
    _wait(md, 300)
    _tap(md, 0, 'start'); _wait(md, 60)
    _tap(md, 0, 'start'); _wait(md, 120)
    for _ in range(3):
        _tap(md, 0, 'right'); _wait(md, 20)
    _tap(md, 0, 'down'); _wait(md, 20)
    _tap(md, 0, 'start'); _wait(md, 200)
    звуки.clear()
    for _ in range(раз):
        _tap(md, 0, кнопка)
        _wait(md, 90)
    print('  %-6s x%d -> %s' % (кнопка, раз,
                                ', '.join('$%02X' % з for з in звуки) or 'тишина'))


print('от чистого входа, курсор на BGM:')
for к in ('a', 'b', 'c', 'start', 'up', 'down'):
    заход(к)
