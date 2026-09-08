# Нарезает нарисованное небо на тайлы, раскладывает их по СВОБОДНЫМ местам
# видеопамяти и строит новую карту плана B.
#
# Свободные места — это тайлы, которыми рисовались стена и ирисы: они больше
# не нужны. Замер, какие именно свободны, делает tools/bg_reuse.py.
import os, sys, json, struct

sys.path.insert(0, os.path.dirname(__file__))
from bg_sm import build as build_sky, PALETTE0

BG_DIR = os.path.join(os.path.dirname(__file__), '..', 'shots', 'bg')
# исходные слова палитры 0 (снято с игры); None в PALETTE0 = оставить это
ORIG_PAL0 = [0x0044, 0x0000, 0x0444, 0x0444, 0x008C, 0x00AE, 0x00CE, 0x0040,
             0x0280, 0x0200, 0x06C4, 0x0020, 0x0602, 0x0048, 0x0EEE, 0x0CC0]

W, H = 40, 28            # видимая часть экрана в клетках


def tile_bytes(img, x0, y0):
    out = bytearray()
    for y in range(8):
        for x in range(0, 8, 2):
            out.append(((img[y0 + y][x0 + x] & 0xF) << 4) | (img[y0 + y][x0 + x + 1] & 0xF))
    return bytes(out)


def build():
    meta = json.load(open(os.path.join(BG_DIR, 'planeb.json')))
    mask, name = meta['mask'], meta['name']
    free = json.load(open(os.path.join(BG_DIR, 'free_tiles.json')))
    sky = build_sky()

    # 1. нарезаем клетки неба, одинаковые тайлы кладём один раз
    uniq = {}
    cell_tile = {}
    for cy in range(H):
        for cx in range(W):
            if not mask[cy][cx]:
                continue
            data = tile_bytes(sky, cx * 8, cy * 8)
            if data not in uniq:
                uniq[data] = len(uniq)
            cell_tile[(cy, cx)] = uniq[data]
    n = len(uniq)
    if n > len(free):
        raise SystemExit(f"тайлов неба {n}, а свободно только {len(free)} — упрощай рисунок")

    # 2. раскладываем по свободным местам, начиная с самых длинных кусков,
    #    чтобы пересылок получилось поменьше
    runs = []
    cur = []
    for t in free:
        if cur and t == cur[-1] + 1:
            cur.append(t)
        else:
            if cur:
                runs.append(cur)
            cur = [t]
    if cur:
        runs.append(cur)
    runs.sort(key=len, reverse=True)

    slots = []
    for r in runs:
        for t in r:
            if len(slots) < n:
                slots.append(t)
    slots_sorted = sorted(slots[:n])

    order = [None] * n
    data_by_idx = {}
    for data, i in uniq.items():
        order[i] = data
    mapping = {}                     # номер уникального тайла -> место в видеопамяти
    for i in range(n):
        mapping[i] = slots_sorted[i]
        data_by_idx[slots_sorted[i]] = order[i]

    # 3. пересылки: собираем соседние места в один кусок
    blobs = []
    cur_start, cur_data = None, b''
    for t in slots_sorted:
        if cur_start is not None and t == cur_start + len(cur_data) // 32:
            cur_data += data_by_idx[t]
        else:
            if cur_start is not None:
                blobs.append((cur_start, cur_data))
            cur_start, cur_data = t, data_by_idx[t]
    if cur_start is not None:
        blobs.append((cur_start, cur_data))

    # 4. новая карта плана B: клетки неба — наши тайлы, остальное как было
    rows = []
    for cy in range(H):
        row = bytearray()
        for cx in range(W):
            if mask[cy][cx]:
                row += struct.pack('>H', mapping[cell_tile[(cy, cx)]])   # палитра 0
            else:
                row += struct.pack('>H', name[cy][cx])
        rows.append(bytes(row))

    # 5. палитра 0
    pal = b''.join(struct.pack('>H', ORIG_PAL0[i] if PALETTE0[i] is None else PALETTE0[i])
                   for i in range(16))
    return blobs, rows, pal, n


if __name__ == '__main__':
    blobs, rows, pal, n = build()
    print(f"уникальных тайлов неба: {n}")
    print(f"кусков для пересылки:   {len(blobs)}")
    print(f"байт графики:           {sum(len(d) for _, d in blobs)}")
    print(f"карта плана B:          {len(rows)} рядов по {len(rows[0])} байт "
          f"= {len(rows)*len(rows[0])} байт")
    print(f"палитра:                {len(pal)} байт")
    print("\nпервые куски:", [(f'${t:03X}', len(d) // 32) for t, d in blobs[:8]])
