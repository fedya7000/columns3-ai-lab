# Дизассемблер Z80 — вторым процессором в Mega Drive заведует звук, и его код
# capstone не понимает. Нужен, чтобы вскрыть формат нот у звукового драйвера.
#
# python z80dis.py <rom> <смещение_в_rom_hex> <длина_hex> [<адрес_z80_hex>]
#   адрес_z80 — куда этот кусок грузится в память Z80 (по умолчанию 0)
import sys

R = ['b', 'c', 'd', 'e', 'h', 'l', '(hl)', 'a']
RP = ['bc', 'de', 'hl', 'sp']
RP2 = ['bc', 'de', 'hl', 'af']
CC = ['nz', 'z', 'nc', 'c', 'po', 'pe', 'p', 'm']
ALU = ['add a,', 'adc a,', 'sub ', 'sbc a,', 'and ', 'xor ', 'or ', 'cp ']
ROT = ['rlc', 'rrc', 'rl', 'rr', 'sla', 'sra', 'sll', 'srl']


def _d(b):
    return b - 256 if b >= 128 else b


def decode(mem, pos, pc):
    """Возвращает (текст, длина). mem — байты, pos — смещение в них, pc — адрес Z80."""
    start = pos
    op = mem[pos]; pos += 1
    idx = None          # префикс dd/fd: замена hl на ix/iy
    if op in (0xDD, 0xFD):
        idx = 'ix' if op == 0xDD else 'iy'
        op = mem[pos]; pos += 1

    def rname(i):
        if idx and i == 6:
            d = _d(mem[pos])
            return f'({idx}{d:+d})', 1
        if idx and i in (4, 5):
            return (idx + 'h' if i == 4 else idx + 'l'), 0
        return R[i], 0

    def rpname(i):
        n = RP[i]
        return idx if (idx and n == 'hl') else n

    def imm8():
        return mem[pos]

    def imm16():
        return mem[pos] | (mem[pos + 1] << 8)

    # --- префикс CB: сдвиги и биты ---
    if op == 0xCB:
        if idx:
            d = _d(mem[pos]); pos += 1
            op2 = mem[pos]; pos += 1
            tgt = f'({idx}{d:+d})'
        else:
            op2 = mem[pos]; pos += 1
            tgt = R[op2 & 7]
        x, y = op2 >> 6, (op2 >> 3) & 7
        if x == 0:
            return f'{ROT[y]} {tgt}', pos - start
        return f'{["", "bit", "res", "set"][x]} {y},{tgt}', pos - start

    # --- префикс ED ---
    if op == 0xED:
        op2 = mem[pos]; pos += 1
        x, y, z = op2 >> 6, (op2 >> 3) & 7, op2 & 7
        if x == 1:
            if z == 0:
                return f'in {R[y]},(c)', pos - start
            if z == 1:
                return f'out (c),{R[y]}', pos - start
            if z == 2:
                return f'{"sbc" if not (y & 1) else "adc"} hl,{RP[y >> 1]}', pos - start
            if z == 3:
                a = imm16(); pos += 2
                return (f'ld (${a:04x}),{RP[y >> 1]}' if not (y & 1)
                        else f'ld {RP[y >> 1]},(${a:04x})'), pos - start
            if z == 4:
                return 'neg', pos - start
            if z == 5:
                return 'retn' if y != 1 else 'reti', pos - start
            if z == 6:
                return f'im {[0, 0, 1, 2, 0, 0, 1, 2][y]}', pos - start
            names = ['ld i,a', 'ld r,a', 'ld a,i', 'ld a,r', 'rrd', 'rld', 'nop', 'nop']
            return names[y], pos - start
        if x == 2 and z < 4 and y >= 4:
            tbl = {(4, 0): 'ldi', (4, 1): 'cpi', (4, 2): 'ini', (4, 3): 'outi',
                   (5, 0): 'ldd', (5, 1): 'cpd', (5, 2): 'ind', (5, 3): 'outd',
                   (6, 0): 'ldir', (6, 1): 'cpir', (6, 2): 'inir', (6, 3): 'otir',
                   (7, 0): 'lddr', (7, 1): 'cpdr', (7, 2): 'indr', (7, 3): 'otdr'}
            return tbl[(y, z)], pos - start
        return f'db $ed,${op2:02x}', pos - start

    x, y, z = op >> 6, (op >> 3) & 7, op & 7
    p, q = y >> 1, y & 1

    if x == 0:
        if z == 0:
            if y == 0:
                return 'nop', pos - start
            if y == 1:
                return "ex af,af'", pos - start
            if y == 2:
                d = _d(mem[pos]); pos += 1
                return f'djnz ${pc + (pos - start) + d:04x}', pos - start
            d = _d(mem[pos]); pos += 1
            tgt = f'${pc + (pos - start) + d:04x}'
            return (f'jr {tgt}' if y == 3 else f'jr {CC[y - 4]},{tgt}'), pos - start
        if z == 1:
            if q == 0:
                v = imm16(); pos += 2
                return f'ld {rpname(p)},${v:04x}', pos - start
            return f'add {rpname(2)},{rpname(p)}', pos - start
        if z == 2:
            if q == 0:
                if p == 0:
                    return 'ld (bc),a', pos - start
                if p == 1:
                    return 'ld (de),a', pos - start
                a = imm16(); pos += 2
                return (f'ld (${a:04x}),{rpname(2)}' if p == 2
                        else f'ld (${a:04x}),a'), pos - start
            if p == 0:
                return 'ld a,(bc)', pos - start
            if p == 1:
                return 'ld a,(de)', pos - start
            a = imm16(); pos += 2
            return (f'ld {rpname(2)},(${a:04x})' if p == 2
                    else f'ld a,(${a:04x})'), pos - start
        if z == 3:
            return f'{"inc" if q == 0 else "dec"} {rpname(p)}', pos - start
        if z in (4, 5):
            nm, extra = rname(y)
            pos += extra
            return f'{"inc" if z == 4 else "dec"} {nm}', pos - start
        if z == 6:
            nm, extra = rname(y)
            pos += extra
            v = imm8(); pos += 1
            return f'ld {nm},${v:02x}', pos - start
        return ['rlca', 'rrca', 'rla', 'rra', 'daa', 'cpl', 'scf', 'ccf'][y], pos - start

    if x == 1:
        if z == 6 and y == 6:
            return 'halt', pos - start
        dn, e1 = rname(y)
        pos += e1
        sn, e2 = rname(z)
        if e1 == 0:
            pos += e2
        return f'ld {dn},{sn}', pos - start

    if x == 2:
        nm, extra = rname(z)
        pos += extra
        return f'{ALU[y]}{nm}', pos - start

    # x == 3
    if z == 0:
        return f'ret {CC[y]}', pos - start
    if z == 1:
        if q == 0:
            return f'pop {idx if (idx and RP2[p] == "hl") else RP2[p]}', pos - start
        return ['ret', "exx", f'jp ({rpname(2)})', f'ld sp,{rpname(2)}'][p], pos - start
    if z == 2:
        a = imm16(); pos += 2
        return f'jp {CC[y]},${a:04x}', pos - start
    if z == 3:
        if y == 0:
            a = imm16(); pos += 2
            return f'jp ${a:04x}', pos - start
        if y == 2:
            v = imm8(); pos += 1
            return f'out (${v:02x}),a', pos - start
        if y == 3:
            v = imm8(); pos += 1
            return f'in a,(${v:02x})', pos - start
        return ['', '', '', '', f'ex (sp),{rpname(2)}', 'ex de,hl',
                'di', 'ei'][y], pos - start
    if z == 4:
        a = imm16(); pos += 2
        return f'call {CC[y]},${a:04x}', pos - start
    if z == 5:
        if q == 0:
            return f'push {idx if (idx and RP2[p] == "hl") else RP2[p]}', pos - start
        a = imm16(); pos += 2
        return f'call ${a:04x}', pos - start
    if z == 6:
        v = imm8(); pos += 1
        return f'{ALU[y]}${v:02x}', pos - start
    return f'rst ${y * 8:02x}', pos - start


def main():
    rom = open(sys.argv[1], 'rb').read()
    off = int(sys.argv[2], 16)
    ln = int(sys.argv[3], 16)
    base = int(sys.argv[4], 16) if len(sys.argv) > 4 else 0
    mem = rom[off:off + ln]
    i = 0
    while i < len(mem):
        pc = base + i
        try:
            txt, n = decode(mem, i, pc)
        except IndexError:
            break
        raw = mem[i:i + n].hex()
        print(f"{pc:04X}: {raw:<12} {txt}")
        i += max(1, n)


if __name__ == '__main__':
    main()
