# Пять видов порчи: включаем каждую напрямую и смотрим глазами.
#
# Таймеры лежат подряд: +0xF0, +0xF2, +0xF4, +0xF6, +0xF8 — по одному на вид.
# Их заводит собранный особый камень ($4000), длительность берётся из
# таблицы по длине цепочки ($009BD2).
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io, brain as brains, play_rom

NAMES = ['+0xF0 (0)', '+0xF2 (1)', '+0xF4 (2)', '+0xF6 (3)', '+0xF8 (4)']
shots = os.path.join(os.path.dirname(__file__), '..', 'shots')
os.makedirs(shots, exist_ok=True)

md = session.new(); session.boot_vs(md); io.fix_empty_slots(md)
h1 = io.Hands(md, 0, io.P1); h2 = io.Hands(md, 1, io.P2); head = brains.Linear()
io.wait_ready(md, io.P1)
for _ in range(14):
    play_rom.one_move(md, h1, io.P1, head, 1)
    if io.piece_ready(md, io.P2):
        play_rom.one_move(md, h2, io.P2, head, 1)
play_rom.wait_stable(md, io.P1)
md.render(os.path.join(shots, 'porcha_нет.png'))
print('обычный вид снят')

for i, name in enumerate(NAMES):
    for k in range(5):                      # погасить остальные
        md.ww(io.P1 + 0xF0 + k * 2, 0)
    md.ww(io.P1 + 0xF0 + i * 2, 900)
    md.wb(io.P1 + 0xA7, 3)                  # заставить перерисовать
    for _ in range(40):
        md.step_frame()
    # немного поиграем, чтобы порча проявилась в движении
    before_col = io.piece_col(md, io.P1)
    h1.tap('right')
    after_col = io.piece_col(md, io.P1)
    md.render(os.path.join(shots, 'porcha_%d.png' % i))
    print('%s: жму ВПРАВО -> колонка %d -> %d %s'
          % (name, before_col, after_col,
             '← ПОЕХАЛА ВЛЕВО' if after_col < before_col else
             ('← не двинулась' if after_col == before_col else '')))
