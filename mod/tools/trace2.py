# Рекурсивный дизассемблер Mega Drive ROM, версия 2.
#
# Отличие от версии 1: игра диспетчеризуется ТАБЛИЦАМИ УКАЗАТЕЛЕЙ
# (movea.l (a0,d0.w),a0 / jsr (a0)) — статически такой прыжок не вычислить.
# Поэтому здесь два механизма:
#   1) обход по ходу выполнения от точки входа и векторов (как в v1);
#   2) поиск таблиц: цепочки подряд идущих длинных слов, каждое из которых
#      указывает на адрес, ПРОВЕРЕННО декодирующийся в осмысленный код.
# Проходы чередуются, пока находятся новые куски.
#
# Выход: <base>.asm (код), .subs (подпрограммы), .ram (карта RAM/железа),
#        .tables (найденные таблицы прыжков), .json (машинный формат)
import sys, struct, json, re
from collections import defaultdict
from capstone import Cs, CS_ARCH_M68K, CS_MODE_BIG_ENDIAN, CS_MODE_M68K_000

ROM_PATH, OUT_BASE = sys.argv[1], sys.argv[2]
rom = open(ROM_PATH, 'rb').read()
N = len(rom)

md = Cs(CS_ARCH_M68K, CS_MODE_BIG_ENDIAN | CS_MODE_M68K_000)

HW = {0xA10000: "версия консоли", 0xA10002: "джойстик1 данные", 0xA10004: "джойстик2 данные",
      0xA10006: "порт-EXT данные", 0xA10008: "джойстик1 режим", 0xA1000A: "джойстик2 режим",
      0xA1000C: "порт-EXT режим", 0xA11100: "Z80 шина", 0xA11200: "Z80 сброс",
      0xA00000: "Z80 RAM", 0xA04000: "YM2612 порт", 0xA04001: "YM2612 данные",
      0xC00000: "VDP данные", 0xC00004: "VDP управление", 0xC00008: "VDP счётчик луча",
      0xC00011: "PSG звук"}

seen = {}                    # адрес -> (мнемоника, операнды, размер)
func_head = defaultdict(set) # адрес подпрограммы -> кто зовёт (-1 вектор, -2 таблица)
xref_call = defaultdict(set) # кого зовут -> откуда
ram_refs = defaultdict(set)
hw_refs = defaultdict(set)
tables_found = {}            # адрес таблицы -> число входов

STOP = {'rts', 'rte', 'rtr', 'jmp', 'bra', 'illegal', 'reset', 'stop'}
BITOPS = {'bset', 'bclr', 'btst', 'bchg', 'bkpt', 'bfextu', 'bfins'}


def is_branch(base):
    return base.startswith('b') and base not in BITOPS


def abs_targets(op_str):
    out = []
    for m in re.finditer(r'\$(?:0x)?([0-9a-fA-F]+)', op_str):
        try:
            out.append(int(m.group(1), 16))
        except ValueError:
            pass
    return out


def validate(addr, depth=24):
    """Похоже ли на настоящий код? Декодируем подряд и смотрим, не рассыпается ли."""
    if addr < 0x200 or addr >= N or (addr & 1):
        return False
    pc, n = addr, 0
    while n < depth and pc < N:
        g = list(md.disasm(rom[pc:pc + 16], pc, count=1))
        if not g:
            return False
        ins = g[0]
        base = ins.mnemonic.lower().split('.')[0]
        # мусор, который капстоун декодирует, но настоящий компилятор не выдаёт
        if base in ('dc', 'illegal', 'reset', 'stop', 'trapv', 'rtr'):
            return False
        if base in ('rts', 'rte', 'jmp', 'bra'):
            return n >= 1          # дошли до законного конца — годится
        pc += ins.size
        n += 1
    return True                     # 24 инструкции подряд без мусора — годится


def note_mem(a, op_str):
    for m in re.finditer(r'\$(?:0x)?([0-9a-fA-F]+)', op_str):
        v = int(m.group(1), 16)
        if 0xFFFF0000 <= v <= 0xFFFFFFFF:
            v &= 0xFFFFFF
        if 0xFF0000 <= v <= 0xFFFFFF:
            ram_refs[v].add(a)
        elif 0xA00000 <= v <= 0xC00020:
            hw_refs[v].add(a)


def trace(start):
    work = [start]
    while work:
        pc = work.pop()
        while True:
            if pc in seen or pc >= N or pc < 0x200 or (pc & 1):
                break
            g = list(md.disasm(rom[pc:pc + 16], pc, count=1))
            if not g:
                break
            ins = g[0]
            seen[pc] = (ins.mnemonic, ins.op_str, ins.size)
            note_mem(pc, ins.op_str)
            base = ins.mnemonic.lower().split('.')[0]
            tg = abs_targets(ins.op_str)

            if base in ('bsr', 'jsr'):
                for t in tg:
                    if 0x200 <= t < N and not (t & 1):
                        func_head[t].add(pc)
                        xref_call[t].add(pc)
                        work.append(t)
            elif is_branch(base) or base == 'jmp':
                for t in tg:
                    if 0x200 <= t < N and not (t & 1):
                        work.append(t)

            if base in STOP:
                break
            pc += ins.size


# ---------- корни ----------
entry = struct.unpack('>I', rom[4:8])[0]
roots = [entry]
for v in range(0x08, 0x100, 4):
    t = struct.unpack('>I', rom[v:v + 4])[0]
    if 0x200 <= t < N and not (t & 1):
        roots.append(t)
for r in roots:
    func_head[r].add(-1)
    trace(r)
print(f"после корней: {len(seen)} инструкций")

# ---------- чередование: поиск таблиц указателей ----------
for rnd in range(1, 16):
    added = 0
    # кандидаты: длинное слово, указывающее на валидный код
    cand = {}
    a = 0x200
    while a < N - 4:
        v = struct.unpack('>I', rom[a:a + 4])[0]
        if 0x200 <= v < N and not (v & 1) and a not in seen:
            cand[a] = v
        a += 2
    # цепочки с шагом 4
    keys = sorted(cand)
    i = 0
    while i < len(keys):
        run = [keys[i]]
        j = i
        while j + 1 < len(keys) and keys[j + 1] == keys[j] + 4:
            j += 1
            run.append(keys[j])
        if len(run) >= 3:
            good = [t for t in (cand[x] for x in run) if validate(t)]
            # таблица засчитывается, только если ПОЧТИ ВСЕ входы — код
            if len(good) >= 3 and len(good) >= len(run) * 0.75:
                tables_found[run[0]] = len(run)
                for x in run:
                    t = cand[x]
                    if validate(t) and t not in seen:
                        func_head[t].add(-2)
                        trace(t)
                        added += 1
        i = j + 1
    print(f"раунд {rnd}: +{added} входов из таблиц, всего {len(seen)} инструкций")
    if added == 0:
        break

# ---------- итог ----------
code_bytes = sum(v[2] for v in seen.values())
print(f"ИТОГ: {len(seen)} инструкций, {code_bytes} байт кода из {N} ({100.0*code_bytes/N:.1f}%)")
print(f"подпрограмм: {len(func_head)}, таблиц прыжков: {len(tables_found)}")

with open(OUT_BASE + '.asm', 'w', encoding='utf-8') as f:
    f.write(f"; {ROM_PATH}\n; код, найденный обходом + таблицами прыжков\n\n")
    prev_end = None
    for a in sorted(seen):
        if prev_end is not None and a != prev_end:
            f.write(f"\n; ---- ДАННЫЕ ${prev_end:06X}..${a:06X} ({a-prev_end} байт) ----\n\n")
        if a in func_head:
            c = func_head[a]
            tag = ('ВЕКТОР ' if -1 in c else '') + ('ТАБЛИЦА ' if -2 in c else '')
            n = len([x for x in c if x >= 0])
            f.write(f"\n; ==== sub_{a:06X} {tag}зовут={n} ====\n")
        mn, ops, sz = seen[a]
        f.write(f"{a:06X}: {rom[a:a+sz].hex():<16} {mn:<10} {ops}\n")
        prev_end = a + sz

with open(OUT_BASE + '.subs', 'w', encoding='utf-8') as f:
    for a in sorted(func_head, key=lambda x: -len(func_head[x])):
        c = sorted(x for x in func_head[a] if x >= 0)
        tag = ('ВЕКТОР ' if -1 in func_head[a] else '') + ('ТАБЛИЦА ' if -2 in func_head[a] else '')
        f.write(f"sub_{a:06X} зовут={len(c):<4} {tag:<18} от: {' '.join(f'{x:06X}' for x in c[:14])}\n")

with open(OUT_BASE + '.ram', 'w', encoding='utf-8') as f:
    f.write("; ==== RAM ====\n")
    for a in sorted(ram_refs):
        s = sorted(ram_refs[a])
        f.write(f"${a:06X} трогают={len(s):<4} из: {' '.join(f'{x:06X}' for x in s[:20])}\n")
    f.write("\n; ==== ЖЕЛЕЗО ====\n")
    for a in sorted(hw_refs):
        s = sorted(hw_refs[a])
        f.write(f"${a:06X} {HW.get(a,'?'):<20} трогают={len(s):<4} из: {' '.join(f'{x:06X}' for x in s[:20])}\n")

with open(OUT_BASE + '.tables', 'w', encoding='utf-8') as f:
    for a in sorted(tables_found):
        f.write(f"${a:06X}  входов={tables_found[a]}\n")

json.dump({'entry': entry,
           'subs': {f"{a:06X}": sorted(x for x in func_head[a] if x >= 0) for a in func_head},
           'code': sorted(seen),
           'ram': {f"{a:06X}": sorted(ram_refs[a]) for a in ram_refs},
           'tables': {f"{a:06X}": tables_found[a] for a in tables_found}},
          open(OUT_BASE + '.json', 'w'), indent=0)
print("записано:", OUT_BASE + ".asm/.subs/.ram/.tables/.json")
