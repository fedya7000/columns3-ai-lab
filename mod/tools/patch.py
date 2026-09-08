# Сборка изменённого ROM: накладывает правки, чинит контрольную сумму, проверяет.
#
# ВАЖНО: Columns III САМ проверяет контрольную сумму на старте (код на $000DBA:
# складывает все слова с $200 и сравнивает с $18E). Не совпало — вечный цикл с
# красным экраном. Поэтому сумму надо пересчитывать ВСЕГДА.
#
# Правки описываются в файле-рецепте (python): список PATCHES = [(адрес, байты, 'зачем')]
#
# python patch.py <исходный_rom> <рецепт.py> <выходной_rom>
import sys, os, struct, importlib.util
from capstone import Cs, CS_ARCH_M68K, CS_MODE_BIG_ENDIAN, CS_MODE_M68K_000

md = Cs(CS_ARCH_M68K, CS_MODE_BIG_ENDIAN | CS_MODE_M68K_000)


def load_recipe(path):
    spec = importlib.util.spec_from_file_location('recipe', path)
    m = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(m)
    return m.PATCHES


def dis(data, addr, nbytes):
    out = []
    for i in md.disasm(bytes(data[addr:addr + nbytes]), addr):
        out.append(f"{i.address:06X}: {i.mnemonic:<9} {i.op_str}")
    return out


def fix_checksum(rom):
    s = 0
    for i in range(0x200, len(rom), 2):
        s = (s + struct.unpack('>H', rom[i:i + 2])[0]) & 0xFFFF
    rom[0x18E:0x190] = struct.pack('>H', s)
    return s


def main():
    src, recipe, dst = sys.argv[1], sys.argv[2], sys.argv[3]
    rom = bytearray(open(src, 'rb').read())
    orig = bytes(rom)
    patches = load_recipe(recipe)

    # СТОРОЖ НАЛОЖЕНИЙ: две правки, налезающие друг на друга, — это молча
    # испорченный код. Ловим до записи файла.
    spans = sorted((a, a + len(bytes(d)), w) for a, d, w in patches)
    for (a1, e1, w1), (a2, e2, w2) in zip(spans, spans[1:]):
        if a2 < e1:
            raise SystemExit(
                f"ПРАВКИ НАЛЕЗАЮТ ДРУГ НА ДРУГА:\n"
                f"  ${a1:06X}..${e1-1:06X}  {w1}\n"
                f"  ${a2:06X}..${e2-1:06X}  {w2}\n"
                f"  перекрытие {e1 - a2} байт — раздвинь адреса")

    for addr, data, why in patches:
        data = bytes(data)
        print(f"\n=== ${addr:06X}  ({len(data)} байт)  — {why} ===")
        print("  БЫЛО:")
        for L in dis(orig, addr, max(len(data), 8))[:6]:
            print("   ", L)
        rom[addr:addr + len(data)] = data
        print("  СТАЛО:")
        for L in dis(rom, addr, max(len(data), 8))[:6]:
            print("   ", L)

    old = struct.unpack('>H', orig[0x18E:0x190])[0]
    new = fix_checksum(rom)
    print(f"\nконтрольная сумма: ${old:04X} -> ${new:04X}")
    open(dst, 'wb').write(bytes(rom))
    print(f"записан {dst}  ({len(rom)} байт)")
    diff = sum(1 for i in range(len(rom)) if rom[i] != orig[i])
    print(f"изменено байт всего: {diff}")


if __name__ == '__main__':
    main()
