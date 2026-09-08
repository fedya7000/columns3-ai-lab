# Почему не встала палитра: смотрим данные в ROM и состояние CRAM
# ДО, СРАЗУ ПОСЛЕ заливки и в конце кадра.
import sys, os, struct
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1

ROM = sys.argv[1]
raw = open(ROM, 'rb').read()
print("данные палитры в ROM по $7C200:")
print("  " + ' '.join(f"{struct.unpack('>H', raw[0x7C200+i*2:0x7C202+i*2])[0]:04X}" for i in range(16)))

md = session.new(ROM)
state = {}


def pal2():
    return tuple(struct.unpack('>H', bytes(md.cram[k * 2:k * 2 + 2]))[0] for k in range(32, 48))


md.add_code_hook(0x07A700, lambda m, pc: state.update(do=pal2()))       # вход в заливку
md.add_code_hook(0x07A75C, lambda m, pc: state.update(posle=pal2(), fr=m.frame))  # выход

session.boot_vs(md)
bot = Bot(0, P1, 5)
for i in range(400):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()
    if 'posle' in state and 'konec' not in state:
        state['konec'] = pal2()

for k in ('do', 'posle', 'konec'):
    if k in state:
        print(f"{k:6}: " + ' '.join(f"{v:04X}" for v in state[k]))
print("кадр заливки:", state.get('fr'))
