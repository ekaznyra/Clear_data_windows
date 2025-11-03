@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: ===============================================
:: SAFE CLEANUP TOOL - Windows 10/11
:: CHI XOA CACHE/LOGS/TEMP - KHONG XOA DU LIEU
:: ===============================================

title Safe Cleanup Tool - Dang kiem tra quyen Administrator...

:: Kiem tra quyen Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo [!] Can quyen Administrator!
    echo [*] Dang tu dong yeu cau quyen...
    timeout /t 2 /nobreak >nul
    powershell -Command "Start-Process '%~f0' -Verb RunAs" 2>nul
    exit /b
)

cls
title Safe Cleanup Tool - Administrator Mode

echo.
echo ================================================
echo   SAFE CLEANUP TOOL - Windows 10/11
echo   CHI XOA: Cache, Logs, Temp
echo   KHONG XOA: Du lieu, Settings, Files
echo ================================================
echo.
echo [*] Bat dau don rac he thong...
echo.

:: Bien dem
set "total=0"

:: Ham don rac
goto :main

:CleanDir
set "path=%~1"
if not exist "%path%" goto :eof
echo   [clean] %path%
del /f /s /q "%path%\*" >nul 2>&1
for /d %%i in ("%path%\*") do rd /s /q "%%i" >nul 2>&1
set /a total+=1
goto :eof

:: MAIN
:main

echo [1/10] Don rac he thong Windows...
call :CleanDir "%TEMP%"
call :CleanDir "C:\Windows\Temp"
call :CleanDir "C:\Windows\Prefetch"
call :CleanDir "%LocalAppData%\CrashDumps"
call :CleanDir "%LocalAppData%\Microsoft\Windows\INetCache"
call :CleanDir "%LocalAppData%\Microsoft\Windows\WebCache"

echo.
echo [2/10] Don thung rac...
for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%d:\$Recycle.Bin call :CleanDir "%%d:\$Recycle.Bin"
)

echo.
echo [3/10] Don cache trinh duyet...
if exist "%LocalAppData%\Google\Chrome" (
    echo   [+] Chrome
    call :CleanDir "%LocalAppData%\Google\Chrome\User Data\Default\Cache"
    call :CleanDir "%LocalAppData%\Google\Chrome\User Data\Default\Code Cache"
)
if exist "%LocalAppData%\Microsoft\Edge" (
    echo   [+] Edge
    call :CleanDir "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache"
)
if exist "%AppData%\Mozilla\Firefox" (
    echo   [+] Firefox
    for /d %%p in ("%AppData%\Mozilla\Firefox\Profiles\*") do (
        call :CleanDir "%%p\cache2"
    )
)

echo.
echo [4/10] Don cache chat apps...
if exist "%AppData%\discord" (
    echo   [+] Discord
    call :CleanDir "%AppData%\discord\Cache"
)
if exist "%AppData%\Microsoft\Teams" (
    echo   [+] Teams
    call :CleanDir "%AppData%\Microsoft\Teams\Cache"
)
if exist "%AppData%\Zoom" (
    echo   [+] Zoom
    call :CleanDir "%AppData%\Zoom\logs"
)

echo.
echo [5/10] Don cache game launchers...
if exist "C:\Program Files (x86)\Steam" (
    echo   [+] Steam
    call :CleanDir "C:\Program Files (x86)\Steam\appcache"
    call :CleanDir "C:\Program Files (x86)\Steam\logs"
)
if exist "%LocalAppData%\EpicGamesLauncher" (
    echo   [+] Epic Games
    call :CleanDir "%LocalAppData%\EpicGamesLauncher\Saved\Logs"
)

echo.
echo [6/10] Don cache apps khac...
if exist "%AppData%\Spotify" (
    echo   [+] Spotify
    call :CleanDir "%AppData%\Spotify\Data"
)
if exist "%AppData%\Code" (
    echo   [+] VS Code
    call :CleanDir "%AppData%\Code\Cache"
)

echo.
echo [7/10] Don GPU cache...
if exist "%LocalAppData%\NVIDIA" (
    echo   [+] NVIDIA
    call :CleanDir "%LocalAppData%\NVIDIA\DXCache"
)
if exist "%LocalAppData%\AMD" (
    echo   [+] AMD
    call :CleanDir "%LocalAppData%\AMD\DxCache"
)
call :CleanDir "%LocalAppData%\D3DSCache"

echo.
echo [8/10] Don Windows Update cache...
call :CleanDir "C:\Windows\SoftwareDistribution\Download"

echo.
echo [9/10] Don Windows Error Reports...
call :CleanDir "%ProgramData%\Microsoft\Windows\WER\ReportArchive"
call :CleanDir "%ProgramData%\Microsoft\Windows\WER\ReportQueue"

echo.
echo [10/10] Don minidump files...
call :CleanDir "C:\Windows\Minidump"
del /f /q "C:\Windows\*.dmp" >nul 2>&1

echo.
echo ================================================
echo   HOAN TAT DON RAC AN TOAN!
echo   Da don: %total%+ thu muc
echo ================================================
echo.
echo AN TOAN:
echo   - Chi xoa: Cache, Logs, Temp
echo   - Khong xoa: Du lieu, Settings, Files
echo.
pause
