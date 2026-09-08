# Рекурсивный дизассемблер Mega Drive ROM.
#
# Что делает: идёт ПО ХОДУ ВЫПОЛНЕНИЯ от точки входа и от векторов прерываний,
# переходя по всем bra/bcc/bsr/jsr/jmp, которые может вычислить статически.
# Так отделяется настоящий код от данных (графики, таблиц, музыки).
#
# Зачем не линейно: линейный дамп 512 КБ дал бы кашу — данные декодируются как
# случайные инструкции, и найти в этом логику игры невозможно.
#
# Выход: три файла
#   *.asm   — дизассемблер найденного кода, по функциям
#   *.subs  — список найденных подпрограмм (адрес, сколько раз зовут, кто зовёт)
#   *.ram   — карта обращений к RAM (0xFFxxxx) и к железу (VDP/звук/джойстики)
import sys, struct, json, re
from collections import defaultdict
from capstone import Cs, CS_ARCH_M68K, CS_MODE_BIG_ENDIAN, CS_MODE_M68K_000

ROM_PATH = sys.argv[1]
OUT_BASE = sys.argv[2]

rom = open(ROM_PATH, 'rb').read()
N = len(rom)

md = Cs(CS_ARCH_M68K, CS_MODE_BIG_ENDIAN | CS_MODE_M68K_000)
md.detail = True

# --- что известно про адреса железа Mega Drive ---
HW = {
    0xA10000: "версия консоли", 0xA10002: "джойстик1 данные", 0xA10004: "джойстик2 данные",
    0xA10006: "порт-EXT данные", 0xA10008: "джойстик1 режим", 0xA1000A: "джойстик2 режим",
    0xA1000C: "порт-EXT режим", 0xA11100: "Z80 шина", 0xA11200: "Z80 сброс",
    0xA00000: "Z80 RAM", 0xA04000: "YM2612 порт", 0xA04001: "YM2612 данные",
    0xC00000: "VDP данные", 0xC00002: "VDP данные", 0xC00004: "VDP управление",
    0xC00006: "VDP управление", 0xC00008: "VDP счётчик луча", 0xC00011: "PSG звук",
}

code_start = set()          # адреса, с которых начинается блок кода
seen = set()                # уже разобранные адреса инструкций
subs = defaultdict(set)     # адрес подпрограммы -> кто её зовёт
insn_at = {}                # адрес -> (мнемоника, операнды, длина)
ram_refs = defaultdict(set) # адрес RAM -> где обращаются
hw_refs = defaultdict(set)  # адрес железа -> где обращаются
bad = set()                 # адреса, где дизассемблер споткнулся

# инструкции, после которых поток НЕ продолжается на следующий адрес
STOP = {'rts', 'rte', 'rtr', 'jmp', 'bra', 'bras', 'braw', 'illegal', 'reset', 'stop'}


def read_targets(ins):
    """Достаёт из инструкции адрес перехода/вызова, если он вычислим статически."""
    ops = ins.op_str
    outs = []
    # абсолютный адрес: $12345 или 0x12345
    for m in re.finditer(r'\$(?:0x)?([0-9a-fA-F]+)', ops):
        try:
            outs.append(int(m.group(1), 16))
        except ValueError:
            pass
    return outs


def note_mem(ins):
    """Записывает обращения к RAM и к железу."""
    a = ins.address
    for m in re.finditer(r'\$(?:0x)?([0-9a-fA-F]+)', ins.op_str):
        v = int(m.group(1), 16)
        # 68000 знаковое расширение слова: $FFxxxx часто пишется как $FFFFxxxx
        if 0xFFFF0000 <= v <= 0xFFFFFFFF:
            v &= 0xFFFFFF
        if 0xFF0000 <= v <= 0xFFFFFF:
            ram_refs[v].add(a)
        elif 0xA00000 <= v <= 0xC00020:
            hw_refs[v].add(a)


def trace(start, caller=None):
    """Разбирает один линейный кусок кода от start до первой останавливающей инструкции."""
    work = [start]
    while work:
        pc = work.pop()
        if pc in seen or pc >= N or pc < 0 or pc & 1:
            continue
        code_start.add(pc)
        while pc < N and pc not in seen and not (pc & 1):
            chunk = rom[pc:pc + 16]
            got = list(md.disasm(chunk, pc, count=1))
            if not got:
                bad.add(pc)
                break
            ins = got[0]
            seen.add(pc)
            insn_at[pc] = (ins.mnemonic, ins.op_str, ins.size)
            note_mem(ins)
            mn = ins.mnemonic.lower()
            base = mn.split('.')[0]

            tgts = read_targets(ins)
            if base in ('bsr', 'jsr'):
                for t in tgts:
                    if 0 <= t < N:
                        subs[t].add(pc)
                        work.append(t)
            elif base.startswith('b') and base != 'bset' and base != 'bclr' and base != 'btst' and base != 'bchg':
                for t in tgts:
                    if 0 <= t < N:
                        work.append(t)
            elif base == 'jmp':
                for t in tgts:
                    if 0 <= t < N:
                        work.append(t)

            if base in STOP or mn in STOP:
                break
            pc += ins.size


# --- стартовые точки: точка входа + все 64 вектора исключений ---
roots = []
entry = struct.unpack('>I', rom[4:8])[0]
roots.append(('точка входа', entry))
VEC_NAMES = {0x08: 'шина', 0x0C: 'адрес', 0x10: 'неверная инструкция', 0x14: 'делен.на 0',
             0x18: 'CHK', 0x1C: 'TRAPV', 0x20: 'привилегия', 0x24: 'трассировка',
             0x70: 'H-Blank', 0x78: 'V-Blank'}
for v in range(0x08, 0x100, 4):
    t = struct.unpack('>I', rom[v:v + 4])[0]
    if 0x200 <= t < N and not (t & 1):
        roots.append((VEC_NAMES.get(v, f'вектор ${v:02X}'), t))

for name, addr in roots:
    subs[addr].add(-1)
    trace(addr)

# --- второй проход: подобрать код, на который ссылались через lea/pea (таблицы адресов) ---
# Ищем длинные слова в ROM, которые указывают на уже найденный код, — это таблицы прыжков.
found_extra = True
rounds = 0
while found_extra and rounds < 6:
    found_extra = False
    rounds += 1
    tables = defaultdict(int)
    for a in range(0x200, N - 4, 2):
        if a in seen:
            continue
        v = struct.unpack('>I', rom[a:a + 4])[0]
        if 0x200 <= v < N and not (v & 1) and v in code_start:
            tables[a] = v
    # если подряд идут >=3 указателя на код — это таблица, её соседей тоже трогаем
    addrs = sorted(tables)
    i = 0
    while i < len(addrs):
        run = [addrs[i]]
        while i + 1 < len(addrs) and addrs[i + 1] == addrs[i] + 4:
            i += 1
            run.append(addrs[i])
        if len(run) >= 3:
            lo, hi = run[0], run[-1]
            for a in range(lo, hi + 4, 4):
                v = struct.unpack('>I', rom[a:a + 4])[0]
                if 0x200 <= v < N and not (v & 1) and v not in seen:
                    subs[v].add(-2)  # -2 = «через таблицу прыжков»
                    trace(v)
                    found_extra = True
        i += 1

# ---------------- вывод ----------------
cov = len(seen)
covered_bytes = sum(insn_at[a][2] for a in insn_at)
print(f"инструкций найдено : {cov}")
print(f"байт кода          : {covered_bytes} из {N} ({100.0*covered_bytes/N:.1f}%)")
print(f"подпрограмм        : {len(subs)}")
print(f"споткнулся         : {len(bad)} мест")

with open(OUT_BASE + '.asm', 'w', encoding='utf-8') as f:
    f.write(f"; {ROM_PATH}\n; код, найденный обходом от точки входа\n\n")
    prev_end = None
    for a in sorted(insn_at):
        if prev_end is not None and a != prev_end:
            f.write(f"\n; ---- разрыв: данные ${prev_end:06X}..${a:06X} ({a-prev_end} байт) ----\n\n")
        if a in subs:
            callers = subs[a]
            tag = []
            if -1 in callers:
                tag.append('ВЕКТОР')
            if -2 in callers:
                tag.append('таблица')
            n = len([c for c in callers if c >= 0])
            f.write(f"\n; ======== sub_{a:06X}  {' '.join(tag)} зовут: {n} ========\n")
        mn, ops, sz = insn_at[a]
        raw = rom[a:a + sz].hex()
        f.write(f"{a:06X}: {raw:<12} {mn:<10} {ops}\n")
        prev_end = a + sz

with open(OUT_BASE + '.subs', 'w', encoding='utf-8') as f:
    f.write("; подпрограммы: адрес | сколько раз зовут | откуда зовут\n")
    for a in sorted(subs, key=lambda x: -len(subs[x])):
        callers = sorted(c for c in subs[a] if c >= 0)
        flags = []
        if -1 in subs[a]:
            flags.append('ВЕКТОР')
        if -2 in subs[a]:
            flags.append('ТАБЛИЦА')
        f.write(f"sub_{a:06X}  зовут={len(callers):<4} {' '.join(flags):<16} "
                f"от: {' '.join(f'{c:06X}' for c in callers[:12])}\n")

with open(OUT_BASE + '.ram', 'w', encoding='utf-8') as f:
    f.write("; ==== обращения к RAM (0xFF0000..0xFFFFFF) ====\n")
    f.write("; адрес | сколько мест трогают | адреса кода\n")
    for a in sorted(ram_refs):
        srcs = sorted(ram_refs[a])
        f.write(f"${a:06X}  трогают={len(srcs):<4} из: {' '.join(f'{s:06X}' for s in srcs[:16])}\n")
    f.write("\n; ==== обращения к железу ====\n")
    for a in sorted(hw_refs):
        srcs = sorted(hw_refs[a])
        f.write(f"${a:06X} {HW.get(a,'?'):<22} трогают={len(srcs):<4} "
                f"из: {' '.join(f'{s:06X}' for s in srcs[:16])}\n")

json.dump({'entry': entry, 'subs': {f"{a:06X}": sorted(c for c in subs[a] if c >= 0) for a in subs},
           'code': sorted(insn_at), 'ram': {f"{a:06X}": sorted(ram_refs[a]) for a in ram_refs}},
          open(OUT_BASE + '.json', 'w'), indent=0)
print(f"записано: {OUT_BASE}.asm / .subs / .ram / .json")
