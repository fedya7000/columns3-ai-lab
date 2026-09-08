# Окно для наблюдения: бои идут вживую, прямо сейчас.
#
# Показывает не запись, а живой бой: сеть берётся ТА, что лежит в build\ на
# эту секунду. Обучение в фоне переписывает файл — значит между боями боец
# меняется, и видно, как он матереет.
#
# Отрисовка кадра в чистом Python тянет 16 кадров в секунду, а игре нужно 60.
# Поэтому шагаем по нескольку кадров на одну перерисовку: игра идёт с обычной
# скоростью, а картинка обновляется реже. При четырёх кадрах на перерисовку
# выходит примерно приставочная скорость и 15 обновлений в секунду.
#
# Запуск:  python tools\smotret.py            (обычная скорость)
#          python tools\smotret.py 8          (вдвое быстрее обычного)
#          python tools\smotret.py 4 3        (обычная скорость, увеличение x3)
import os
import random
import sys
import time
import tkinter as tk

sys.path.insert(0, os.path.dirname(__file__))
from PIL import ImageTk

import bot_io as io
import brain
import duel
import train
import train_duel


def взять_бойца():
    """Свежайший боец: сперва боевой, если нет — одиночный."""
    try:
        б, г, м = train_duel.load()
        return б, г, 'боевой, поколение %s' % м.get('gen', '?')
    except Exception:
        б, м = train.load()
        return б, list(duel.DEFAULT_GENES), 'одиночный, поколение %s' % м.get('gen', '?')


class Окно:
    def __init__(self, ускорение=4, увеличение=2, слои=0):
        self.ускорение = max(1, int(ускорение))
        self.увеличение = увеличение
        self.корень = tk.Tk()
        self.корень.title('Columns III — сеть против самой себя')
        self.корень.configure(bg='#101018')
        self.холст = tk.Label(self.корень, bd=0, bg='#101018')
        self.холст.pack(padx=8, pady=(8, 0))
        self.строка = tk.Label(self.корень, text='запуск...', font=('Consolas', 11),
                               fg='#c8c8d8', bg='#101018', justify='left')
        self.строка.pack(padx=8, pady=(4, 4), anchor='w')
        self.правило = tk.Label(self.корень, text='', font=('Consolas', 10),
                                fg='#7fd8c8', bg='#101018', justify='left', wraplength=700)
        self.правило.pack(padx=8, pady=(0, 8), anchor='w')
        self.боёв = 0
        self.слои = слои
        self.rng = random.Random()
        self.корень.after(50, self.бой)

    def задержка(self):
        return self.rng.randrange(0, 600)

    def показать(self, md):
        картинка = md.render(scale=self.увеличение)
        self.фото = ImageTk.PhotoImage(картинка)
        self.холст.configure(image=self.фото)

    def бой(self):
        import session
        боец, гены, кто = взять_бойца()
        правило = ', '.join('%s %+.1f' % (н, в)
                            for н, в in zip(duel.GENE_NAMES, гены) if abs(в) > 0.4)
        self.правило.configure(text='боец: %s\nбьёт когда: %s' % (кто, правило or 'никогда'))
        self.боёв += 1

        md = session.new()
        # ⚠️ Игра берёт случайные числа из счётчика, который тикает всё время.
        # Если заходить в бой всегда одинаково, лента фигур будет ОДНА И ТА ЖЕ
        # от боя к бою — что и было видно: каждый матч повторял предыдущий.
        # Задержка перед входом сдвигает счётчик и даёт новую раздачу.
        duel.wait(md, self.задержка())
        duel.boot_duel(md, self.слои)
        io.fix_empty_slots(md)
        pilots = [duel.Pilot(md, 0, io.P1, боец, genes=гены),
                  duel.Pilot(md, 1, io.P2, боец, genes=гены)]

        часы = time.time()
        кадр = 0
        while io.in_battle(md) and not md.stopped and кадр < 60000:
            for _ in range(self.ускорение):
                io.fix_empty_slots(md)
                for pl in pilots:
                    pl.tick()
                md.step_frame()
                кадр += 1
            self.показать(md)
            self.строка.configure(text=(
                'бой %d   кадр %5d   фигур %3d : %-3d   шкала %2d : %-2d   '
                'слои %2d : %-2d   атак %2d : %-2d'
                % (self.боёв, кадр, pilots[0].placed, pilots[1].placed,
                   io.attack_gauge(md, io.P1), io.attack_gauge(md, io.P2),
                   io.layers(md, io.P1), io.layers(md, io.P2),
                   pilots[0].attacks, pilots[1].attacks)))
            self.корень.update()
            # отрисовка и так медленнее приставки — притормаживать нечего,
            # но если вдруг обгоняем, придерживаем до честных 60 кадров в секунду
            пауза = кадр / 60.0 - (time.time() - часы)
            if пауза > 0.002:
                time.sleep(min(пауза, 0.05))
        self.корень.after(600, self.бой)

    def запуск(self):
        self.корень.mainloop()


if __name__ == '__main__':
    у = float(sys.argv[1]) if len(sys.argv) > 1 else 4
    м = int(sys.argv[2]) if len(sys.argv) > 2 else 2
    сл = int(sys.argv[3]) if len(sys.argv) > 3 else 0
    Окно(у, м, сл).запуск()
