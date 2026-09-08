# Разбор последовательности нот звукового драйвера Columns III.
#
# Формат (вскрыт по коду Z80, см. docs/SOSTOYANIE.md):
#   $80        — пауза
#   $81..$DF   — нота, номер полутона = байт - $81 (октава = /12, ступень = %12)
#   < $80      — длительность предыдущей ноты
#   $E0..$FF   — команда; важные: $F6 переход, $F7 повтор, $F8 вызов, $F9 возврат
#
# python seq_decode.py <номер_записи> [сколько_байт]
import sys, os, struct

ROM = os.environ.get(
    'C3_ROM',
    os.path.join(os.path.dirname(__file__), '..', 'rom', 'Columns III (USA).gen'))
rom = open(ROM, 'rb').read()
BLOB, BASE = 0x0764A0, 0x1000

NOTE = ['до', 'до#', 'ре', 'ре#', 'ми', 'фа', 'фа#', 'соль', 'соль#', 'ля', 'ля#', 'си']
CMD_ARGS = {  # сколько байт аргументов у команды (что разобрано)
    0xF6: 2, 0xF7: 4, 0xF8: 2, 0xF9: 0,
}


def z2r(a):
    return BLOB + (a - BASE)


def ptrs():
    out, i = [], 0
    while True:
        v = struct.unpack('<H', rom[BLOB + i:BLOB + i + 2])[0]
        if out and v < out[-1]:
            break
        out.append(v)
        i += 2
    return out


def decode(addr, limit=200):
    """Разбирает поток начиная с адреса Z80."""
    a = addr
    lines = []
    for _ in range(limit):
        b = rom[z2r(a)]
        if b >= 0xE0:
            n = CMD_ARGS.get(b, 1)
            args = rom[z2r(a) + 1:z2r(a) + 1 + n]
            txt = f"КОМАНДА ${b:02X}"
            if b == 0xF6 and n == 2:
                tgt = struct.unpack('<H', args)[0]
                txt = f"ПЕРЕХОД на ${tgt:04X}   <-- зацикливание"
            elif b == 0xF7:
                tgt = struct.unpack('<H', args[2:4])[0]
                txt = f"ПОВТОР {args[1]} раз на ${tgt:04X} (слот {args[0]})"
            elif b == 0xF8:
                txt = f"ВЫЗОВ ${struct.unpack('<H', args)[0]:04X}"
            elif b == 0xF9:
                txt = "ВОЗВРАТ"
            lines.append((a, rom[z2r(a):z2r(a) + 1 + n], txt))
            a += 1 + n
            if b in (0xF6, 0xF9):
                break
        elif b == 0x80:
            lines.append((a, rom[z2r(a):z2r(a) + 1], "пауза"))
            a += 1
        elif b >= 0x81:
            s = b - 0x81
            lines.append((a, rom[z2r(a):z2r(a) + 1],
                          f"нота {NOTE[s % 12]}{s // 12}  (полутон {s})"))
            a += 1
        else:
            lines.append((a, rom[z2r(a):z2r(a) + 1], f"длительность {b}"))
            a += 1
    return lines


if __name__ == '__main__' and sys.argv[1].startswith('@'):
    # разбор с ПРОИЗВОЛЬНОГО адреса Z80: seq_decode.py @139F 40
    addr = int(sys.argv[1][1:], 16)
    lim = int(sys.argv[2]) if len(sys.argv) > 2 else 40
    print(f"поток с ${addr:04X} (в ROM ${z2r(addr):06X}):")
    for a, bs, txt in decode(addr, lim):
        print(f"  ${a:04X}: {bs.hex(' '):<14} {txt}")
    sys.exit(0)

if __name__ == '__main__':
    p = ptrs()
    idx = int(sys.argv[1], 0)
    lim = int(sys.argv[2]) if len(sys.argv) > 2 else 60
    start = p[idx]
    end = p[idx + 1] if idx + 1 < len(p) else BASE + 0xB58
    print(f"запись {idx} (звук ${0x80 + idx:02X}): Z80 ${start:04X}..${end - 1:04X}, "
          f"{end - start} байт, в ROM ${z2r(start):06X}")
    raw = rom[z2r(start):z2r(end)]
    print("сырые байты:")
    for i in range(0, len(raw), 16):
        print("   " + raw[i:i + 16].hex(' '))
    print("\nразбор потока с начала записи:")
    for a, bs, txt in decode(start, lim):
        print(f"  ${a:04X}: {bs.hex(' '):<14} {txt}")
