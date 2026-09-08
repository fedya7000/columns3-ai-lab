# ОПЫТ ПРО ВЕРХ ПОЛЯ.
#
# Кладём вертикальную тройку одного цвета и смотрим, уберёт ли её игра.
# Под тройкой колонка ЗАБИТА (иначе камни просто упадут вниз и схлопнутся там —
# на этом первый заход опыта и сгорел). Забивка — чередование двух цветов,
# чтобы она сама по себе линий не давала.
#
#   вариант "видимая"   — тройка в рядах 0,1,2   (вся на экране)     -> обязана убраться
#   вариант "заверхом"  — тройка в рядах -1,0,1  (верхний за краем)  -> это и проверяем
#
# python test_top.py <rom> [видимая|заверхом]
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, ROW, COLS, ROWS, field_base

ROM = sys.argv[1]
VARIANT = sys.argv[2] if len(sys.argv) > 2 else 'заверхом'
TOPROW = 0 if VARIANT == 'видимая' else -1
COLOR = 4
COL = 0

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


def column(c):
    return ' '.join(f"{get(r, c):2}" for r in range(-2, ROWS))


# подпорка: забиваем колонку ПОД тройкой чередованием 1/2
for r in range(TOPROW + 3, ROWS):
    put(r, COL, 1 if (r % 2 == 0) else 2)
for k in range(3):
    put(TOPROW + k, COL, COLOR)

print(f"вариант: {VARIANT}; тройка цвета {COLOR} в рядах {TOPROW}..{TOPROW+2}, колонка {COL}")
print(f"колонка ДО   (ряды -2..12): {column(COL)}")

# Сбор линии видно по ПОМЕТКЕ: игра ставит старший бит ($8000) на камни,
# которые сейчас схлопнутся. Конец раунда виден по смене режима ($FF0406).
MODE_PLAY = md.rw(0xFF0406)
matched_at = None
round_over_at = None
for i in range(1500):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()
    if md.stopped:
        print("ОСТАНОВ:", md.log[-1].splitlines()[0])
        break
    if matched_at is None and any(get(TOPROW + k, COL) & 0x8000 for k in range(3)):
        matched_at = i
        break
    if md.rw(0xFF0406) != MODE_PLAY:
        round_over_at = i
        break

print(f"колонка ПОСЛЕ(ряды -2..12): {column(COL)}")
if matched_at is not None:
    print(f"ИТОГ: тройку НАШЛО и пометило к сбору (через {matched_at} кадров)")
elif round_over_at is not None:
    print(f"ИТОГ: тройку НЕ НАШЛО — вместо сбора РАУНД ЗАКОНЧИЛСЯ "
          f"(через {round_over_at} кадров), поле стёрлось")
else:
    print("ИТОГ: тройку НЕ УБРАЛО и раунд не кончился")
md.render(os.path.join(os.path.dirname(__file__), '..', 'shots', f'top_{VARIANT}.png'))
