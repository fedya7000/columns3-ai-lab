# -*- coding: utf-8 -*-
"""РАЗБОР SOUND TEST: какие кнопки им управляют и какой номер уходит в драйвер.

Звука у нас нет, зато есть хук $3D7A — он показывает НОМЕР запрошенного звука.
Этого хватит, чтобы подписать записи, которые потом снимем в RetroArch.
"""
import os
import sys

sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
from unicorn.m68k_const import UC_M68K_REG_D7
import session
from session import _tap, _wait

ШОТЫ = 'shots/sound_test'
os.makedirs(ШОТЫ, exist_ok=True)
звуки = []
n = [0]

md = session.new()


def на_звуке(m, pc):
    звуки.append((m.frame, m.uc.reg_read(UC_M68K_REG_D7) & 0xFF))


md.add_code_hook(0x3D7A, на_звуке)


def снять(тег):
    n[0] += 1
    путь = os.path.join(ШОТЫ, '%02d_%s.png' % (n[0], тег))
    md.render(путь)
    новые = [з for з in звуки if з[0] > снять.метка]
    снять.метка = md.frame
    print('  %-22s звуков за шаг: %s' % (тег, ', '.join('$%02X' % з[1] for з in новые) or '—'))


снять.метка = 0

# до меню режимов и в TEST MODE (последний пункт: вправо до конца, потом вниз)
_wait(md, 300)
_tap(md, 0, 'start'); _wait(md, 60)
_tap(md, 0, 'start'); _wait(md, 120)
for _ in range(3):
    _tap(md, 0, 'right'); _wait(md, 20)
_tap(md, 0, 'down'); _wait(md, 20)
_tap(md, 0, 'start'); _wait(md, 180)
снять('вошли')

# перебираем кнопки и смотрим, что меняется
for кнопка in ('right', 'left', 'up', 'down', 'a', 'b', 'c', 'start'):
    _tap(md, 0, кнопка); _wait(md, 60)
    снять(кнопка)

print()
print('всего звуков за прогон: %d' % len(звуки))
print('последние: ' + ', '.join('%d:$%02X' % з for з in звуки[-10:]))
