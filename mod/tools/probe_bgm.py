# ДИАГНОЗ: какие номера ЗВУКА игра шлёт драйверу и что из них МУЗЫКА.
# Разделение узнано из кода драйвера: номер темы = ID - $81, тем 31,
# то есть ID $81..$9F — музыка, всё выше — эффекты.
# Запуск: python tools\probe_bgm.py <rom> [ещё_кадров]
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _wait

ROM = sys.argv[1]
EXTRA = int(sys.argv[2]) if len(sys.argv) > 2 else 600

sob = []


def na_z80(m, addr, size, val, pc):
    if addr & 0xFFFFFF == 0xA01C0A:
        sob.append(val)


md = session.new(ROM)
md.add_watch(0xA01C0A, 0xA01C0A, na_z80)
session.boot_vs(md)
mark = len(sob)
_wait(md, EXTRA)

print(f'файл: {os.path.basename(ROM)}')
print('порядок заявок звука (| = начало боя):')
line = []
for i, v in enumerate(sob):
    if i == mark:
        line.append('|')
    kind = 'МУЗЫКА' if 0x81 <= v <= 0x9F else 'эффект'
    line.append(f'{v:02X}({kind[0]})')
print('  ' + ' '.join(line))

muz = [v for v in sob if 0x81 <= v <= 0x9F]
print(f'\nвсего заявок: {len(sob)}, из них музыки: {len(muz)}')
if muz:
    print(f'ПОСЛЕДНЯЯ музыка = ${muz[-1]:02X}  ->  тема номер {muz[-1] - 0x81}')
else:
    print('музыку не просили ни разу')
