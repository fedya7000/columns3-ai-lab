# Печатает раскладку своей мелодии в звуковом блоке: где лежит, сколько заняла,
# сколько места осталось до области команд. Нужен, чтобы видеть запас глазами.
import sys, os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'patches'))
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'art'))
import sailor, melody

print(f"мелодия: Z80 ${sailor.MEL_Z:04X}  {len(sailor.MEL_DATA):3} байт  "
      f"({len(melody.MOONLIGHT)} нот и пауз)")
print(f"бас:     Z80 ${sailor.BASS_Z:04X}  {len(sailor.BASS_DATA):3} байт  "
      f"({len(melody.BASS)} нот)")
print(f"конец:   Z80 ${sailor.SND_END:04X}  потолок ${sailor.SND_CEIL:04X}  "
      f"ЗАПАС {sailor.SND_CEIL - sailor.SND_END} байт")
print(f"счётчик копировщика: было $0B57, стало "
      f"${sailor.SND_END - sailor.SND_Z80 - 1:04X}")
print(f"каналы мелодии боя ${sailor.TRACK:02X}: "
      f"${sailor.CH1:04X} -> мелодия, ${sailor.CH2:04X} -> бас")
