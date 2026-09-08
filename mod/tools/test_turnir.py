# ПРОВЕРКА турнирного правила.
#
# Опыт поставлен так, чтобы ответ был однозначным:
#   игрок 2 бездействует и заваливается; в момент его выбывания мы ВПИСЫВАЕМ
#   ему в очки заданную планку. Дальше смотрим, когда кончится раунд.
#
# Правильно (с правкой): раунд НЕ кончается, пока очки игрока 1 не станут
#   БОЛЬШЕ планки. Кончился ровно на превышении — правило работает.
# Сломано (оригинал): раунд кончается сразу же, как только выбыл игрок 2.
#
# python test_turnir.py <rom> [планка]
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

ROM = sys.argv[1]
TARGET = int(sys.argv[2]) if len(sys.argv) > 2 else 40
# где лежат очки: у правки — своё поле +0xE4, у оригинала счёта нет, берём +0x8C
PTS = int(sys.argv[3], 16) if len(sys.argv) > 3 else 0xE4

md = session.new(ROM)
session.boot_vs(md)
if md.stopped:
    print("ROM НЕ ЗАПУСТИЛСЯ:", md.log[-1] if md.log else '?')
    sys.exit(1)

bot = Bot(0, P1, 5)
mode_play = md.rw(0xFF0406)
planted = False
plant_frame = None
print(f"бой начался, режим=${mode_play:04X}, планка для игрока 1 = {TARGET}")

for i in range(30000):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)                                  # игрок 2 бездействует
    md.step_frame()
    if md.stopped:
        print("ОСТАНОВ:", md.log[-1])
        break

    # как только игрок 2 выбыл — вписываем ему планку
    if not planted and md.rw(P2 + 0x4C) >= 0x1C:
        md.uc.mem_write(P2 + PTS, bytes([TARGET >> 8, TARGET & 0xFF]))
        planted = True
        plant_frame = md.frame
        print(f"кадр {md.frame}: игрок 2 выбыл. вписали ему очки {TARGET}. "
              f"у игрока 1 сейчас {md.rw(P1+PTS)} очков, режим=${md.rw(0xFF0406):04X}")

    if planted:
        # держим планку: игра сама её не трогает, но подстрахуемся
        if md.rw(P2 + PTS) != TARGET and md.rw(0xFF0406) == mode_play:
            md.uc.mem_write(P2 + PTS, bytes([TARGET >> 8, TARGET & 0xFF]))
        if md.rw(0xFF0406) != mode_play:
            p1 = md.rw(P1 + PTS)
            print(f"кадр {md.frame}: РАУНД КОНЧИЛСЯ (прошло {md.frame - plant_frame} кадров "
                  f"после выбывания). очки: игрок1={p1} игрок2={md.rw(P2+PTS)}")
            print(f"  игрок 1 {'ПЕРЕБИЛ' if p1 > TARGET else 'НЕ ПЕРЕБИЛ'} планку {TARGET}")
            for _ in range(400):
                md.step_frame()
            print(f"  победы: игрок1={md.rb(P1+0xD8)}W/{md.rb(P1+0xD9)}L  "
                  f"игрок2={md.rb(P2+0xD8)}W/{md.rb(P2+0xD9)}L")
            md.render(os.path.join(os.path.dirname(__file__), '..', 'shots',
                                   'test_' + os.path.basename(ROM) + '.png'))
            break
else:
    print("раунд так и не кончился за отведённые кадры")
