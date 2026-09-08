# Доходим до экрана выбора «best of» и снимаем его — там пункт SETTING.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import session, bot_io as io

shots = os.path.join(os.path.dirname(__file__), '..', 'shots')


def tap(md, port, *b, hold=4, gap=4):
    md.press(port, *b)
    for _ in range(hold):
        md.step_frame()
    md.release(port)
    for _ in range(gap):
        md.step_frame()


md = session.new()
for _ in range(300):
    md.step_frame()
tap(md, 0, 'start')
for _ in range(60):
    md.step_frame()
tap(md, 0, 'start')
for _ in range(120):
    md.step_frame()
tap(md, 0, 'right')      # 1P -> 1on1
for _ in range(20):
    md.step_frame()
tap(md, 0, 'start')
for _ in range(120):
    md.step_frame()
md.render(os.path.join(shots, 'menu_bestof.png'))
print('снят экран выбора, режим=%04X' % md.rw(io.MODE))

for _ in range(3):
    tap(md, 0, 'down')
    for _ in range(10):
        md.step_frame()
tap(md, 0, 'start')
for _ in range(120):
    md.step_frame()
md.render(os.path.join(shots, 'menu_setting.png'))
print('снято меню настроек, режим=%04X, $FF0444=%d' % (md.rw(io.MODE), md.rb(0xFF0444)))

print('поднимаем LAYERS...')
for k in range(3):
    tap(md, 0, 'right')
    for _ in range(10):
        md.step_frame()
    print('   после нажатия %d: $FF0444=%d, $FF0445=%d' % (k + 1, md.rb(0xFF0444), md.rb(0xFF0445)))
md.render(os.path.join(shots, 'menu_layers.png'))
