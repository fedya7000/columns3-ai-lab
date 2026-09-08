# Слой «руки и глаза» бота: чтение состояния из ОЗУ и постановка фигуры.
#
# Всё разобрано в docs\razbor.md:
#   +0x06 указатель на поле (ряд 0 = первый ВИДИМЫЙ), ряд = 16 байт, ячейка = слово
#   +0x42 колонка фигуры (0..5) · +0x4E клетка под фигурой · +0x70 счётчик уложенных
#   +0x60/62/64 цвета текущей фигуры СВЕРХУ ВНИЗ · +0xCE/D0/D2 то же для следующей
#   +0x4C высота завала (>=24 — смерть) · +0x6C длина цепочки
import os, sys
sys.path.insert(0, os.path.dirname(__file__))

ROW = 16
COLS, ROWS = 6, 13
HIDDEN = 6                 # скрытых рядов над экраном
P1, P2 = 0xFF1000, 0xFF1400


def field(md, p, with_hidden=True):
    """Поле сверху вниз. Индекс 0 = ряд -HIDDEN (или ряд 0). Только цвет, без флагов."""
    base = md.rl(p + 6)
    lo = -HIDDEN if with_hidden else 0
    return [[md.rw(base + r * ROW + c * 2) & 0xFF for c in range(COLS)]
            for r in range(lo, ROWS)]


def cur_piece(md, p):
    return (md.rw(p + 0x60), md.rw(p + 0x62), md.rw(p + 0x64))


def next_piece(md, p):
    return (md.rw(p + 0xCE), md.rw(p + 0xD0), md.rw(p + 0xD2))


def piece_col(md, p):
    return md.rw(p + 0x42)


def placed(md, p):
    return md.rw(p + 0x70)


def dead(md, p):
    return md.rw(p + 0x4C) >= 24


def in_battle(md):
    return md.rw(0xFF0406) == 0x20


class Hands:
    """Доводит фигуру до нужной колонки с нужным сдвигом цветов и роняет её.

    Кнопку нельзя держать: игра считает удержание одним нажатием, поэтому
    каждый ход — такт «нажал / отпустил».
    """

    def __init__(self, md, port=0, p=P1):
        self.md, self.port, self.p = md, port, p

    def _tap(self, btn, hold=2, gap=2):
        self.md.press(self.port, btn)
        for _ in range(hold):
            self.md.step_frame()
        self.md.release(self.port)
        for _ in range(gap):
            self.md.step_frame()

    def play(self, col, rot, limit=400):
        """Ставит текущую фигуру. Возвращает число кадров или None, если фигура сменилась сама."""
        md, p = self.md, self.p
        n0 = placed(md, p)
        used = 0
        for _ in range(rot % 3):
            self._tap('b'); used += 4
            if placed(md, p) != n0:
                return None
        while used < limit:
            c = piece_col(md, p)
            if c == col:
                break
            self._tap('right' if c < col else 'left'); used += 4
            if placed(md, p) != n0 or not in_battle(md):
                return None
        # ускоренное падение
        while used < limit:
            md.press(self.port, 'down')
            md.step_frame(); used += 1
            if placed(md, p) != n0 or not in_battle(md):
                break
        md.release(self.port)
        # дождаться, пока схлопывания отработают и появится новая фигура
        for _ in range(4):
            md.step_frame(); used += 1
        return used


def wait_new_piece(md, p, limit=600):
    """Ждёт появления следующей фигуры (счётчик уложенных изменился)."""
    n0 = placed(md, p)
    for i in range(limit):
        md.step_frame()
        if placed(md, p) != n0:
            return i
        if not in_battle(md) or dead(md, p):
            return None
    return None
