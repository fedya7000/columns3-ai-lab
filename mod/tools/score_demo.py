# Показывает НАЧИСЛЕНИЕ ОЧКОВ вживую: на каждый сбор печатает
# длину цепочки, число групп, число камней и сколько очков дали.
# Нужно, чтобы объяснять правила начисления числами, а не на память.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2
from unicorn.m68k_const import UC_M68K_REG_D1, UC_M68K_REG_D2, UC_M68K_REG_A6

ROM = sys.argv[1]
SEED = int(sys.argv[2]) if len(sys.argv) > 2 else 5

md = session.new(ROM)
ev = []


def on_score(m, pc):
    u = m.uc
    a6 = u.reg_read(UC_M68K_REG_A6)
    d1 = u.reg_read(UC_M68K_REG_D1) & 0xFFFF          # камни (уже с бонусом цепочки)
    d2 = u.reg_read(UC_M68K_REG_D2) & 0xFFFF          # группы
    chain = m.rw(a6 + 0x6C)
    before = m.rw(a6 + 0xE4)
    ev.append([m.frame, a6, chain, d2, d1, before, None])


def after_score(m, pc):
    if ev and ev[-1][6] is None:
        ev[-1][6] = m.rw(ev[-1][1] + 0xE4)


md.add_code_hook(0x00DF62, on_score)        # вход в начисление
md.add_code_hook(0x00DF9C, after_score)     # сразу после него

session.boot_vs(md)
bot = Bot(0, P1, SEED)
for i in range(12000):
    b = bot.decide(md)
    if b and i % 2 == 0:
        md.press(0, *b)
    else:
        md.release(0)
    md.release(1)
    md.step_frame()
    if md.stopped:
        break

print("кадр   | игрок | цепочка | групп | камней | очки было -> стало | дано")
mult = [1, 2, 4, 8, 16, 32]
for fr, a6, chain, groups, jewels, b4, aft in ev[:40]:
    if aft is None:
        continue
    who = 'P1' if a6 == P1 else 'P2'
    m = mult[min(chain, 5)]
    print(f"{fr:6} |  {who}   |    {chain:2}   |   {groups:2}  |   {jewels:3}  | "
          f"{b4:5} -> {aft:5}       | +{aft-b4:3}   (группы {groups} x множитель {m})")
print(f"\nвсего сборов поймано: {len(ev)}")
