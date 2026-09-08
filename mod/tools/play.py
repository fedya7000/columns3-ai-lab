# Проигрывает сценарий нажатий и снимает кадры.
#
# python play.py <rom> <сценарий> [папка_снимков]
# Сценарий — строка через ';':
#   w<N>            ждать N кадров
#   p1:start        нажать на 1-м джойстике (несколько кнопок через '+': p1:up+a)
#   p2:down
#   shot            снять кадр
#   dump            напечатать ключевые ячейки RAM
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
from md_machine import MD

rom = sys.argv[1]
script = sys.argv[2]
outdir = sys.argv[3] if len(sys.argv) > 3 else os.path.join(os.path.dirname(__file__), '..', 'shots')
os.makedirs(outdir, exist_ok=True)

md = MD(rom)
shot_n = 0


def do(cmd):
    global shot_n
    cmd = cmd.strip()
    if not cmd:
        return
    if cmd.startswith('w'):
        n = int(cmd[1:])
        for _ in range(n):
            md.step_frame()
            if md.stopped:
                print("ОСТАНОВ:", md.log[-1] if md.log else '?')
                sys.exit(1)
    elif cmd.startswith('p1:') or cmd.startswith('p2:'):
        port = 0 if cmd[1] == '1' else 1
        btns = cmd[3:].split('+')
        md.press(port, *btns)
        for _ in range(4):
            md.step_frame()
        md.release(port)
        for _ in range(4):
            md.step_frame()
    elif cmd == 'shot':
        shot_n += 1
        p = os.path.join(outdir, f"s{shot_n:03}_f{md.frame:05}.png")
        md.render(p)
        print(f"  снимок {os.path.basename(p)}  кадр={md.frame} режим={md.rw(0xFF0406):04X}")
    elif cmd == 'dump':
        print(f"  кадр={md.frame} режим(FF0406)={md.rw(0xFF0406):04X} "
              f"FF0418={md.rw(0xFF0418):04X} FF0500={md.rw(0xFF0500):04X}")
    else:
        print("непонятная команда:", cmd)


for c in script.split(';'):
    do(c)
print("кадров пройдено:", md.frame)
