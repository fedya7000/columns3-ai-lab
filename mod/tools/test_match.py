# БАТАРЕЯ ПРОВЕРОК ПОИСКА ЛИНИЙ.
#
# Выкладывает тройку одного цвета в разных местах и направлениях и смотрит,
# заметит ли её игра. Заметка видна по старшему биту ячейки ($8000 = «схлопнуть»).
#
# Под тройкой и под всеми камнями колонки ставится ЗАБИВКА, чтобы ничего не
# падало; забивка подбирается так, чтобы сама линий не давала (проверяется).
#
# python test_match.py <rom>
import sys, os, random
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, ROW, ROWS, COLS, field_base

ROM = sys.argv[1] if len(sys.argv) > 1 else os.path.join(
    os.path.dirname(__file__), '..', 'rom', 'Columns III (USA).gen')
TOP = -2                      # самый верхний играбельный ряд
COLOR = 4

# проверки: (имя, [(ряд, колонка) x3])
# ⚠️ Тройки уводим в ДАЛЬНИЕ колонки (3,4,5): забитая колонка 2 перекрывает
# место появления фигуры, игрок выбывает раньше поиска, и опыт врёт.
CASES = [
    ('вертикаль в середине',      [(5, 4), (6, 4), (7, 4)]),
    ('вертикаль у пола',          [(10, 4), (11, 4), (12, 4)]),
    ('вертикаль на краю экрана',  [(0, 4), (1, 4), (2, 4)]),
    ('вертикаль ЗА краем -1',     [(-1, 4), (0, 4), (1, 4)]),
    ('вертикаль ЗА краем -2',     [(-2, 4), (-1, 4), (0, 4)]),
    ('горизонталь в середине',    [(6, 3), (6, 4), (6, 5)]),
    ('горизонталь у пола',        [(12, 3), (12, 4), (12, 5)]),
    ('горизонталь на краю',       [(0, 3), (0, 4), (0, 5)]),
    ('горизонталь ЗА краем -1',   [(-1, 3), (-1, 4), (-1, 5)]),
    ('горизонталь ЗА краем -2',   [(-2, 3), (-2, 4), (-2, 5)]),
    ('диагональ в середине',      [(5, 3), (6, 4), (7, 5)]),
    ('диагональ у пола',          [(10, 3), (11, 4), (12, 5)]),
    ('диагональ на краю',         [(0, 3), (1, 4), (2, 5)]),
    ('диагональ ЗА краем -1',     [(-1, 3), (0, 4), (1, 5)]),
    ('диагональ ЗА краем -2',     [(-2, 3), (-1, 4), (0, 5)]),
    ('обратная диагональ середина', [(5, 5), (6, 4), (7, 3)]),
    ('обратная диагональ у пола', [(10, 5), (11, 4), (12, 3)]),
    ('обратная диагональ ЗА краем -1', [(-1, 5), (0, 4), (1, 3)]),
    ('обратная диагональ ЗА краем -2', [(-2, 5), (-1, 4), (0, 3)]),
]


def run_case(name, cells):
    md = session.new(ROM)
    session.boot_vs(md)
    bot = Bot(0, P1, 5)
    for _ in range(120):
        md.step_frame()
    base = field_base(md, P1)

    def put(r, c, v):
        md.uc.mem_write(base + r * ROW + c * 2, bytes([v >> 8, v & 0xFF]))

    def get(r, c):
        return md.rw(base + r * ROW + c * 2)

    # доска: забивка снизу под каждым камнем тройки + сама тройка
    board = {}
    rng = random.Random(12345)
    for (r, c) in cells:
        board[(r, c)] = COLOR
        for rr in range(r + 1, ROWS):
            board.setdefault((rr, c), None)
    # подобрать забивку без собственных линий
    def line_at(bd, r, c):
        v = bd.get((r, c))
        if not v:
            return False
        for dr, dc in ((0, 1), (1, 0), (1, 1), (1, -1)):
            n = 1
            for s in (1, -1):
                k = 1
                while bd.get((r + dr * k * s, c + dc * k * s)) == v:
                    n += 1
                    k += 1
            if n >= 3:
                return True
        return False

    trio = set(cells)
    for key in [k for k, v in board.items() if v is None]:
        for cand in rng.sample([c for c in range(1, 7) if c != COLOR], 5):
            board[key] = cand
            # проверяемая тройка — линия по замыслу; запрещаем ЛЮБЫЕ ДРУГИЕ
            if not any(line_at(board, r, c) for (r, c) in board if (r, c) not in trio):
                break
        else:
            board[key] = 1

    # проверка: тройка должна быть ЕДИНСТВЕННОЙ линией на доске
    lines = [k for k in board if line_at(board, *k)]
    if set(lines) != set(cells):
        return name, 'ЗАБИВКА ПОДВЕЛА', f"линии в {lines}"

    for (r, c), v in board.items():
        put(r, c, v)

    MODE = md.rw(0xFF0406)
    for i in range(900):
        b = bot.decide(md)
        if b and i % 2 == 0:
            md.press(0, *b)
        else:
            md.release(0)
        md.release(1)
        md.step_frame()
        if md.stopped:
            return name, 'ОСТАНОВ', md.log[-1].splitlines()[0]
        if any(get(r, c) & 0x8000 for (r, c) in cells):
            return name, 'НАШЛО', f"за {i} кадров"
        if md.rw(P1 + 0x4C) >= 0x18:
            # игрок выбыл — поиск линий уже не запустится, опыт не состоялся
            return name, 'ОПЫТ НЕ ВЫШЕЛ', f"игрок выбыл на кадре {i}"
        if md.rw(0xFF0406) != MODE:
            return name, 'НЕ НАШЛО', 'раунд кончился'
    return name, 'НЕ НАШЛО', 'за 900 кадров'


print(f"ROM: {os.path.basename(ROM)}\n")
ok = bad = 0
for name, cells in CASES:
    n, verdict, note = run_case(name, cells)
    flag = '+' if verdict == 'НАШЛО' else '-'
    print(f" {flag} {n:30} {verdict:16} {note}")
    if verdict == 'НАШЛО':
        ok += 1
    else:
        bad += 1
print(f"\nнашло: {ok}, не нашло: {bad}")
