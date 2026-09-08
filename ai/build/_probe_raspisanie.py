# -*- coding: utf-8 -*-
"""Идут ли звуки по расписанию: раз в 300 кадров, номера подряд с $01."""
import sys
sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
from unicorn.m68k_const import UC_M68K_REG_D7
import session

лог = []
md = session.new('build/c3_zvukovoe.gen')
md.add_code_hook(0x3D7A, lambda m, pc: лог.append((m.frame, m.uc.reg_read(UC_M68K_REG_D7) & 0xFF)))
for _ in range(3100):
    if md.stopped:
        print('сорвался на кадре', md.frame)
        break
    md.step_frame()
свои = [(ф, н) for ф, н in лог if ф % 300 <= 2]
чужие = [(ф, н) for ф, н in лог if ф % 300 > 2]
print('кадров: %d, всего звуков: %d' % (md.frame, len(лог)))
print('по расписанию (кратно 300): %d' % len(свои))
for ф, н in свои[:12]:
    print('   кадр %-6d номер $%02X' % (ф, н))
print()
print('посторонних звуков игры: %d %s' % (len(чужие),
      ', '.join('%d:$%02X' % x for x in чужие[:6])))
