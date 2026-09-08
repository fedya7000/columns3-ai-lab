# Кто ЗОВЁТ $00CE52 в реальном бою: снимаем адрес возврата со стека на входе.
import os, sys, struct
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'tools'))
import bot_io as io
import duel
import session
import train_duel as td

CYKL = {0x00CEBA, 0x00CEC4, 0x00CECE}
vhody = []
POPEL = []

md = session.new()
session.boot_vs(md)


def na_vhode(md, pc):
    if len(vhody) < 12:
        u = md.uc
        a7 = u.reg_read(8 + 7)
        try:
            ret = struct.unpack('>I', u.mem_read(a7, 4))[0]
        except Exception:
            ret = -1
        vhody.append(dict(kadr=md.frame, a6=u.reg_read(8 + 6), ret=ret,
                          p_0e=md.rl(u.reg_read(8 + 6) + 0x0E)
                          if 0xFF0000 <= u.reg_read(8 + 6) < 0xFF10000 else -1))


def cb(md, a, size, value, pc):
    if pc in CYKL and len(POPEL) < 4:
        POPEL.append((md.frame, a, pc))


md.add_code_hook(0x00CE52, na_vhode)
for ad in (0xFF0406, 0xFF0418, 0xFF0422):
    md.add_watch(ad, ad + 1, cb)

boec, geny, _ = td.load()
pilots = [duel.Pilot(md, 0, io.P1, boec, genes=geny, name='p1'),
          duel.Pilot(md, 1, io.P2, boec, genes=geny, name='p2')]
for k in range(9000):
    if md.stopped or len(POPEL) >= 4:
        break
    io.fix_empty_slots(md)
    for pl in pilots:
        pl.tick()
    md.step_frame()

out = ['stop=%d vhodov_poymano=%d divyh=%d' % (md.frame, len(vhody), len(POPEL))]
for r in vhody:
    out.append('vhod kadp %(kadr)d a6=$%(a6)08X ret=$%(ret)06X +0e=$%(p_0e)08X' % r)
for fr, a, pc in POPEL:
    out.append('dikaya kadp %d adr=$%06X PC=$%06X' % (fr, a, pc))
open('build/_ox_kto_zovet.txt', 'w', encoding='utf-8').write('\n'.join(out))
print('ok')
