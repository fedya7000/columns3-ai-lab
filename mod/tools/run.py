# Гоняет ROM N кадров и снимает картинки — проверка, что эмулятор вообще везёт игру.
# python run.py <rom> <кадров> [шаг_снимка]
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
from md_machine import MD

rom = sys.argv[1]
frames = int(sys.argv[2]) if len(sys.argv) > 2 else 120
step = int(sys.argv[3]) if len(sys.argv) > 3 else 60
outdir = os.path.join(os.path.dirname(__file__), '..', 'shots')
os.makedirs(outdir, exist_ok=True)

md = MD(rom)
for f in range(frames):
    md.step_frame()
    if md.stopped:
        print("ОСТАНОВ:", md.log[-3:])
        break
    if (f + 1) % step == 0:
        p = os.path.join(outdir, f"f{f+1:05}.png")
        md.render(p)
        r = md.vdp_reg
        print(f"кадр {f+1:5}  режим_игры(FF0406)={md.rw(0xFF0406):04X}  "
              f"экран={'вкл' if r[1] & 0x40 else 'выкл'}  снимок -> {os.path.basename(p)}")
print("готово. кадров пройдено:", md.frame)
if md.log:
    print("журнал:", *md.log[-5:], sep="\n  ")
