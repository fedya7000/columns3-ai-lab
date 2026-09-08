# Проверяет догадку про поля падающей фигуры в структуре игрока:
#   +0x60,+0x62,+0x64 — цвета трёх камней, +0x66 — ряд, +0x68 — колонка
# Печатает их по кадрам рядом с реальным полем.
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session

P1 = 0xFF1000
md = session.new()
session.boot_vs(md)
prev = None
for i in range(400):
    md.step_frame()
    v = tuple(md.rw(P1 + o) for o in (0x60, 0x62, 0x64, 0x66, 0x68, 0x6A, 0xCE, 0xD0, 0xD2))
    if v != prev:
        print(f"кадр +{i:4}  цвета={v[0]},{v[1]},{v[2]}  +66={v[3]:2} +68={v[4]:2} +6A={v[5]:2}  "
              f"следующая={v[6]},{v[7]},{v[8]}")
        prev = v
