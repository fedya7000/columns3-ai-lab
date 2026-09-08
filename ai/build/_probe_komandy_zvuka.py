# -*- coding: utf-8 -*-
"""КАКИЕ ЗВУКИ ИГРА ЗАПУСКАЕТ И КОГДА.

$3D7A — подпрограмма постановки звука в очередь, номер приходит в d7
(разобрано в соседнем проекте columns3, tools/sound_ids.py).

Это даёт то, чего не было: ТОЧНЫЕ события звука от самой игры — и музыка,
и эффекты, — без всякой эмуляции Z80. Нам остаётся только знать, как каждый
номер звучит.
"""
import sys
from collections import Counter

sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
from unicorn.m68k_const import UC_M68K_REG_D7
import duel
import md_machine
import train_duel as td

счёт = Counter()
первые = []
ish = md_machine.MD.__init__


def init_s_hukom(self, *a, **kw):
    ish(self, *a, **kw)

    def на_звуке(m, pc):
        н = m.uc.reg_read(UC_M68K_REG_D7) & 0xFF
        счёт[н] += 1
        if len(первые) < 25:
            первые.append((m.frame, н))
    self.add_code_hook(0x3D7A, на_звуке)


md_machine.MD.__init__ = init_s_hukom
боец, гены, _ = td.load('build/net_duel.json')
r = duel.run_duel(боец, боец, layers=0, max_frames=7200, genes_a=гены,
                  genes_b=гены, quiet=True, jitter=25, mnogo_raundov=True)
md_machine.MD.__init__ = ish

print('за две минуты боя игра запустила звуков: %d, разных номеров: %d'
      % (sum(счёт.values()), len(счёт)))
print()
print('%-8s %-8s %s' % ('номер', 'сколько', 'что это, судя по частоте'))
print('-' * 52)
for н, n in счёт.most_common():
    вид = 'мелодия' if н >= 0x80 else 'эффект'
    print('  $%02X    %-8d %s' % (н, n, вид))
print()
print('первые запуски (кадр: номер):')
print('   ' + ', '.join('%d:$%02X' % (ф, н) for ф, н in первые[:18]))
