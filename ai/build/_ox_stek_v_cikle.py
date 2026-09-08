# В момент записи из цикла $00CEAE снимаем ВСЕ регистры и кусок стека.
# ⚠️ Регистры Unicorn: UC_M68K_REG_D0=1 .. D7=8, A0=9 .. A6=15, A7=16 (0 - невалид).
import os, sys, struct
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'tools'))
from unicorn.m68k_const import UC_M68K_REG_A0, UC_M68K_REG_D0
import bot_io as io
import duel
import session
import train_duel as td

CYKL = {0x00CEBA, 0x00CEC4, 0x00CECE}
POPEL = []

md = session.new()
session.boot_vs(md)

LIM_DIKA = 3
LIM_ZAK = 2


def cb(md, a, size, value, pc):
    if pc not in CYKL:
        return
    dikaya = a >= 0xFF0200          # всё выше буферов игроков - служебное
    est = sum(1 for r in POPEL if r['dikaya'] == dikaya)
    if est >= (LIM_DIKA if dikaya else LIM_ZAK):
        return
    u = md.uc
    a7 = u.reg_read(16)             # A7
    try:
        stek = list(struct.unpack('>80I', bytes(u.mem_read(a7, 320))))
    except Exception:
        stek = []
    POPEL.append(dict(
        dikaya=dikaya, kadr=md.frame, adr=a, pc=pc, znach=value & 0xFFFF,
        d=[u.reg_read(UC_M68K_REG_D0 + i) for i in range(8)],
        m=[u.reg_read(UC_M68K_REG_A0 + i) for i in range(8)],
        stek=stek))


for ad in (0xFF0406, 0xFF0418, 0xFF0422, 0xFF0098, 0xFF0118):
    md.add_watch(ad, ad + 1, cb)

boec, geny, _ = td.load()
pilots = [duel.Pilot(md, 0, io.P1, boec, genes=geny, name='p1'),
          duel.Pilot(md, 1, io.P2, boec, genes=geny, name='p2')]
for k in range(9000):
    if md.stopped:
        break
    dik = sum(1 for r in POPEL if r['dikaya'])
    zak = len(POPEL) - dik
    if dik >= LIM_DIKA and zak >= LIM_ZAK:
        break
    io.fix_empty_slots(md)
    for pl in pilots:
        pl.tick()
    md.step_frame()

out = ['stop=%d' % md.frame]
for r in POPEL:
    t = 'DIKAYA' if r['dikaya'] else 'zakonnaya'
    out.append('')
    out.append('=== %s kadr %d adr=$%06X PC=$%06X znach=$%04X' %
               (t, r['kadr'], r['adr'], r['pc'], r['znach']))
    out.append('  d0-d7: ' + ' '.join('%08X' % v for v in r['d']))
    out.append('  a0-a7: ' + ' '.join('%08X' % v for v in r['m']))
    rets = [(i, w) for i, w in enumerate(r['stek']) if 0x200 <= w <= 0x0FFFFF]
    out.append('  stek (a7..): ' + ' '.join('+%d:$%08X' % (i * 4, w)
                                            for i, w in enumerate(r['stek'][:20])))
    out.append('  pohozhe na vozvraty: ' +
               ' '.join('+%d:$%06X' % (i * 4, w) for i, w in rets[:12]))
open('build/_ox_stek.txt', 'w').write('\n'.join(out))
print('ok')
