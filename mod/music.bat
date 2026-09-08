@echo off
REM Собирает ROM с выбранной мелодией локации.
REM   music.bat 8F     -> build\c3_sailor_8F.gen
REM   music.bat        -> покажет список
REM Номера мелодий: от 80 до 9F (шестнадцатеричные).
cd /d "%~dp0"
if "%~1"=="" (
  echo.
  echo   Как пользоваться:  music.bat 8F
  echo.
  echo   Номера мелодий: от 80 до 9F.
  echo   Самые объёмные ^(скорее всего полноценные темы^):
  echo      8F   144 байта
  echo      80   143
  echo      86   117
  echo      99   115
  echo      8D    90   ^(родная для боя 1 на 1^)
  echo      81    89
  echo.
  echo   Полный список: python tools\music_list.py
  echo.
  goto :eof
)
if not exist build mkdir build
set SAILOR_TRACK=%~1
python tools\patch.py "rom\Columns III (USA).gen" patches\sailor.py "build\c3_sailor_%~1.gen"
set SAILOR_TRACK=
echo.
echo Готово: build\c3_sailor_%~1.gen
