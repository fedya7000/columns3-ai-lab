# Таблица наборов цветов $D5CC: запись = 32 байта, номер набора = +0xB0.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
ROM = os.path.join(os.path.dirname(__file__), '..', 'rom', 'Columns III (USA).gen')
data = open(ROM, 'rb').read()
BASE = 0xD5CC
for lvl in range(8):
    rec = data[BASE + lvl * 32: BASE + lvl * 32 + 32]
    cnt = {}
    for b in rec:
        cnt[b] = cnt.get(b, 0) + 1
    print('набор %d: %s' % (lvl, ' '.join('%d' % b for b in rec)))
    print('          частоты: %s' % sorted(cnt.items()))
