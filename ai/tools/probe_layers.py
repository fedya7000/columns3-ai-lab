# Какой байт меняется, когда в настройках крутишь LAYERS.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io

shots = os.path.join(os.path.dirname(__file__), '..', 'shots')


def tap(md, port, *b, hold=4, gap=6):
    md.press(port, *b)
    for _ in range(hold):
        md.step_frame()
    md.release(port)
    for _ in range(gap):
        md.step_frame()


md = session.new()
for _ in range(300):
    md.step_frame()
tap(md, 0, 'start'); [md.step_frame() for _ in range(60)]
tap(md, 0, 'start'); [md.step_frame() for _ in range(120)]
tap(md, 0, 'right'); [md.step_frame() for _ in range(20)]
tap(md, 0, 'start'); [md.step_frame() for _ in range(120)]
for _ in range(3):
    tap(md, 0, 'down'); [md.step_frame() for _ in range(10)]
tap(md, 0, 'start'); [md.step_frame() for _ in range(120)]
print('в настройках, режим=%04X' % md.rw(io.MODE))

for btn in ('right', 'left', 'up', 'down', 'a', 'b', 'c'):
    before = bytearray(md.uc.mem_read(0xFF0400, 0x100))
    tap(md, 0, btn)
    after = bytearray(md.uc.mem_read(0xFF0400, 0x100))
    ch = ['$FF%04X: %02X->%02X' % (0x0400 + i, before[i], after[i])
          for i in range(0x100) if before[i] != after[i]]
    print('%-6s -> %s' % (btn, ', '.join(ch[:6]) or 'ничего'))
md.render(os.path.join(shots, 'menu_after.png'))

print()
print('крутим LAYERS кнопкой A:')
for k in range(5):
    tap(md, 0, 'a')
    print('   %d нажатий -> $FF0460=%d' % (k + 1, md.rb(0xFF0460)))
md.render(os.path.join(shots, 'menu_layers_set.png'))
# выйти из настроек: EXIT
for _ in range(6):
    tap(md, 0, 'down'); [md.step_frame() for _ in range(8)]
tap(md, 0, 'start'); [md.step_frame() for _ in range(120)]
print('после выхода: режим=%04X, $FF0460=%d, $FF0444=%d' % (md.rw(io.MODE), md.rb(0xFF0460), md.rb(0xFF0444)))
md.render(os.path.join(shots, 'menu_exit.png'))
