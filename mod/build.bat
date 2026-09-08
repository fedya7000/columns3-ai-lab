@echo off
REM Сборка турнирного ROM одной командой.
REM Выход: build\c3_turnir.gen  — его и грузить в эмулятор.
cd /d "%~dp0"
if not exist build mkdir build
python tools\patch.py "rom\Columns III (USA).gen" patches\turnir.py "build\c3_turnir.gen"
echo.
echo Готово: build\c3_turnir.gen
