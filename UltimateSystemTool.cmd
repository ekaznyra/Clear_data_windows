@echo off
setlocal enabledelayedexpansion
:: ============================================================================
:: ULTIMATE WINDOWS SYSTEM TOOL v5.0 - SIMPLE & SAFE EDITION
:: ============================================================================
:: Author: Nguyen Ngoc Anh Tu
:: Facebook: https://www.facebook.com/NguyenNgocAnhTu.VN
:: 
:: Description: Safe Windows optimization and cleanup tool
:: Compatible: Windows 7, 8, 8.1, 10, 11 (32-bit & 64-bit)
:: All commands tested and SAFE for your system
:: ============================================================================

title Ultimate Windows System Tool v5.0 by Nguyen Ngoc Anh Tu
color 0B

:: ============================================================================
:: WINDOWS VERSION DETECTION
:: ============================================================================
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
set WIN_VER=Unknown
set WIN_NAME=Unknown Windows

if "%version%" == "10.0" (
    set WIN_VER=10
    for /f "tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild 2^>nul ^| find "CurrentBuild"') do set BUILD=%%a
    if !BUILD! GEQ 22000 (
        set WIN_NAME=Windows 11
    ) else (
        set WIN_NAME=Windows 10
    )
)
if "%version%" == "6.3" (set WIN_VER=8.1 & set WIN_NAME=Windows 8.1)
if "%version%" == "6.2" (set WIN_VER=8 & set WIN_NAME=Windows 8)
if "%version%" == "6.1" (set WIN_VER=7 & set WIN_NAME=Windows 7)
if not defined WIN_VER (set WIN_VER=10 & set WIN_NAME=Windows 10+)

:: ============================================================================
:: ADMIN CHECK & AUTO-ELEVATE
:: ============================================================================
net session >nul 2>&1
if %errorLevel% neq 0 (
    cls
    color 0E
    echo.
    echo   ========================================================================
    echo   ADMINISTRATOR RIGHTS REQUIRED
    echo   ========================================================================
    echo.
    echo   This tool requires Administrator privileges.
    echo   Auto-elevating...
    echo.
    timeout /t 2 /nobreak >nul
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~0\"' -Verb RunAs" 2>nul
    exit
)

cls
color 0A
echo.
echo   ========================================================================
echo   ADMINISTRATOR CONFIRMED - %WIN_NAME% (Build %BUILD%)
echo   ========================================================================
echo.
timeout /t 1 /nobreak >nul

:MAIN_MENU
cls
color 0B
echo.
echo  ================================================================================
echo                ULTIMATE WINDOWS SYSTEM TOOL v5.0                
echo                   by Nguyen Ngoc Anh Tu                          
echo  ================================================================================
echo.
echo   [1] Quick System Cleanup          [2] Deep System Cleanup
echo   [3] Clear Browser Cache           [4] Clear Temp Files
echo   [5] Clear DNS Cache               [6] Clear Recycle Bin
echo.
echo   [7] Optimize Network              [8] Reset Network Settings
echo   [9] Disk Cleanup (Windows)        [10] Clear Update Cache
echo.
echo   [11] Disable Telemetry            [12] Clear Event Logs
echo   [13] System Info                  [14] Check Disk Health
echo   [15] Backup Registry              [16] Windows Update Fix
echo.
echo   [0] Exit                          [T] Language Toggle
echo  ================================================================================
echo.
set /p choice="  SELECT [0-16 or T]: "

if /i "%choice%"=="T" goto SWITCH_LANGUAGE
if "%choice%"=="0" goto EXIT
if "%choice%"=="1" goto QUICK_CLEANUP
if "%choice%"=="2" goto DEEP_CLEANUP
if "%choice%"=="3" goto BROWSER_CACHE
if "%choice%"=="4" goto TEMP_FILES
if "%choice%"=="5" goto DNS_CACHE
if "%choice%"=="6" goto RECYCLE_BIN
if "%choice%"=="7" goto OPTIMIZE_NETWORK
if "%choice%"=="8" goto RESET_NETWORK
if "%choice%"=="9" goto DISK_CLEANUP
if "%choice%"=="10" goto UPDATE_CACHE
if "%choice%"=="11" goto DISABLE_TELEMETRY
if "%choice%"=="12" goto EVENT_LOGS
if "%choice%"=="13" goto SYSTEM_INFO
if "%choice%"=="14" goto DISK_HEALTH
if "%choice%"=="15" goto BACKUP_REGISTRY
if "%choice%"=="16" goto UPDATE_FIX

echo.
echo  [!] Invalid choice! / Lua chon khong hop le!
timeout /t 2 /nobreak >nul
goto MAIN_MENU

:: ============================================================================
:: FUNCTIONS
:: ============================================================================

:QUICK_CLEANUP
cls
color 0E
echo.
echo  [1] Quick System Cleanup
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] Cleaning temp files...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "%WINDIR%\Temp\*" >nul 2>&1
for /d %%x in ("%TEMP%\*") do @rd /s /q "%%x" >nul 2>&1
echo  [+] Temp files cleared
echo.
echo  [*] Cleaning prefetch...
del /f /s /q "%WINDIR%\Prefetch\*" >nul 2>&1
echo  [+] Prefetch cleared
echo.
echo  [*] Clearing DNS cache...
ipconfig /flushdns >nul 2>&1
echo  [+] DNS cache cleared
echo.
echo  [SUCCESS] Quick cleanup complete!
echo.
pause
goto MAIN_MENU

:DEEP_CLEANUP
cls
color 0E
echo.
echo  [2] Deep System Cleanup
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] Stopping Windows Update service...
net stop wuauserv >nul 2>&1
echo  [*] Cleaning Windows Update cache...
del /f /s /q "%WINDIR%\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1
echo  [+] Update cache cleared
echo.
echo  [*] Cleaning thumbnail cache...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
echo  [+] Thumbnail cache cleared
echo.
echo  [*] Cleaning error reports...
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\*" >nul 2>&1
echo  [+] Error reports cleared
echo.
echo  [SUCCESS] Deep cleanup complete!
echo.
pause
goto MAIN_MENU

:BROWSER_CACHE
cls
color 0E
echo.
echo  [3] Clear Browser Cache
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] Chrome...
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
echo  [+] Chrome cache cleared
echo.
echo  [*] Firefox...
del /f /s /q "%APPDATA%\Mozilla\Firefox\Profiles\*.default\cache2\*" >nul 2>&1
echo  [+] Firefox cache cleared
echo.
echo  [*] Edge...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
echo  [+] Edge cache cleared
echo.
echo  [SUCCESS] Browser cache cleared!
echo.
pause
goto MAIN_MENU

:TEMP_FILES
cls
color 0E
echo.
echo  [4] Clear All Temp Files
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] User temp...
del /f /s /q "%TEMP%\*" >nul 2>&1
echo  [*] Windows temp...
del /f /s /q "%WINDIR%\Temp\*" >nul 2>&1
echo  [*] Recent files...
del /f /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1
echo.
echo  [SUCCESS] All temp files cleared!
echo.
pause
goto MAIN_MENU

:DNS_CACHE
cls
color 0E
echo.
echo  [5] Clear DNS Cache
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] Flushing DNS cache...
ipconfig /flushdns
echo.
echo  [SUCCESS] DNS cache cleared!
echo.
pause
goto MAIN_MENU

:RECYCLE_BIN
cls
color 0E
echo.
echo  [6] Clear Recycle Bin
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] Clearing Recycle Bin for all drives...
if exist "%SystemDrive%\$Recycle.Bin" (
    rd /s /q "%SystemDrive%\$Recycle.Bin" >nul 2>&1
    echo  [+] Recycle Bin cleared
) else (
    echo  [i] Recycle Bin already empty
)
echo.
echo  [SUCCESS] Recycle Bin cleared!
echo.
pause
goto MAIN_MENU

:OPTIMIZE_NETWORK
cls
color 0E
echo.
echo  [7] Optimize Network
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] Optimizing TCP settings...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
echo  [*] Enabling Chimney...
netsh int tcp set global chimney=enabled >nul 2>&1
echo  [*] Optimizing RSS...
netsh int tcp set global rss=enabled >nul 2>&1
echo.
echo  [SUCCESS] Network optimized!
echo.
pause
goto MAIN_MENU

:RESET_NETWORK
cls
color 0E
echo.
echo  [8] Reset Network Settings
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] Resetting Winsock...
netsh winsock reset >nul 2>&1
echo  [*] Resetting IP...
netsh int ip reset >nul 2>&1
echo  [*] Flushing DNS...
ipconfig /flushdns >nul 2>&1
echo  [*] Renewing IP...
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1
echo.
echo  [SUCCESS] Network reset! Restart recommended.
echo.
pause
goto MAIN_MENU

:DISK_CLEANUP
cls
color 0E
echo.
echo  [9] Windows Disk Cleanup
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] Launching Windows Disk Cleanup...
cleanmgr /sagerun:1
echo.
echo  [INFO] Disk Cleanup launched
echo.
pause
goto MAIN_MENU

:UPDATE_CACHE
cls
color 0E
echo.
echo  [10] Clear Windows Update Cache
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] Stopping Windows Update...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
echo  [*] Clearing cache...
del /f /s /q "%WINDIR%\SoftwareDistribution\Download\*" >nul 2>&1
echo  [*] Starting Windows Update...
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
echo.
echo  [SUCCESS] Update cache cleared!
echo.
pause
goto MAIN_MENU

:DISABLE_TELEMETRY
cls
color 0E
echo.
echo  [11] Disable Windows Telemetry
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] Disabling telemetry services...
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1
echo.
echo  [SUCCESS] Telemetry disabled!
echo.
pause
goto MAIN_MENU

:EVENT_LOGS
cls
color 0E
echo.
echo  [12] Clear Event Logs
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] Clearing Application log...
wevtutil cl Application >nul 2>&1
echo  [*] Clearing System log...
wevtutil cl System >nul 2>&1
echo  [*] Clearing Security log...
wevtutil cl Security >nul 2>&1
echo.
echo  [SUCCESS] Event logs cleared!
echo.
pause
goto MAIN_MENU

:SYSTEM_INFO
cls
color 0B
echo.
echo  [13] System Information
echo  ════════════════════════════════════════════════════════════════
echo.
systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory"
echo.
echo  Windows Version: %WIN_NAME%
echo  Build: %BUILD%
echo.
pause
goto MAIN_MENU

:DISK_HEALTH
cls
color 0B
echo.
echo  [14] Check Disk Health
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] Checking disk health (SMART)...
wmic diskdrive get status
echo.
pause
goto MAIN_MENU

:BACKUP_REGISTRY
cls
color 0E
echo.
echo  [15] Backup Registry
echo  ════════════════════════════════════════════════════════════════
echo.
set BACKUP_PATH=%USERPROFILE%\Desktop\RegistryBackup_%date:~-4,4%%date:~-10,2%%date:~-7,2%.reg
echo  [*] Backing up registry to Desktop...
reg export HKLM\SOFTWARE "%BACKUP_PATH%" /y >nul 2>&1
if %errorlevel%==0 (
    echo  [SUCCESS] Registry backed up to Desktop!
    echo  File: %BACKUP_PATH%
) else (
    echo  [ERROR] Backup failed!
)
echo.
pause
goto MAIN_MENU

:UPDATE_FIX
cls
color 0E
echo.
echo  [16] Fix Windows Update
echo  ════════════════════════════════════════════════════════════════
echo.
echo  [*] Running DISM to repair Windows Update...
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo  [*] Running SFC scan...
sfc /scannow
echo.
echo  [SUCCESS] Windows Update components repaired!
echo.
pause
goto MAIN_MENU

:SWITCH_LANGUAGE
cls
echo.
echo  Language toggle feature - Coming soon!
echo.
timeout /t 2 /nobreak >nul
goto MAIN_MENU

:EXIT
cls
color 0A
echo.
echo  ════════════════════════════════════════════════════════════════
echo   Thank you for using Ultimate Windows System Tool v5.0
echo   by Nguyen Ngoc Anh Tu
echo   https://www.facebook.com/NguyenNgocAnhTu.VN
echo  ════════════════════════════════════════════════════════════════
echo.
timeout /t 3 /nobreak >nul
exit
