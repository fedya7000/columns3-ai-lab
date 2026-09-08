# Автоигрок: ведёт обоих игроков, чтобы в бою РЕАЛЬНО собирались камни.
#
# Что известно про структуру игрока (разобрано):
#   +0x06 (long) — указатель на поле; ряд = 16 байт, ячейка = слово
#   +0x42 (word) — колонка падающей фигуры (0..5)
#   +0x4E (long) — указатель на клетку поля под фигурой
#
# Стратегия простая: на каждую новую фигуру выбирается колонка (по кругу или
# случайно) и фигура туда уводится, потом ускоренное падение.
# Умного подбора нет и не нужно: цель — чтобы сборы случались часто.
import os, sys, random
sys.path.insert(0, os.path.dirname(__file__))

P1, P2 = 0xFF1000, 0xFF1400
ROW, COLS, ROWS = 16, 6, 13


def field_base(md, p):
    return md.rl(p + 6)


def piece_row(md, p):
    ptr = md.rl(p + 0x4E)
    base = field_base(md, p)
    if base == 0 or ptr < base:
        return -1
    return (ptr - base) // ROW


def piece_col(md, p):
    return md.rw(p + 0x42)


def cell(md, p, r, c):
    return md.rw(field_base(md, p) + r * ROW + c * 2)


def column_height(md, p, c):
    """Сколько занято в колонке снизу — нужно, чтобы не заваливать одну."""
    h = 0
    for r in range(ROWS - 1, -1, -1):
        v = cell(md, p, r, c)
        if v == 0:
            break
        h += 1
    return h


class Bot:
    """Ведёт одного игрока. rng — свой на игрока, чтобы поля расходились."""

    def __init__(self, port, struct_addr, seed):
        self.port = port
        self.p = struct_addr
        self.rng = random.Random(seed)
        self.target = None
        self.prev_row = -1

    def decide(self, md):
        r = piece_row(md, self.p)
        if r < 0:
            return []
        # новая фигура: ряд скакнул вверх
        if r < self.prev_row or self.target is None:
            heights = [column_height(md, self.p, c) for c in range(COLS)]
            lo = min(heights)
            good = [c for c in range(COLS) if heights[c] <= lo + 1]
            self.target = self.rng.choice(good)
        self.prev_row = r
        c = piece_col(md, self.p)
        if c < self.target:
            return ['right']
        if c > self.target:
            return ['left']
        return ['down']


def run_match(md, frames, on_frame=None, seed=1):
    bots = [Bot(0, P1, seed), Bot(1, P2, seed + 77)]
    for i in range(frames):
        for b in bots:
            btns = b.decide(md)
            # кнопку надо ОТПУСКАТЬ, иначе игра считает её удержанием и не двигает
            if btns and (i % 2 == 0):
                md.press(b.port, *btns)
            else:
                md.release(b.port)
        md.step_frame()
        if md.stopped:
            break
        if on_frame:
            on_frame(md, i)
    return md


if __name__ == '__main__':
    import session
    frames = int(sys.argv[1]) if len(sys.argv) > 1 else 3000
    md = session.new()
    session.boot_vs(md)
    shots = os.path.join(os.path.dirname(__file__), '..', 'shots', 'auto')
    os.makedirs(shots, exist_ok=True)

    def tick(md, i):
        if (i + 1) % 600 == 0:
            md.render(os.path.join(shots, f"a{i+1:05}.png"))
            n = sum(1 for r in range(ROWS) for c in range(COLS) if 0 < cell(md, P1, r, c) < 0xFF)
            print(f"кадр +{i+1:5}  камней у P1={n:3}  режим={md.rw(0xFF0406):04X}")

    run_match(md, frames, tick)
    print("готово, кадров:", md.frame)
