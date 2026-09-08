# -*- coding: utf-8 -*-
"""ГДЕ В ОЗУ ПРАВДА ПУСТО. Прошлое допущение ($FFD000 ничей) оказалось ложным:
игра держала там свои числа, счётчик заплатки затирался. Ищем честно —
снимаем ОЗУ на разных кадрах и берём то, что НИ РАЗУ не менялось и осталось
нулём."""
import sys
sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
import session

md = session.new('rom/Columns III (USA).gen')
снимки = []
for кадр in range(1, 1201):
    md.step_frame()
    if кадр in (100, 300, 600, 900, 1200):
        снимки.append(md.ram_snapshot())

нули = bytearray(b'\x01' * len(снимки[0]))
for i in range(len(снимки[0])):
    нули[i] = 1 if all(с[i] == 0 for с in снимки) else 0

# ищем самые длинные подряд идущие нетронутые нули
лучшие, i, n = [], 0, len(нули)
while i < n:
    if нули[i]:
        j = i
        while j < n and нули[j]:
            j += 1
        if j - i >= 64:
            лучшие.append((j - i, i))
        i = j
    else:
        i += 1
лучшие.sort(reverse=True)
print('нетронутые куски ОЗУ (адрес = $FF0000 + смещение):')
for длина, смещ in лучшие[:8]:
    print('   $%06X .. $%06X   %d байт' % (0xFF0000 + смещ, 0xFF0000 + смещ + длина - 1, длина))
