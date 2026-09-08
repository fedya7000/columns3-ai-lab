# Второй случай: выживший ПЕРЕБИВАЕТ планку — раунд обязан кончиться
# ровно на превышении, и победа обязана достаться ему.
# Заодно снимает экран во время игры, чтобы видеть очки в белом окошке.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

ROM = sys.argv[1]
DELTA = int(sys.argv[2]) if len(sys.argv) > 2 else 3   # насколько планка выше текущих очков
PTS = 0xE4

md = session.new(ROM)
session.boot_vs(md)
bot = Bot(0, P1, 5)
planted = False
target = None
shots = os.path.join(os.path.dirname(__file__), '..', 'shots')

for i in range(30000):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()

    if not planted and md.rw(P2 + 0x4C) >= 0x1C:
        target = md.rw(P1 + PTS) + DELTA
        md.uc.mem_write(P2 + PTS, bytes([target >> 8, target & 0xFF]))
        planted = True
        print(f"кадр {md.frame}: игрок 2 выбыл с планкой {target}; "
              f"у игрока 1 сейчас {md.rw(P1+PTS)} — надо перебить")
        md.render(os.path.join(shots, 'turnir_play.png'))

    if planted and md.rw(0xFF0406) != 0x20:
        p1 = md.rw(P1 + PTS)
        print(f"кадр {md.frame}: раунд кончился. очки игрок1={p1}, планка={target}")
        print(f"  {'ПЕРЕБИЛ' if p1 > target else 'НЕ ПЕРЕБИЛ'}")
        for _ in range(500):
            md.step_frame()
        print(f"  победы: игрок1={md.rb(P1+0xD8)}W/{md.rb(P1+0xD9)}L  "
              f"игрок2={md.rb(P2+0xD8)}W/{md.rb(P2+0xD9)}L")
        md.render(os.path.join(shots, 'turnir_result.png'))
        break
