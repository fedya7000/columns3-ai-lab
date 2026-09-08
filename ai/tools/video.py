# Видео боя: кадры эмулятора склеиваются в MP4 (или в GIF, если нет ffmpeg).
#
# Бой гоняется дважды одним зерном (игра детерминирована): первый проход
# узнаёт, где бой кончился, второй рисует нужное окно. Иначе пришлось бы
# держать в памяти весь бой целиком.
#
# Запуск:
#   python tools\video.py                 — последние 12 секунд, каждый 3-й кадр
#   python tools\video.py --весь          — весь бой, все 60 кадров в секунду
#   python tools\video.py 20 130 2        — 20 секунд, зерно 130, каждый 2-й кадр
import os
import shutil
import subprocess
import sys

sys.path.insert(0, os.path.dirname(__file__))
import duel
import train_duel

ВЫХОД = os.path.join(os.path.dirname(__file__), '..', 'shots')
ВРЕМЯ = os.path.join(ВЫХОД, 'kadry')

# Пути через прямой слэш: Windows их понимает, а обратные слэши ломают разбор.
FFMPEG_МЕСТА = ['E:/New1/gfx_lab/tools/ff/bin/ffmpeg.exe',
                'E:/New1/video_razvedka/ffmpeg.exe',
                'ffmpeg']


def найти_ffmpeg():
    for м in FFMPEG_МЕСТА:
        if os.path.exists(м):
            return м
        найдено = shutil.which(м)
        if найдено:
            return найдено
    return None


def собрать_mp4(папка, путь, fps=60, увеличение=2):
    """Склеивает кадры в MP4.

    Увеличение соседним пикселем (flags=neighbor) — чтобы картинка осталась
    чёткой, по-приставочному, а не размылилась сглаживанием.
    """
    ff = найти_ffmpeg()
    if not ff:
        return None
    cmd = [ff, '-y', '-framerate', str(fps),
           '-i', os.path.join(папка, 'k%06d.png'),
           '-vf', 'scale=iw*%d:ih*%d:flags=neighbor' % (увеличение, увеличение),
           '-c:v', 'libx264', '-preset', 'slow', '-crf', '18',
           '-pix_fmt', 'yuv420p', путь]
    r = subprocess.run(cmd, capture_output=True)
    if r.returncode != 0:
        print('ffmpeg ругается:', r.stderr.decode('utf-8', 'replace')[-400:])
        return None
    return os.path.getsize(путь)


def собрать_gif(файлы, путь, задержка=50):
    from PIL import Image
    кадры = [Image.open(f).convert('P', palette=Image.ADAPTIVE, colors=64)
             for f in файлы]
    кадры[0].save(путь, save_all=True, append_images=кадры[1:],
                  duration=задержка, loop=0, optimize=True)
    return os.path.getsize(путь)


def main():
    args = [a for a in sys.argv[1:] if not a.startswith('--')]
    весь = '--весь' in sys.argv
    секунд = float(args[0]) if len(args) > 0 else 12.0
    jitter = int(args[1]) if len(args) > 1 else 130
    шаг = int(args[2]) if len(args) > 2 else 3

    # --свежий: веса берём у последнего одиночного чемпиона (он обучен на
    # полях разной глубины и на исправленных признаках), а боевые гены —
    # у обученного боями. Пока боевое обучение не переиграно, это сильнейшая
    # связка: 136 фигур за бой против 50.
    боец, гены, _ = train_duel.load()
    if len(гены) != duel.N_GENES:
        гены = list(duel.DEFAULT_GENES)
    if '--свежий' in sys.argv:
        import train
        боец, meta = train.load()
        print('боец: свежий, поколение %d, стойкость %.0f'
              % (meta.get('gen', -1), meta.get('fitness', 0)))

    # Для начала боя искать конец незачем: снимаем с нулевого кадра.
    # А искать дорого — бои теперь идут по семьдесят тысяч кадров.
    if '--начало' in sys.argv:
        r = {}
        последний = int(секунд * 60)
    else:
        конец = [0]

        def искать(md, f, pilots):
            конец[0] = f

        r = duel.run_duel(боец, боец, layers=1, max_frames=400000, genes_a=гены,
                          genes_b=гены, quiet=True, jitter=jitter, on_frame=искать,
                          prostor=False)
        последний = конец[0]
    if весь:
        начало, шаг = 0, 1
    elif '--начало' in sys.argv:
        начало = 0
    else:
        начало = max(0, последний - int(секунд * 60))
    print('бой: %s' % {k: r.get(k) for k in
                       ('победил', 'фигур', 'атак', 'комбо3+', 'наложено порч')})
    print('снимаем кадры %d..%d (каждый %d-й)' % (начало, последний, шаг))

    if os.path.isdir(ВРЕМЯ):
        shutil.rmtree(ВРЕМЯ)
    os.makedirs(ВРЕМЯ)
    файлы = []
    счёт = [0]

    def рисовать(md, f, pilots):
        if начало <= f <= последний and (f - начало) % шаг == 0:
            # нумерация подряд без пропусков — иначе ffmpeg не соберёт
            путь = os.path.join(ВРЕМЯ, 'k%06d.png' % счёт[0])
            счёт[0] += 1
            md.render(путь)
            файлы.append(путь)

    duel.run_duel(боец, боец, layers=0, max_frames=400000, genes_a=гены,
                  genes_b=гены, quiet=True, jitter=jitter, on_frame=рисовать,
                  # ⚠️ prostor двигает буферы спрайтов: счёт растёт, но падающие
                  # фигуры перестают рисоваться. Для видео — строго False.
                  prostor=False)
    print('нарисовано кадров: %d' % len(файлы))
    if not файлы:
        print('снимать нечего')
        return

    длительность = len(файлы) * шаг / 60.0
    путь = os.path.join(ВЫХОД, 'boi.mp4')
    размер = собрать_mp4(ВРЕМЯ, путь, fps=max(1, 60 // шаг))
    хвост = ''
    if размер is None:
        путь = os.path.join(ВЫХОД, 'boi.gif')
        размер = собрать_gif(файлы, путь, задержка=int(1000 * шаг / 60))
        хвост = ' (ffmpeg не нашёлся, вышел GIF)'
    shutil.rmtree(ВРЕМЯ)
    print('готово: %s, %.1f МБ, %.0f секунд%s'
          % (os.path.abspath(путь), размер / 1e6, длительность, хвост))


if __name__ == '__main__':
    main()
