# Работает ли золотая фигура при LAYERS = 0? Прошлый раз я проверил её
# в первый же миг появления — когда игра ещё показывает заставку уровня и
# кнопки не слушает. Теперь честно: ловим, ЖДЁМ, потом жмём.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, duel, bot_io as io, brain as brains, play_rom, train

боец, _ = train.load()
for слои in (0, 1):
    md = session.new(); duel.boot_duel(md, слои); io.fix_empty_slots(md)
    h1 = io.Hands(md, 0, io.P1); h2 = io.Hands(md, 1, io.P2)
    io.wait_ready(md, io.P1)
    поймали = False
    for i in range(70):
        live = (md.rw(io.P1 + 0x100), md.rw(io.P1 + 0x120), md.rw(io.P1 + 0x140))
        if any((v & 0xFF) >= 7 for v in live):
            поймали = True
            break
        play_rom.one_move(md, h1, io.P1, боец, 1)
        if io.piece_ready(md, io.P2):
            play_rom.one_move(md, h2, io.P2, боец, 1)
        play_rom.wait_stable(md, io.P1)
    if not поймали:
        print('слои=%d: золотая не выпала за 70 ходов' % слои)
        continue
    for _ in range(40):          # ← вот этого в прошлый раз не было
        md.step_frame()
    c0 = io.piece_col(md, io.P1)
    h1.tap('right')
    c1 = io.piece_col(md, io.P1)
    было = (md.rw(io.P1 + 0x100), md.rw(io.P1 + 0x120), md.rw(io.P1 + 0x140))
    h1.tap('b')
    стало = (md.rw(io.P1 + 0x100), md.rw(io.P1 + 0x120), md.rw(io.P1 + 0x140))
    print('слои=%d: колонка %d->%d (%s), поворот %s -> %s (%s)'
          % (слои, c0, c1, 'двигается' if c1 != c0 else 'НЕ двигается',
             было, стало, 'крутится' if было != стало else 'НЕ крутится'))
