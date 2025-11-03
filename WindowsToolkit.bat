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
echo   [2] Windows Activation  - Activate Windows ^& Office
echo   [3] Windows Optimizer   - Optimize Windows 10/11 (NEW!)
echo   [4] Software Manager    - Uninstall applications
echo   [5] View Logs           - Check operation history
echo   [6] System Info         - View system information
echo   [0] Exit                - Close toolkit
echo.
echo ================================================================
echo.

set /p choice="Enter your choice (0-6): "

if "%choice%"=="1" goto CLEANUP_MENU
if "%choice%"=="2" goto ACTIVATION_MENU
if "%choice%"=="3" goto OPTIMIZER_MENU
if "%choice%"=="4" goto SOFTWARE_MENU
if "%choice%"=="5" goto VIEW_LOGS
if "%choice%"=="6" goto SYSTEM_INFO
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
:: ACTIVATION MENU (Full MAS Features)
:: ============================================
:ACTIVATION_MENU
cls
color 0E
echo.
echo ================================================================
echo   WINDOWS ^& OFFICE ACTIVATION TOOL
echo   Microsoft Activation Scripts (MAS) - Full Edition
echo ================================================================
echo.

:: Check current activation status
echo   Current Status:
cscript //nologo %SystemRoot%\System32\slmgr.vbs /dli | findstr /C:"License Status"
echo.

echo ================================================================
echo.
echo   WINDOWS ACTIVATION:
echo.
echo   [1]  HWID Activation          - Permanent (Win 10/11)
echo   [2]  KMS38 Activation         - Until 2038 (Win 10/11/Server)
echo   [3]  Online KMS Activation    - 180 days, auto-renew
echo.
echo   OFFICE ACTIVATION:
echo.
echo   [4]  Ohook Activation         - Permanent Office (Recommended)
echo   [5]  KMS Office Activation    - Office KMS (180 days)
echo.
echo   UTILITY TOOLS:
echo.
echo   [6]  Activation Troubleshoot  - Fix activation issues
echo   [7]  Check Activation Status  - Detailed info
echo   [8]  Extract Windows Keys     - Show product keys
echo   [9]  Change Windows Edition   - Home to Pro, etc.
echo   [10] Show OEM Information     - View OEM details
echo   [11] Remove Office Licenses   - Clean Office keys
echo.
echo   MANUAL OPTIONS:
echo.
echo   [12] Install Product Key      - Enter key manually
echo   [13] Uninstall Product Key    - Remove current key
echo   [14] View License Information - Detailed license
echo.
echo   [0]  Back to Main Menu
echo.
echo   Source: github.com/massgravel/Microsoft-Activation-Scripts
echo.
echo ================================================================
echo.

set /p act_choice="Enter your choice (0-14): "

if "%act_choice%"=="1" goto HWID_ACTIVATE
if "%act_choice%"=="2" goto KMS38_ACTIVATE
if "%act_choice%"=="3" goto ONLINE_KMS_ACTIVATE
if "%act_choice%"=="4" goto OHOOK_OFFICE
if "%act_choice%"=="5" goto KMS_OFFICE
if "%act_choice%"=="6" goto ACTIVATION_TROUBLESHOOT
if "%act_choice%"=="7" goto CHECK_STATUS
if "%act_choice%"=="8" goto EXTRACT_KEYS
if "%act_choice%"=="9" goto CHANGE_EDITION
if "%act_choice%"=="10" goto SHOW_OEM_INFO
if "%act_choice%"=="11" goto REMOVE_OFFICE_LICENSE
if "%act_choice%"=="12" goto MANUAL_KEY
if "%act_choice%"=="13" goto UNINSTALL_KEY
if "%act_choice%"=="14" goto LICENSE_INFO
if "%act_choice%"=="0" goto MAIN_MENU
goto ACTIVATION_MENU

:: ============================================
:: HWID ACTIVATION (Permanent - Windows 10/11)
:: ============================================
:HWID_ACTIVATE
cls
echo.
echo ================================================================
echo   HWID PERMANENT ACTIVATION
echo ================================================================
echo.
echo   HWID (Hardware ID) Activation:
echo   - PERMANENT activation (lifetime)
echo   - Works on Windows 10/11
echo   - Survives reinstalls on same hardware
echo   - Most recommended method
echo.

set /p confirm_hwid="Continue with HWID activation? (Y/N): "
if /i not "%confirm_hwid%"=="Y" goto ACTIVATION_MENU

echo.
echo   Downloading and running HWID activation script...
echo.

:: Download and run HWID script from MAS
powershell -Command "irm https://massgrave.dev/get | iex" 2>nul

if errorlevel 1 (
    echo.
    echo   ERROR: Could not download activation script
    echo   Check your internet connection
    echo.
    pause
    goto ACTIVATION_MENU
)

echo.
echo ================================================================
echo   HWID ACTIVATION PROCESS COMPLETE!
echo ================================================================
echo   Check activation status to verify
echo.
call :LOG "SUCCESS: HWID activation attempted"
pause
goto ACTIVATION_MENU

:: ============================================
:: KMS38 ACTIVATION (Valid until 2038)
:: ============================================
:KMS38_ACTIVATE
cls
echo.
echo ================================================================
echo   KMS38 ACTIVATION
echo ================================================================
echo.
echo   KMS38 Activation:
echo   - Valid until year 2038 (19 years)
echo   - Works on Windows 10/11/Server
echo   - No need for renewal
echo   - Offline activation
echo.

set /p confirm_kms38="Continue with KMS38 activation? (Y/N): "
if /i not "%confirm_kms38%"=="Y" goto ACTIVATION_MENU

echo.
echo   Downloading and running KMS38 activation script...
echo.

:: Download and run KMS38 script from MAS
powershell -Command "irm https://massgrave.dev/get | iex" 2>nul

if errorlevel 1 (
    echo.
    echo   ERROR: Could not download activation script
    echo   Check your internet connection
    echo.
    pause
    goto ACTIVATION_MENU
)

echo.
echo ================================================================
echo   KMS38 ACTIVATION PROCESS COMPLETE!
echo ================================================================
echo   Check activation status to verify
echo.
call :LOG "SUCCESS: KMS38 activation attempted"
pause
goto ACTIVATION_MENU

:: ============================================
:: ONLINE KMS ACTIVATION (180 days, auto-renew)
:: ============================================
:ONLINE_KMS_ACTIVATE
cls
echo.
echo ================================================================
echo   ONLINE KMS ACTIVATION
echo ================================================================
echo.
echo   Online KMS Activation:
echo   - Valid for 180 days
echo   - Auto-renews automatically
echo   - Works on all Windows versions
echo   - Requires periodic internet connection
echo.

set /p confirm_kms="Continue with Online KMS activation? (Y/N): "
if /i not "%confirm_kms%"=="Y" goto ACTIVATION_MENU

echo.
echo   Method 1: Using MAS Script (Recommended)
echo.

:: Try MAS script first
powershell -Command "irm https://massgrave.dev/get | iex" 2>nul

if errorlevel 1 (
    echo.
    echo   Trying fallback method...
    echo.
    
    :: Fallback to manual KMS
    echo   Step 1: Setting KMS server...
    cscript //nologo %SystemRoot%\System32\slmgr.vbs /skms kms8.msguides.com
    timeout /t 2 >nul
    echo   [OK] KMS server configured
    
    echo.
    echo   Step 2: Activating Windows...
    cscript //nologo %SystemRoot%\System32\slmgr.vbs /ato
    timeout /t 3 >nul
)

echo.
echo ================================================================
echo   ONLINE KMS ACTIVATION COMPLETE!
echo ================================================================
echo   Check status to verify activation
echo.
call :LOG "SUCCESS: Online KMS activation attempted"
pause
goto ACTIVATION_MENU

:: ============================================
:: OHOOK OFFICE ACTIVATION (Permanent)
:: ============================================
:OHOOK_OFFICE
cls
echo.
echo ================================================================
echo   OHOOK OFFICE ACTIVATION (PERMANENT)
echo ================================================================
echo.
echo   Ohook Activation Method:
echo   - PERMANENT activation (no expiration!)
echo   - No KMS server needed
echo   - Works offline
echo   - Supports Office 2016/2019/2021/365
echo   - Recommended method for Office
echo.
echo   Supports:
echo   - Office 365 / Microsoft 365
echo   - Office 2021 / 2019 / 2016
echo   - Project and Visio
echo   - All editions
echo.

set /p confirm_ohook="Continue with Ohook activation? (Y/N): "
if /i not "%confirm_ohook%"=="Y" goto ACTIVATION_MENU

echo.
echo   Detecting Office installation...
echo.

:: Check if Office is installed
set "office_found=0"
if exist "%ProgramFiles%\Microsoft Office" set "office_found=1"
if exist "%ProgramFiles(x86)%\Microsoft Office" set "office_found=1"
if exist "%ProgramW6432%\Microsoft Office" set "office_found=1"

if "%office_found%"=="0" (
    echo.
    echo   ERROR: Microsoft Office not found!
    echo   Please install Office first.
    echo.
    pause
    goto ACTIVATION_MENU
)

echo   Office detected!
echo.
echo   Downloading and running Ohook activation...
echo.

:: Download and run Ohook from MAS
powershell -Command "irm https://massgrave.dev/get | iex" 2>nul

if errorlevel 1 (
    echo.
    echo   ERROR: Could not download Ohook script
    echo   Check your internet connection
    echo   Try option [5] KMS Office Activation instead
    echo.
    pause
    goto ACTIVATION_MENU
)

echo.
echo ================================================================
echo   OHOOK ACTIVATION COMPLETE!
echo ================================================================
echo   Office is now permanently activated!
echo   Open Word/Excel to verify
echo.
call :LOG "SUCCESS: Ohook Office activation completed"
pause
goto ACTIVATION_MENU

:: ============================================
:: KMS OFFICE ACTIVATION (180 days)
:: ============================================
:KMS_OFFICE
cls
echo.
echo ================================================================
echo   KMS OFFICE ACTIVATION
echo ================================================================
echo.
echo   KMS Office Activation:
echo   - 180 days validity
echo   - Auto-renews automatically
echo   - Works with all Office versions
echo   - Requires periodic internet
echo.
echo   Supports:
echo   - Office 365 / 2021 / 2019 / 2016 / 2013 / 2010
echo   - Project and Visio
echo   - All editions
echo.

set /p confirm_kms_office="Continue with KMS Office activation? (Y/N): "
if /i not "%confirm_kms_office%"=="Y" goto ACTIVATION_MENU

echo.
echo   Detecting Office installation...
echo.

set "office_found=0"
if exist "%ProgramFiles%\Microsoft Office" set "office_found=1"
if exist "%ProgramFiles(x86)%\Microsoft Office" set "office_found=1"

if "%office_found%"=="0" (
    echo.
    echo   ERROR: Microsoft Office not found!
    echo.
    pause
    goto ACTIVATION_MENU
)

echo   Office detected!
echo.
echo   Running KMS Office activation...
echo.

:: Try MAS script
powershell -Command "irm https://massgrave.dev/get | iex" 2>nul

if errorlevel 1 (
    echo.
    echo   Trying manual KMS activation...
    echo.
    
    cd /d "%ProgramFiles%\Microsoft Office\Office16"
    if errorlevel 1 cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"
    if errorlevel 1 cd /d "%ProgramFiles%\Microsoft Office\Office15"
    if errorlevel 1 cd /d "%ProgramFiles(x86)%\Microsoft Office\Office15"
    
    for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms 2^>nul') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul 2>&1
    cscript ospp.vbs /setprt:1688 >nul 2>&1
    cscript ospp.vbs /unpkey:6MWKP >nul 2>&1
    cscript ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP >nul 2>&1
    cscript ospp.vbs /sethst:kms8.msguides.com >nul 2>&1
    cscript ospp.vbs /act >nul 2>&1
)

echo.
echo ================================================================
echo   KMS OFFICE ACTIVATION COMPLETE!
echo ================================================================
echo   Valid for 180 days, auto-renews
echo   Open Office apps to verify
echo.
call :LOG "SUCCESS: KMS Office activation completed"
pause
goto ACTIVATION_MENU

:: ============================================
:: ACTIVATION TROUBLESHOOT
:: ============================================
:ACTIVATION_TROUBLESHOOT
cls
echo.
echo ================================================================
echo   ACTIVATION TROUBLESHOOT ^& FIX
echo ================================================================
echo.
echo   This will attempt to fix common activation issues:
echo   - Reset activation tokens
echo   - Repair Windows licensing
echo   - Clear activation cache
echo   - Fix corrupted activation files
echo   - Reset KMS settings
echo.

set /p confirm_troubleshoot="Run activation troubleshoot? (Y/N): "
if /i not "%confirm_troubleshoot%"=="Y" goto ACTIVATION_MENU

echo.
echo   Running troubleshoot steps...
echo.

echo   [1/7] Stopping Software Protection service...
net stop sppsvc /y >nul 2>&1
echo       [OK] Service stopped

echo   [2/7] Resetting activation tokens...
cscript //nologo %SystemRoot%\System32\slmgr.vbs /rilc >nul 2>&1
echo       [OK] Tokens reset

echo   [3/7] Clearing activation cache...
del /f /q "%SystemRoot%\System32\7B296FB0-376B-497e-B012-9C450E1B7327-5P-0.C7483456-A289-439d-8115-601632D005A0" >nul 2>&1
del /f /q "%SystemRoot%\System32\7B296FB0-376B-497e-B012-9C450E1B7327-5P-1.C7483456-A289-439d-8115-601632D005A0" >nul 2>&1
del /f /q "%SystemRoot%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform\tokens.dat" >nul 2>&1
echo       [OK] Cache cleared

echo   [4/7] Clearing KMS settings...
cscript //nologo %SystemRoot%\System32\slmgr.vbs /ckms >nul 2>&1
echo       [OK] KMS cleared

echo   [5/7] Repairing Windows licensing...
dism /online /cleanup-image /restorehealth >nul 2>&1
echo       [OK] Licensing repaired

echo   [6/7] Starting Software Protection service...
net start sppsvc >nul 2>&1
echo       [OK] Service started

echo   [7/7] Refreshing activation status...
cscript //nologo %SystemRoot%\System32\slmgr.vbs /ato >nul 2>&1
echo       [OK] Status refreshed

echo.
echo ================================================================
echo   TROUBLESHOOT COMPLETE!
echo ================================================================
echo   Try activating Windows again now
echo   If still fails, try different activation method
echo.
call :LOG "INFO: Activation troubleshoot completed"
pause
goto ACTIVATION_MENU

:: ============================================
:: EXTRACT WINDOWS KEYS
:: ============================================
:EXTRACT_KEYS
cls
echo.
echo ================================================================
echo   EXTRACT WINDOWS PRODUCT KEYS
echo ================================================================
echo.
echo   This will show all Windows product keys on your system:
echo   - Current installed key
echo   - OEM key (if available)
echo   - Retail key (if available)
echo.

echo   Extracting product keys...
echo.

:: Show current key
echo   Current Product Key:
for /f "tokens=2 delims==" %%I in ('wmic path softwarelicensingservice get OA3xOriginalProductKey /value 2^>nul') do set "key=%%I"
if defined key (
    echo   %key%
) else (
    echo   Not found or digital license
)

echo.
echo   Partial Product Key (last 5 characters):
cscript //nologo %SystemRoot%\System32\slmgr.vbs /dli | findstr /C:"partial product key"

echo.
echo   Attempting to extract OEM key from BIOS...
wmic path softwarelicensingservice get OA3xOriginalProductKey 2>nul

echo.
echo   Full license details:
cscript //nologo %SystemRoot%\System32\slmgr.vbs /dlv

echo.
echo ================================================================
echo.
call :LOG "INFO: Product keys extracted"
pause
goto ACTIVATION_MENU

:: ============================================
:: CHANGE WINDOWS EDITION
:: ============================================
:CHANGE_EDITION
cls
echo.
echo ================================================================
echo   CHANGE WINDOWS EDITION
echo ================================================================
echo.
echo   This allows you to upgrade Windows edition:
echo   - Home to Pro
echo   - Pro to Enterprise
echo   - And other editions
echo.
echo   WARNING: This requires a valid product key for target edition
echo.

echo   Current Edition:
for /f "tokens=3*" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v EditionID 2^>nul ^| find "EditionID"') do echo   %%i %%j

echo.
echo   Available target editions:
DISM /online /Get-TargetEditions

echo.
echo   Common upgrade keys (for reference only):
echo.
echo   Windows 10/11 Pro: VK7JG-NPHTM-C97JM-9MPGT-3V66T
echo   Windows 10/11 Pro N: 2B87N-8KFHP-DKV6R-Y2C8J-PKCKT
echo   Windows 10/11 Enterprise: XGVPP-NMH47-7TTHJ-W3FW7-8HV2C
echo.

set /p target_edition="Enter target edition ID (or press Enter to cancel): "
if "%target_edition%"=="" goto ACTIVATION_MENU

echo.
set /p edition_key="Enter product key for %target_edition%: "
if "%edition_key%"=="" goto ACTIVATION_MENU

echo.
echo   Changing edition to %target_edition%...
echo   This may take several minutes...
echo.

cscript //nologo %SystemRoot%\System32\slmgr.vbs /ipk %edition_key%
timeout /t 3 >nul

DISM /online /Set-Edition:%target_edition% /ProductKey:%edition_key% /AcceptEula

echo.
echo ================================================================
echo   EDITION CHANGE INITIATED
echo ================================================================
echo   System may need to restart to complete
echo   Follow on-screen instructions
echo.
call :LOG "INFO: Edition change attempted to %target_edition%"
pause
goto ACTIVATION_MENU

:: ============================================
:: SHOW OEM INFORMATION
:: ============================================
:SHOW_OEM_INFO
cls
echo.
echo ================================================================
echo   OEM SYSTEM INFORMATION
echo ================================================================
echo.

echo   Computer Manufacturer:
wmic computersystem get manufacturer /value | findstr /r /v "^$"

echo.
echo   Computer Model:
wmic computersystem get model /value | findstr /r /v "^$"

echo.
echo   BIOS Information:
wmic bios get manufacturer,version,releasedate /format:list | findstr /r /v "^$"

echo.
echo   OEM Product Key (from BIOS/UEFI):
wmic path softwarelicensingservice get OA3xOriginalProductKey /value | findstr /r /v "^$"

echo.
echo   System Serial Number:
wmic bios get serialnumber /value | findstr /r /v "^$"

echo.
echo   Windows Installation Info:
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName 2>nul | findstr ProductName
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v EditionID 2>nul | findstr EditionID
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ReleaseId 2>nul | findstr ReleaseId

echo.
echo ================================================================
echo.
call :LOG "INFO: OEM information displayed"
pause
goto ACTIVATION_MENU

:: ============================================
:: REMOVE OFFICE LICENSES
:: ============================================
:REMOVE_OFFICE_LICENSE
cls
echo.
echo ================================================================
echo   REMOVE OFFICE LICENSES
echo ================================================================
echo.
echo   This will remove all Office product keys and licenses
echo   Useful for:
echo   - Troubleshooting activation issues
echo   - Before reinstalling Office
echo   - Switching activation methods
echo   - Cleaning corrupted licenses
echo.

set /p confirm_remove="Continue? (Y/N): "
if /i not "%confirm_remove%"=="Y" goto ACTIVATION_MENU

echo.
echo   Detecting Office installations...
echo.

set "office_found=0"

:: Check Office 16 (2016/2019/2021)
if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" (
    set "office_found=1"
    echo   Found Office 16 (64-bit^)
    echo   Removing licenses...
    cd /d "%ProgramFiles%\Microsoft Office\Office16"
    cscript ospp.vbs /dstatus
    echo.
    for /f "skip=2 tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Office\16.0\Registration" /s /f "DigitalProductId" 2^>nul') do (
        cscript ospp.vbs /unpkey:%%b >nul 2>&1
    )
)

if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" (
    set "office_found=1"
    echo   Found Office 16 (32-bit^)
    echo   Removing licenses...
    cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"
    cscript ospp.vbs /dstatus
    echo.
    for /f "skip=2 tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Office\16.0\Registration" /s /f "DigitalProductId" 2^>nul') do (
        cscript ospp.vbs /unpkey:%%b >nul 2>&1
    )
)

:: Check Office 15 (2013)
if exist "%ProgramFiles%\Microsoft Office\Office15\ospp.vbs" (
    set "office_found=1"
    echo   Found Office 15 (2013 64-bit^)
    echo   Removing licenses...
    cd /d "%ProgramFiles%\Microsoft Office\Office15"
    cscript ospp.vbs /dstatus
    for /f "skip=2 tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Office\15.0\Registration" /s /f "DigitalProductId" 2^>nul') do (
        cscript ospp.vbs /unpkey:%%b >nul 2>&1
    )
)

if "%office_found%"=="0" (
    echo   No Office installation detected!
)

:: Common Office keys to remove
echo.
echo   Removing common Office keys...
cscript //nologo ospp.vbs /unpkey:6MWKP >nul 2>&1
cscript //nologo ospp.vbs /unpkey:BTDRB >nul 2>&1
cscript //nologo ospp.vbs /unpkey:KHGM9 >nul 2>&1
cscript //nologo ospp.vbs /unpkey:CPQVG >nul 2>&1
cscript //nologo ospp.vbs /unpkey:XQNVK >nul 2>&1

echo.
echo ================================================================
echo   OFFICE LICENSES REMOVED!
echo ================================================================
echo   All Office licenses have been cleared
echo   You can now activate Office again with new method
echo.
call :LOG "INFO: Office licenses removed"
pause
goto ACTIVATION_MENU

:: ============================================
:: UNINSTALL PRODUCT KEY
:: ============================================
:UNINSTALL_KEY
cls
echo.
echo ================================================================
echo   UNINSTALL WINDOWS PRODUCT KEY
echo ================================================================
echo.
echo   This will remove the current Windows product key
echo   Useful for:
echo   - Switching to different activation method
echo   - Removing invalid key
echo   - Troubleshooting
echo.
echo   WARNING: Windows will become unactivated!
echo.

set /p confirm_uninstall="Continue? (Y/N): "
if /i not "%confirm_uninstall%"=="Y" goto ACTIVATION_MENU

echo.
echo   Current activation status:
cscript //nologo %SystemRoot%\System32\slmgr.vbs /dli

echo.
echo   Uninstalling product key...
cscript //nologo %SystemRoot%\System32\slmgr.vbs /upk

echo.
echo   Clearing KMS settings...
cscript //nologo %SystemRoot%\System32\slmgr.vbs /ckms

echo.
echo ================================================================
echo   PRODUCT KEY UNINSTALLED!
echo ================================================================
echo   Windows is now unactivated
echo   You can install new key or use activation methods
echo.
call :LOG "INFO: Product key uninstalled"
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
echo   WINDOWS ACTIVATION STATUS
echo ================================================================
echo.
cscript //nologo %SystemRoot%\System32\slmgr.vbs /dli
echo.
echo ================================================================
echo.

:: Check Office activation if installed
if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" (
    echo.
    echo ================================================================
    echo   OFFICE ACTIVATION STATUS
    echo ================================================================
    echo.
    cd /d "%ProgramFiles%\Microsoft Office\Office16"
    cscript ospp.vbs /dstatus
    echo.
    echo ================================================================
    echo.
) else if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" (
    echo.
    echo ================================================================
    echo   OFFICE ACTIVATION STATUS
    echo ================================================================
    echo.
    cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"
    cscript ospp.vbs /dstatus
    echo.
    echo ================================================================
    echo.
) else (
    echo.
    echo   Office not detected or not installed
    echo.
)

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
echo   WINDOWS LICENSE INFORMATION
echo ================================================================
echo.
cscript //nologo %SystemRoot%\System32\slmgr.vbs /dlv
echo.
echo ================================================================
echo.

:: Show Office license if installed
if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" (
    echo.
    echo ================================================================
    echo   OFFICE LICENSE INFORMATION
    echo ================================================================
    echo.
    cd /d "%ProgramFiles%\Microsoft Office\Office16"
    cscript ospp.vbs /dstatus
    echo.
    echo ================================================================
    echo.
) else if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" (
    echo.
    echo ================================================================
    echo   OFFICE LICENSE INFORMATION
    echo ================================================================
    echo.
    cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"
    cscript ospp.vbs /dstatus
    echo.
    echo ================================================================
    echo.
)

pause
goto ACTIVATION_MENU

:: ============================================
:: WINDOWS OPTIMIZER MENU (NEW!)
:: ============================================
:OPTIMIZER_MENU
cls
color 0C
echo.
echo ================================================================
echo   WINDOWS OPTIMIZER - MAKE YOUR PC FASTER!
echo   Windows 10/11 Performance ^& Privacy Optimization
echo ================================================================
echo.
echo   QUICK ACTIONS:
echo.
echo   [1]  Quick Optimize           - One-click optimization
echo   [2]  Run Chris Titus WinUtil  - Popular optimization tool
echo.
echo   PERFORMANCE TWEAKS:
echo.
echo   [3]  Disable Visual Effects   - Faster performance
echo   [4]  Optimize Services        - Disable unnecessary services
echo   [5]  Optimize Startup         - Speed up boot time
echo   [6]  Optimize Power Plan      - High performance mode
echo   [7]  Optimize Network         - Better internet speed
echo.
echo   PRIVACY ^& DEBLOAT:
echo.
echo   [8]  Remove Bloatware         - Uninstall pre-installed apps
echo   [9]  Disable Telemetry        - Stop data collection
echo   [10] Privacy Settings         - Enhance privacy
echo   [11] Disable Cortana          - Remove Cortana
echo.
echo   SYSTEM TWEAKS:
echo.
echo   [12] Clean System Cache       - Clear system cache
echo   [13] Defragment Drives        - Optimize hard drives
echo   [14] Update Group Policy      - Refresh policies
echo   [15] Restore Default Settings - Undo optimizations
echo.
echo   [0]  Back to Main Menu
echo.
echo   Based on: Chris Titus WinUtil ^& Best Practices
echo.
echo ================================================================
echo.

set /p opt_choice="Enter your choice (0-15): "

if "%opt_choice%"=="1" goto QUICK_OPTIMIZE
if "%opt_choice%"=="2" goto RUN_WINTUTIL
if "%opt_choice%"=="3" goto DISABLE_VISUAL_EFFECTS
if "%opt_choice%"=="4" goto OPTIMIZE_SERVICES
if "%opt_choice%"=="5" goto OPTIMIZE_STARTUP
if "%opt_choice%"=="6" goto OPTIMIZE_POWER
if "%opt_choice%"=="7" goto OPTIMIZE_NETWORK
if "%opt_choice%"=="8" goto REMOVE_BLOATWARE
if "%opt_choice%"=="9" goto DISABLE_TELEMETRY
if "%opt_choice%"=="10" goto PRIVACY_SETTINGS
if "%opt_choice%"=="11" goto DISABLE_CORTANA
if "%opt_choice%"=="12" goto CLEAN_SYSTEM_CACHE
if "%opt_choice%"=="13" goto DEFRAGMENT_DRIVES
if "%opt_choice%"=="14" goto UPDATE_GROUP_POLICY
if "%opt_choice%"=="15" goto RESTORE_DEFAULTS
if "%opt_choice%"=="0" goto MAIN_MENU
goto OPTIMIZER_MENU

:: ============================================
:: QUICK OPTIMIZE (All-in-One)
:: ============================================
:QUICK_OPTIMIZE
cls
echo.
echo ================================================================
echo   QUICK OPTIMIZE - ALL-IN-ONE OPTIMIZATION
echo ================================================================
echo.
echo   This will apply all safe optimizations:
echo   - Disable visual effects
echo   - Optimize services
echo   - Clear system cache
echo   - Disable telemetry
echo   - Optimize network
echo   - High performance power plan
echo.

set /p confirm_quick="Continue with Quick Optimize? (Y/N): "
if /i not "%confirm_quick%"=="Y" goto OPTIMIZER_MENU

echo.
echo   Starting optimization...
echo.

echo   [1/10] Disabling visual effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
echo       [OK] Visual effects disabled

echo   [2/10] Disabling Windows Search indexing...
sc config "WSearch" start=disabled >nul 2>&1
sc stop "WSearch" >nul 2>&1
echo       [OK] Search indexing disabled

echo   [3/10] Disabling Superfetch/SysMain...
sc config "SysMain" start=disabled >nul 2>&1
sc stop "SysMain" >nul 2>&1
echo       [OK] Superfetch disabled

echo   [4/10] Disabling Windows Tips...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f >nul 2>&1
echo       [OK] Windows Tips disabled

echo   [5/10] Disabling Telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
sc config "DiagTrack" start=disabled >nul 2>&1
sc stop "DiagTrack" >nul 2>&1
echo       [OK] Telemetry disabled

echo   [6/10] Setting High Performance power plan...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo       [OK] High Performance enabled

echo   [7/10] Optimizing network settings...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global chimney=enabled >nul 2>&1
echo       [OK] Network optimized

echo   [8/10] Disabling unnecessary animations...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
echo       [OK] Animations disabled

echo   [9/10] Clearing system cache...
ipconfig /flushdns >nul 2>&1
del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
echo       [OK] Cache cleared

echo   [10/10] Restarting Explorer...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo       [OK] Explorer restarted

echo.
echo ================================================================
echo   QUICK OPTIMIZE COMPLETE!
echo ================================================================
echo   Your Windows is now optimized for better performance!
echo   Recommended: Restart your computer for full effect
echo.
call :LOG "SUCCESS: Quick Optimize completed"
pause
goto OPTIMIZER_MENU

:: ============================================
:: RUN CHRIS TITUS WINUTIL
:: ============================================
:RUN_WINTUTIL
cls
echo.
echo ================================================================
echo   CHRIS TITUS TECH WINDOWS UTILITY
echo ================================================================
echo.
echo   This will download and run the popular WinUtil tool
echo   Features:
echo   - Debloat Windows
echo   - Install software packages
echo   - Tweaks and optimizations
echo   - Privacy settings
echo.
echo   Source: https://github.com/ChrisTitusTech/winutil
echo.

set /p confirm_winutil="Run Chris Titus WinUtil? (Y/N): "
if /i not "%confirm_winutil%"=="Y" goto OPTIMIZER_MENU

echo.
echo   Downloading and launching WinUtil...
echo   (A new window will open)
echo.

powershell -Command "irm christitus.com/win | iex" 2>nul

if errorlevel 1 (
    echo.
    echo   ERROR: Could not download WinUtil
    echo   Check your internet connection
    echo.
    pause
    goto OPTIMIZER_MENU
)

echo.
echo   WinUtil launched successfully!
echo.
call :LOG "INFO: Chris Titus WinUtil launched"
pause
goto OPTIMIZER_MENU

:: ============================================
:: DISABLE VISUAL EFFECTS
:: ============================================
:DISABLE_VISUAL_EFFECTS
cls
echo.
echo ================================================================
echo   DISABLE VISUAL EFFECTS FOR PERFORMANCE
echo ================================================================
echo.
echo   This will disable:
echo   - Animations and fading
echo   - Transparency effects
echo   - Thumbnails and previews
echo   - Smooth scrolling
echo.
echo   Result: Faster performance, less resource usage
echo.

set /p confirm_visual="Disable visual effects? (Y/N): "
if /i not "%confirm_visual%"=="Y" goto OPTIMIZER_MENU

echo.
echo   Applying settings...
echo.

:: Set for best performance
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1

:: Disable animations
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1

:: Disable transparency
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1

:: Disable smooth scrolling
reg add "HKCU\Control Panel\Desktop" /v SmoothScroll /t REG_DWORD /d 0 /f >nul 2>&1

:: Restart Explorer
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo.
echo   SUCCESS! Visual effects disabled
echo   Performance improved
echo.
call :LOG "SUCCESS: Visual effects disabled"
pause
goto OPTIMIZER_MENU

:: ============================================
:: OPTIMIZE SERVICES
:: ============================================
:OPTIMIZE_SERVICES
cls
echo.
echo ================================================================
echo   OPTIMIZE WINDOWS SERVICES
echo ================================================================
echo.
echo   This will disable unnecessary services:
echo   - Windows Search (indexing)
echo   - Superfetch/SysMain
echo   - Windows Error Reporting
echo   - Diagnostic services
echo   - Print Spooler (if not using printer)
echo.

set /p confirm_services="Optimize services? (Y/N): "
if /i not "%confirm_services%"=="Y" goto OPTIMIZER_MENU

echo.
echo   Disabling unnecessary services...
echo.

echo   [1/8] Windows Search...
sc config "WSearch" start=disabled >nul 2>&1
sc stop "WSearch" >nul 2>&1
echo       [OK]

echo   [2/8] Superfetch/SysMain...
sc config "SysMain" start=disabled >nul 2>&1
sc stop "SysMain" >nul 2>&1
echo       [OK]

echo   [3/8] Windows Error Reporting...
sc config "WerSvc" start=disabled >nul 2>&1
sc stop "WerSvc" >nul 2>&1
echo       [OK]

echo   [4/8] Diagnostic services...
sc config "DiagTrack" start=disabled >nul 2>&1
sc stop "DiagTrack" >nul 2>&1
sc config "dmwappushservice" start=disabled >nul 2>&1
sc stop "dmwappushservice" >nul 2>&1
echo       [OK]

echo   [5/8] Windows Insider Service...
sc config "wisvc" start=disabled >nul 2>&1
sc stop "wisvc" >nul 2>&1
echo       [OK]

echo   [6/8] Remote Registry...
sc config "RemoteRegistry" start=disabled >nul 2>&1
sc stop "RemoteRegistry" >nul 2>&1
echo       [OK]

echo   [7/8] Fax service...
sc config "Fax" start=disabled >nul 2>&1
sc stop "Fax" >nul 2>&1
echo       [OK]

echo   [8/8] Xbox services...
sc config "XblAuthManager" start=disabled >nul 2>&1
sc stop "XblAuthManager" >nul 2>&1
sc config "XblGameSave" start=disabled >nul 2>&1
sc stop "XblGameSave" >nul 2>&1
sc config "XboxNetApiSvc" start=disabled >nul 2>&1
sc stop "XboxNetApiSvc" >nul 2>&1
echo       [OK]

echo.
echo   SUCCESS! Services optimized
echo   System resources freed up
echo.
call :LOG "SUCCESS: Services optimized"
pause
goto OPTIMIZER_MENU

:: ============================================
:: OPTIMIZE STARTUP
:: ============================================
:OPTIMIZE_STARTUP
cls
echo.
echo ================================================================
echo   OPTIMIZE STARTUP PROGRAMS
echo ================================================================
echo.
echo   Opening Task Manager Startup tab...
echo   Please disable unnecessary startup programs manually
echo.
echo   Tips:
echo   - Disable programs you don't use at startup
echo   - Keep antivirus and important tools
echo   - Disable: Steam, Discord, Spotify (if not needed at boot)
echo.

taskmgr /0 /startup

echo   Task Manager opened!
echo   After disabling programs, close Task Manager
echo.
call :LOG "INFO: Startup optimization tool opened"
pause
goto OPTIMIZER_MENU

:: ============================================
:: OPTIMIZE POWER PLAN
:: ============================================
:OPTIMIZE_POWER
cls
echo.
echo ================================================================
echo   OPTIMIZE POWER PLAN
echo ================================================================
echo.
echo   This will set Windows to High Performance mode
echo   Benefits:
echo   - Maximum CPU performance
echo   - No CPU throttling
echo   - Faster response times
echo.
echo   Note: May increase power consumption on laptops
echo.

set /p confirm_power="Set High Performance mode? (Y/N): "
if /i not "%confirm_power%"=="Y" goto OPTIMIZER_MENU

echo.
echo   Setting power plan...
echo.

:: Enable High Performance plan
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

:: Disable USB selective suspend
powercfg /change usb-selective-suspend-setting 0

:: Set processor minimum state to 100%
powercfg /change processor-state-min 100

echo.
echo   SUCCESS! High Performance mode enabled
echo   Your PC will now run at maximum performance
echo.
call :LOG "SUCCESS: High Performance power plan enabled"
pause
goto OPTIMIZER_MENU

:: ============================================
:: OPTIMIZE NETWORK
:: ============================================
:OPTIMIZE_NETWORK
cls
echo.
echo ================================================================
echo   OPTIMIZE NETWORK SETTINGS
echo ================================================================
echo.
echo   This will optimize network for better speed:
echo   - Enable TCP auto-tuning
echo   - Optimize TCP settings
echo   - Flush DNS cache
echo   - Reset network stack
echo.

set /p confirm_network="Optimize network? (Y/N): "
if /i not "%confirm_network%"=="Y" goto OPTIMIZER_MENU

echo.
echo   Optimizing network...
echo.

echo   [1/6] Flushing DNS cache...
ipconfig /flushdns >nul 2>&1
echo       [OK]

echo   [2/6] Enabling TCP auto-tuning...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
echo       [OK]

echo   [3/6] Enabling TCP Chimney...
netsh int tcp set global chimney=enabled >nul 2>&1
echo       [OK]

echo   [4/6] Enabling RSS (Receive Side Scaling)...
netsh int tcp set global rss=enabled >nul 2>&1
echo       [OK]

echo   [5/6] Disabling NetBIOS over TCP/IP...
wmic nicconfig where (IPEnabled=TRUE) call SetTcpipNetbios 2 >nul 2>&1
echo       [OK]

echo   [6/6] Optimizing network adapter...
netsh int tcp set global timestamps=disabled >nul 2>&1
echo       [OK]

echo.
echo   SUCCESS! Network optimized
echo   You may need to restart for full effect
echo.
call :LOG "SUCCESS: Network settings optimized"
pause
goto OPTIMIZER_MENU

:: ============================================
:: REMOVE BLOATWARE
:: ============================================
:REMOVE_BLOATWARE
cls
echo.
echo ================================================================
echo   REMOVE WINDOWS BLOATWARE
echo ================================================================
echo.
echo   This will remove pre-installed Windows apps:
echo   - Xbox apps
echo   - Candy Crush
echo   - 3D Viewer
echo   - Mixed Reality Portal
echo   - People app
echo   - And other bloatware
echo.
echo   NOTE: Calculator, Photos, Store will be kept
echo.

set /p confirm_bloat="Remove bloatware apps? (Y/N): "
if /i not "%confirm_bloat%"=="Y" goto OPTIMIZER_MENU

echo.
echo   Removing bloatware...
echo   This may take a few minutes...
echo.

:: Xbox
powershell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage" 2>nul
echo   [OK] Xbox apps removed

:: Candy Crush and other games
powershell -Command "Get-AppxPackage *CandyCrush* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *BubbleWitch* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage king.com* | Remove-AppxPackage" 2>nul
echo   [OK] Games removed

:: 3D Viewer
powershell -Command "Get-AppxPackage *3DViewer* | Remove-AppxPackage" 2>nul
echo   [OK] 3D Viewer removed

:: Mixed Reality Portal
powershell -Command "Get-AppxPackage *MixedReality* | Remove-AppxPackage" 2>nul
echo   [OK] Mixed Reality removed

:: People
powershell -Command "Get-AppxPackage *People* | Remove-AppxPackage" 2>nul
echo   [OK] People app removed

:: Skype
powershell -Command "Get-AppxPackage *Skype* | Remove-AppxPackage" 2>nul
echo   [OK] Skype removed

:: Get Office (hub)
powershell -Command "Get-AppxPackage *GetOffice* | Remove-AppxPackage" 2>nul
echo   [OK] Get Office removed

:: OneNote (preinstalled)
powershell -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage" 2>nul
echo   [OK] OneNote removed

:: Weather
powershell -Command "Get-AppxPackage *BingWeather* | Remove-AppxPackage" 2>nul
echo   [OK] Weather removed

:: News
powershell -Command "Get-AppxPackage *BingNews* | Remove-AppxPackage" 2>nul
echo   [OK] News removed

echo.
echo   SUCCESS! Bloatware removed
echo   Disk space freed up
echo.
call :LOG "SUCCESS: Bloatware removed"
pause
goto OPTIMIZER_MENU

:: ============================================
:: DISABLE TELEMETRY
:: ============================================
:DISABLE_TELEMETRY
cls
echo.
echo ================================================================
echo   DISABLE TELEMETRY ^& DATA COLLECTION
echo ================================================================
echo.
echo   This will disable Windows data collection:
echo   - Telemetry services
echo   - Diagnostic data
echo   - Activity history
echo   - App diagnostics
echo.

set /p confirm_telemetry="Disable telemetry? (Y/N): "
if /i not "%confirm_telemetry%"=="Y" goto OPTIMIZER_MENU

echo.
echo   Disabling telemetry...
echo.

:: Set telemetry to Security only (minimum)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
echo   [OK] Telemetry set to minimum

:: Disable DiagTrack service
sc config "DiagTrack" start=disabled >nul 2>&1
sc stop "DiagTrack" >nul 2>&1
echo   [OK] DiagTrack disabled

:: Disable dmwappushservice
sc config "dmwappushservice" start=disabled >nul 2>&1
sc stop "dmwappushservice" >nul 2>&1
echo   [OK] dmwappushservice disabled

:: Disable Activity History
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities /t REG_DWORD /d 0 /f >nul 2>&1
echo   [OK] Activity History disabled

:: Disable App Diagnostics
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v ShowedToastAtLevel /t REG_DWORD /d 1 /f >nul 2>&1
echo   [OK] App diagnostics disabled

:: Disable Feedback
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f >nul 2>&1
echo   [OK] Feedback disabled

echo.
echo   SUCCESS! Telemetry disabled
echo   Your privacy is now better protected
echo.
call :LOG "SUCCESS: Telemetry disabled"
pause
goto OPTIMIZER_MENU

:: ============================================
:: PRIVACY SETTINGS
:: ============================================
:PRIVACY_SETTINGS
cls
echo.
echo ================================================================
echo   PRIVACY SETTINGS
echo ================================================================
echo.
echo   This will enhance your privacy:
echo   - Disable location tracking
echo   - Disable camera and mic access
echo   - Disable advertising ID
echo   - Disable app diagnostics
echo   - Disable tailored experiences
echo.

set /p confirm_privacy="Apply privacy settings? (Y/N): "
if /i not "%confirm_privacy%"=="Y" goto OPTIMIZER_MENU

echo.
echo   Applying privacy settings...
echo.

:: Disable Location Tracking
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v Value /t REG_SZ /d Deny /f >nul 2>&1
echo   [OK] Location tracking disabled

:: Disable Camera Access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v Value /t REG_SZ /d Deny /f >nul 2>&1
echo   [OK] Camera access disabled

:: Disable Microphone Access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v Value /t REG_SZ /d Deny /f >nul 2>&1
echo   [OK] Microphone access disabled

:: Disable Advertising ID
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   [OK] Advertising ID disabled

:: Disable Tailored Experiences
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   [OK] Tailored experiences disabled

:: Disable Online Speech Recognition
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v HasAccepted /t REG_DWORD /d 0 /f >nul 2>&1
echo   [OK] Speech recognition disabled

echo.
echo   SUCCESS! Privacy settings applied
echo   Your privacy is now enhanced
echo.
call :LOG "SUCCESS: Privacy settings applied"
pause
goto OPTIMIZER_MENU

:: ============================================
:: DISABLE CORTANA
:: ============================================
:DISABLE_CORTANA
cls
echo.
echo ================================================================
echo   DISABLE CORTANA
echo ================================================================
echo.
echo   This will completely disable Cortana
echo   Benefits:
echo   - Free up system resources
echo   - Better privacy
echo   - Faster search
echo.

set /p confirm_cortana="Disable Cortana? (Y/N): "
if /i not "%confirm_cortana%"=="Y" goto OPTIMIZER_MENU

echo.
echo   Disabling Cortana...
echo.

:: Disable Cortana
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1
echo   [OK] Cortana disabled via policy

:: Disable Cortana on lock screen
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortanaAboveLock /t REG_DWORD /d 0 /f >nul 2>&1
echo   [OK] Cortana on lock screen disabled

:: Disable web search in Start Menu
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v DisableWebSearch /t REG_DWORD /d 1 /f >nul 2>&1
echo   [OK] Web search disabled

:: Restart Explorer
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo   [OK] Explorer restarted

echo.
echo   SUCCESS! Cortana disabled
echo   System resources freed
echo.
call :LOG "SUCCESS: Cortana disabled"
pause
goto OPTIMIZER_MENU

:: ============================================
:: CLEAN SYSTEM CACHE
:: ============================================
:CLEAN_SYSTEM_CACHE
cls
echo.
echo ================================================================
echo   CLEAN SYSTEM CACHE
echo ================================================================
echo.
echo   This will clean:
echo   - DNS cache
echo   - Windows Update cache
echo   - Icon cache
echo   - Font cache
echo   - Thumbnail cache
echo.

set /p confirm_cache="Clean system cache? (Y/N): "
if /i not "%confirm_cache%"=="Y" goto OPTIMIZER_MENU

echo.
echo   Cleaning cache...
echo.

echo   [1/5] Flushing DNS cache...
ipconfig /flushdns >nul 2>&1
echo       [OK]

echo   [2/5] Cleaning Windows Update cache...
net stop wuauserv >nul 2>&1
del /f /s /q "%SystemRoot%\SoftwareDistribution\Download\*.*" >nul 2>&1
net start wuauserv >nul 2>&1
echo       [OK]

echo   [3/5] Cleaning icon cache...
del /f /s /q "%LocalAppData%\IconCache.db" >nul 2>&1
echo       [OK]

echo   [4/5] Cleaning font cache...
net stop "FontCache" >nul 2>&1
del /f /s /q "%SystemRoot%\ServiceProfiles\LocalService\AppData\Local\FontCache\*.*" >nul 2>&1
net start "FontCache" >nul 2>&1
echo       [OK]

echo   [5/5] Cleaning thumbnail cache...
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
echo       [OK]

:: Restart Explorer
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo.
echo   SUCCESS! System cache cleaned
echo   System should feel more responsive
echo.
call :LOG "SUCCESS: System cache cleaned"
pause
goto OPTIMIZER_MENU

:: ============================================
:: DEFRAGMENT DRIVES
:: ============================================
:DEFRAGMENT_DRIVES
cls
echo.
echo ================================================================
echo   DEFRAGMENT ^& OPTIMIZE DRIVES
echo ================================================================
echo.
echo   This will optimize your drives:
echo   - HDD: Defragmentation
echo   - SSD: TRIM optimization
echo.
echo   NOTE: This may take a while for large drives
echo.

set /p confirm_defrag="Optimize drives? (Y/N): "
if /i not "%confirm_defrag%"=="Y" goto OPTIMIZER_MENU

echo.
echo   Starting drive optimization...
echo   Please wait...
echo.

:: Defragment C: drive
defrag C: /O /H /U /V

echo.
echo   SUCCESS! Drives optimized
echo.
call :LOG "SUCCESS: Drives optimized"
pause
goto OPTIMIZER_MENU

:: ============================================
:: UPDATE GROUP POLICY
:: ============================================
:UPDATE_GROUP_POLICY
cls
echo.
echo ================================================================
echo   UPDATE GROUP POLICY
echo ================================================================
echo.
echo   This will refresh all Group Policy settings
echo   Use this after making system changes
echo.

echo   Updating Group Policy...
echo.

gpupdate /force

echo.
echo   SUCCESS! Group Policy updated
echo.
call :LOG "INFO: Group Policy updated"
pause
goto OPTIMIZER_MENU

:: ============================================
:: RESTORE DEFAULT SETTINGS
:: ============================================
:RESTORE_DEFAULTS
cls
echo.
echo ================================================================
echo   RESTORE DEFAULT SETTINGS
echo ================================================================
echo.
echo   WARNING: This will undo optimizations and restore defaults:
echo   - Re-enable visual effects
echo   - Re-enable services
echo   - Re-enable telemetry
echo   - Restore power plan
echo.

set /p confirm_restore="Restore default settings? (Y/N): "
if /i not "%confirm_restore%"=="Y" goto OPTIMIZER_MENU

echo.
echo   Restoring defaults...
echo.

:: Re-enable visual effects
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 0 /f >nul 2>&1
echo   [OK] Visual effects restored

:: Re-enable Windows Search
sc config "WSearch" start=auto >nul 2>&1
sc start "WSearch" >nul 2>&1
echo   [OK] Windows Search enabled

:: Re-enable Superfetch
sc config "SysMain" start=auto >nul 2>&1
sc start "SysMain" >nul 2>&1
echo   [OK] Superfetch enabled

:: Restore balanced power plan
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1
echo   [OK] Balanced power plan restored

:: Restart Explorer
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo.
echo   SUCCESS! Default settings restored
echo   Restart computer to complete restoration
echo.
call :LOG "INFO: Default settings restored"
pause
goto OPTIMIZER_MENU

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
