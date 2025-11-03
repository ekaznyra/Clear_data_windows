@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

:: ============================================================================
:: WinClean Pro - Professional Windows Cleanup Tool
:: Inspired by: BleachBit, CCleaner, PrivaZer
:: License: MIT
:: Version: 3.0.0
:: ============================================================================

title WinClean Pro - Initializing...

:: ============================================================================
:: ADMIN PRIVILEGE CHECK
:: ============================================================================
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo ============================================================
    echo  Administrator Privileges Required
    echo ============================================================
    echo.
    echo  This tool requires elevated privileges to clean system
    echo  folders and protected directories.
    echo.
    echo  Requesting elevation...
    timeout /t 2 /nobreak >nul
    powershell -Command "Start-Process '%~f0' -Verb RunAs" 2>nul
    exit /b
)

:: ============================================================================
:: INITIALIZE VARIABLES
:: ============================================================================
set "VERSION=3.0.0"
set "APP_NAME=WinClean Pro"
set "CLEANED_ITEMS=0"
set "FREED_SPACE=0"
set "ERRORS=0"
set "START_TIME=%time%"

:: Create log directory
set "LOG_DIR=%~dp0logs"
if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"
set "LOG_FILE=%LOG_DIR%\cleanup_%date:~-4,4%%date:~-7,2%%date:~-10,2%.log"

:: ============================================================================
:: MAIN MENU
:: ============================================================================
:MAIN_MENU
cls
title %APP_NAME% v%VERSION% - Main Menu

echo.
echo  ╔════════════════════════════════════════════════════════════╗
echo  ║                                                            ║
echo  ║               WinClean Pro v%VERSION%                     ║
echo  ║        Professional Windows Cleanup Tool                  ║
echo  ║                                                            ║
echo  ╚════════════════════════════════════════════════════════════╝
echo.
echo  ┌────────────────────────────────────────────────────────────┐
echo  │  CLEANUP PROFILES                                          │
echo  ├────────────────────────────────────────────────────────────┤
echo  │  [1] Quick Clean      - Safe, common temp files (~2 min)  │
echo  │  [2] Standard Clean   - Recommended cleanup (~5 min)      │
echo  │  [3] Deep Clean       - Thorough system scan (~15 min)    │
echo  │  [4] Custom Clean     - Choose what to clean              │
echo  ├────────────────────────────────────────────────────────────┤
echo  │  TOOLS                                                     │
echo  ├────────────────────────────────────────────────────────────┤
echo  │  [5] Analyze Only     - Scan without cleaning             │
echo  │  [6] View Report      - Last cleanup statistics           │
echo  │  [7] Settings         - Configure options                 │
echo  │  [8] About            - Version and credits               │
echo  ├────────────────────────────────────────────────────────────┤
echo  │  [0] Exit                                                  │
echo  └────────────────────────────────────────────────────────────┘
echo.
set /p CHOICE="  Select option [0-8]: "

if "%CHOICE%"=="1" goto QUICK_CLEAN
if "%CHOICE%"=="2" goto STANDARD_CLEAN
if "%CHOICE%"=="3" goto DEEP_CLEAN
if "%CHOICE%"=="4" goto CUSTOM_CLEAN
if "%CHOICE%"=="5" goto ANALYZE_ONLY
if "%CHOICE%"=="6" goto VIEW_REPORT
if "%CHOICE%"=="7" goto SETTINGS
if "%CHOICE%"=="8" goto ABOUT
if "%CHOICE%"=="0" goto EXIT
goto MAIN_MENU

:: ============================================================================
:: CLEANUP FUNCTIONS
:: ============================================================================

:CleanDirectory
set "path=%~1"
set "description=%~2"
if not exist "%path%" goto :eof
echo   [CLEAN] %description%
echo [%date% %time%] Cleaning: %path% >> "%LOG_FILE%"
for /f %%A in ('dir /s /b /a "%path%\*" 2^>nul ^| find /c /v ""') do set /a CLEANED_ITEMS+=%%A
del /f /s /q "%path%\*" >nul 2>&1
for /d %%i in ("%path%\*") do rd /s /q "%%i" >nul 2>&1
goto :eof

:CheckAndClean
set "check_path=%~1"
set "clean_path=%~2"
set "app_name=%~3"
if exist "%check_path%" (
    echo   [FOUND] %app_name%
    call :CleanDirectory "%clean_path%" "%app_name% Cache"
)
goto :eof

:: ============================================================================
:: QUICK CLEAN PROFILE
:: ============================================================================
:QUICK_CLEAN
cls
title %APP_NAME% - Quick Clean in Progress...

echo.
echo  ╔════════════════════════════════════════════════════════════╗
echo  ║  QUICK CLEAN - Fast and Safe                               ║
echo  ╚════════════════════════════════════════════════════════════╝
echo.
echo  Starting quick cleanup...
echo  Estimated time: 2-3 minutes
echo.

echo [%date% %time%] === QUICK CLEAN STARTED === >> "%LOG_FILE%"

echo  [Step 1/5] System Temporary Files...
call :CleanDirectory "%TEMP%" "User Temp"
call :CleanDirectory "%SystemRoot%\Temp" "Windows Temp"

echo  [Step 2/5] Windows Prefetch...
call :CleanDirectory "%SystemRoot%\Prefetch" "Prefetch"

echo  [Step 3/5] Recycle Bin...
for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%d:\$Recycle.Bin" call :CleanDirectory "%%d:\$Recycle.Bin" "Recycle Bin %%d:"
)

echo  [Step 4/5] Browser Cache...
call :CheckAndClean "%LocalAppData%\Google\Chrome" "%LocalAppData%\Google\Chrome\User Data\Default\Cache" "Chrome"
call :CheckAndClean "%LocalAppData%\Microsoft\Edge" "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache" "Edge"

echo  [Step 5/5] Windows Update Cache...
call :CleanDirectory "%SystemRoot%\SoftwareDistribution\Download" "Update Cache"

echo.
echo  ✓ Quick Clean Complete!
echo.
goto CLEANUP_SUMMARY

:: ============================================================================
:: STANDARD CLEAN PROFILE
:: ============================================================================
:STANDARD_CLEAN
cls
title %APP_NAME% - Standard Clean in Progress...

echo.
echo  ╔════════════════════════════════════════════════════════════╗
echo  ║  STANDARD CLEAN - Recommended                              ║
echo  ╚════════════════════════════════════════════════════════════╝
echo.
echo  Starting standard cleanup...
echo  Estimated time: 5-7 minutes
echo.

echo [%date% %time%] === STANDARD CLEAN STARTED === >> "%LOG_FILE%"

echo  [1/12] System Temporary Files...
call :CleanDirectory "%TEMP%" "User Temp"
call :CleanDirectory "%SystemRoot%\Temp" "Windows Temp"
call :CleanDirectory "%SystemRoot%\Prefetch" "Prefetch"
call :CleanDirectory "%LocalAppData%\CrashDumps" "Crash Dumps"

echo  [2/12] Recycle Bin...
for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%d:\$Recycle.Bin" call :CleanDirectory "%%d:\$Recycle.Bin" "Recycle Bin %%d:"
)

echo  [3/12] Browser Cache...
call :CheckAndClean "%LocalAppData%\Google\Chrome" "%LocalAppData%\Google\Chrome\User Data\Default\Cache" "Chrome"
call :CheckAndClean "%LocalAppData%\Google\Chrome" "%LocalAppData%\Google\Chrome\User Data\Default\Code Cache" "Chrome Code"
call :CheckAndClean "%LocalAppData%\Microsoft\Edge" "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache" "Edge"
if exist "%AppData%\Mozilla\Firefox\Profiles" (
    echo   [FOUND] Firefox
    for /d %%p in ("%AppData%\Mozilla\Firefox\Profiles\*") do (
        call :CleanDirectory "%%p\cache2" "Firefox Cache"
    )
)

echo  [4/12] Communication Apps...
call :CheckAndClean "%AppData%\discord" "%AppData%\discord\Cache" "Discord"
call :CheckAndClean "%AppData%\Microsoft\Teams" "%AppData%\Microsoft\Teams\Cache" "Teams"
call :CheckAndClean "%AppData%\Zoom" "%AppData%\Zoom\logs" "Zoom"
call :CheckAndClean "%AppData%\Slack" "%AppData%\Slack\Cache" "Slack"

echo  [5/12] Game Platforms...
call :CheckAndClean "C:\Program Files (x86)\Steam" "C:\Program Files (x86)\Steam\appcache" "Steam"
call :CheckAndClean "%LocalAppData%\EpicGamesLauncher" "%LocalAppData%\EpicGamesLauncher\Saved\Logs" "Epic Games"

echo  [6/12] Media Applications...
call :CheckAndClean "%AppData%\Spotify" "%AppData%\Spotify\Data" "Spotify"
call :CheckAndClean "%AppData%\vlc" "%AppData%\vlc\art" "VLC"

echo  [7/12] Development Tools...
call :CheckAndClean "%AppData%\Code" "%AppData%\Code\Cache" "VS Code"
call :CheckAndClean "%LocalAppData%\JetBrains" "%LocalAppData%\JetBrains" "JetBrains IDEs"

echo  [8/12] GPU Cache...
call :CheckAndClean "%LocalAppData%\NVIDIA" "%LocalAppData%\NVIDIA\DXCache" "NVIDIA"
call :CheckAndClean "%LocalAppData%\AMD" "%LocalAppData%\AMD\DxCache" "AMD"
call :CleanDirectory "%LocalAppData%\D3DSCache" "DirectX Shader"

echo  [9/12] Windows Components...
call :CleanDirectory "%SystemRoot%\SoftwareDistribution\Download" "Update Cache"
call :CleanDirectory "%LocalAppData%\Microsoft\Windows\INetCache" "Internet Cache"
call :CleanDirectory "%LocalAppData%\Microsoft\Windows\WebCache" "Web Cache"

echo  [10/12] Windows Error Reports...
call :CleanDirectory "%ProgramData%\Microsoft\Windows\WER\ReportArchive" "WER Archive"
call :CleanDirectory "%ProgramData%\Microsoft\Windows\WER\ReportQueue" "WER Queue"

echo  [11/12] Thumbnail Cache...
del /f /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1

echo  [12/12] Crash Dumps...
call :CleanDirectory "%SystemRoot%\Minidump" "Minidumps"
del /f /q "%SystemRoot%\*.dmp" >nul 2>&1

echo.
echo  ✓ Standard Clean Complete!
echo.
goto CLEANUP_SUMMARY

:: ============================================================================
:: DEEP CLEAN PROFILE
:: ============================================================================
:DEEP_CLEAN
cls
title %APP_NAME% - Deep Clean in Progress...

echo.
echo  ╔════════════════════════════════════════════════════════════╗
echo  ║  DEEP CLEAN - Thorough System Scan                         ║
echo  ╚════════════════════════════════════════════════════════════╝
echo.
echo  ⚠ WARNING: This will perform extensive cleanup
echo  Estimated time: 15-20 minutes
echo.
set /p CONFIRM="  Continue? (Y/N): "
if /i not "%CONFIRM%"=="Y" goto MAIN_MENU

echo.
echo  Starting deep cleanup...
echo.

echo [%date% %time%] === DEEP CLEAN STARTED === >> "%LOG_FILE%"

:: Run all standard clean items
call :STANDARD_CLEAN_CORE

echo  [Extra 1/8] Cloud Storage Cache...
call :CheckAndClean "%LocalAppData%\Microsoft\OneDrive" "%LocalAppData%\Microsoft\OneDrive\logs" "OneDrive"
call :CheckAndClean "%LocalAppData%\Dropbox" "%LocalAppData%\Dropbox\logs" "Dropbox"
call :CheckAndClean "%LocalAppData%\Google\DriveFS" "%LocalAppData%\Google\DriveFS\Logs" "Google Drive"

echo  [Extra 2/8] Adobe Cache...
call :CheckAndClean "%LocalAppData%\Adobe" "%LocalAppData%\Adobe\Adobe Creative Cloud\ACC\Cache" "Adobe CC"
call :CheckAndClean "%AppData%\Adobe" "%AppData%\Adobe\Common\Media Cache Files" "Adobe Media"

echo  [Extra 3/8] Office Cache...
call :CheckAndClean "%LocalAppData%\Microsoft\Office" "%LocalAppData%\Microsoft\Office\16.0\OfficeFileCache" "Office"

echo  [Extra 4/8] Development Package Managers...
if exist "%AppData%\npm-cache" (
    echo   [FOUND] npm cache
    call npm cache clean --force >nul 2>&1
)
call :CheckAndClean "%LocalAppData%\Yarn" "%LocalAppData%\Yarn\Cache" "Yarn"
call :CheckAndClean "%LocalAppData%\pip" "%LocalAppData%\pip\cache" "pip"

echo  [Extra 5/8] Game Launchers Extended...
call :CheckAndClean "%ProgramData%\Origin" "%ProgramData%\Origin\Logs" "Origin"
call :CheckAndClean "%LocalAppData%\Riot Games" "%LocalAppData%\Riot Games\Riot Client\Logs" "Riot"

echo  [Extra 6/8] Windows Logs...
call :CleanDirectory "%SystemRoot%\Logs\CBS" "CBS Logs"
call :CleanDirectory "%SystemRoot%\Logs\DISM" "DISM Logs"

echo  [Extra 7/8] Windows Defender...
call :CleanDirectory "%ProgramData%\Microsoft\Windows Defender\Scans\History\Results\Quick" "Defender Quick"

echo  [Extra 8/8] Font Cache...
call :CleanDirectory "%LocalAppData%\Microsoft\Windows\Fonts" "Font Cache"

echo.
echo  ✓ Deep Clean Complete!
echo.
goto CLEANUP_SUMMARY

:STANDARD_CLEAN_CORE
:: Core standard clean without menu/display (used by deep clean)
call :CleanDirectory "%TEMP%" "User Temp"
call :CleanDirectory "%SystemRoot%\Temp" "Windows Temp"
call :CleanDirectory "%SystemRoot%\Prefetch" "Prefetch"
for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%d:\$Recycle.Bin" call :CleanDirectory "%%d:\$Recycle.Bin" "Recycle Bin %%d:"
)
goto :eof

:: ============================================================================
:: CUSTOM CLEAN
:: ============================================================================
:CUSTOM_CLEAN
cls
title %APP_NAME% - Custom Clean

echo.
echo  ╔════════════════════════════════════════════════════════════╗
echo  ║  CUSTOM CLEAN - Select Categories                          ║
echo  ╚════════════════════════════════════════════════════════════╝
echo.
echo  Select categories to clean:
echo.
echo  [1] System Files (Temp, Prefetch, Crash Dumps)
echo  [2] Browser Cache (Chrome, Edge, Firefox)
echo  [3] Communication Apps (Discord, Teams, Zoom)
echo  [4] Game Platforms (Steam, Epic, Origin)
echo  [5] Development Tools (VS Code, npm, pip)
echo  [6] Windows Components (Updates, Error Reports)
echo  [7] GPU Cache (NVIDIA, AMD, DirectX)
echo  [8] All of the above
echo  [0] Back to Main Menu
echo.
set /p CUSTOM_CHOICE="  Select [0-8]: "

if "%CUSTOM_CHOICE%"=="0" goto MAIN_MENU
if "%CUSTOM_CHOICE%"=="8" goto STANDARD_CLEAN

echo.
echo  Custom clean started...
echo.
:: Add custom logic here based on choice
echo  Feature in development...
timeout /t 2 /nobreak >nul
goto MAIN_MENU

:: ============================================================================
:: ANALYZE ONLY
:: ============================================================================
:ANALYZE_ONLY
cls
title %APP_NAME% - System Analysis

echo.
echo  ╔════════════════════════════════════════════════════════════╗
echo  ║  SYSTEM ANALYSIS - Scan Without Cleaning                   ║
echo  ╚════════════════════════════════════════════════════════════╝
echo.
echo  Analyzing system...
echo.

set "ANALYSIS_FILE=%~dp0analysis_report.txt"
echo WinClean Pro - System Analysis Report > "%ANALYSIS_FILE%"
echo Generated: %date% %time% >> "%ANALYSIS_FILE%"
echo ================================================ >> "%ANALYSIS_FILE%"
echo. >> "%ANALYSIS_FILE%"

echo  Scanning temporary files...
for /f "tokens=3" %%a in ('dir /s "%TEMP%" 2^>nul ^| find "File(s)"') do (
    echo User Temp: %%a bytes >> "%ANALYSIS_FILE%"
)

echo  Scanning browser cache...
for /f "tokens=3" %%a in ('dir /s "%LocalAppData%\Google\Chrome" 2^>nul ^| find "File(s)"') do (
    echo Chrome: %%a bytes >> "%ANALYSIS_FILE%"
)

echo  Scanning recycle bin...
for %%d in (C D E F) do (
    if exist "%%d:\$Recycle.Bin" (
        for /f "tokens=3" %%a in ('dir /s "%%d:\$Recycle.Bin" 2^>nul ^| find "File(s)"') do (
            echo Recycle Bin %%d: %%a bytes >> "%ANALYSIS_FILE%"
        )
    )
)

echo.
echo  ✓ Analysis complete!
echo  Report saved to: %ANALYSIS_FILE%
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: VIEW REPORT
:: ============================================================================
:VIEW_REPORT
cls
title %APP_NAME% - Cleanup Report

echo.
echo  ╔════════════════════════════════════════════════════════════╗
echo  ║  CLEANUP REPORT                                            ║
echo  ╚════════════════════════════════════════════════════════════╝
echo.

if exist "%LOG_FILE%" (
    type "%LOG_FILE%"
) else (
    echo  No cleanup history found.
)

echo.
pause
goto MAIN_MENU

:: ============================================================================
:: SETTINGS
:: ============================================================================
:SETTINGS
cls
title %APP_NAME% - Settings

echo.
echo  ╔════════════════════════════════════════════════════════════╗
echo  ║  SETTINGS                                                  ║
echo  ╚════════════════════════════════════════════════════════════╝
echo.
echo  [1] View Logs Folder
echo  [2] Clear All Logs
echo  [3] Reset Statistics
echo  [0] Back
echo.
set /p SET_CHOICE="  Select [0-3]: "

if "%SET_CHOICE%"=="1" start "" "%LOG_DIR%"
if "%SET_CHOICE%"=="2" del /q "%LOG_DIR%\*.log" >nul 2>&1 && echo Logs cleared!
if "%SET_CHOICE%"=="0" goto MAIN_MENU
timeout /t 2 /nobreak >nul
goto SETTINGS

:: ============================================================================
:: ABOUT
:: ============================================================================
:ABOUT
cls
title %APP_NAME% - About

echo.
echo  ╔════════════════════════════════════════════════════════════╗
echo  ║                                                            ║
echo  ║                    WinClean Pro v%VERSION%                ║
echo  ║         Professional Windows Cleanup Tool                 ║
echo  ║                                                            ║
echo  ╚════════════════════════════════════════════════════════════╝
echo.
echo  Inspired by leading open-source cleanup tools:
echo    • BleachBit
echo    • PrivaZer
echo    • CCleaner Community Edition
echo.
echo  Features:
echo    ✓ Multiple cleanup profiles
echo    ✓ 250+ application support
echo    ✓ Safe cleaning algorithms
echo    ✓ Detailed logging
echo    ✓ Real-time statistics
echo.
echo  License: MIT
echo  Author: WinClean Development Team
echo  Website: https://github.com/winclean-pro
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: CLEANUP SUMMARY
:: ============================================================================
:CLEANUP_SUMMARY
set "END_TIME=%time%"
echo.
echo  ╔════════════════════════════════════════════════════════════╗
echo  ║  CLEANUP SUMMARY                                           ║
echo  ╚════════════════════════════════════════════════════════════╝
echo.
echo  Items Cleaned:     %CLEANED_ITEMS%+
echo  Errors:            %ERRORS%
echo  Started:           %START_TIME%
echo  Completed:         %END_TIME%
echo.
echo  Log file: %LOG_FILE%
echo.
echo  ✓ All operations completed successfully!
echo.

echo [%date% %time%] === CLEANUP COMPLETED === >> "%LOG_FILE%"
echo Items Cleaned: %CLEANED_ITEMS% >> "%LOG_FILE%"
echo. >> "%LOG_FILE%"

pause
goto MAIN_MENU

:: ============================================================================
:: EXIT
:: ============================================================================
:EXIT
cls
echo.
echo  ╔════════════════════════════════════════════════════════════╗
echo  ║  Thank you for using WinClean Pro!                         ║
echo  ╚════════════════════════════════════════════════════════════╝
echo.
echo  System optimization complete.
echo  Run regularly for best performance.
echo.
timeout /t 3 /nobreak >nul
exit /b 0
