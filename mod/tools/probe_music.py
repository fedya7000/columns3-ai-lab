# ДИАГНОЗ: какой номер мелодии игра на самом деле просит в бою 1on1.
# Смотрит, что 68000 кладёт в область команд Z80 ($A01C00..) и в ячейку $FF053C,
# через которую едет номер мелодии.
# Запуск: python tools\probe_music.py build\c3_sailor.gen
import sys, os, collections
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait

ROM = sys.argv[1]
md = session.new(ROM)

zapisi = []          # что уехало в Z80
cell = []            # что писали в ячейку номера мелодии


def na_z80(m, addr, size, val, pc):
    zapisi.append((addr, size, val, pc))


def na_cell(m, addr, size, val, pc):
    cell.append((addr, size, val, pc))


md.add_watch(0xA01C00, 0xA01C20, na_z80)
md.add_watch(0x00FF053C, 0x00FF053D, na_cell)

session.boot_vs(md)
_wait(md, 400)

print(f'=== записи в область команд Z80 ($A01C00..): {len(zapisi)} ===')
vidno = collections.Counter()
for addr, size, val, pc in zapisi[:60]:
    print(f'  ${addr:06X} размер={size} значение=${val:02X} из кода ${pc:06X}')
    vidno[val] += 1
print('  какие значения встречались:', {f'${k:02X}': v for k, v in vidno.most_common(12)})

print(f'\n=== записи в ячейку номера мелодии $FF053C: {len(cell)} ===')
for addr, size, val, pc in cell[:30]:
    print(f'  ${addr:06X} размер={size} значение=${val:02X} из кода ${pc:06X}')

print(f'\nсейчас в $FF053C: ${md.rb(0x00FF053C):02X}')
