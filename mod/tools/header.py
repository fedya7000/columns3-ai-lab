# Читает заголовок картриджа Mega Drive (лежит по адресу 0x100..0x1FF)
# и вектора прерываний (0x000..0x0FF). Ничего не меняет — только смотрит.
import sys, struct

rom = open(sys.argv[1], 'rb').read()
print(f"размер ROM: {len(rom)} байт = 0x{len(rom):X}")

def s(a, n):
    return rom[a:a+n].decode('ascii', 'replace').rstrip()

# --- вектора 68000 (big-endian, по 4 байта) ---
sp   = struct.unpack('>I', rom[0x00:0x04])[0]
pc   = struct.unpack('>I', rom[0x04:0x08])[0]
hint = struct.unpack('>I', rom[0x70:0x74])[0]
vint = struct.unpack('>I', rom[0x78:0x7C])[0]
print(f"начальный стек SP   = 0x{sp:08X}")
print(f"точка входа   PC   = 0x{pc:08X}   <-- отсюда стартует игра")
print(f"H-Blank (стр.)     = 0x{hint:08X}")
print(f"V-Blank (кадр)     = 0x{vint:08X}   <-- главный тик 60 Гц")

print("-" * 60)
print(f"консоль     : {s(0x100,16)}")
print(f"копирайт    : {s(0x110,16)}")
print(f"название JP : {s(0x120,48)}")
print(f"название INT: {s(0x150,48)}")
print(f"серийник    : {s(0x180,14)}")
chk = struct.unpack('>H', rom[0x18E:0x190])[0]
print(f"контр.сумма : 0x{chk:04X}")
print(f"устройства  : {s(0x190,16)}")
rom_s, rom_e = struct.unpack('>II', rom[0x1A0:0x1A8])
ram_s, ram_e = struct.unpack('>II', rom[0x1A8:0x1B0])
print(f"ROM         : 0x{rom_s:08X}..0x{rom_e:08X}")
print(f"RAM         : 0x{ram_s:08X}..0x{ram_e:08X}")
print(f"SRAM-поле   : {rom[0x1B0:0x1BC].hex(' ')}  ('{s(0x1B0,2)}')")
print(f"модем       : {s(0x1BC,12)}")
print(f"заметка     : {s(0x1C8,40)}")
print(f"регион      : {s(0x1F0,16)}")

# --- честная сумма: слова с 0x200 до конца ---
calc = 0
for i in range(0x200, len(rom), 2):
    calc = (calc + struct.unpack('>H', rom[i:i+2])[0]) & 0xFFFF
print("-" * 60)
print(f"посчитанная сумма = 0x{calc:04X}  {'СОВПАЛА' if calc == chk else 'НЕ СОВПАЛА'}")

# --- хвост: сколько на конце пустоты (куда можно дописывать свой код) ---
pad = 0
for i in range(len(rom) - 1, -1, -1):
    if rom[i] in (0xFF, 0x00):
        pad += 1
    else:
        break
print(f"свободный хвост ROM: {pad} байт (с 0x{len(rom)-pad:X} до конца)")
