@echo off
setlocal enabledelayedexpansion
:: ============================================================================
:: ULTIMATE WINDOWS SYSTEM TOOL v5.0
:: Author: Nguyen Ngoc Anh Tu | https://www.facebook.com/NguyenNgocAnhTu.VN
:: ============================================================================
title Ultimate Windows System Tool v5.0 by Nguyen Ngoc Anh Tu
color 0B

:: Windows Detection
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
set WIN_VER=10
set WIN_NAME=Windows 10
if "%version%" == "10.0" (
    for /f "tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild 2^>nul ^| find "CurrentBuild"') do set BUILD=%%a
    if !BUILD! GEQ 22000 (set WIN_NAME=Windows 11) else (set WIN_NAME=Windows 10)
)
if "%version%" == "6.3" set WIN_NAME=Windows 8.1
if "%version%" == "6.2" set WIN_NAME=Windows 8
if "%version%" == "6.1" set WIN_NAME=Windows 7

:: Admin Check
net session >nul 2>&1
if %errorLevel% neq 0 (
    cls & color 0E & echo. & echo   ADMIN REQUIRED - Auto-elevating... & echo.
    timeout /t 2 /nobreak >nul
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~0\"' -Verb RunAs" 2>nul
    exit
)

cls & color 0A & echo. & echo   ADMIN OK - %WIN_NAME% (Build %BUILD%) & echo. & timeout /t 1 /nobreak >nul

:MAIN_MENU
cls & color 0B & echo.
echo  ═══════════════════════════════════════════════════════════════════
echo    ULTIMATE WINDOWS SYSTEM TOOL v5.0 by Nguyen Ngoc Anh Tu
echo  ═══════════════════════════════════════════════════════════════════
echo.
echo   [1] Quick Cleanup          [2] Deep Cleanup         [3] Browser Cache
echo   [4] Temp Files             [5] DNS Cache            [6] Recycle Bin
echo   [7] Optimize Network       [8] Reset Network        [9] Disk Cleanup
echo   [10] Update Cache          [11] Disable Telemetry   [12] Event Logs
echo   [13] System Info           [14] Disk Health         [15] Backup Registry
echo   [16] Windows Update Fix    [0] Exit
echo.
set /p choice="  SELECT [0-16]: "

if "%choice%"=="0" goto EXIT
if "%choice%"=="1" goto F1
if "%choice%"=="2" goto F2
if "%choice%"=="3" goto F3
if "%choice%"=="4" goto F4
if "%choice%"=="5" goto F5
if "%choice%"=="6" goto F6
if "%choice%"=="7" goto F7
if "%choice%"=="8" goto F8
if "%choice%"=="9" goto F9
if "%choice%"=="10" goto F10
if "%choice%"=="11" goto F11
if "%choice%"=="12" goto F12
if "%choice%"=="13" goto F13
if "%choice%"=="14" goto F14
if "%choice%"=="15" goto F15
if "%choice%"=="16" goto F16
echo. & echo  [!] Invalid choice! & timeout /t 2 /nobreak >nul & goto MAIN_MENU

:F1
cls & echo. & echo  [1] Quick Cleanup & echo  ═══════════════════════════════════════════════════════════════════ & echo.
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "%WINDIR%\Temp\*" >nul 2>&1
del /f /s /q "%WINDIR%\Prefetch\*" >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo  [SUCCESS] Quick cleanup complete! & echo. & pause & goto MAIN_MENU

:F2
cls & echo. & echo  [2] Deep Cleanup & echo  ═══════════════════════════════════════════════════════════════════ & echo.
net stop wuauserv >nul 2>&1
del /f /s /q "%WINDIR%\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1
del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\*" >nul 2>&1
echo  [SUCCESS] Deep cleanup complete! & echo. & pause & goto MAIN_MENU

:F3
cls & echo. & echo  [3] Browser Cache & echo  ═══════════════════════════════════════════════════════════════════ & echo.
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
del /f /s /q "%APPDATA%\Mozilla\Firefox\Profiles\*.default\cache2\*" >nul 2>&1
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
echo  [SUCCESS] Browser cache cleared! & echo. & pause & goto MAIN_MENU

:F4
cls & echo. & echo  [4] Temp Files & echo  ═══════════════════════════════════════════════════════════════════ & echo.
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "%WINDIR%\Temp\*" >nul 2>&1
del /f /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1
echo  [SUCCESS] Temp files cleared! & echo. & pause & goto MAIN_MENU

:F5
cls & echo. & echo  [5] DNS Cache & echo  ═══════════════════════════════════════════════════════════════════ & echo.
ipconfig /flushdns
echo. & echo  [SUCCESS] DNS cache cleared! & echo. & pause & goto MAIN_MENU

:F6
cls & echo. & echo  [6] Recycle Bin & echo  ═══════════════════════════════════════════════════════════════════ & echo.
if exist "%SystemDrive%\$Recycle.Bin" (rd /s /q "%SystemDrive%\$Recycle.Bin" >nul 2>&1 & echo  [SUCCESS] Recycle Bin cleared!) else (echo  [INFO] Already empty)
echo. & pause & goto MAIN_MENU

:F7
cls & echo. & echo  [7] Optimize Network & echo  ═══════════════════════════════════════════════════════════════════ & echo.
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global chimney=enabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
echo  [SUCCESS] Network optimized! & echo. & pause & goto MAIN_MENU

:F8
cls & echo. & echo  [8] Reset Network & echo  ═══════════════════════════════════════════════════════════════════ & echo.
netsh winsock reset >nul 2>&1
netsh int ip reset >nul 2>&1
ipconfig /flushdns >nul 2>&1
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1
echo  [SUCCESS] Network reset! Restart recommended. & echo. & pause & goto MAIN_MENU

:F9
cls & echo. & echo  [9] Disk Cleanup & echo  ═══════════════════════════════════════════════════════════════════ & echo.
cleanmgr /sagerun:1
echo  [INFO] Disk Cleanup launched & echo. & pause & goto MAIN_MENU

:F10
cls & echo. & echo  [10] Windows Update Cache & echo  ═══════════════════════════════════════════════════════════════════ & echo.
net stop wuauserv >nul 2>&1 & net stop bits >nul 2>&1
del /f /s /q "%WINDIR%\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1 & net start bits >nul 2>&1
echo  [SUCCESS] Update cache cleared! & echo. & pause & goto MAIN_MENU

:F11
cls & echo. & echo  [11] Disable Telemetry & echo  ═══════════════════════════════════════════════════════════════════ & echo.
sc stop DiagTrack >nul 2>&1 & sc config DiagTrack start= disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1 & sc config dmwappushservice start= disabled >nul 2>&1
echo  [SUCCESS] Telemetry disabled! & echo. & pause & goto MAIN_MENU

:F12
cls & echo. & echo  [12] Event Logs & echo  ═══════════════════════════════════════════════════════════════════ & echo.
wevtutil cl Application >nul 2>&1
wevtutil cl System >nul 2>&1
wevtutil cl Security >nul 2>&1
echo  [SUCCESS] Event logs cleared! & echo. & pause & goto MAIN_MENU

:F13
cls & echo. & echo  [13] System Info & echo  ═══════════════════════════════════════════════════════════════════ & echo.
systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory"
echo. & echo  Windows: %WIN_NAME% (Build %BUILD%) & echo. & pause & goto MAIN_MENU

:F14
cls & echo. & echo  [14] Disk Health & echo  ═══════════════════════════════════════════════════════════════════ & echo.
wmic diskdrive get status
echo. & pause & goto MAIN_MENU

:F15
cls & echo. & echo  [15] Backup Registry & echo  ═══════════════════════════════════════════════════════════════════ & echo.
set BACKUP=%USERPROFILE%\Desktop\RegBackup_%date:~-4,4%%date:~-10,2%%date:~-7,2%.reg
reg export HKLM\SOFTWARE "%BACKUP%" /y >nul 2>&1
if %errorlevel%==0 (echo  [SUCCESS] Saved to Desktop!) else (echo  [ERROR] Backup failed!)
echo. & pause & goto MAIN_MENU

:F16
cls & echo. & echo  [16] Windows Update Fix & echo  ═══════════════════════════════════════════════════════════════════ & echo.
DISM /Online /Cleanup-Image /RestoreHealth
sfc /scannow
echo. & echo  [SUCCESS] Update components repaired! & echo. & pause & goto MAIN_MENU

:EXIT
cls & color 0A & echo. & echo  ═══════════════════════════════════════════════════════════════════
echo   Thank you! - Nguyen Ngoc Anh Tu
echo   https://www.facebook.com/NguyenNgocAnhTu.VN
echo  ═══════════════════════════════════════════════════════════════════
echo. & timeout /t 3 /nobreak >nul & exit
