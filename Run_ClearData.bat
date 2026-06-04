@echo off
setlocal
cd /d "%~dp0"

REM Fix Vietnamese display: prefer Windows Terminal; fallback opens a NEW PowerShell window with Consolas + UTF-8.
where wt.exe >nul 2>&1
if %errorlevel%==0 (
    start "" wt.exe -w 0 nt --title "Clear Data Windows" powershell -NoProfile -ExecutionPolicy Bypass -NoExit -File "%~dp0ClearData.ps1"
    exit /b
)

reg add HKCU\Console /v FaceName /t REG_SZ /d "Consolas" /f >nul 2>&1
reg add HKCU\Console /v CodePage /t REG_DWORD /d 65001 /f >nul 2>&1
start "Clear Data Windows" powershell -NoProfile -ExecutionPolicy Bypass -NoExit -File "%~dp0ClearData.ps1"
exit /b
