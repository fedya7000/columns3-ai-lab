# Сверяет все четыре палитры двух ROM в одной точке боя.
# python pal_compare.py <rom_A> <rom_B>
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
import session
import struct

def grab(rom):
    md = session.new(rom)
    session.boot_vs(md)
    for _ in range(300):
        md.step_frame()
    return [struct.unpack('>H', bytes(md.cram[i*2:i*2+2]))[0] for i in range(64)]

A = grab(sys.argv[1])
B = grab(sys.argv[2])
for line in range(4):
    a = A[line*16:(line+1)*16]
    b = B[line*16:(line+1)*16]
    same = 'одинаково' if a == b else 'РАЗЛИЧАЕТСЯ'
    print(f"палитра {line}: {same}")
    if a != b:
        for i, (x, y) in enumerate(zip(a, b)):
            if x != y:
                print(f"   индекс {i:2}: ${x:04X} -> ${y:04X}")
