# Гоняет бой и следит: снимки экрана + значения указанных ячеек по кадрам.
# python watch.py <кадров> <шаг_снимка> [адрес,адрес,...]
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session

FRAMES = int(sys.argv[1]) if len(sys.argv) > 1 else 900
STEP = int(sys.argv[2]) if len(sys.argv) > 2 else 300
ADDRS = [int(x, 16) for x in sys.argv[3].split(',')] if len(sys.argv) > 3 else []

outdir = os.path.join(os.path.dirname(__file__), '..', 'shots', 'watch')
os.makedirs(outdir, exist_ok=True)

md = session.new()
session.boot_vs(md)
start = md.frame
print(f"бой начался на кадре {start}")

for i in range(FRAMES):
    md.step_frame()
    if md.stopped:
        print("ОСТАНОВ:", md.log[-1])
        break
    n = i + 1
    if n % STEP == 0:
        p = os.path.join(outdir, f"w{n:05}.png")
        md.render(p)
        vals = ' '.join(f"${a:06X}={md.rb(a):3}" for a in ADDRS)
        print(f"кадр +{n:5} режим={md.rw(0xFF0406):04X}  {vals}  -> {os.path.basename(p)}")
print("готово")
