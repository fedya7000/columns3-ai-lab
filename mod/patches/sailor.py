# ЛОКАЦИЯ «СЕЙЛОР МУН» — облик боя 1 на 1.
#
# Включает в себя ВСЕ правила и починки турнирного режима (patches/turnir.py)
# и добавляет новый облик: знаки планет вместо самоцветов, ночное небо,
# кошку Луну вместо петуха и выбор мелодии.
#
# КАК ЭТО РАБОТАЕТ, не трогая сжатие
#   Графика в картридже сжата (игра распаковывает её в буфер $FFA000 и оттуда
#   шлёт в видеопамять). Упаковщик писать не нужно: мы ЗАЛИВАЕМ свои готовые
#   тайлы ПОВЕРХ, уже после того, как игра загрузила стенд.
#
#   Врезка сделана без единой переписанной команды игры — только два указателя
#   в ТАБЛИЦЕ РЕЖИМОВ ($000E8E): подготовка раунда ($1C) и бой ($20).
#
# Всё включается ТОЛЬКО в бою 1on1 ($FF0418 == 1): сюжетный режим и режимы на
# 3-6 игроков сохраняют родной вид.
import os, sys
from struct import pack

_here = os.path.dirname(__file__)
sys.path.insert(0, _here)
sys.path.insert(0, os.path.join(_here, '..', 'tools'))
sys.path.insert(0, os.path.join(_here, '..', 'art'))

from asm import Asm
import turnir
from encode import build_all, tile_bytes
from bg_build import build as build_bg
import luna

TILES_MAIN, TILES_ANIM, PAL_DATA = build_all()
BG_BLOBS, BG_ROWS, PAL0_DATA, BG_NTILES = build_bg()

# --- где в свободном хвосте ROM лежит новое ---
INJECT = 0x07A700          # подпрограмма заливки (около 200 байт)
MODE20 = 0x07A900          # обёртка режима «бой»
MODE1C = 0x07A940          # обёртка режима «подготовка раунда»
MASCOT = 0x07AB00          # подстановка таблицы кадров маскота
D_TILES = 0x07B000         # тайлы камней        (768)
D_ANIM = 0x07B300          # кадры приземления   (3840)
D_PAL = 0x07C200           # палитра 2           (32)
D_SKY = 0x07C300           # тайлы неба
D_NAME = 0x07CE00          # новая карта плана B (28 рядов по 80 байт)
D_PAL0 = 0x07D700          # палитра 0
D_PAL1 = 0x07D760          # палитра 1 (маскот)
D_LIST = 0x07D800          # список пересылок для неба
D_LUNA = 0x07DB00          # тайлы Луны (4 кадра по 512 байт = 2048)
D_MTAB = 0x07E400          # своя таблица кадров маскота (64 записи по 14 байт)

FLAG = 0x00FF7F00          # какой режим залил облик последним (1 или 2)
PAL_LIVE = 0x00FF0340      # рабочая копия палитры 2 в памяти игры
PAL_TARGET = 0x00FF03C0    # её же целевая копия (для плавных переходов)
PAL0_LIVE = 0x00FF0300     # то же для палитры 0 (небо и поле)
PAL0_TARGET = 0x00FF0380
PAL1_LIVE = 0x00FF0320     # и для палитры 1 (маскот)
PAL1_TARGET = 0x00FF03A0
VDP_CTRL = 0x00C00004
MODE2 = 0x00FFEF86         # копия регистра VDP «режим 2» в памяти игры
PLANE_B = 0xE000           # карта фона в видеопамяти
MODE_1ON1 = 0x00FF0418
DMA_SUB = 0x00003980       # родная подпрограмма пересылки DMA

# родные обработчики режимов (из таблицы $000E8E)
ORIG_MODE20 = 0x000058AC
ORIG_MODE1C = 0x0000F158


def vram_cmd(addr):
    """Команда VDP «писать в видеопамять по адресу addr через DMA».
    Бит DMA подпрограмма $3980 ставит сама, поэтому здесь его нет."""
    return ((0x4000 | (addr & 0x3FFF)) << 16) | ((addr >> 14) & 3)


def dma_len(nbytes):
    """d1 = $94<длина_ст>93<длина_мл>, длина в СЛОВАХ."""
    w = nbytes // 2
    return 0x94009300 | ((w >> 8) << 16) | (w & 0xFF)


def dma_src_d2(addr):
    """d2 = $96<адрес_ср>95<адрес_мл>, адрес в СЛОВАХ."""
    w = addr >> 1
    return 0x96009500 | (((w >> 8) & 0xFF) << 16) | (w & 0xFF)


def dma_src_d3(addr):
    """d3 = $97<адрес_ст>."""
    return 0x9700 | ((addr >> 17) & 0x7F)


# ------------------------------------------------------------ заливка графики
SKY_BLOB = b''.join(d for _, d in BG_BLOBS)
_list = b''
_off = 0
for tile_first, data in BG_BLOBS:
    src = D_SKY + _off
    _list += pack('>IIIH', vram_cmd(tile_first * 32), dma_len(len(data)),
                  dma_src_d2(src), dma_src_d3(src))
    _off += len(data)
for row, data in enumerate(BG_ROWS):
    src = D_NAME + row * len(data)
    _list += pack('>IIIH', vram_cmd(PLANE_B + row * 128), dma_len(len(data)),
                  dma_src_d2(src), dma_src_d3(src))
_list += pack('>I', 0)                       # признак конца списка
LIST_DATA = _list
NAME_BLOB = b''.join(BG_ROWS)

# переключатели для бисекции
NO_BG = os.environ.get('SAILOR_NO_BG') == '1'
NO_BLANK = os.environ.get('SAILOR_NO_BLANK') == '1'

inj = Asm(INJECT)
inj.movem_save(0xFFFE)                       # сохранить всё: $3980 портит регистры
# Экран на время пересылок гасим: с включённым экраном DMA идёт впятеро
# медленнее и десять килобайт растянулись бы на несколько кадров с рывком.
# Подпрограмма $3980 берёт значение регистра из $FFEF86 — гасим ИМЕННО там,
# иначе она сама включит экран обратно на каждой пересылке.
inj.move_w_abs_dn(MODE2, 7)
if not NO_BLANK:
    inj.move_w_dn_dn(7, 6)
    inj.andi_w_dn(0xFFBF, 6)
    inj.move_w_dn_abs(6, MODE2)
    inj.move_w_dn_abs(6, VDP_CTRL)

for dest_cmd, src, size in (
        (vram_cmd(0x2000), D_TILES, len(TILES_MAIN)),
        (vram_cmd(0x3C00), D_ANIM, len(TILES_ANIM))):
    inj.move_l_imm_dn(dest_cmd, 0)
    inj.move_l_imm_dn(dma_len(size), 1)
    inj.move_l_imm_dn(dma_src_d2(src), 2)
    inj.move_w_imm_dn(dma_src_d3(src), 3)
    inj.jsr_abs(DMA_SUB)

if not NO_BG:                                # небо: идём по списку пересылок
    inj.lea_abs(D_LIST, 5)
    inj.label('nextdma')
    inj.move_l_postinc_dn(5, 0)
    inj.bcc('eq', 'dmadone')
    inj.move_l_postinc_dn(5, 1)
    inj.move_l_postinc_dn(5, 2)
    inj.move_w_postinc_dn(5, 3)
    inj.jsr_abs(DMA_SUB)
    inj.bcc('ra', 'nextdma')
    inj.label('dmadone')

if not NO_BLANK:                             # вернуть экран
    inj.move_w_dn_abs(7, MODE2)
    inj.move_w_dn_abs(7, VDP_CTRL)

# Палитру НЕЛЬЗЯ слать прямо в CRAM: игра держит рабочую копию в памяти и
# каждый кадр заново заливает из неё, так что наша правка жила бы один кадр
# (проверено tools/pal_debug.py). Пишем в ОБА буфера игры.
for src, dest in ((D_PAL, PAL_LIVE), (D_PAL, PAL_TARGET),
                  (D_PAL0, PAL0_LIVE), (D_PAL0, PAL0_TARGET),
                  (D_PAL1, PAL1_LIVE), (D_PAL1, PAL1_TARGET)):
    inj.lea_abs(src, 0)
    inj.lea_abs(dest, 1)
    inj.moveq(7, 0)                          # 32 байта = 8 длинных слов
    inj.label(f'copy{src:X}{dest:X}')
    inj.move_l_postinc(0, 1)
    inj.dbra(0, f'copy{src:X}{dest:X}')
inj.movem_restore(0x7FFF)
inj.rts()
INJECT_CODE = inj.assemble()

# --------------------------- обёртки режимов: заливка в ОБОИХ, по разу на вход
#
# Раньше заливка шла только в режиме боя ($20), и до неё — на меню «best of» и
# на «READY» — был виден РОДНОЙ стенд. Теперь заливаем и на подготовке ($1C).
#
# Признак хранит, КАКОЙ режим залил последним: 1 — подготовка, 2 — бой. При
# входе в другой режим значение не совпадает, и заливка идёт снова. Отдельный
# сброс не нужен: режимы чередуются и сами взводят друг друга.
m1c = Asm(MODE1C)
m1c.cmpi_w_abs(1, MODE_1ON1)
m1c.bcc('ne', 'go')
m1c.cmpi_b_abs(1, FLAG)
m1c.bcc('eq', 'go')                          # уже залито на подготовке
m1c.move_b_imm_abs(1, FLAG)
m1c.jsr_abs(INJECT)
m1c.label('go')
m1c.jmp_abs(ORIG_MODE1C)
MODE1C_CODE = m1c.assemble()

m20 = Asm(MODE20)
m20.cmpi_w_abs(1, MODE_1ON1)
m20.bcc('ne', 'go')
m20.cmpi_b_abs(2, FLAG)
m20.bcc('eq', 'go')                          # уже залито в бою
m20.move_b_imm_abs(2, FLAG)
m20.jsr_abs(INJECT)
m20.label('go')
m20.jmp_abs(ORIG_MODE20)
MODE20_CODE = m20.assemble()

# ------------------------------------------------------ Луна вместо петуха
#
# Маскот — блок 4x4 тайла (32x32 точки), палитра 1. Каждый кадр анимации
# заливает его 512 байт в видеопамять по таблице $10944 (запись 14 байт:
# источник DMA, указатель на раскладку клеток, длина).
#
# Подменяем САМУ ТАБЛИЦУ на свою. Записи ведут на РАЗНЫЕ кадры Луны по кругу,
# поэтому кошка живая: моргает и водит хвостом, а не стоит истуканом.
# Раскладку клеток и длину берём из записи 0 оригинала, чтобы кошка встала
# ровно туда же, где сидел петух.
LUNA_FRAMES = luna.frames()
LUNA_TILES = b''.join(
    b''.join(tile_bytes(f, cx * 8, cy * 8) for cy in range(4) for cx in range(4))
    for f in LUNA_FRAMES)
assert len(LUNA_TILES) == 512 * len(LUNA_FRAMES), len(LUNA_TILES)

_MT_PTR = 0x0002D35E       # раскладка клеток из записи 0 оригинала
_MT_LEN = 0x94019300       # длина 256 слов = 512 байт, оттуда же
MTAB = b''
for i in range(64):        # наблюдался номер кадра до 43, берём с запасом
    src = D_LUNA + (i % len(LUNA_FRAMES)) * 512
    MTAB += pack('>IHII', dma_src_d2(src), dma_src_d3(src), _MT_PTR, _MT_LEN)

_ms = Asm(MASCOT)
_ms.lea_abs(D_MTAB, 2)                 # a2 = наша таблица вместо $10944
_ms.raw('20321000')                    # move.l (a2, d1.w), d0 — как было
_ms.rts()
MASCOT_CODE = _ms.assemble()

# палитра 1: перекрашиваем только те индексы, что заняты одним маскотом
PAL1_ORIG = [0x0644, 0x0444, 0x0EC8, 0x0E80, 0x0E00, 0x0EEE, 0x004E, 0x0000,
             0x0A88, 0x0EEE, 0x0046, 0x0E2E, 0x0E22, 0x0EA2, 0x0444, 0x000C]
PAL1_DATA = b''.join(
    pack('>H', PAL1_ORIG[i] if luna.PALETTE1[i] is None else luna.PALETTE1[i])
    for i in range(16))

# ------------------------------------------------- какая мелодия у локации
#
# Номер мелодии игра берёт из $FF053C, таблица на $00FA38 индексируется как
# «номер - $80» и занимает 32 байта — мелодий ровно 32, номера $80..$9F.
# Родная для боя 1on1 — $8D. Слушать все можно прямо в игре:
# меню режимов -> вправо 3 раза -> вниз -> Start -> SOUND TEST.
#
# Собрать с другой мелодией: music.bat 8F
TRACK = int(os.environ.get('SAILOR_TRACK', '8D'), 16)
MUSIC = 0x07AA80

_m = Asm(MUSIC)
_m.cmpi_w_abs(1, MODE_1ON1)
_m.bcc('ne', 'van')
_m.move_b_imm_abs(TRACK, 0x00FF053C)     # в бою 1on1 — наша мелодия
_m.label('van')
_m.raw('1e3900ff053c')                   # move.b $ff053c.l, d7 — как было
_m.rts()
MUSIC_CODE = _m.assemble()

# ------------------------------------------------------------- СВОЯ МЕЛОДИЯ
# ⚠️ ОПЛАЧЕННАЯ ОШИБКА, не наступать снова: сперва мелодия легла в блок на
# Z80 $1000 — а это ЭФФЕКТЫ, не музыка, и звучала она поэтому «чуть-чуть».
# У драйвера ДВЕ таблицы, обе берутся через шапку на Z80 $8000:
#   слово по +6 -> $1000  — звуковые эффекты (ID от $A0);
#   слово по +4 -> $8255  — МУЗЫКА, 31 тема, ID $81..$9F, номер = ID - $81.
# Музыка лежит в ПЗУ и читается через банковое окно: Z80 $8000 = ПЗУ $070000.
# Боевая тема 1on1 — ID $8D, её запись в ПЗУ $071D20, первый нотный канал —
# Z80 $A04F (ПЗУ $07204F). Настройки в начало канала не нужны: тембр задаёт
# шапка темы, родной канал начинается прямо с ноты.
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'art'))
import melody

WIN_ROM, WIN_Z80 = 0x070000, 0x8000   # банковое окно: где в ПЗУ -> адрес у Z80
WIN_END = 0x078000                    # конец банка
MEL_CH = 1                            # номер канала, который ведёт мелодию в теме $8D


def _w2r(z):                          # адрес Z80 в окне -> адрес в ПЗУ
    return WIN_ROM + (z - WIN_Z80)


# ⚠️ Адрес канала ВЫЧИСЛЯЕТСЯ ИЗ САМИХ ТАБЛИЦ ПЗУ, а не переписан руками:
# однажды я перепутал соседнюю тему ($8C вместо $8D) именно на ручном списке.
_rom = open(os.path.join(_here, '..', 'rom', 'Columns III (USA).gen'), 'rb').read()


def _w(z):                            # слово по адресу Z80 в окне
    a = _w2r(z)
    return _rom[a] | (_rom[a + 1] << 8)


_tab = _w(0x8004)                     # шапка драйвера, +4 -> таблица МУЗЫКИ
_rec = _w(_tab + (TRACK - 0x81) * 2)  # запись выбранной темы
_chans = []                           # записи каналов идут по 4 байта с +4
_o = _w2r(_rec) + 4
while True:
    p = _rom[_o + 2] | (_rom[_o + 3] << 8)
    if not (WIN_Z80 <= p <= 0xFFFF):
        break
    _chans.append(p)
    _o += 4
if len(_chans) <= MEL_CH:
    raise SystemExit(f'у темы ${TRACK:02X} нет канала {MEL_CH}: нашлось {len(_chans)}')
CH_MEL = _chans[MEL_CH]

# Настройка в начале канала (тембр) — снимается БАЙТ В БАЙТ с родного канала,
# иначе мелодия заиграет чужим голосом. Команды идут парами «код + аргумент».
_s = _w2r(CH_MEL)
_n = 0
while _rom[_s + _n] >= 0xE0 and _n < 8:
    _n += 2
SETUP = _rom[_s:_s + _n]

MEL_Z = 0xF000                        # чистые 4 КБ в хвосте банка (проверено: сплошной $FF)
MEL_DATA = melody.encode(melody.MOONLIGHT, MEL_Z + _n, SETUP)
if _w2r(MEL_Z) + len(MEL_DATA) > WIN_END:
    raise SystemExit('мелодия не влезла в банк')


def _goto(z):                         # команда «перейти на адрес»
    return bytes([0xF6, z & 0xFF, (z >> 8) & 0xFF])


# --------------------------------------------------------------------- правки
PATCHES = list(turnir.PATCHES) + [
    (_w2r(MEL_Z), MEL_DATA,
     f'мелодия «Лунная легенда», {len(melody.MOONLIGHT)} нот, зациклена'),
    (_w2r(CH_MEL), _goto(MEL_Z), 'нотный канал боевой темы $8D -> наша мелодия'),

    (0x000EAE, pack('>I', MODE20), 'таблица режимов: бой -> наша обёртка'),
    (0x000EAA, pack('>I', MODE1C), 'таблица режимов: подготовка -> наша обёртка'),

    (INJECT, INJECT_CODE, 'код: заливка облика локации'),
    (MODE20, MODE20_CODE, 'код: обёртка режима боя'),
    (MODE1C, MODE1C_CODE, 'код: обёртка подготовки раунда'),

    (0x00FA00, pack('>HI', 0x4EB9, MUSIC),
     f'мелодия локации: номер ${TRACK:02X}'),
    (MUSIC, MUSIC_CODE, 'код: выбор мелодии локации'),

    (0x0107A2, pack('>HI', 0x4EB9, MASCOT) + b'\x4e\x71',
     'маскот: своя таблица кадров вместо родной'),
    (MASCOT, MASCOT_CODE, 'код: подстановка таблицы маскота'),
    (D_LUNA, LUNA_TILES, f'графика: Луна, {len(LUNA_FRAMES)} кадра'),
    (D_MTAB, MTAB, 'таблица кадров маскота'),
    (D_PAL1, PAL1_DATA, 'палитра маскота'),

    (D_TILES, TILES_MAIN, 'графика: шесть знаков планет'),
    (D_ANIM, TILES_ANIM, 'графика: кадры приземления'),
    (D_PAL, PAL_DATA, 'палитра камней'),

    (D_SKY, SKY_BLOB, f'графика: ночное небо ({BG_NTILES} тайлов)'),
    (D_NAME, NAME_BLOB, 'новая карта фона'),
    (D_PAL0, PAL0_DATA, 'палитра неба'),
    (D_LIST, LIST_DATA, 'список пересылок фона'),
]
