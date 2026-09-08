# Точечный просмотр ROM: hex-дамп, дизассемблер, таблица указателей.
#
# python peek.py <rom> hex  <addr> [len]     — байты
# python peek.py <rom> dis  <addr> [count]   — дизассемблер N инструкций
# python peek.py <rom> tab  <addr> [count]   — таблица длинных слов (указатели)
# python peek.py <rom> wtab <addr> [count]   — таблица слов
# python peek.py <rom> find <hex-байты>      — где встречается такая последовательность
import sys, struct
from capstone import Cs, CS_ARCH_M68K, CS_MODE_BIG_ENDIAN, CS_MODE_M68K_000

rom = open(sys.argv[1], 'rb').read()
cmd = sys.argv[2]
md = Cs(CS_ARCH_M68K, CS_MODE_BIG_ENDIAN | CS_MODE_M68K_000)


def A(x):
    return int(x, 16)


if cmd == 'hex':
    a = A(sys.argv[3]); n = int(sys.argv[4], 0) if len(sys.argv) > 4 else 128
    for off in range(a, a + n, 16):
        row = rom[off:off + 16]
        txt = ''.join(chr(c) if 32 <= c < 127 else '.' for c in row)
        print(f"{off:06X}: {row.hex(' '):<48} {txt}")

elif cmd == 'dis':
    a = A(sys.argv[3]); n = int(sys.argv[4], 0) if len(sys.argv) > 4 else 40
    for i in md.disasm(rom[a:a + n * 10], a, count=n):
        print(f"{i.address:06X}: {rom[i.address:i.address+i.size].hex():<16} {i.mnemonic:<10} {i.op_str}")

elif cmd == 'tab':
    a = A(sys.argv[3]); n = int(sys.argv[4], 0) if len(sys.argv) > 4 else 32
    for i in range(n):
        off = a + i * 4
        v = struct.unpack('>I', rom[off:off + 4])[0]
        mark = ''
        if 0x200 <= v < len(rom) and not (v & 1):
            g = list(md.disasm(rom[v:v + 16], v, count=1))
            mark = f"-> {g[0].mnemonic} {g[0].op_str}" if g else "-> ???"
        print(f"[{i:3}] {off:06X}: {v:08X}  {mark}")

elif cmd == 'wtab':
    a = A(sys.argv[3]); n = int(sys.argv[4], 0) if len(sys.argv) > 4 else 32
    for i in range(n):
        off = a + i * 2
        v = struct.unpack('>H', rom[off:off + 2])[0]
        print(f"[{i:3}] {off:06X}: {v:04X}  ({v:5}) ({struct.unpack('>h', rom[off:off+2])[0]:6})")

elif cmd == 'find':
    pat = bytes.fromhex(sys.argv[3].replace(' ', ''))
    i = rom.find(pat)
    cnt = 0
    while i >= 0 and cnt < 60:
        print(f"{i:06X}")
        cnt += 1
        i = rom.find(pat, i + 1)
    print(f"всего: {cnt}{'+' if cnt >= 60 else ''}")
