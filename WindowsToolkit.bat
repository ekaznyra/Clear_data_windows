@echo off
:: ============================================
:: WINDOWS PROFESSIONAL TOOLKIT v3.0
:: All-in-One System Tool (CMD/Batch)
:: Features: Cleanup | Activation | Uninstaller
:: ============================================

:: Set UTF-8 encoding
chcp 65001 >nul 2>&1

:: Check Admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo ==========================================
    echo   ADMINISTRATOR RIGHTS REQUIRED
    echo ==========================================
    echo.
    echo This tool needs Administrator privileges.
    echo Right-click and select "Run as administrator"
    echo.
    pause
    exit /b
)

:MAIN_MENU
cls
color 0B
echo.
echo ================================================================
echo.
echo           WINDOWS PROFESSIONAL TOOLKIT v3.0
echo           All-in-One System Management Tool
echo.
echo ================================================================
echo.
echo   SELECT TOOL:
echo.
echo   [1] Cleanup Tool        - Remove junk and optimize
echo   [2] Windows Activation  - Activate Windows
echo   [3] Software Manager    - Uninstall applications
echo   [4] View Logs           - Check operation history
echo   [5] System Info         - View system information
echo   [0] Exit                - Close toolkit
echo.
echo ================================================================
echo.

set /p choice="Enter your choice (0-5): "

if "%choice%"=="1" goto CLEANUP_MENU
if "%choice%"=="2" goto ACTIVATION_MENU
if "%choice%"=="3" goto SOFTWARE_MENU
if "%choice%"=="4" goto VIEW_LOGS
if "%choice%"=="5" goto SYSTEM_INFO
if "%choice%"=="0" goto EXIT_PROGRAM
goto MAIN_MENU

:: ============================================
:: CLEANUP TOOL MENU
:: ============================================
:CLEANUP_MENU
cls
color 0A
echo.
echo ================================================================
echo   CLEANUP TOOL - REMOVE JUNK FILES
echo ================================================================
echo.
echo   SELECT CLEANUP MODE:
echo.
echo   [1] Quick Cleanup      - Basic and safe (200-500 MB)
echo   [2] Standard Cleanup   - Recommended (500 MB - 3 GB)
echo   [3] Deep Cleanup       - Comprehensive (2-10+ GB)
echo   [4] Preview Mode       - See what will be deleted
echo   [0] Back to Main Menu
echo.
echo ================================================================
echo.

set /p cleanup_choice="Enter your choice (0-4): "

if "%cleanup_choice%"=="1" goto QUICK_CLEANUP
if "%cleanup_choice%"=="2" goto STANDARD_CLEANUP
if "%cleanup_choice%"=="3" goto DEEP_CLEANUP
if "%cleanup_choice%"=="4" goto PREVIEW_CLEANUP
if "%cleanup_choice%"=="0" goto MAIN_MENU
goto CLEANUP_MENU

:: ============================================
:: QUICK CLEANUP
:: ============================================
:QUICK_CLEANUP
cls
echo.
echo ================================================================
echo   QUICK CLEANUP - Starting...
echo ================================================================
echo.

call :LOG "==================== QUICK CLEANUP START ===================="

echo [1/4] Cleaning Windows Temp...
del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
rd /s /q "%SystemRoot%\Temp" >nul 2>&1
md "%SystemRoot%\Temp" >nul 2>&1
echo       [OK] Windows Temp
call :LOG "SUCCESS: Windows Temp cleaned"

echo [2/4] Cleaning User Temp...
del /f /s /q "%TEMP%\*.*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
md "%TEMP%" >nul 2>&1
echo       [OK] User Temp
call :LOG "SUCCESS: User Temp cleaned"

echo [3/4] Cleaning Recent Items...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*.*" >nul 2>&1
echo       [OK] Recent Items
call :LOG "SUCCESS: Recent Items cleaned"

echo [4/4] Cleaning Thumbnail Cache...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
echo       [OK] Thumbnail Cache
call :LOG "SUCCESS: Thumbnail Cache cleaned"

echo.
echo ================================================================
echo   QUICK CLEANUP COMPLETE!
echo ================================================================
echo   Estimated space freed: 200-500 MB
echo.
call :LOG "==================== QUICK CLEANUP END ===================="
pause
goto CLEANUP_MENU

:: ============================================
:: STANDARD CLEANUP
:: ============================================
:STANDARD_CLEANUP
cls
echo.
echo ================================================================
echo   STANDARD CLEANUP - Starting...
echo ================================================================
echo.

call :LOG "==================== STANDARD CLEANUP START ===================="

echo [1/12] Cleaning Windows Temp...
del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
rd /s /q "%SystemRoot%\Temp" >nul 2>&1
md "%SystemRoot%\Temp" >nul 2>&1
echo       [OK] Windows Temp

echo [2/12] Cleaning User Temp...
del /f /s /q "%TEMP%\*.*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
md "%TEMP%" >nul 2>&1
echo       [OK] User Temp

echo [3/12] Cleaning Prefetch...
del /f /s /q "%SystemRoot%\Prefetch\*.*" >nul 2>&1
echo       [OK] Prefetch

echo [4/12] Cleaning Windows Update Cache...
del /f /s /q "%SystemRoot%\SoftwareDistribution\Download\*.*" >nul 2>&1
echo       [OK] Windows Update Cache

echo [5/12] Cleaning Error Reports...
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\ReportQueue\*.*" >nul 2>&1
echo       [OK] Error Reports

echo [6/12] Cleaning Crash Dumps...
del /f /s /q "%LOCALAPPDATA%\CrashDumps\*.*" >nul 2>&1
echo       [OK] Crash Dumps

echo [7/12] Cleaning Recent Items...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*.*" >nul 2>&1
echo       [OK] Recent Items

echo [8/12] Cleaning Thumbnail Cache...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
echo       [OK] Thumbnail Cache

echo [9/12] Cleaning Chrome Cache...
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache\*.*" >nul 2>&1
echo       [OK] Chrome Cache

echo [10/12] Cleaning Edge Cache...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache\*.*" >nul 2>&1
echo       [OK] Edge Cache

echo [11/12] Cleaning Firefox Cache...
for /d %%G in ("%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*") do (
    del /f /s /q "%%G\cache2\*.*" >nul 2>&1
)
echo       [OK] Firefox Cache

echo [12/12] Cleaning Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
echo       [OK] Recycle Bin

echo.
echo ================================================================
echo   STANDARD CLEANUP COMPLETE!
echo ================================================================
echo   Estimated space freed: 500 MB - 3 GB
echo.
call :LOG "SUCCESS: Standard cleanup completed"
call :LOG "==================== STANDARD CLEANUP END ===================="
pause
goto CLEANUP_MENU

:: ============================================
:: DEEP CLEANUP
:: ============================================
:DEEP_CLEANUP
cls
echo.
echo ================================================================
echo   DEEP CLEANUP - WARNING!
echo ================================================================
echo.
echo   This will perform comprehensive cleanup including:
echo   - All standard items
echo   - Windows logs
echo   - Application caches (Teams, Discord, VS Code, etc.)
echo   - Delivery Optimization
echo.
echo   Some apps may start slower first time after cleanup.
echo.

set /p confirm="Continue with Deep Cleanup? (Y/N): "
if /i not "%confirm%"=="Y" goto CLEANUP_MENU

cls
echo.
echo ================================================================
echo   DEEP CLEANUP - Starting...
echo ================================================================
echo.

call :LOG "==================== DEEP CLEANUP START ===================="

echo Performing Standard Cleanup first...
echo.

echo [1/20] Cleaning Windows Temp...
del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
rd /s /q "%SystemRoot%\Temp" >nul 2>&1
md "%SystemRoot%\Temp" >nul 2>&1
echo       [OK] Windows Temp

echo [2/20] Cleaning User Temp...
del /f /s /q "%TEMP%\*.*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
md "%TEMP%" >nul 2>&1
echo       [OK] User Temp

echo [3/20] Cleaning Prefetch...
del /f /s /q "%SystemRoot%\Prefetch\*.*" >nul 2>&1
echo       [OK] Prefetch

echo [4/20] Cleaning Windows Update Cache...
del /f /s /q "%SystemRoot%\SoftwareDistribution\Download\*.*" >nul 2>&1
echo       [OK] Windows Update Cache

echo [5/20] Cleaning Error Reports...
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\ReportQueue\*.*" >nul 2>&1
echo       [OK] Error Reports

echo [6/20] Cleaning Crash Dumps...
del /f /s /q "%LOCALAPPDATA%\CrashDumps\*.*" >nul 2>&1
echo       [OK] Crash Dumps

echo [7/20] Cleaning Recent Items...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*.*" >nul 2>&1
echo       [OK] Recent Items

echo [8/20] Cleaning Thumbnail Cache...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
echo       [OK] Thumbnail Cache

echo [9/20] Cleaning Chrome Cache...
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache\*.*" >nul 2>&1
echo       [OK] Chrome Cache

echo [10/20] Cleaning Edge Cache...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache\*.*" >nul 2>&1
echo       [OK] Edge Cache

echo [11/20] Cleaning Firefox Cache...
for /d %%G in ("%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*") do (
    del /f /s /q "%%G\cache2\*.*" >nul 2>&1
)
echo       [OK] Firefox Cache

echo [12/20] Cleaning Windows Logs...
del /f /s /q "%SystemRoot%\Logs\*.*" >nul 2>&1
del /f /s /q "%SystemRoot%\System32\LogFiles\*.*" >nul 2>&1
echo       [OK] Windows Logs

echo [13/20] Cleaning Delivery Optimization...
del /f /s /q "%SystemRoot%\SoftwareDistribution\DeliveryOptimization\*.*" >nul 2>&1
echo       [OK] Delivery Optimization

echo [14/20] Cleaning Teams Cache...
del /f /s /q "%APPDATA%\Microsoft\Teams\Cache\*.*" >nul 2>&1
del /f /s /q "%APPDATA%\Microsoft\Teams\tmp\*.*" >nul 2>&1
echo       [OK] Teams Cache

echo [15/20] Cleaning Discord Cache...
del /f /s /q "%APPDATA%\Discord\Cache\*.*" >nul 2>&1
del /f /s /q "%APPDATA%\Discord\Code Cache\*.*" >nul 2>&1
echo       [OK] Discord Cache

echo [16/20] Cleaning VS Code Cache...
del /f /s /q "%APPDATA%\Code\Cache\*.*" >nul 2>&1
del /f /s /q "%APPDATA%\Code\CachedData\*.*" >nul 2>&1
echo       [OK] VS Code Cache

echo [17/20] Cleaning Spotify Cache...
del /f /s /q "%APPDATA%\Spotify\Data\*.*" >nul 2>&1
echo       [OK] Spotify Cache

echo [18/20] Cleaning Slack Cache...
del /f /s /q "%APPDATA%\Slack\Cache\*.*" >nul 2>&1
echo       [OK] Slack Cache

echo [19/20] Cleaning Zoom Cache...
del /f /s /q "%APPDATA%\Zoom\logs\*.*" >nul 2>&1
echo       [OK] Zoom Cache

echo [20/20] Cleaning Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
echo       [OK] Recycle Bin

echo.
echo ================================================================
echo   DEEP CLEANUP COMPLETE!
echo ================================================================
echo   Estimated space freed: 2-10+ GB
echo.
call :LOG "SUCCESS: Deep cleanup completed"
call :LOG "==================== DEEP CLEANUP END ===================="
pause
goto CLEANUP_MENU

:: ============================================
:: PREVIEW CLEANUP
:: ============================================
:PREVIEW_CLEANUP
cls
echo.
echo ================================================================
echo   PREVIEW MODE - What will be deleted
echo ================================================================
echo.
echo   This is PREVIEW mode - nothing will be deleted!
echo   Showing what Standard Cleanup would remove:
echo.
echo   [X] Windows Temp folder
echo   [X] User Temp folder
echo   [X] Prefetch files
echo   [X] Windows Update cache
echo   [X] Error reports
echo   [X] Crash dumps
echo   [X] Recent items
echo   [X] Thumbnail cache
echo   [X] Chrome cache
echo   [X] Edge cache
echo   [X] Firefox cache
echo   [X] Recycle Bin
echo.
echo   Estimated space: 500 MB - 3 GB
echo.
echo ================================================================
echo.
call :LOG "PREVIEW: User viewed preview mode"
pause
goto CLEANUP_MENU

:: ============================================
:: ACTIVATION MENU
:: ============================================
:ACTIVATION_MENU
cls
color 0E
echo.
echo ================================================================
echo   WINDOWS ACTIVATION TOOL
echo ================================================================
echo.

:: Check current activation status
echo   Current Activation Status:
cscript //nologo %SystemRoot%\System32\slmgr.vbs /dli | findstr /C:"License Status"
echo.

echo ================================================================
echo.
echo   SELECT ACTIVATION METHOD:
echo.
echo   [1] Activate Windows (KMS Method)
echo   [2] Enter Product Key Manually
echo   [3] Check Activation Status
echo   [4] View License Information
echo   [0] Back to Main Menu
echo.
echo   WARNING: Use only on your own devices!
echo.
echo ================================================================
echo.

set /p act_choice="Enter your choice (0-4): "

if "%act_choice%"=="1" goto KMS_ACTIVATE
if "%act_choice%"=="2" goto MANUAL_KEY
if "%act_choice%"=="3" goto CHECK_STATUS
if "%act_choice%"=="4" goto LICENSE_INFO
if "%act_choice%"=="0" goto MAIN_MENU
goto ACTIVATION_MENU

:: ============================================
:: KMS ACTIVATION
:: ============================================
:KMS_ACTIVATE
cls
echo.
echo ================================================================
echo   KMS ACTIVATION - Starting...
echo ================================================================
echo.
echo   This will use KMS activation method
echo   Valid for 180 days (auto-renews)
echo.

set /p confirm_act="Continue with KMS activation? (Y/N): "
if /i not "%confirm_act%"=="Y" goto ACTIVATION_MENU

echo.
echo   Step 1: Setting KMS server...
cscript //nologo %SystemRoot%\System32\slmgr.vbs /skms kms8.msguides.com
timeout /t 2 >nul
echo   [OK] KMS server configured

echo.
echo   Step 2: Activating Windows...
cscript //nologo %SystemRoot%\System32\slmgr.vbs /ato
timeout /t 3 >nul

echo.
echo ================================================================
echo   ACTIVATION COMPLETE!
echo ================================================================
echo   Check status to verify activation
echo.
call :LOG "SUCCESS: Windows activated via KMS"
pause
goto ACTIVATION_MENU

:: ============================================
:: MANUAL PRODUCT KEY
:: ============================================
:MANUAL_KEY
cls
echo.
echo ================================================================
echo   ENTER PRODUCT KEY
echo ================================================================
echo.

set /p product_key="Enter your 25-character product key (XXXXX-XXXXX-XXXXX-XXXXX-XXXXX): "

echo.
echo   Installing product key...
cscript //nologo %SystemRoot%\System32\slmgr.vbs /ipk %product_key%
timeout /t 2 >nul

echo.
echo   Activating Windows...
cscript //nologo %SystemRoot%\System32\slmgr.vbs /ato
timeout /t 3 >nul

echo.
echo ================================================================
echo   ACTIVATION COMPLETE!
echo ================================================================
echo.
call :LOG "SUCCESS: Product key entered and activated"
pause
goto ACTIVATION_MENU

:: ============================================
:: CHECK ACTIVATION STATUS
:: ============================================
:CHECK_STATUS
cls
echo.
echo ================================================================
echo   ACTIVATION STATUS
echo ================================================================
echo.
cscript //nologo %SystemRoot%\System32\slmgr.vbs /dli
echo.
echo ================================================================
echo.
call :LOG "INFO: Activation status checked"
pause
goto ACTIVATION_MENU

:: ============================================
:: LICENSE INFORMATION
:: ============================================
:LICENSE_INFO
cls
echo.
echo ================================================================
echo   LICENSE INFORMATION
echo ================================================================
echo.
cscript //nologo %SystemRoot%\System32\slmgr.vbs /dlv
echo.
echo ================================================================
echo.
pause
goto ACTIVATION_MENU

:: ============================================
:: SOFTWARE MANAGER MENU
:: ============================================
:SOFTWARE_MENU
cls
color 0D
echo.
echo ================================================================
echo   SOFTWARE MANAGER - UNINSTALL APPLICATIONS
echo ================================================================
echo.
echo   SELECT ACTION:
echo.
echo   [1] List All Installed Software
echo   [2] Uninstall Software by Name
echo   [3] Export Software List to File
echo   [0] Back to Main Menu
echo.
echo ================================================================
echo.

set /p soft_choice="Enter your choice (0-3): "

if "%soft_choice%"=="1" goto LIST_SOFTWARE
if "%soft_choice%"=="2" goto UNINSTALL_SOFTWARE
if "%soft_choice%"=="3" goto EXPORT_SOFTWARE
if "%soft_choice%"=="0" goto MAIN_MENU
goto SOFTWARE_MENU

:: ============================================
:: LIST SOFTWARE
:: ============================================
:LIST_SOFTWARE
cls
echo.
echo ================================================================
echo   INSTALLED SOFTWARE LIST
echo ================================================================
echo.
echo   Loading installed applications...
echo.

wmic product get name,version,vendor /format:table

echo.
echo ================================================================
echo.
call :LOG "INFO: Software list viewed"
pause
goto SOFTWARE_MENU

:: ============================================
:: UNINSTALL SOFTWARE
:: ============================================
:UNINSTALL_SOFTWARE
cls
echo.
echo ================================================================
echo   UNINSTALL SOFTWARE
echo ================================================================
echo.

set /p soft_name="Enter software name to uninstall: "

echo.
echo   Searching for "%soft_name%"...
echo.

wmic product where "name like '%%%soft_name%%%'" get name,version

echo.
set /p confirm_uninstall="Uninstall this software? (Y/N): "
if /i not "%confirm_uninstall%"=="Y" goto SOFTWARE_MENU

echo.
echo   Uninstalling...
wmic product where "name like '%%%soft_name%%%'" call uninstall /nointeractive

echo.
echo ================================================================
echo   UNINSTALL COMPLETE!
echo ================================================================
echo.
call :LOG "UNINSTALL: %soft_name%"
pause
goto SOFTWARE_MENU

:: ============================================
:: EXPORT SOFTWARE LIST
:: ============================================
:EXPORT_SOFTWARE
cls
echo.
echo ================================================================
echo   EXPORT SOFTWARE LIST
echo ================================================================
echo.

set "export_file=%~dp0InstalledSoftware_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
set "export_file=%export_file: =0%"

echo   Exporting software list...
echo.

echo ================================================================ > "%export_file%"
echo INSTALLED SOFTWARE LIST - %date% %time% >> "%export_file%"
echo ================================================================ >> "%export_file%"
echo. >> "%export_file%"

wmic product get name,version,vendor /format:table >> "%export_file%"

echo. >> "%export_file%"
echo ================================================================ >> "%export_file%"

echo.
echo   SUCCESS - List exported!
echo   File: %export_file%
echo.
echo ================================================================
echo.
call :LOG "EXPORT: Software list exported to file"
pause
goto SOFTWARE_MENU

:: ============================================
:: VIEW LOGS
:: ============================================
:VIEW_LOGS
cls
echo.
echo ================================================================
echo   OPERATION LOGS
echo ================================================================
echo.

set "log_file=%~dp0ToolkitLog.txt"

if exist "%log_file%" (
    echo   Last 50 log entries:
    echo.
    type "%log_file%" | more
) else (
    echo   No logs found yet.
    echo   Logs will be created after first operation.
)

echo.
echo ================================================================
echo.
pause
goto MAIN_MENU

:: ============================================
:: SYSTEM INFO
:: ============================================
:SYSTEM_INFO
cls
echo.
echo ================================================================
echo   SYSTEM INFORMATION
echo ================================================================
echo.
systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory" /C:"Available Physical Memory"
echo.
echo   Disk Information:
wmic logicaldisk get caption,size,freespace /format:table
echo.
echo ================================================================
echo.
pause
goto MAIN_MENU

:: ============================================
:: LOG FUNCTION
:: ============================================
:LOG
set "log_file=%~dp0ToolkitLog.txt"
echo [%date% %time%] %~1 >> "%log_file%"
goto :eof

:: ============================================
:: EXIT PROGRAM
:: ============================================
:EXIT_PROGRAM
cls
echo.
echo ================================================================
echo.
echo        Thank you for using Windows Toolkit!
echo        Goodbye!
echo.
echo ================================================================
echo.
call :LOG "==================== TOOLKIT CLOSED ===================="
timeout /t 2 >nul
exit
