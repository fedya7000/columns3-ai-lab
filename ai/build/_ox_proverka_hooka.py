# Проверка механизма code-hook: сколько раз исполняется $000208 (вход V-Blank IRQ)
# и $00CE52 за 200 кадров обычной игры.
import os, sys
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'tools'))
import bot_io as io
import duel
import session
import train_duel as td

cnt = {0x000208: 0, 0x00CE52: 0, 0x00CEAE: 0}
md = session.new()
session.boot_vs(md)

def mk(k):
    def h(md_, pc):
        cnt[k] += 1
    return h

md.add_code_hook(0x000208, mk(0x000208))
md.add_code_hook(0x00CE52, mk(0x00CE52))
md.add_code_hook(0x00CEAE, mk(0x00CEAE))

boec, geny, _ = td.load()
pilots = [duel.Pilot(md, 0, io.P1, boec, genes=geny, name='p1'),
          duel.Pilot(md, 1, io.P2, boec, genes=geny, name='p2')]
for k in range(400):
    if md.stopped:
        break
    io.fix_empty_slots(md)
    for pl in pilots:
        pl.tick()
    md.step_frame()

open('build/_ox_hook_cnt.txt', 'w').write(
    '$000208 x%d\n$00CE52 x%d\n$00CEAE x%d' % (cnt[0x000208], cnt[0x00CE52], cnt[0x00CEAE]))
print('ok')
