# -*- coding: utf-8 -*-
"""ЧЕМ ИГРА ДЕЛАЕТ ЗВУК. Считаем обращения 68000 к звуковым адресам:
  $A04000..$A04003 — YM2612 (шесть FM-каналов, сложный);
  $C00011          — PSG (три квадрата и шум, простой);
  $A00000..$A0FFFF — память Z80 (значит музыку играет Z80, и его надо
                     эмулировать целиком).
От того, кто из них работает, зависит, дешёвый путь или дорогой.
"""
import sys
from collections import Counter
sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
import duel, md_machine, train_duel as td

счёт = Counter()
ish = md_machine.MD.__init__


def init_s_yarlykom(self, *a, **kw):
    ish(self, *a, **kw)

    def cb(md, adr, size, value, pc):
        if 0xA04000 <= adr <= 0xA04003:
            счёт['YM2612 (FM)'] += 1
        elif adr == 0xC00011:
            счёт['PSG'] += 1
        elif 0xA00000 <= adr <= 0xA0FFFF:
            счёт['память Z80'] += 1
        elif 0xA11100 <= adr <= 0xA11200:
            счёт['захват/сброс шины Z80'] += 1
    self.add_watch(0xA00000, 0xA04003, cb)
    self.add_watch(0xA11100, 0xA11200, cb)
    self.add_watch(0xC00010, 0xC00011, cb)


md_machine.MD.__init__ = init_s_yarlykom
боец, гены, _ = td.load('build/net_duel.json')
duel.run_duel(боец, боец, layers=0, max_frames=3000, genes_a=гены, genes_b=гены,
              quiet=True, jitter=25)
md_machine.MD.__init__ = ish

print('за 3000 кадров боя 68000 обратился:')
if not счёт:
    print('   никуда — звук эта игра с 68000 не трогает вовсе')
for имя, n in счёт.most_common():
    print('   %-24s %d раз' % (имя, n))
