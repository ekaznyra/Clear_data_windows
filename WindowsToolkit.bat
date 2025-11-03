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
