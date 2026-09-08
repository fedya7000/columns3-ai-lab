# Минимальная Mega Drive на движке Unicorn (эмулятор процессора 68000).
#
# Зачем: чтобы РЕАЛЬНО гонять ROM и смотреть, что происходит в памяти,
# а не гадать по дизассемблеру. Отсюда берутся: адрес счёта, адрес комбо,
# кто и когда пишет в конкретную ячейку, и картинка экрана для проверки глазами.
#
# Что реализовано:
#   68000 (Unicorn) · RAM 64К · VDP (регистры, VRAM/CRAM/VSRAM, DMA) ·
#   прерывания кадра (V-Blank) и строки (H-Blank) · 3-кнопочные джойстики ·
#   заглушки Z80/YM2612/PSG · отрисовка кадра в PNG (планы A/B + спрайты).
#
# Чего НЕТ: точных тактов, звука, теней/подсветки, растровых тонкостей.
# Для логики игры этого хватает: игра управляется кадрами, а не тактами.
#
# Кто зовёт: run.py, find_score.py, watch.py и прочие инструменты разбора.
import os
import struct
from unicorn import *
from unicorn.m68k_const import *

# --- области адресов ---
ROM_BASE, ROM_MAX = 0x000000, 0x400000
RAM_BASE, RAM_SIZE = 0xFF0000, 0x10000
Z80_BASE, Z80_SIZE = 0xA00000, 0x10000
IO_BASE,  IO_SIZE = 0xA10000, 0x1000
ZBUS_BASE, ZBUS_SIZE = 0xA11000, 0x1000
VDP_BASE, VDP_SIZE = 0xC00000, 0x1000

# --- кнопки джойстика (биты внутри нашего значения pad) ---
BTN = {'up': 0, 'down': 1, 'left': 2, 'right': 3, 'b': 4, 'c': 5, 'a': 6, 'start': 7}


class MD:
    # ⭐ ПОТОЛОК КОМАНД НА КАДР. Найдено 25.08: при 13000 тяжёлый кадр
    # (схлопывание с анимацией) ОБРЫВАЕТСЯ на середине, и шаг уплотнения не
    # достаётся тому, кого игра считает последним — ВТОРОМУ игроку. Клетка,
    # помеченная битом 7 в цикле $00E338..$00E358, остаётся непереписанной
    # навсегда: игра держит её занятой, а рисовать в ней нечего — на экране
    # под камнями зияет пустота. Снять эту метку в ПЗУ некому: единственный
    # `bclr #7` во всей игре работает по регистру, клетки только ПЕРЕЗАПИСЫВАЮТ.
    # Слово владельца: «мы с сестрой очень долго играем, такого никогда не
    # было» — и он прав, на приставке кадр не обрывается.
    # Замер при 26000: сид 165 призраков 87 -> 0 и групп 127 -> 220,
    # сид 85 призраков 30 -> 0 и групп 206 -> 583.
    # Выбрано замером 25.08 (сиды 25/130/165): при 39000 призраков НОЛЬ на
    # всех и ни одного срыва; при 26000 двое из четырёх ещё с призраками;
    # при 60000 сид 165 срывается на первом же кадре. Прежнее значение 13000
    # оставлено доступным через OX_INSTR — им меряют пару «до/после».
    ПОТОЛОК = int(os.environ.get('OX_INSTR', '39000'))

    def __init__(self, rom_path, instr_per_frame=None, hint_enabled=True):
        self.rom = bytearray(open(rom_path, 'rb').read())
        self.instr_per_frame = int(instr_per_frame or MD.ПОТОЛОК)
        self.hint_enabled = hint_enabled

        self.vram = bytearray(0x10000)
        self.cram = bytearray(0x80)      # 64 слова = 4 палитры по 16 цветов
        self.vsram = bytearray(0x50)
        self.vdp_reg = bytearray(32)

        self.ctrl_pending = None         # первое слово команды VDP
        self.vdp_cmd = 0                 # код операции (CD)
        self.vdp_addr = 0
        self.dma_fill_pending = False

        self.pad = [0xFF, 0xFF]          # 0 = нажато; по биту на кнопку из BTN
        self.io_ctrl = [0, 0, 0]
        self.io_data = [0, 0, 0]

        self.frame = 0
        self.vblank = False
        self.stopped = False
        self.watch = []                  # список (lo, hi, callback) — слежка за записью в RAM
        self.trace_pc = None             # callback(pc) если нужен трейс инструкций
        self.log = []
        self.exceptions = []             # необработанные исключения процессора
        self.in_irq = False

        self.uc = Uc(UC_ARCH_M68K, UC_MODE_BIG_ENDIAN)
        try:
            self.uc.ctl_set_cpu_model(UC_CPU_M68K_M68040)
        except Exception:
            pass

        u = self.uc
        # ПЗУ открыто на запись НАМЕРЕННО. На настоящей Mega Drive запись в
        # картридж просто пропадает, а Unicorn на защищённой памяти падает —
        # и игра снимается с обрыва на первом же диком указателе (например
        # $00E6E8: clr.l (a4) для пустого слота игрока, где +0x1C — мусор).
        # Поэтому запись разрешаем, ловим и тут же откатываем: снаружи всё
        # выглядит ровно как на железе — записи как будто не было.
        u.mem_map(ROM_BASE, 0x400000, UC_PROT_ALL)
        u.mem_write(ROM_BASE, bytes(self.rom))
        self.rom_writes = []
        self.rom_write_count = 0
        u.hook_add(UC_HOOK_MEM_WRITE, self._on_rom_write,
                   begin=ROM_BASE, end=ROM_BASE + 0x400000 - 1)

        # Обращение по несуществующему адресу на приставке даёт мусор и живёт
        # дальше, а Unicorn останавливает работу. Так игра снималась с обрыва
        # на своей же беде: анимация маскота изредка кладёт в заявку DMA
        # мусорный адрес источника, и обязательное чтение по нему ($0039EA)
        # уводило эмулятор в никуда. Подставляем пустую страницу и идём дальше.
        self.phantom = 0
        u.hook_add(UC_HOOK_MEM_READ_UNMAPPED | UC_HOOK_MEM_WRITE_UNMAPPED,
                   self._on_unmapped)
        # RAM кладём ОДНИМ куском памяти хоста, но видимым по ДВУМ адресам:
        # у 68000 шина адреса 24-битная, поэтому $FFFFxxxx и $00FFxxxx — одно и то же
        # место, а Unicorn считает адрес 32-битным и без зеркала спотыкается.
        import ctypes
        self._ram_buf = ctypes.create_string_buffer(RAM_SIZE)
        ptr = ctypes.addressof(self._ram_buf)
        u.mem_map_ptr(RAM_BASE, RAM_SIZE, UC_PROT_ALL, ptr)
        u.mem_map_ptr(0xFFFF0000, RAM_SIZE, UC_PROT_ALL, ptr)
        u.mem_map(Z80_BASE, Z80_SIZE)
        u.mmio_map(IO_BASE, IO_SIZE, self._io_r, None, self._io_w, None)
        u.mmio_map(ZBUS_BASE, ZBUS_SIZE, self._zbus_r, None, self._zbus_w, None)
        u.mmio_map(VDP_BASE, VDP_SIZE, self._vdp_r, None, self._vdp_w, None)

        # Unicorn не доигрывает исключения 68000 сам — ловим их и доигрываем вручную.
        u.hook_add(UC_HOOK_INTR, self._on_exception)

        # начальные SP/PC из векторов
        sp = struct.unpack('>I', self.rom[0:4])[0]
        pc = struct.unpack('>I', self.rom[4:8])[0]
        u.reg_write(UC_M68K_REG_A7, sp)
        u.reg_write(UC_M68K_REG_PC, pc)
        u.reg_write(UC_M68K_REG_SR, 0x2700)   # супервизор, прерывания запрещены
        self.pc = pc

    # ---------------- ввод-вывод ----------------
    def _pad_value(self, port):
        """Отдаёт байт, который читается из порта джойстика (3 кнопки, активный ноль)."""
        p = self.pad[port] if port < 2 else 0xFF
        def bit(name):
            return (p >> BTN[name]) & 1
        th = 1
        if self.io_ctrl[port] & 0x40:
            th = (self.io_data[port] >> 6) & 1
        if th:
            # TH=1: вверх вниз влево вправо B C
            v = (bit('up') | (bit('down') << 1) | (bit('left') << 2) | (bit('right') << 3)
                 | (bit('b') << 4) | (bit('c') << 5))
            v |= 0x40
        else:
            # TH=0: вверх вниз 0 0 A Start
            v = (bit('up') | (bit('down') << 1) | (0 << 2) | (0 << 3)
                 | (bit('a') << 4) | (bit('start') << 5))
        out = self.io_data[port] & self.io_ctrl[port]
        inp = v & (~self.io_ctrl[port] & 0xFF)
        return (out | inp) & 0xFF

    def _io_r(self, uc, off, size, ud):
        idx = off
        if idx == 0x01:
            return 0xA0                      # версия: зарубежная NTSC
        if idx in (0x03, 0x05, 0x07):
            return self._pad_value((idx - 3) // 2)
        if idx in (0x09, 0x0B, 0x0D):
            return self.io_ctrl[(idx - 9) // 2]
        if size == 2:
            hi = self._io_r(uc, off, 1, ud)
            lo = self._io_r(uc, off + 1, 1, ud)
            return (hi << 8) | lo
        return 0

    def _io_w(self, uc, off, size, val, ud):
        idx = off
        if size == 2:
            self._io_w(uc, off, 1, (val >> 8) & 0xFF, ud)
            self._io_w(uc, off + 1, 1, val & 0xFF, ud)
            return
        if idx in (0x03, 0x05, 0x07):
            self.io_data[(idx - 3) // 2] = val & 0xFF
        elif idx in (0x09, 0x0B, 0x0D):
            self.io_ctrl[(idx - 9) // 2] = val & 0xFF

    def _zbus_r(self, uc, off, size, ud):
        a = ZBUS_BASE + off
        if a == 0xA11100:                    # шина Z80: 0 = отдана процессору 68000
            return 0x0000 if size == 2 else 0x00
        return 0

    def _zbus_w(self, uc, off, size, val, ud):
        pass

    # ---------------- VDP ----------------
    def _vdp_r(self, uc, off, size, ud):
        a = VDP_BASE + off
        p = a & 0x1F
        if p in (0x00, 0x02):                # порт данных
            return self._vdp_data_read(size)
        if p in (0x04, 0x06):                # порт состояния
            st = 0x3400 | 0x0200             # очередь записи пуста
            if self.vblank:
                st |= 0x08
            self.ctrl_pending = None
            return st if size == 2 else (st >> 8) & 0xFF
        if p == 0x08:                        # счётчик луча
            return 0x0000
        return 0

    def _vdp_data_read(self, size):
        c = self.vdp_cmd & 0x0F
        a = self.vdp_addr
        if c == 0:
            v = struct.unpack('>H', bytes(self.vram[a & 0xFFFE:(a & 0xFFFE) + 2]))[0]
        elif c == 8:
            v = struct.unpack('>H', bytes(self.cram[a & 0x7E:(a & 0x7E) + 2]))[0]
        elif c == 4:
            v = struct.unpack('>H', bytes(self.vsram[a % 0x50:(a % 0x50) + 2]))[0]
        else:
            v = 0
        self.vdp_addr = (self.vdp_addr + self.vdp_reg[0x0F]) & 0xFFFF
        return v

    def _vdp_w(self, uc, off, size, val, ud):
        p = (VDP_BASE + off) & 0x1F
        if p in (0x00, 0x02):
            if size == 4:
                self._vdp_data_write((val >> 16) & 0xFFFF)
                self._vdp_data_write(val & 0xFFFF)
            else:
                self._vdp_data_write(val & 0xFFFF)
            return
        if p in (0x04, 0x06):
            if size == 4:
                self._vdp_ctrl_write((val >> 16) & 0xFFFF)
                self._vdp_ctrl_write(val & 0xFFFF)
            else:
                self._vdp_ctrl_write(val & 0xFFFF)
            return
        if p == 0x11:
            return                            # PSG — звук не эмулируем

    def _vdp_ctrl_write(self, w):
        if self.ctrl_pending is None and (w & 0xC000) == 0x8000:
            r = (w >> 8) & 0x1F
            self.vdp_reg[r] = w & 0xFF
            return
        if self.ctrl_pending is None:
            self.ctrl_pending = w
            self.vdp_cmd = (w >> 14) & 0x03
            self.vdp_addr = w & 0x3FFF
            return
        first = self.ctrl_pending
        self.ctrl_pending = None
        self.vdp_cmd = ((first >> 14) & 0x03) | (((w >> 4) & 0x0F) << 2)
        self.vdp_addr = (first & 0x3FFF) | ((w & 0x03) << 14)
        if self.vdp_cmd & 0x20:               # запрошен DMA
            self._dma_start()

    def _vdp_data_write(self, w):
        if self.dma_fill_pending:
            self.dma_fill_pending = False
            self._dma_fill(w)
            return
        c = self.vdp_cmd & 0x0F
        a = self.vdp_addr
        if c == 1:                            # в VRAM
            a &= 0xFFFF
            if a & 1:                         # нечётный адрес — байты меняются местами
                self.vram[a - 1] = w & 0xFF
                self.vram[a] = (w >> 8) & 0xFF
            else:
                self.vram[a] = (w >> 8) & 0xFF
                self.vram[a + 1] = w & 0xFF
        elif c == 3:                          # в CRAM (палитры)
            a &= 0x7E
            self.cram[a] = (w >> 8) & 0xFF
            self.cram[a + 1] = w & 0xFF
        elif c == 5:                          # в VSRAM (вертикальный скролл)
            a %= 0x50
            self.vsram[a] = (w >> 8) & 0xFF
            self.vsram[a + 1] = w & 0xFF
        self.vdp_addr = (self.vdp_addr + self.vdp_reg[0x0F]) & 0xFFFF

    def _dma_start(self):
        r = self.vdp_reg
        length = (r[0x13] | (r[0x14] << 8)) or 0x10000
        mode = (r[0x17] >> 6) & 0x03
        if mode == 0x02:                      # заливка VRAM — ждём слово данных
            self.dma_fill_pending = True
            return
        src = ((r[0x15] | (r[0x16] << 8) | ((r[0x17] & 0x7F) << 16)) << 1) & 0xFFFFFF
        if mode == 0x03:                      # копирование внутри VRAM
            for i in range(length):
                self.vram[(self.vdp_addr + i) & 0xFFFF] = self.vram[(src + i) & 0xFFFF]
            self.vdp_addr = (self.vdp_addr + length * r[0x0F]) & 0xFFFF
            return
        # 68000 -> VDP
        for i in range(length):
            sa = (src + i * 2) & 0xFFFFFF
            try:
                w = struct.unpack('>H', self.uc.mem_read(sa, 2))[0]
            except Exception:
                w = 0
            self._vdp_data_write(w)

    def _dma_fill(self, w):
        r = self.vdp_reg
        length = (r[0x13] | (r[0x14] << 8)) or 0x10000
        val = (w >> 8) & 0xFF
        a = self.vdp_addr
        self.vram[a & 0xFFFF] = w & 0xFF
        for i in range(length):
            self.vram[(a + i) & 0xFFFF] = val
            a_inc = r[0x0F]
            self.vdp_addr = (self.vdp_addr + a_inc) & 0xFFFF

    # ---------------- прерывания ----------------
    EXCP_RTE = 0x100          # номер, которым Unicorn/QEMU сообщает про инструкцию rte
    EXCP_HALT = 0x101         # инструкция stop

    def _on_exception(self, uc, intno, ud=None):
        """Доигрывает исключения, которые Unicorn отдаёт наружу."""
        if intno == self.EXCP_RTE:
            a7 = uc.reg_read(UC_M68K_REG_A7)
            sr = struct.unpack('>H', uc.mem_read(a7, 2))[0]
            pc = struct.unpack('>I', uc.mem_read(a7 + 2, 4))[0]
            uc.reg_write(UC_M68K_REG_A7, a7 + 6)
            uc.reg_write(UC_M68K_REG_SR, sr)
            uc.reg_write(UC_M68K_REG_PC, pc)
            self.pc = pc
            self.in_irq = False
            return
        if intno == self.EXCP_HALT:
            return
        self.exceptions.append((self.frame, intno, uc.reg_read(UC_M68K_REG_PC)))
        if len(self.exceptions) > 200:
            self.log.append(f"кадр {self.frame}: слишком много исключений, останов")
            self.stopped = True
            uc.emu_stop()

    def _irq(self, level, vector_addr):
        u = self.uc
        sr = u.reg_read(UC_M68K_REG_SR)
        if ((sr >> 8) & 7) >= level:
            return False
        pc = u.reg_read(UC_M68K_REG_PC)
        a7 = u.reg_read(UC_M68K_REG_A7)
        a7 -= 4
        u.mem_write(a7, struct.pack('>I', pc))
        a7 -= 2
        u.mem_write(a7, struct.pack('>H', sr & 0xFFFF))
        u.reg_write(UC_M68K_REG_A7, a7)
        u.reg_write(UC_M68K_REG_SR, (sr & ~0x0700) | (level << 8) | 0x2000)
        tgt = struct.unpack('>I', self.rom[vector_addr:vector_addr + 4])[0]
        u.reg_write(UC_M68K_REG_PC, tgt)
        self.pc = tgt
        return True

    def _on_unmapped(self, uc, access, address, size, value, user):
        """Подставляет пустую страницу вместо несуществующей памяти."""
        if self.phantom > 256:
            return False
        page = address & ~0xFFF
        try:
            uc.mem_map(page, 0x1000, UC_PROT_ALL)
            self.phantom += 1
        except UcError:
            pass
        return True

    def _on_rom_write(self, uc, access, address, size, value, user):
        """Запись в ПЗУ: откатываем ПОЧТИ МГНОВЕННО.

        ⚠️ Раньше откат делался в конце куска работы, и этого было мало.
        Дикая запись портила таблицу в ПЗУ, а игра успевала прочитать её
        в том же куске — и уходила в разнос: цикл отрисовки не находил
        признака конца, писал сотни слов подряд и затирал номер режима.
        Выглядело это как «бот завалился на 35-й фигуре».

        Теперь откатываем предыдущую запись на первом же следующем обращении,
        так что испорченной ПЗУ остаётся не дольше одной инструкции.
        """
        if self.rom_writes:
            self._undo_rom_writes()
        self.rom_writes.append((address, size))
        self.rom_write_count += 1
        return True

    def _undo_rom_writes(self):
        if not self.rom_writes:
            return
        for address, size in self.rom_writes:
            off = address - ROM_BASE
            if 0 <= off < len(self.rom):
                orig = bytes(self.rom[off:off + size])
                if len(orig) < size:
                    orig += bytes(size - len(orig))
            else:
                orig = bytes(size)
            try:
                self.uc.mem_write(address, orig)
            except UcError:
                pass
        self.rom_writes.clear()

    def _run_chunk(self, count):
        u = self.uc
        try:
            u.emu_start(self.pc, 0, 0, count)
        except UcError as e:
            regs = ' '.join(f"d{i}={u.reg_read(UC_M68K_REG_D0 + i):08X}" for i in range(8))
            aregs = ' '.join(f"a{i}={u.reg_read(UC_M68K_REG_A0 + i):08X}" for i in range(8))
            self.log.append(
                f"кадр {self.frame}: ошибка процессора {e} на PC={u.reg_read(UC_M68K_REG_PC):06X}\n"
                f"    {regs}\n    {aregs}")
            self.stopped = True
        self.pc = u.reg_read(UC_M68K_REG_PC)
        self._undo_rom_writes()

    def step_frame(self):
        """Один кадр: активная часть экрана, затем V-Blank с прерыванием."""
        r = self.vdp_reg
        self.vblank = False
        lines = 224
        hint_en = self.hint_enabled and (r[0x00] & 0x10)
        if hint_en:
            per = max(1, self.instr_per_frame // lines)
            cnt = r[0x0A]
            for ln in range(lines):
                if self.stopped:
                    break
                self._run_chunk(per)
                if cnt == 0:
                    cnt = r[0x0A]
                    self._irq(4, 0x70)
                else:
                    cnt -= 1
        else:
            self._run_chunk(self.instr_per_frame)
        self.vblank = True
        if not self.stopped and (r[0x01] & 0x20):
            self._irq(6, 0x78)
        self._run_chunk(self.instr_per_frame // 6)
        self.frame += 1

    def run_frames(self, n, on_frame=None):
        for _ in range(n):
            if self.stopped:
                break
            self.step_frame()
            if on_frame:
                on_frame(self)

    def add_code_hook(self, addr, cb):
        """Зовёт cb(md, pc) КАЖДЫЙ раз, когда выполняется команда по адресу addr."""
        def h(uc, address, size, ud=None):
            cb(self, address)
        self.uc.hook_add(UC_HOOK_CODE, h, begin=addr, end=addr)

    def regs(self):
        u = self.uc
        return ([u.reg_read(UC_M68K_REG_D0 + i) for i in range(8)],
                [u.reg_read(UC_M68K_REG_A0 + i) for i in range(8)])

    # ---------------- слежка за памятью ----------------
    def add_watch(self, lo, hi, cb):
        """Зовёт cb(md, адрес, размер, значение, pc) на КАЖДУЮ запись в диапазон.
        Главный инструмент разбора: показывает, КАКОЙ КОД трогает ячейку."""
        self.watch.append((lo & 0xFFFFFF, hi & 0xFFFFFF, cb))
        for base in (0x000000, 0xFF000000):
            self.uc.hook_add(UC_HOOK_MEM_WRITE, self._on_write,
                             begin=(lo | base) & 0xFFFFFFFF, end=(hi | base) & 0xFFFFFFFF)

    def add_read_watch(self, lo, hi, cb):
        """Зовёт cb(md, адрес, размер, pc) на КАЖДОЕ чтение из диапазона.
        ⚠️ Ставить ДО загрузки ROM: движок кеширует оттранслированный код."""
        self.read_watch = getattr(self, 'read_watch', [])
        self.read_watch.append((lo & 0xFFFFFF, hi & 0xFFFFFF, cb))
        for base in (0x000000, 0xFF000000):
            self.uc.hook_add(UC_HOOK_MEM_READ, self._on_read,
                             begin=(lo | base) & 0xFFFFFFFF, end=(hi | base) & 0xFFFFFFFF)

    def _on_read(self, uc, access, address, size, value, ud=None):
        a = address & 0xFFFFFF
        pc = uc.reg_read(UC_M68K_REG_PC)
        for lo, hi, cb in getattr(self, 'read_watch', []):
            if lo <= a <= hi:
                cb(self, a, size, pc)

    def _on_write(self, uc, access, address, size, value, ud=None):
        a = address & 0xFFFFFF
        pc = uc.reg_read(UC_M68K_REG_PC)
        for lo, hi, cb in self.watch:
            if lo <= a <= hi:
                cb(self, a, size, value, pc)

    # ---------------- доступ к памяти ----------------
    def rb(self, a):
        return self.uc.mem_read(a, 1)[0]

    def rw(self, a):
        return struct.unpack('>H', self.uc.mem_read(a, 2))[0]

    def rl(self, a):
        return struct.unpack('>I', self.uc.mem_read(a, 4))[0]

    def wb(self, a, v):
        self.uc.mem_write(a, bytes([v & 0xFF]))

    def ww(self, a, v):
        self.uc.mem_write(a, struct.pack('>H', v & 0xFFFF))

    def wl(self, a, v):
        self.uc.mem_write(a, struct.pack('>I', v & 0xFFFFFFFF))

    def ram_snapshot(self):
        return bytes(self.uc.mem_read(RAM_BASE, RAM_SIZE))

    def press(self, port, *buttons):
        v = 0xFF
        for b in buttons:
            v &= ~(1 << BTN[b]) & 0xFF
        self.pad[port] = v

    def release(self, port):
        self.pad[port] = 0xFF

    # ---------------- картинка ----------------
    def _palette(self):
        pal = []
        for i in range(64):
            w = struct.unpack('>H', bytes(self.cram[i * 2:i * 2 + 2]))[0]
            b = (w >> 9) & 7
            g = (w >> 5) & 7
            r_ = (w >> 1) & 7
            pal.append((r_ * 36, g * 36, b * 36))
        return pal

    def _tile_px(self, tile_idx, px, py, hflip, vflip):
        if hflip:
            px = 7 - px
        if vflip:
            py = 7 - py
        off = tile_idx * 32 + py * 4 + (px >> 1)
        if off >= len(self.vram):
            return 0
        byte = self.vram[off]
        return (byte >> 4) if (px & 1) == 0 else (byte & 0x0F)

    def render_np(self, scale=2):
        """БЫСТРАЯ отрисовка кадра — то же самое, что render(), но на numpy.

        Зачем: старая рисует по пикселю на питоне, 66 мс на кадр (15 кадров/с),
        а сам кадр игры считается за 7 мс. Для живого стенда это не годится —
        картинка отставала бы вчетверо от игры. Здесь тайлы раскрываются
        ОДНОЙ операцией на всю видеопамять, а планы собираются индексацией.

        Рисует ровно то же и в том же порядке: план B, план A, спрайты по
        цепочке link. Прокрутки в нашей отрисовке нет и не было — игра ею
        не пользуется.
        """
        import numpy as np
        from PIL import Image
        r = self.vdp_reg
        h40 = (r[0x0C] & 0x81) == 0x81
        W = 320 if h40 else 256
        H = 224

        vr = np.frombuffer(bytes(self.vram), dtype=np.uint8)
        # вся видеопамять -> тайлы 8x8 по 4 бита на пиксель
        целых = len(vr) // 32
        куски = vr[:целых * 32].reshape(целых, 8, 4)
        тайлы = np.empty((целых, 8, 8), dtype=np.uint8)
        тайлы[:, :, 0::2] = куски >> 4
        тайлы[:, :, 1::2] = куски & 0x0F

        экран = np.full((H, W), r[0x07] & 0x3F, dtype=np.uint8)

        hw = {0: 32, 1: 64, 2: 64, 3: 128}[r[0x10] & 3]
        vh = {0: 32, 1: 64, 2: 64, 3: 128}[(r[0x10] >> 4) & 3]
        TY, TX = H // 8 + 1, W // 8 + 1
        cy = (np.arange(TY) % vh)[:, None]
        cx = (np.arange(TX) % hw)[None, :]

        def план(base):
            e = base + (cy * hw + cx) * 2
            годно = (e + 1) < len(vr)
            e = np.where(годно, e, 0)
            w = (vr[e].astype(np.uint16) << 8) | vr[e + 1]
            tile = (w & 0x7FF).astype(np.int32)
            hf = ((w >> 11) & 1).astype(bool)
            vf = ((w >> 12) & 1).astype(bool)
            pl = ((w >> 13) & 3).astype(np.uint8)
            пиксели = тайлы[np.clip(tile, 0, целых - 1)]        # (TY,TX,8,8)
            пиксели = np.where(hf[:, :, None, None], пиксели[:, :, :, ::-1], пиксели)
            пиксели = np.where(vf[:, :, None, None], пиксели[:, :, ::-1, :], пиксели)
            видно = (пиксели != 0) & годно[:, :, None, None] & (tile != 0)[:, :, None, None]
            цвет = pl[:, :, None, None] * 16 + пиксели
            полотно = цвет.transpose(0, 2, 1, 3).reshape(TY * 8, TX * 8)[:H, :W]
            маска = видно.transpose(0, 2, 1, 3).reshape(TY * 8, TX * 8)[:H, :W]
            экран[маска] = полотно[маска]

        план((r[0x04] & 0x07) << 13)      # план B
        план((r[0x02] & 0x38) << 10)      # план A

        spr = (r[0x05] & 0x7F) << 9
        idx = 0
        for _ in range(80):
            e = spr + idx * 8
            if e + 7 >= len(vr):
                break
            y = ((int(vr[e]) << 8) | int(vr[e + 1])) & 0x3FF
            szb = int(vr[e + 2])
            link = int(vr[e + 3]) & 0x7F
            attr = (int(vr[e + 4]) << 8) | int(vr[e + 5])
            x = ((int(vr[e + 6]) << 8) | int(vr[e + 7])) & 0x1FF
            wcell = ((szb >> 2) & 3) + 1
            hcell = (szb & 3) + 1
            tile = attr & 0x7FF
            hf = (attr >> 11) & 1
            vf = (attr >> 12) & 1
            pl = (attr >> 13) & 3
            for кx in range(wcell):
                for кy in range(hcell):
                    t = tile + (кx if not hf else wcell - 1 - кx) * hcell                              + (кy if not vf else hcell - 1 - кy)
                    if not (0 <= t < целых):
                        continue
                    кусок = тайлы[t]
                    if hf:
                        кусок = кусок[:, ::-1]
                    if vf:
                        кусок = кусок[::-1, :]
                    Y0, X0 = y - 128 + кy * 8, x - 128 + кx * 8
                    y1, y2 = max(0, Y0), min(H, Y0 + 8)
                    x1, x2 = max(0, X0), min(W, X0 + 8)
                    if y1 >= y2 or x1 >= x2:
                        continue
                    вид = кусок[y1 - Y0:y2 - Y0, x1 - X0:x2 - X0]
                    м = вид != 0
                    окно = экран[y1:y2, x1:x2]
                    окно[м] = pl * 16 + вид[м]
            idx = link
            if link == 0:
                break

        палитра = np.array(self._palette(), dtype=np.uint8)
        картинка = палитра[экран]
        img = Image.fromarray(картинка, 'RGB')
        if scale != 1:
            img = img.resize((W * scale, H * scale), Image.NEAREST)
        return img

    def render(self, path=None, scale=2):
        """Рисует текущий кадр: план B, план A, спрайты.

        Без пути возвращает готовую картинку — так её можно показывать
        в окне, не гоняя каждый кадр через диск.
        """
        from PIL import Image
        r = self.vdp_reg
        pal = self._palette()
        h40 = (r[0x0C] & 0x81) == 0x81
        W = 320 if h40 else 256
        H = 224
        img = Image.new('RGB', (W, H), pal[r[0x07] & 0x3F])
        px = img.load()

        planeA = (r[0x02] & 0x38) << 10
        planeB = (r[0x04] & 0x07) << 13
        spr = (r[0x05] & 0x7F) << 9
        sz = r[0x10]
        hw = {0: 32, 1: 64, 2: 64, 3: 128}[sz & 3]
        vh = {0: 32, 1: 64, 2: 64, 3: 128}[(sz >> 4) & 3]

        def draw_plane(base, opaque_bg):
            for ty in range(H // 8 + 1):
                for tx in range(W // 8 + 1):
                    cx, cy = tx % hw, ty % vh
                    e = base + (cy * hw + cx) * 2
                    if e + 1 >= len(self.vram):
                        continue
                    w = (self.vram[e] << 8) | self.vram[e + 1]
                    tile = w & 0x7FF
                    hf = (w >> 11) & 1
                    vf = (w >> 12) & 1
                    pl = (w >> 13) & 3
                    if tile == 0:
                        continue
                    for yy in range(8):
                        Y = ty * 8 + yy
                        if Y >= H:
                            break
                        for xx in range(8):
                            X = tx * 8 + xx
                            if X >= W:
                                break
                            c = self._tile_px(tile, xx, yy, hf, vf)
                            if c or opaque_bg:
                                px[X, Y] = pal[pl * 16 + c]

        draw_plane(planeB, False)
        draw_plane(planeA, False)

        # спрайты
        idx = 0
        for _ in range(80):
            e = spr + idx * 8
            if e + 7 >= len(self.vram):
                break
            y = ((self.vram[e] << 8) | self.vram[e + 1]) & 0x3FF
            szb = self.vram[e + 2]
            link = self.vram[e + 3] & 0x7F
            attr = (self.vram[e + 4] << 8) | self.vram[e + 5]
            x = ((self.vram[e + 6] << 8) | self.vram[e + 7]) & 0x1FF
            wcell = ((szb >> 2) & 3) + 1
            hcell = (szb & 3) + 1
            tile = attr & 0x7FF
            hf = (attr >> 11) & 1
            vf = (attr >> 12) & 1
            pl = (attr >> 13) & 3
            for cx in range(wcell):
                for cy in range(hcell):
                    t = tile + (cx if not hf else wcell - 1 - cx) * hcell + (cy if not vf else hcell - 1 - cy)
                    for yy in range(8):
                        Y = y - 128 + cy * 8 + yy
                        if not (0 <= Y < H):
                            continue
                        for xx in range(8):
                            X = x - 128 + cx * 8 + xx
                            if not (0 <= X < W):
                                continue
                            c = self._tile_px(t, xx, yy, hf, vf)
                            if c:
                                px[X, Y] = pal[pl * 16 + c]
            idx = link
            if link == 0:
                break
        img = img.resize((W * scale, H * scale), Image.NEAREST)
        if path is None:
            return img
        img.save(path)
        return path
