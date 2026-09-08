# Откуда берутся слои в бою, где никто не бьёт.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import bot_io as io, duel, train

head, _ = train.load()
prev = {}
события = []


def watch(md, f, pilots):
    global prev
    st = {}
    for имя, a in (('P1', io.P1), ('P2', io.P2)):
        st[имя] = (md.rw(a + 0x7E), md.rw(a + 0x78), md.rb(a + 0x90),
                   md.rb(a + 0x8B), md.rw(a + 0x94))
    if prev and st != prev and len(события) < 25:
        for имя in st:
            if st[имя] != prev[имя]:
                события.append((f, имя, prev[имя], st[имя],
                                [pl.placed for pl in pilots]))
    prev = st


мир = [0, 0, 0, 0, 0, 0, -9, 1.0, 0.6, 0.5]
r = duel.run_duel(head, head, layers=1, max_frames=200000, genes_a=мир, genes_b=мир,
                  quiet=True, jitter=11, on_frame=watch)
print('%7s %4s %-28s %-28s %s' % ('кадр', 'кто', 'было (7E,78,90,8B,94)', 'стало', 'фигур'))
for f, имя, a, b, p in события:
    print('%7d %4s %-28s %-28s %s' % (f, имя, a, b, p))
print()
print('итог:', {k: r.get(k) for k in ('фигур', 'слоёв', 'кадров')})
