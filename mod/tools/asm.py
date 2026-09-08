# Крошечный ассемблер 68000 — ровно те команды, что нужны для правок ROM.
#
# Зачем: смещения условных переходов считать руками — верный способ ошибиться.
# Здесь есть МЕТКИ, и смещения считаются сами в два прохода.
#
# Всё, что он выдаёт, потом всё равно проверяется дизассемблером (patch.py),
# так что ошибка в кодировке не пройдёт молча.
import struct

# коды условий для Bcc
CC = {'ra': 0x0, 'sr': 0x1, 'hi': 0x2, 'ls': 0x3, 'cc': 0x4, 'cs': 0x5,
      'ne': 0x6, 'eq': 0x7, 'vc': 0x8, 'vs': 0x9, 'pl': 0xA, 'mi': 0xB,
      'ge': 0xC, 'lt': 0xD, 'gt': 0xE, 'le': 0xF,
      'lo': 0x5, 'hs': 0x4}          # синонимы для беззнаковых сравнений


class Asm:
    def __init__(self, org):
        self.org = org
        self.items = []              # (размер, функция_или_байты)
        self.labels = {}

    # ---- служебное ----
    def _add(self, data):
        self.items.append((len(data), data))

    def label(self, name):
        self.items.append((0, ('LABEL', name)))

    def raw(self, hexstr, _comment=''):
        self._add(bytes.fromhex(hexstr.replace(' ', '')))

    def db(self, *vals):
        self._add(bytes(vals))

    # ---- переходы с метками ----
    def bcc(self, cond, label):
        """Bcc.w — всегда словом, чтобы хватало дальности и размер был известен."""
        op = 0x6000 | (CC[cond] << 8)

        def emit(pc, labels):
            disp = labels[label] - (pc + 2)
            if not -32768 <= disp <= 32767:
                raise ValueError(f'слишком далеко до {label}: {disp}')
            return struct.pack('>HH', op, disp & 0xFFFF)
        self.items.append((4, emit))

    def lea_label(self, label, an):
        """lea метка.l,An — адрес метки подставляется на втором проходе."""
        op = 0x41F9 | (an << 9)

        def emit(pc, labels):
            return struct.pack('>HI', op, labels[label])
        self.items.append((6, emit))

    def dbra(self, dn, label):
        """dbra Dn, метка — счётчик цикла; смещение считается автоматически."""
        op = 0x51C8 | dn

        def emit(pc, labels):
            disp = labels[label] - (pc + 2)
            return struct.pack('>Hh', op, disp)
        self.items.append((4, emit))

    def move_l_postinc(self, src_an, dst_an):
        """move.l (Asrc)+, (Adst)+"""
        self._add(struct.pack('>H', 0x20C0 | (dst_an << 9) | 0x0018 | src_an))

    def move_l_postinc_dn(self, an, dn):
        """move.l (An)+, Dn — заодно взводит признак нуля"""
        self._add(struct.pack('>H', 0x2018 | (dn << 9) | an))

    def move_w_postinc_dn(self, an, dn):
        """move.w (An)+, Dn"""
        self._add(struct.pack('>H', 0x3018 | (dn << 9) | an))

    def move_w_dn_abs(self, dn, addr):
        """move.w Dn, (xxx).L"""
        self._add(struct.pack('>HI', 0x33C0 | dn, addr))

    # ---- команды с фиксированной кодировкой ----
    def cmpi_w_dn(self, imm, dn):
        self._add(struct.pack('>HH', 0x0C40 | dn, imm & 0xFFFF))

    def cmpi_w_abs(self, imm, addr):
        self._add(struct.pack('>HHI', 0x0C79, imm & 0xFFFF, addr))

    def cmpi_b_abs(self, imm, addr):
        self._add(struct.pack('>HHI', 0x0C39, imm & 0xFF, addr))

    def tst_b_abs(self, addr):
        self._add(struct.pack('>HI', 0x4A39, addr))

    def clr_b_abs(self, addr):
        self._add(struct.pack('>HI', 0x4239, addr))

    def move_b_imm_abs(self, imm, addr):
        self._add(struct.pack('>HHI', 0x13FC, imm & 0xFF, addr))

    def move_l_imm_dn(self, imm, dn):
        self._add(struct.pack('>HI', 0x203C | (dn << 9), imm & 0xFFFFFFFF))

    def move_w_imm_dn(self, imm, dn):
        self._add(struct.pack('>HH', 0x303C | (dn << 9), imm & 0xFFFF))

    def cmpi_w_d16an(self, imm, an, disp):
        self._add(struct.pack('>HHH', 0x0C68 | an, imm & 0xFFFF, disp & 0xFFFF))

    def cmpi_w_d16a6(self, imm, disp):
        self._add(struct.pack('>HHH', 0x0C6E, imm & 0xFFFF, disp & 0xFFFF))

    def lea_abs(self, addr, an):
        self._add(struct.pack('>HI', 0x41F9 | (an << 9), addr))

    def move_w_d16an_dn(self, an, disp, dn):
        self._add(struct.pack('>HH', 0x3028 | (dn << 9) | an, disp & 0xFFFF))

    def move_w_abs_dn(self, addr, dn):
        self._add(struct.pack('>HI', 0x3039 | (dn << 9), addr))

    def cmp_w_abs_dn(self, addr, dn):
        self._add(struct.pack('>HI', 0xB079 | (dn << 9), addr))

    def move_w_d16an_abs(self, an, disp, addr):
        self._add(struct.pack('>HHI', 0x33E8 | an, disp & 0xFFFF, addr))

    def move_w_dn_d16a6(self, dn, disp):
        self._add(struct.pack('>HH', 0x3D40 | dn, disp & 0xFFFF))

    def move_w_imm_d16a6(self, imm, disp):
        self._add(struct.pack('>HHH', 0x3D7C, imm & 0xFFFF, disp & 0xFFFF))

    def move_b_imm_d16an(self, imm, an, disp):
        self._add(struct.pack('>HHH', 0x117C | (an << 9), imm & 0xFF, disp & 0xFFFF))

    def cmp_w_d16an_dn(self, an, disp, dn):
        self._add(struct.pack('>HH', 0xB068 | (dn << 9) | an, disp & 0xFFFF))

    def add_w_dn_d16a6(self, dn, disp):
        self._add(struct.pack('>HH', 0xD16E | (dn << 9), disp & 0xFFFF))

    def move_w_dn_dn(self, src, dst):
        self._add(struct.pack('>H', 0x3000 | (dst << 9) | src))

    def move_b_idx_dn(self, an, ix, dn):
        """move.b (An,Dx.w),Dn — выборка из таблицы"""
        self._add(struct.pack('>HH', 0x1030 | (dn << 9) | an, (ix << 12)))

    def andi_w_dn(self, imm, dn):
        self._add(struct.pack('>HH', 0x0240 | dn, imm & 0xFFFF))

    def moveq(self, imm, dn):
        self._add(struct.pack('>H', 0x7000 | (dn << 9) | (imm & 0xFF)))

    def mulu_dn_dn(self, src, dst):
        self._add(struct.pack('>H', 0xC0C0 | (dst << 9) | src))

    def sub_w_dn_dn(self, src, dst):
        """sub.w Dsrc, Ddst"""
        self._add(struct.pack('>H', 0x9040 | (dst << 9) | src))

    def asl_w_imm_dn(self, count, dn):
        """asl.w #count, Dn (count 1..8, где 8 кодируется нулём)"""
        c = count & 7
        self._add(struct.pack('>H', 0xE140 | (c << 9) | dn))

    def movea_l_an_a6(self, an):
        self._add(struct.pack('>H', 0x2C48 | an))

    def movem_save(self, mask):
        self._add(struct.pack('>HH', 0x48E7, mask))

    def movem_restore(self, mask):
        self._add(struct.pack('>HH', 0x4CDF, mask))

    def jsr_abs(self, addr):
        self._add(struct.pack('>HI', 0x4EB9, addr))

    def jmp_abs(self, addr):
        self._add(struct.pack('>HI', 0x4EF9, addr))

    def rts(self):
        self._add(b'\x4e\x75')

    def nop(self):
        self._add(b'\x4e\x71')

    # ---- сборка ----
    def assemble(self):
        # проход 1: адреса меток
        pc = self.org
        for size, it in self.items:
            if isinstance(it, tuple) and it and it[0] == 'LABEL':
                self.labels[it[1]] = pc
            pc += size
        # проход 2: байты
        out = bytearray()
        pc = self.org
        for size, it in self.items:
            if isinstance(it, tuple) and it and it[0] == 'LABEL':
                continue
            data = it if isinstance(it, (bytes, bytearray)) else it(pc, self.labels)
            assert len(data) == size, f'размер не сошёлся на ${pc:06X}'
            out += data
            pc += size
        return bytes(out)
