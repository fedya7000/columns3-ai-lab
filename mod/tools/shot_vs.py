# Снимает бой 1 на 1 на заданном ROM — для проверки внешнего вида локации.
# python shot_vs.py <rom> [имя_снимка] [кадров]
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
from autoplay import Bot, P1, P2

ROM = sys.argv[1]
NAME = sys.argv[2] if len(sys.argv) > 2 else 'vs'
NF = int(sys.argv[3]) if len(sys.argv) > 3 else 1200

md = session.new(ROM)
session.boot_vs(md)
if md.stopped:
    print("НЕ ЗАПУСТИЛСЯ:", md.log[-1].splitlines()[0])
    sys.exit(1)
bots = [Bot(0, P1, 5), Bot(1, P2, 91)]
out = os.path.join(os.path.dirname(__file__), '..', 'shots', 'look')
os.makedirs(out, exist_ok=True)
for i in range(NF):
    for b in bots:
        btns = b.decide(md)
        if btns and i % 2 == 0:
            md.press(b.port, *btns)
        else:
            md.release(b.port)
    md.step_frame()
    if md.stopped:
        print("ОСТАНОВ:", md.log[-1].splitlines()[0])
        break
    if (i + 1) % 400 == 0:
        p = os.path.join(out, f"{NAME}_{i+1:05}.png")
        md.render(p)
        print(f"кадр +{i+1}: режим=${md.rw(0xFF0406):04X} -> {os.path.basename(p)}")
