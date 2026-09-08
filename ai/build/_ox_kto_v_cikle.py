# Ловим запись в служебные ячейки ($FF0406/$FF0418/$FF0422) из цикла отрисовки
# $00CEAE и СНОВАМ РЕГИСТРЫ в тот самый момент: кто в a6, куда смотрит +0x0E.
import os, sys
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'tools'))
import bot_io as io
import duel
import session
import train_duel as td

CYKL = {0x00CEBA, 0x00CEC4, 0x00CECE}
POPEL = []

md = session.new()
session.boot_vs(md)

def snap(md):
    u = md.uc
    a6 = u.reg_read(8 + 6)   # UC_M68K_REG_A6
    a0 = u.reg_read(8 + 0)
    return a6, a0

def cb(md, a, size, value, pc):
    if pc not in CYKL or len(POPEL) >= 8:
        return
    a6, a0 = snap(md)
    rec = dict(kadr=md.frame, adr=a, pc=pc, znach=value & 0xFFFF,
               a6=a6, a0=a0,
               smesh=(a6 - 0xFF1000) if 0xFF1000 <= a6 < 0xFF2000 else None)
    try:
        rec['p_0e'] = md.rl(a6 + 0x0E)
        rec['p_16'] = md.rl(a6 + 0x16)
        rec['p_1c'] = md.rl(a6 + 0x1C)
        rec['p_20'] = md.rl(a6 + 0x20)
    except Exception:
        pass
    POPEL.append(rec)

for ad in (0xFF0406, 0xFF0418, 0xFF0422):
    md.add_watch(ad, ad + 1, cb)

boec, geny, _ = td.load()
pilots = [duel.Pilot(md, 0, io.P1, boec, genes=geny, name='первый'),
          duel.Pilot(md, 1, io.P2, boec, genes=geny, name='второй')]
for k in range(9000):
    if md.stopped or len(POPEL) >= 8:
        break
    io.fix_empty_slots(md)
    for pl in pilots:
        pl.tick()
    md.step_frame()

print('кадр остановки:', md.frame, 'поймано:', len(POPEL))
for r in POPEL:
    print('--- кадр %(kadr)d  адрес=$%(adr)06X  PC=$%(pc)06X  знач=$%(znach)04X' % r)
    print('    a6=$%08X  a0=$%08X  слот=%s' % (
        r['a6'], r['a0'],
        ('нет (вне $FF1000..$FF1FFF)' if r['smesh'] is None else '$FF%04X, индекс %d' % (r['smesh'] + 0x1000, r['smesh'] // 0x400))))
    for k in ('p_0e', 'p_16', 'p_1c', 'p_20'):
        if k in r:
            print('    +%s = $%08X' % (k[2:], r[k]))
