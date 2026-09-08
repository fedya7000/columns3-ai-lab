# -*- coding: utf-8 -*-
"""Исполняется ли заплатка и доходит ли дело до прежнего обработчика."""
import sys
sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
import session

счёт = {'заплатка': 0, 'прежний': 0}
md = session.new('build/c3_zvukovoe.gen')
md.add_code_hook(0x07A386, lambda m, pc: счёт.__setitem__('заплатка', счёт['заплатка'] + 1))
md.add_code_hook(0x000208, lambda m, pc: счёт.__setitem__('прежний', счёт['прежний'] + 1))
for _ in range(400):
    if md.stopped:
        break
    md.step_frame()
print('кадров: %d, сорвался: %s' % (md.frame, md.stopped))
print('заплатка исполнялась: %d раз' % счёт['заплатка'])
print('прежний обработчик:  %d раз' % счёт['прежний'])
print()
md2 = session.new('rom/Columns III (USA).gen')
c = {'n': 0}
md2.add_code_hook(0x000208, lambda m, pc: c.__setitem__('n', c['n'] + 1))
for _ in range(400):
    md2.step_frame()
print('для сравнения, ИСХОДНОЕ ПЗУ: обработчик $000208 сработал %d раз' % c['n'])
