@echo off
chcp 65001 >nul
cd /d "%~dp0"
python tools\efir.py 3
if errorlevel 1 pause
