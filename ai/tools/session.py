# Готовые «заходы» в нужное место игры — чтобы каждый инструмент разбора
# не переписывал одну и ту же навигацию по меню.
#
# Кто зовёт: probe.py, find_score.py и прочее.
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
from md_machine import MD

ROM = os.path.join(os.path.dirname(__file__), '..', 'rom', 'Columns III (USA).gen')


def _tap(md, port, *btns, hold=4, gap=4):
    md.press(port, *btns)
    for _ in range(hold):
        md.step_frame()
    md.release(port)
    for _ in range(gap):
        md.step_frame()


def _wait(md, n):
    for _ in range(n):
        md.step_frame()


def new(rom=None, **kw):
    return MD(rom or ROM, **kw)


def boot_vs(md, best_of=0):
    """Доводит игру до боя 1 на 1 (режим 1on1). best_of: 0='из 3', 1='из 5', 2='из 7'."""
    _wait(md, 300)          # логотип SEGA
    _tap(md, 0, 'start')    # титульник
    _wait(md, 60)
    _tap(md, 0, 'start')    # -> выбор режима
    _wait(md, 120)
    _tap(md, 0, 'right')    # 1P MODE -> 1on1 MODE
    _wait(md, 20)
    _tap(md, 0, 'start')
    _wait(md, 120)
    for _ in range(best_of):
        _tap(md, 0, 'down')
        _wait(md, 10)
    _tap(md, 0, 'start')    # выбрано «best of N»
    _wait(md, 120)
    # на 'READY' игра ждёт ОБОИХ игроков — без старта со второго джойстика висит вечно
    _tap(md, 0, 'start')
    _wait(md, 150)
    _tap(md, 1, 'start')
    _wait(md, 120)
    _tap(md, 0, 'start')
    _wait(md, 120)
    return md


def boot_1p(md):
    """Доводит до сюжетного режима 1P (первый пункт меню)."""
    _wait(md, 300)
    _tap(md, 0, 'start')
    _wait(md, 60)
    _tap(md, 0, 'start')
    _wait(md, 120)
    _tap(md, 0, 'start')
    _wait(md, 120)
    return md
