import struct
rom = open('rom/Columns III (USA).gen', 'rb').read()
out = []
for v in range(0x60, 0x80, 4):
    out.append('vector $%02X -> $%06X' % (v, struct.unpack('>I', rom[v:v + 4])[0]))
out.append('SP0=$%08X PC0=$%08X' % struct.unpack('>II', rom[0:8]))
open('build/_ox_vektora.txt', 'w').write('\n'.join(out))
print('ok')
