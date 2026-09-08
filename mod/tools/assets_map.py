# КАРТА АССЕТОВ ЛОКАЦИИ: ловим все пересылки DMA во время загрузки боя 1on1
# и печатаем, ОТКУДА в ROM и КУДА в видеопамять едут данные.
#
# Подпрограмма DMA — $3980, параметры приходят регистрами:
#   d1 = $94<длина_ст>93<длина_мл>   d2 = $96<адр_ср>95<адр_мл>   d3 = $97<адр_ст>
#   d0 = команда VDP (куда писать)
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from session import _tap, _wait
from unicorn.m68k_const import UC_M68K_REG_D0, UC_M68K_REG_D1, UC_M68K_REG_D2, UC_M68K_REG_D3

md = session.new()
log = []


def decode_dest(d0):
    """Из команды VDP достаём тип записи и адрес."""
    cmd = ((d0 >> 30) & 3) | (((d0 >> 4) & 0x0F) << 2)
    addr = ((d0 >> 16) & 0x3FFF) | ((d0 & 3) << 14)
    kind = {1: 'VRAM', 3: 'CRAM(палитра)', 5: 'VSRAM'}.get(cmd & 0x0F, f'код{cmd & 0x0F}')
    return kind, addr


def on_dma(m, pc):
    u = m.uc
    d0 = u.reg_read(UC_M68K_REG_D0)
    d1 = u.reg_read(UC_M68K_REG_D1)
    d2 = u.reg_read(UC_M68K_REG_D2)
    d3 = u.reg_read(UC_M68K_REG_D3)
    length = ((d1 >> 16) & 0xFF) << 8 | (d1 & 0xFF)
    src = (((d2 & 0xFF)) | (((d2 >> 16) & 0xFF) << 8) | ((d3 & 0x7F) << 16)) << 1
    kind, addr = decode_dest(d0)
    log.append((m.frame, src, length, kind, addr))


md.add_code_hook(0x3980, on_dma)

_wait(md, 300)
_tap(md, 0, 'start'); _wait(md, 60)
_tap(md, 0, 'start'); _wait(md, 120)
mark_menu = len(log)
_tap(md, 0, 'right'); _wait(md, 20)
_tap(md, 0, 'start'); _wait(md, 120)     # выбор best of
_tap(md, 0, 'start'); _wait(md, 150)
mark_load = len(log)
_tap(md, 1, 'start'); _wait(md, 120)
_tap(md, 0, 'start'); _wait(md, 200)     # бой пошёл

print(f"всего пересылок: {len(log)}; из них при загрузке боя: {len(log) - mark_load}")
print("\n=== пересылки ПРИ ЗАГРУЗКЕ БОЯ (источник в ROM -> куда) ===")
seen = set()
for fr, src, length, kind, addr in log[mark_load:]:
    key = (src, length, kind, addr)
    if key in seen:
        continue
    seen.add(key)
    print(f"  кадр {fr:5}  ROM ${src:06X}  слов {length:5} ({length*2:6} байт)  -> {kind} ${addr:04X}")

print("\n=== крупнейшие пересылки за весь прогон ===")
for fr, src, length, kind, addr in sorted(set(log), key=lambda x: -x[2])[:20]:
    print(f"  кадр {fr:5}  ROM ${src:06X}  слов {length:5} ({length*2:6} байт)  -> {kind} ${addr:04X}")
