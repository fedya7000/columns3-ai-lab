# -*- coding: utf-8 -*-
"""УПРАВЛЕНИЕ SOUND TEST — по номерам звуков, а не по экрану.

Прошлая проба считала шаги неверно и показала «звуков нет» там, где они были.
Здесь считаем честно: запоминаем длину списка ДО нажатия и печатаем всё, что
добавилось ПОСЛЕ.
"""
import sys
sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
from unicorn.m68k_const import UC_M68K_REG_D7
import session
from session import _tap, _wait

звуки = []
md = session.new()
md.add_code_hook(0x3D7A, lambda m, pc: звуки.append(m.uc.reg_read(UC_M68K_REG_D7) & 0xFF))


def шаг(кнопка, раз=1, ждать=70):
    было = len(звуки)
    for _ in range(раз):
        _tap(md, 0, кнопка)
        _wait(md, ждать)
    новые = звуки[было:]
    print('  %-6s x%-2d -> %s' % (кнопка, раз,
                                  ', '.join('$%02X' % з for з in новые) or 'тишина'))
    return новые


_wait(md, 300)
_tap(md, 0, 'start'); _wait(md, 60)
_tap(md, 0, 'start'); _wait(md, 120)
for _ in range(3):
    _tap(md, 0, 'right'); _wait(md, 20)
_tap(md, 0, 'down'); _wait(md, 20)
_tap(md, 0, 'start'); _wait(md, 200)
звуки.clear()
print('вошли в SOUND TEST, курсор на BGM')
for кнопка in ('up', 'down', 'a', 'b', 'c', 'start'):
    шаг(кнопка, 4)
