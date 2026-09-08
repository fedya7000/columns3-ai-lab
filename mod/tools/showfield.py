# Показывает ИГРОВОЕ ПОЛЕ обоих игроков сеткой — так видно, что делает игра.
#
# Устройство поля (найдено разбором):
#   указатель на поле лежит в структуре игрока по смещению +0x06
#   ячейка = СЛОВО (2 байта), ряд = 16 байт (8 слов)
#   $0000 = пусто, $0001..$0006 = цвет камня, $00FF = стена/пол
#
# python showfield.py [кадров] [шаг]
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session

P1 = 0xFF1000
P2 = 0xFF1400
ROW = 16          # байт на ряд
COLS = 8          # слов на ряд (6 игровых + 2 стены)

SYM = {0x0000: '.', 0x00FF: '#'}


def field_ptr(md, p):
    return md.rl(p + 6)


def show(md, label, p, rows_up=4, rows_dn=16):
    base = field_ptr(md, p)
    print(f"{label}  поле=${base:06X}")
    for r in range(-rows_up, rows_dn):
        a = base + r * ROW
        cells = []
        for c in range(COLS):
            v = md.rw(a + c * 2)
            cells.append(SYM.get(v, str(v) if v < 10 else f'{v:02X}'))
        mark = '<' if r == 0 else (' ' if r > 0 else '^')
        print(f"  {r:+3} ${a:06X} {' '.join(cells)} {mark}")


if __name__ == '__main__':
    NF = int(sys.argv[1]) if len(sys.argv) > 1 else 1800
    STEP = int(sys.argv[2]) if len(sys.argv) > 2 else 600
    md = session.new()
    session.boot_vs(md)
    for i in range(NF):
        md.step_frame()
        if (i + 1) % STEP == 0:
            print(f"\n########## кадр +{i+1} ##########")
            show(md, 'ИГРОК 1', P1)
            show(md, 'ИГРОК 2', P2, rows_up=0, rows_dn=0)
