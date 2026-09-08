# -*- coding: utf-8 -*-
"""Что происходит со счётчиком заплатки в $FFD000 и номером в $FFD002."""
import sys
sys.path.insert(0, 'tools')
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
import session

md = session.new('build/c3_zvukovoe.gen')
for кадр in range(1, 1001):
    md.step_frame()
    if кадр in (1, 5, 50, 100, 200, 290, 300, 305, 400, 600, 1000):
        print('кадр %-5d счётчик $FFD000 = %-6d номер $FFD002 = %d'
              % (кадр, md.rw(0xFFD000), md.rw(0xFFD002)))
