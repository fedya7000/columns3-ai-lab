# Версия 2: снимаем a6 на КАЖДОМ входе во внешний цикл слотов ($005A8A)
# и смотрим, что в a6 в момент дикой записи из $00CEAE.
import os, sys
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'tools'))
import bot_io as io
import duel
import session
import train_duel as td

CYKL = {0x00CEBA, 0x00CEC4, 0x00CECE}
state = dict(a6_v_cikle=None, kadr_v_cikle=None)
POPEL = []

md = session.new()
session.boot_vs(md)


def na_vhode_cikla(md, pc):
    state['a6_v_cikle'] = md.uc.reg_read(8 + 6)
    state['kadr_v_cikle'] = md.frame


md.add_code_hook(0x005A8A, na_vhode_cikla)


def cb(md, a, size, value, pc):
    if pc not in CYKL or len(POPEL) >= 6:
        return
    u = md.uc
    POPEL.append(dict(
        kadr=md.frame, adr=a, pc=pc,
        a6=u.reg_read(8 + 6), a0=u.reg_read(8 + 0),
        cikl_a6=state['a6_v_cikle'], cikl_kadr=state['kadr_v_cikle']))


for ad in (0xFF0406, 0xFF0418, 0xFF0422):
    md.add_watch(ad, ad + 1, cb)

boec, geny, _ = td.load()
pilots = [duel.Pilot(md, 0, io.P1, boec, genes=geny, name='первый'),
          duel.Pilot(md, 1, io.P2, boec, genes=geny, name='второй')]
for k in range(9000):
    if md.stopped or len(POPEL) >= 6:
        break
    io.fix_empty_slots(md)
    for pl in pilots:
        pl.tick()
    md.step_frame()

print('stop frame:', md.frame, 'poymano:', len(POPEL))
for r in POPEL:
    print('--- kadp %(kadr)d adr=$%(adr)06X PC=$%(pc)06X' % r)
    print('    a6 teper=$%08X   a6 na vhode cikla=$%08X (kadr %(cikl_kadr)d)   a0=$%08X'
          % (r['a6'], r['cikl_a6'], r['cikl_kadr'], r['a0']))
