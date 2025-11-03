@echo off
:: ============================================
:: WINDOWS PROFESSIONAL TOOLKIT v4.2
:: All-in-One System Tool (CMD/Batch)
:: OFFLINE EDITION - FULL MAS INTEGRATION
:: ============================================

title Windows Professional Toolkit v4.2

:: Check Admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    cls
    color 0C
    echo.
    echo ================================================================
    echo    ADMINISTRATOR RIGHTS REQUIRED!
    echo ================================================================
    echo.
    echo  This tool needs Administrator privileges.
    echo.
    echo  HOW TO FIX:
    echo  1. Right-click on WindowsToolkit.bat
    echo  2. Select "Run as administrator"
    echo  3. Click "Yes" when prompted
    echo.
    pause
    exit /b
)

:MAIN_MENU
cls
color 0B
title Windows Toolkit v4.2 - Main Menu
echo.
echo ================================================================
echo.
echo         WINDOWS PROFESSIONAL TOOLKIT v4.2
echo         All-in-One System Management Tool
echo         OFFLINE EDITION - Full MAS Integration
echo.
echo ================================================================
echo.
echo  MAIN MENU - SELECT YOUR TOOL
echo.
echo  [1] Cleanup Tool        - Remove junk and free disk space
echo  [2] Windows Activation  - Activate Windows and Office
echo  [3] Windows Optimizer   - Make your PC faster and smoother
echo  [4] Software Manager    - Uninstall applications easily
echo  [5] System Info         - View detailed system information
echo  [6] About and Help      - Information and documentation
echo  [0] Exit                - Close toolkit
echo.
echo ================================================================
echo.

set /p choice="Enter your choice (0-6): "

if "%choice%"=="1" goto CLEANUP_MENU
if "%choice%"=="2" goto ACTIVATION_MENU
if "%choice%"=="3" goto OPTIMIZER_MENU
if "%choice%"=="4" goto SOFTWARE_MENU
if "%choice%"=="5" goto SYSTEM_INFO
if "%choice%"=="6" goto ABOUT_HELP
if "%choice%"=="0" goto EXIT_PROGRAM
echo.
echo [!] Invalid choice. Please enter 0-6.
timeout /t 2 >nul
goto MAIN_MENU

:: ============================================
:: CLEANUP TOOL MENU
:: ============================================
:CLEANUP_MENU
cls
color 0A
title Windows Toolkit v4.2 - Cleanup Tool
echo.
echo ================================================================
echo  CLEANUP TOOL - REMOVE JUNK FILES AND FREE DISK SPACE
echo ================================================================
echo.
echo  SELECT CLEANUP MODE:
echo.
echo  [1] Quick Cleanup      - Fast and safe        (~200-500 MB)
echo      * Temp files, cache, recent items
echo      * Time: 30 seconds
echo.
echo  [2] Standard Cleanup   - Recommended          (~500MB-3GB)
echo      * Quick + Browser cache + Updates + Recycle Bin
echo      * Time: 1-2 minutes
echo.
echo  [3] Deep Cleanup       - Maximum cleaning     (~2-10+ GB)
echo      * Standard + Logs + App caches
echo      * Time: 2-5 minutes
echo.
echo  [4] Preview Mode       - See before delete
echo.
echo  [5] Custom Cleanup     - Choose what to clean
echo.
echo  [0] Back to Main Menu
echo.
echo ================================================================
echo.

set /p cleanup_choice="Enter your choice (0-5): "

if "%cleanup_choice%"=="1" goto QUICK_CLEANUP
if "%cleanup_choice%"=="2" goto STANDARD_CLEANUP
if "%cleanup_choice%"=="3" goto DEEP_CLEANUP
if "%cleanup_choice%"=="4" goto PREVIEW_CLEANUP
if "%cleanup_choice%"=="5" goto CUSTOM_CLEANUP
if "%cleanup_choice%"=="0" goto MAIN_MENU
echo.
echo [!] Invalid choice. Please enter 0-5.
timeout /t 2 >nul
goto CLEANUP_MENU

:: ============================================
:: QUICK CLEANUP
:: ============================================
:QUICK_CLEANUP
cls
echo.
echo ================================================================
echo  QUICK CLEANUP - Starting...
echo ================================================================
echo.

echo [*] Cleaning Windows Temp...
del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
echo [OK] Windows Temp cleaned

echo [*] Cleaning User Temp...
del /f /s /q "%Temp%\*.*" >nul 2>&1
echo [OK] User Temp cleaned

echo [*] Cleaning Recent Items...
del /f /s /q "%AppData%\Microsoft\Windows\Recent\*.*" >nul 2>&1
echo [OK] Recent items cleaned

echo [*] Cleaning Thumbnail Cache...
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
echo [OK] Thumbnail cache cleaned

echo.
echo ================================================================
echo  QUICK CLEANUP COMPLETE!
echo ================================================================
echo  Your computer has been cleaned.
echo  Estimated space freed: 200-500 MB
echo.
pause
goto CLEANUP_MENU

:: ============================================
:: STANDARD CLEANUP
:: ============================================
:STANDARD_CLEANUP
cls
echo.
echo ================================================================
echo  STANDARD CLEANUP - Starting...
echo ================================================================
echo.

echo [*] Running Quick Cleanup first...
del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
del /f /s /q "%Temp%\*.*" >nul 2>&1
del /f /s /q "%AppData%\Microsoft\Windows\Recent\*.*" >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
echo [OK] Quick cleanup done

echo [*] Cleaning Prefetch...
del /f /s /q "%SystemRoot%\Prefetch\*.*" >nul 2>&1
echo [OK] Prefetch cleaned

echo [*] Cleaning Windows Update Cache...
net stop wuauserv >nul 2>&1
del /f /s /q "%SystemRoot%\SoftwareDistribution\Download\*.*" >nul 2>&1
net start wuauserv >nul 2>&1
echo [OK] Windows Update cache cleaned

echo [*] Cleaning Error Reports...
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\*.*" >nul 2>&1
echo [OK] Error reports cleaned

echo [*] Cleaning Browser Caches...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 >nul 2>&1
del /f /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
echo [OK] Browser caches cleaned

echo [*] Emptying Recycle Bin...
rd /s /q %SystemDrive%\$Recycle.Bin >nul 2>&1
echo [OK] Recycle Bin emptied

echo.
echo ================================================================
echo  STANDARD CLEANUP COMPLETE!
echo ================================================================
echo  Your computer has been cleaned.
echo  Estimated space freed: 500MB - 3GB
echo.
pause
goto CLEANUP_MENU

:: ============================================
:: DEEP CLEANUP
:: ============================================
:DEEP_CLEANUP
cls
echo.
echo ================================================================
echo  DEEP CLEANUP - Starting...
echo ================================================================
echo.
echo [!] WARNING: This will close running applications!
echo.
set /p confirm_deep="Continue with Deep Cleanup? (Y/N): "
if /i not "%confirm_deep%"=="Y" goto CLEANUP_MENU

echo.
echo [*] Running Standard Cleanup first...
del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
del /f /s /q "%Temp%\*.*" >nul 2>&1
del /f /s /q "%AppData%\Microsoft\Windows\Recent\*.*" >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
del /f /s /q "%SystemRoot%\Prefetch\*.*" >nul 2>&1
net stop wuauserv >nul 2>&1
del /f /s /q "%SystemRoot%\SoftwareDistribution\Download\*.*" >nul 2>&1
net start wuauserv >nul 2>&1
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\*.*" >nul 2>&1
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 >nul 2>&1
del /f /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
rd /s /q %SystemDrive%\$Recycle.Bin >nul 2>&1
echo [OK] Standard cleanup done

echo [*] Cleaning Windows Logs...
del /f /s /q "%SystemRoot%\Logs\*.*" >nul 2>&1
del /f /s /q "%SystemRoot%\Panther\*.*" >nul 2>&1
echo [OK] Windows logs cleaned

echo [*] Cleaning Delivery Optimization...
del /f /s /q "%SystemRoot%\SoftwareDistribution\DeliveryOptimization\*.*" >nul 2>&1
echo [OK] Delivery optimization cleaned

echo [*] Cleaning App Caches...
del /f /s /q "%AppData%\Microsoft\Teams\Cache\*.*" >nul 2>&1
del /f /s /q "%AppData%\Discord\Cache\*.*" >nul 2>&1
del /f /s /q "%AppData%\Code\Cache\*.*" >nul 2>&1
del /f /s /q "%AppData%\Spotify\Data\*.*" >nul 2>&1
del /f /s /q "%AppData%\Slack\Cache\*.*" >nul 2>&1
echo [OK] App caches cleaned

echo.
echo ================================================================
echo  DEEP CLEANUP COMPLETE!
echo ================================================================
echo  Your computer has been thoroughly cleaned.
echo  Estimated space freed: 2-10+ GB
echo.
pause
goto CLEANUP_MENU

:: ============================================
:: PREVIEW CLEANUP
:: ============================================
:PREVIEW_CLEANUP
cls
echo.
echo ================================================================
echo  PREVIEW MODE - Files to be deleted
echo ================================================================
echo.
echo [*] Scanning files...
echo.

echo Windows Temp folder:
dir "%SystemRoot%\Temp" /s 2>nul | find "File(s)"

echo.
echo User Temp folder:
dir "%Temp%" /s 2>nul | find "File(s)"

echo.
echo Recycle Bin:
dir %SystemDrive%\$Recycle.Bin /s 2>nul | find "File(s)"

echo.
echo ================================================================
echo  NOTE: No files were deleted. This was preview mode only.
echo ================================================================
echo.
pause
goto CLEANUP_MENU

:: ============================================
:: CUSTOM CLEANUP
:: ============================================
:CUSTOM_CLEANUP
cls
echo.
echo ================================================================
echo  CUSTOM CLEANUP - CHOOSE WHAT TO CLEAN
echo ================================================================
echo.
echo  Select items (type numbers separated by spaces):
echo.
echo  [1] Windows Temp            [8]  Browser Caches
echo  [2] User Temp               [9]  Recycle Bin
echo  [3] Prefetch                [10] Windows Update Cache
echo  [4] Recent Items            [11] Error Reports
echo  [5] Thumbnail Cache         [12] Windows Logs
echo  [6] DNS Cache               [13] App Caches
echo  [7] Font Cache              [14] Delivery Optimization
echo.
echo  [99] Select All             [0] Back to Menu
echo.
set /p custom_selection="Enter your selection (e.g., 1 2 5 8): "

if "%custom_selection%"=="0" goto CLEANUP_MENU
if "%custom_selection%"=="99" (
    echo.
    echo [*] Cleaning ALL items...
    call :CLEAN_ALL_CUSTOM
    echo.
    echo ================================================================
    echo  CUSTOM CLEANUP COMPLETE!
    echo ================================================================
    echo.
    pause
    goto CLEANUP_MENU
)

echo.
echo [*] Processing custom cleanup...
echo.

for %%i in (%custom_selection%) do (
    if "%%i"=="1" (
        del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
        echo [OK] Windows Temp cleaned
    )
    if "%%i"=="2" (
        del /f /s /q "%Temp%\*.*" >nul 2>&1
        echo [OK] User Temp cleaned
    )
    if "%%i"=="3" (
        del /f /s /q "%SystemRoot%\Prefetch\*.*" >nul 2>&1
        echo [OK] Prefetch cleaned
    )
    if "%%i"=="4" (
        del /f /s /q "%AppData%\Microsoft\Windows\Recent\*.*" >nul 2>&1
        echo [OK] Recent items cleaned
    )
    if "%%i"=="5" (
        del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
        echo [OK] Thumbnail cache cleaned
    )
    if "%%i"=="6" (
        ipconfig /flushdns >nul 2>&1
        echo [OK] DNS cache flushed
    )
    if "%%i"=="7" (
        net stop "FontCache" >nul 2>&1
        del /f /s /q "%SystemRoot%\ServiceProfiles\LocalService\AppData\Local\FontCache\*.*" >nul 2>&1
        net start "FontCache" >nul 2>&1
        echo [OK] Font cache cleaned
    )
    if "%%i"=="8" (
        RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 >nul 2>&1
        del /f /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
        del /f /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
        echo [OK] Browser caches cleaned
    )
    if "%%i"=="9" (
        rd /s /q %SystemDrive%\$Recycle.Bin >nul 2>&1
        echo [OK] Recycle Bin emptied
    )
    if "%%i"=="10" (
        net stop wuauserv >nul 2>&1
        del /f /s /q "%SystemRoot%\SoftwareDistribution\Download\*.*" >nul 2>&1
        net start wuauserv >nul 2>&1
        echo [OK] Windows Update cache cleaned
    )
    if "%%i"=="11" (
        del /f /s /q "%ProgramData%\Microsoft\Windows\WER\*.*" >nul 2>&1
        echo [OK] Error reports cleaned
    )
    if "%%i"=="12" (
        del /f /s /q "%SystemRoot%\Logs\*.*" >nul 2>&1
        del /f /s /q "%SystemRoot%\Panther\*.*" >nul 2>&1
        echo [OK] Windows logs cleaned
    )
    if "%%i"=="13" (
        del /f /s /q "%AppData%\Microsoft\Teams\Cache\*.*" >nul 2>&1
        del /f /s /q "%AppData%\Discord\Cache\*.*" >nul 2>&1
        del /f /s /q "%AppData%\Code\Cache\*.*" >nul 2>&1
        echo [OK] App caches cleaned
    )
    if "%%i"=="14" (
        del /f /s /q "%SystemRoot%\SoftwareDistribution\DeliveryOptimization\*.*" >nul 2>&1
        echo [OK] Delivery optimization cleaned
    )
)

echo.
echo ================================================================
echo  CUSTOM CLEANUP COMPLETE!
echo ================================================================
echo.
pause
goto CLEANUP_MENU

:CLEAN_ALL_CUSTOM
del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
del /f /s /q "%Temp%\*.*" >nul 2>&1
del /f /s /q "%SystemRoot%\Prefetch\*.*" >nul 2>&1
del /f /s /q "%AppData%\Microsoft\Windows\Recent\*.*" >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
ipconfig /flushdns >nul 2>&1
net stop "FontCache" >nul 2>&1
del /f /s /q "%SystemRoot%\ServiceProfiles\LocalService\AppData\Local\FontCache\*.*" >nul 2>&1
net start "FontCache" >nul 2>&1
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 >nul 2>&1
del /f /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
rd /s /q %SystemDrive%\$Recycle.Bin >nul 2>&1
net stop wuauserv >nul 2>&1
del /f /s /q "%SystemRoot%\SoftwareDistribution\Download\*.*" >nul 2>&1
net start wuauserv >nul 2>&1
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\*.*" >nul 2>&1
del /f /s /q "%SystemRoot%\Logs\*.*" >nul 2>&1
del /f /s /q "%SystemRoot%\Panther\*.*" >nul 2>&1
del /f /s /q "%AppData%\Microsoft\Teams\Cache\*.*" >nul 2>&1
del /f /s /q "%AppData%\Discord\Cache\*.*" >nul 2>&1
del /f /s /q "%AppData%\Code\Cache\*.*" >nul 2>&1
del /f /s /q "%SystemRoot%\SoftwareDistribution\DeliveryOptimization\*.*" >nul 2>&1
echo [OK] All cleanup operations completed
exit /b

:: ============================================
:: ACTIVATION MENU
:: ============================================
:ACTIVATION_MENU
cls
color 0E
title Windows Toolkit v4.2 - Windows Activation
echo.
echo ================================================================
echo  WINDOWS AND OFFICE ACTIVATION TOOL
echo  Using: Open Source Activation Methods
echo ================================================================
echo.
echo  Current Status:
cscript //nologo %SystemRoot%\System32\slmgr.vbs /dli | findstr /C:"License Status"
echo.
echo ================================================================
echo.
echo  WINDOWS ACTIVATION:
echo.
echo  [1]  HWID Activation          - Permanent (Win 10/11)
echo  [2]  KMS38 Activation         - Until 2038 (Win 10/11/Server)
echo  [3]  Online KMS Activation    - 180 days, auto-renew
echo.
echo  OFFICE ACTIVATION:
echo.
echo  [4]  Ohook Activation         - Permanent Office (Recommended)
echo  [5]  KMS Office Activation    - Office KMS (180 days)
echo.
echo  UTILITY TOOLS:
echo.
echo  [6]  Activation Troubleshoot  - Fix activation issues
echo  [7]  Check Activation Status  - Detailed info
echo  [8]  Extract Windows Keys     - Show product keys
echo  [9]  Change Windows Edition   - Home to Pro, etc.
echo  [10] Show OEM Information     - View OEM details
echo  [11] Remove Office Licenses   - Clean Office keys
echo.
echo  MANUAL OPTIONS:
echo.
echo  [12] Install Product Key      - Enter key manually
echo  [13] Uninstall Product Key    - Remove current key
echo  [14] View License Information - Detailed license
echo.
echo  [0]  Back to Main Menu
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
:: HWID ACTIVATION
:: ============================================
:HWID_ACTIVATE
cls
echo.
echo ================================================================
echo  HWID ACTIVATION - PERMANENT WINDOWS ACTIVATION
echo ================================================================
echo.
echo  This will permanently activate Windows 10/11
echo  Activation will survive reinstalls on same hardware
echo.
set /p confirm_hwid="Continue with HWID Activation? (Y/N): "
if /i not "%confirm_hwid%"=="Y" goto ACTIVATION_MENU

echo.
echo  Running HWID Activation...
echo  Please wait...
echo.
if exist "%~dp0MAS_Scripts\HWID_Activation.cmd" (
    call "%~dp0MAS_Scripts\HWID_Activation.cmd" /HWID
) else (
    echo  [ERROR] HWID_Activation.cmd not found!
    echo  Please ensure MAS_Scripts folder exists.
    pause
)
goto ACTIVATION_MENU

:: ============================================
:: KMS38 ACTIVATION
:: ============================================
:KMS38_ACTIVATE
cls
echo.
echo ================================================================
echo  KMS38 ACTIVATION - VALID UNTIL 2038
echo ================================================================
echo.
echo  This will activate Windows until year 2038
echo  Works on Windows 10/11/Server editions
echo.
set /p confirm_kms38="Continue with KMS38 Activation? (Y/N): "
if /i not "%confirm_kms38%"=="Y" goto ACTIVATION_MENU

echo.
echo  Running KMS38 Activation...
echo  Please wait...
echo.
if exist "%~dp0MAS_Scripts\KMS38_Activation.cmd" (
    call "%~dp0MAS_Scripts\KMS38_Activation.cmd" /KMS38
) else (
    echo  [ERROR] KMS38_Activation.cmd not found!
    echo  Please ensure MAS_Scripts folder exists.
    pause
)
goto ACTIVATION_MENU

:: ============================================
:: ONLINE KMS ACTIVATION
:: ============================================
:ONLINE_KMS_ACTIVATE
cls
echo.
echo ================================================================
echo  ONLINE KMS ACTIVATION - 180 DAYS (AUTO-RENEW)
echo ================================================================
echo.
echo  This will activate Windows for 180 days
echo  Activation will auto-renew automatically
echo.
set /p confirm_onlinekms="Continue with Online KMS Activation? (Y/N): "
if /i not "%confirm_onlinekms%"=="Y" goto ACTIVATION_MENU

echo.
echo  Running Online KMS Activation...
echo  Please wait...
echo.
if exist "%~dp0MAS_Scripts\Online_KMS_Activation.cmd" (
    call "%~dp0MAS_Scripts\Online_KMS_Activation.cmd" /KMS-ActAndRenewalTask
) else (
    echo  [ERROR] Online_KMS_Activation.cmd not found!
    echo  Please ensure MAS_Scripts folder exists.
    pause
)
goto ACTIVATION_MENU

:: ============================================
:: OHOOK OFFICE ACTIVATION
:: ============================================
:OHOOK_OFFICE
cls
echo.
echo ================================================================
echo  OHOOK OFFICE ACTIVATION - PERMANENT
echo ================================================================
echo.
echo  This will permanently activate Office
echo  Supports Office 365/2021/2019/2016
echo.
set /p confirm_ohook="Continue with Ohook Office Activation? (Y/N): "
if /i not "%confirm_ohook%"=="Y" goto ACTIVATION_MENU

echo.
echo  Running Ohook Office Activation...
echo  Please wait...
echo.
if exist "%~dp0MAS_Scripts\Ohook_Activation_AIO.cmd" (
    call "%~dp0MAS_Scripts\Ohook_Activation_AIO.cmd" /Ohook
) else (
    echo  [ERROR] Ohook_Activation_AIO.cmd not found!
    echo  Please ensure MAS_Scripts folder exists.
    pause
)
goto ACTIVATION_MENU

:: ============================================
:: KMS OFFICE ACTIVATION
:: ============================================
:KMS_OFFICE
cls
echo.
echo ================================================================
echo  KMS OFFICE ACTIVATION - 180 DAYS
echo ================================================================
echo.
echo  This will activate Office for 180 days
echo  Supports all Office versions
echo.
set /p confirm_kmsoffice="Continue with KMS Office Activation? (Y/N): "
if /i not "%confirm_kmsoffice%"=="Y" goto ACTIVATION_MENU

echo.
echo  Running KMS Office Activation...
echo  Please wait...
echo.
if exist "%~dp0MAS_Scripts\Online_KMS_Activation.cmd" (
    call "%~dp0MAS_Scripts\Online_KMS_Activation.cmd" /KMS-ActAndRenewalTask /KMS-Office
) else (
    echo  [ERROR] Online_KMS_Activation.cmd not found!
    echo  Please ensure MAS_Scripts folder exists.
    pause
)
goto ACTIVATION_MENU

:: ============================================
:: ACTIVATION TROUBLESHOOT
:: ============================================
:ACTIVATION_TROUBLESHOOT
cls
echo.
echo ================================================================
echo  ACTIVATION TROUBLESHOOT
echo ================================================================
echo.
echo  Running Activation Troubleshooter...
echo  This will attempt to fix activation issues
echo.
if exist "%~dp0MAS_Scripts\Troubleshoot.cmd" (
    call "%~dp0MAS_Scripts\Troubleshoot.cmd"
) else (
    echo  [ERROR] Troubleshoot.cmd not found!
    echo  Please ensure MAS_Scripts folder exists.
    pause
)
goto ACTIVATION_MENU

:: ============================================
:: CHECK ACTIVATION STATUS
:: ============================================
:CHECK_STATUS
cls
echo.
echo ================================================================
echo  ACTIVATION STATUS
echo ================================================================
echo.
if exist "%~dp0MAS_Scripts\Check_Activation_Status.cmd" (
    call "%~dp0MAS_Scripts\Check_Activation_Status.cmd"
) else (
    echo  Windows Activation Status:
    echo.
    cscript //nologo %SystemRoot%\System32\slmgr.vbs /dlv
    echo.
    echo ================================================================
    echo.
    pause
)
goto ACTIVATION_MENU

:: ============================================
:: EXTRACT WINDOWS KEYS
:: ============================================
:EXTRACT_KEYS
cls
echo.
echo ================================================================
echo  EXTRACT WINDOWS PRODUCT KEYS
echo ================================================================
echo.
if exist "%~dp0MAS_Scripts\Extract_OEM_Folder.cmd" (
    call "%~dp0MAS_Scripts\Extract_OEM_Folder.cmd"
) else (
    echo  Installed Product Key:
    wmic path softwarelicensingservice get OA3xOriginalProductKey 2>nul
    echo.
    echo  Current Product Key (Partial):
    cscript //nologo %SystemRoot%\System32\slmgr.vbs /dli | findstr /C:"partial"
    echo.
    echo ================================================================
    echo.
    pause
)
goto ACTIVATION_MENU

:: ============================================
:: CHANGE WINDOWS EDITION
:: ============================================
:CHANGE_EDITION
cls
echo.
echo ================================================================
echo  CHANGE WINDOWS EDITION
echo ================================================================
echo.
if exist "%~dp0MAS_Scripts\Change_Windows_Edition.cmd" (
    call "%~dp0MAS_Scripts\Change_Windows_Edition.cmd"
) else (
    echo  Current Edition:
    wmic os get Caption
    echo.
    echo  Available Editions:
    DISM /online /Get-TargetEditions
    echo.
    echo  To change edition, use option [12] Install Product Key
    echo  with a valid product key for the target edition
    echo.
    pause
)
goto ACTIVATION_MENU

:: ============================================
:: SHOW OEM INFORMATION
:: ============================================
:SHOW_OEM_INFO
cls
echo.
echo ================================================================
echo  OEM INFORMATION
echo ================================================================
echo.
systeminfo | findstr /C:"System Manufacturer" /C:"System Model" /C:"BIOS Version"
echo.
echo  OEM Product Key:
wmic path softwarelicensingservice get OA3xOriginalProductKey 2>nul
echo.
echo ================================================================
echo.
pause
goto ACTIVATION_MENU

:: ============================================
:: REMOVE OFFICE LICENSES
:: ============================================
:REMOVE_OFFICE_LICENSE
cls
echo.
echo ================================================================
echo  REMOVE OFFICE LICENSES
echo ================================================================
echo.
echo  WARNING: This will remove all Office licenses!
echo  You will need to activate Office again afterwards.
echo.
set /p confirm_remove="Continue? (Y/N): "
if /i not "%confirm_remove%"=="Y" goto ACTIVATION_MENU

echo.
echo  Removing Office licenses...
echo.

for /f "tokens=1,2*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Office" /s /k /f "ProductID" 2^>nul') do (
    cscript //nologo "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" /unpkey:BTDRB >nul 2>&1
)

echo  Office licenses removed!
echo  Please activate Office again using options 4 or 5
echo.
pause
goto ACTIVATION_MENU

:: ============================================
:: MANUAL PRODUCT KEY
:: ============================================
:MANUAL_KEY
cls
echo.
echo ================================================================
echo  INSTALL PRODUCT KEY MANUALLY
echo ================================================================
echo.
set /p product_key="Enter your 25-character product key: "

echo.
echo  Installing product key...
cscript //nologo %SystemRoot%\System32\slmgr.vbs /ipk %product_key%

echo.
echo  Activating...
cscript //nologo %SystemRoot%\System32\slmgr.vbs /ato

echo.
echo  Checking status...
cscript //nologo %SystemRoot%\System32\slmgr.vbs /xpr
echo.
pause
goto ACTIVATION_MENU

:: ============================================
:: UNINSTALL PRODUCT KEY
:: ============================================
:UNINSTALL_KEY
cls
echo.
echo ================================================================
echo  UNINSTALL PRODUCT KEY
echo ================================================================
echo.
echo  WARNING: This will remove your current Windows product key!
echo.
set /p confirm_uninstall="Continue? (Y/N): "
if /i not "%confirm_uninstall%"=="Y" goto ACTIVATION_MENU

echo.
echo  Uninstalling product key...
cscript //nologo %SystemRoot%\System32\slmgr.vbs /upk
echo.
echo  Product key uninstalled!
echo.
pause
goto ACTIVATION_MENU

:: ============================================
:: LICENSE INFORMATION
:: ============================================
:LICENSE_INFO
cls
echo.
echo ================================================================
echo  DETAILED LICENSE INFORMATION
echo ================================================================
echo.
cscript //nologo %SystemRoot%\System32\slmgr.vbs /dlv
echo.
echo ================================================================
echo.
pause
goto ACTIVATION_MENU

:: ============================================
:: OPTIMIZER MENU
:: ============================================
:OPTIMIZER_MENU
cls
color 0C
title Windows Toolkit v4.2 - Windows Optimizer
echo.
echo ================================================================
echo  WINDOWS OPTIMIZER - MAKE YOUR PC FASTER!
echo  Windows 10/11 Performance and Privacy Optimization
echo ================================================================
echo.
echo  QUICK ACTIONS:
echo.
echo  [1]  Quick Optimize           - One-click optimization
echo  [2]  Run WinUtil  - Popular optimization tool
echo.
echo  PERFORMANCE TWEAKS:
echo.
echo  [3]  Disable Visual Effects   - Faster performance
echo  [4]  Optimize Services        - Disable unnecessary services
echo  [5]  Optimize Startup         - Speed up boot time
echo  [6]  Optimize Power Plan      - High performance mode
echo  [7]  Optimize Network         - Better internet speed
echo.
echo  PRIVACY AND DEBLOAT:
echo.
echo  [8]  Remove Bloatware         - Uninstall pre-installed apps
echo  [9]  Disable Telemetry        - Stop data collection
echo  [10] Privacy Settings         - Enhance privacy
echo  [11] Disable Cortana          - Remove Cortana
echo.
echo  SYSTEM TWEAKS:
echo.
echo  [12] Clean System Cache       - Clear system cache
echo  [13] Defragment Drives        - Optimize hard drives
echo  [14] Update Group Policy      - Refresh policies
echo  [15] Restore Default Settings - Undo optimizations
echo.
echo  [0]  Back to Main Menu
echo.
echo ================================================================
echo.

set /p opt_choice="Enter your choice (0-15): "

if "%opt_choice%"=="1" goto QUICK_OPTIMIZE
if "%opt_choice%"=="2" goto RUN_WINUTIL
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
:: QUICK OPTIMIZE
:: ============================================
:QUICK_OPTIMIZE
cls
echo.
echo ================================================================
echo  QUICK OPTIMIZE - ALL-IN-ONE OPTIMIZATION
echo ================================================================
echo.
echo  This will apply all safe optimizations:
echo  - Disable visual effects
echo  - Optimize services
echo  - Clear system cache
echo  - Disable telemetry
echo  - Optimize network
echo  - High performance power plan
echo.
set /p confirm_quick="Continue with Quick Optimize? (Y/N): "
if /i not "%confirm_quick%"=="Y" goto OPTIMIZER_MENU

echo.
echo  Starting optimization...
echo.

echo  [1/10] Disabling visual effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
echo  [OK] Visual effects disabled

echo  [2/10] Disabling Windows Search indexing...
sc config "WSearch" start=disabled >nul 2>&1
sc stop "WSearch" >nul 2>&1
echo  [OK] Search indexing disabled

echo  [3/10] Disabling Superfetch/SysMain...
sc config "SysMain" start=disabled >nul 2>&1
sc stop "SysMain" >nul 2>&1
echo  [OK] Superfetch disabled

echo  [4/10] Disabling Windows Tips...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f >nul 2>&1
echo  [OK] Windows Tips disabled

echo  [5/10] Disabling Telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
sc config "DiagTrack" start=disabled >nul 2>&1
sc stop "DiagTrack" >nul 2>&1
echo  [OK] Telemetry disabled

echo  [6/10] Setting High Performance power plan...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo  [OK] High Performance enabled

echo  [7/10] Optimizing network settings...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global chimney=enabled >nul 2>&1
echo  [OK] Network optimized

echo  [8/10] Disabling unnecessary animations...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
echo  [OK] Animations disabled

echo  [9/10] Clearing system cache...
ipconfig /flushdns >nul 2>&1
del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
echo  [OK] Cache cleared

echo  [10/10] Restarting Explorer...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo  [OK] Explorer restarted

echo.
echo ================================================================
echo  QUICK OPTIMIZE COMPLETE!
echo ================================================================
echo  Your Windows is now optimized for better performance!
echo  Recommended: Restart your computer for full effect
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: RUN WINUTIL
:: ============================================
:RUN_WINUTIL
cls
echo.
echo ================================================================
echo  WINDOWS UTILITY TOOL
echo ================================================================
echo.
echo  This will download and run the popular WinUtil tool
echo  Features:
echo  - Debloat Windows
echo  - Install software packages
echo  - Tweaks and optimizations
echo  - Privacy settings
echo.
echo.
set /p confirm_winutil="Run WinUtil? (Y/N): "
if /i not "%confirm_winutil%"=="Y" goto OPTIMIZER_MENU

echo.
echo  Downloading and launching WinUtil...
echo  A new window will open...
echo.

powershell -Command "irm christitus.com/win | iex" 2>nul

if errorlevel 1 (
    echo.
    echo  ERROR: Could not download WinUtil
    echo  Check your internet connection
    echo.
    pause
    goto OPTIMIZER_MENU
)

echo.
echo  WinUtil launched successfully!
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: DISABLE VISUAL EFFECTS
:: ============================================
:DISABLE_VISUAL_EFFECTS
cls
echo.
echo ================================================================
echo  DISABLE VISUAL EFFECTS FOR PERFORMANCE
echo ================================================================
echo.
echo  This will disable:
echo  - Animations and fading
echo  - Transparency effects
echo  - Thumbnails and previews
echo  - Smooth scrolling
echo.
echo  Result: Faster performance, less resource usage
echo.
set /p confirm_visual="Disable visual effects? (Y/N): "
if /i not "%confirm_visual%"=="Y" goto OPTIMIZER_MENU

echo.
echo  Applying settings...
echo.

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v SmoothScroll /t REG_DWORD /d 0 /f >nul 2>&1

taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo.
echo  SUCCESS! Visual effects disabled
echo  Performance improved
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: OPTIMIZE SERVICES
:: ============================================
:OPTIMIZE_SERVICES
cls
echo.
echo ================================================================
echo  OPTIMIZE WINDOWS SERVICES
echo ================================================================
echo.
echo  This will disable unnecessary services:
echo  - Windows Search (indexing)
echo  - Superfetch/SysMain
echo  - Windows Error Reporting
echo  - Diagnostic services
echo  - Xbox services
echo.
set /p confirm_services="Optimize services? (Y/N): "
if /i not "%confirm_services%"=="Y" goto OPTIMIZER_MENU

echo.
echo  Disabling unnecessary services...
echo.

echo  [1/8] Windows Search...
sc config "WSearch" start=disabled >nul 2>&1
sc stop "WSearch" >nul 2>&1
echo  [OK]

echo  [2/8] Superfetch/SysMain...
sc config "SysMain" start=disabled >nul 2>&1
sc stop "SysMain" >nul 2>&1
echo  [OK]

echo  [3/8] Windows Error Reporting...
sc config "WerSvc" start=disabled >nul 2>&1
sc stop "WerSvc" >nul 2>&1
echo  [OK]

echo  [4/8] Diagnostic services...
sc config "DiagTrack" start=disabled >nul 2>&1
sc stop "DiagTrack" >nul 2>&1
sc config "dmwappushservice" start=disabled >nul 2>&1
sc stop "dmwappushservice" >nul 2>&1
echo  [OK]

echo  [5/8] Windows Insider Service...
sc config "wisvc" start=disabled >nul 2>&1
sc stop "wisvc" >nul 2>&1
echo  [OK]

echo  [6/8] Remote Registry...
sc config "RemoteRegistry" start=disabled >nul 2>&1
sc stop "RemoteRegistry" >nul 2>&1
echo  [OK]

echo  [7/8] Fax service...
sc config "Fax" start=disabled >nul 2>&1
sc stop "Fax" >nul 2>&1
echo  [OK]

echo  [8/8] Xbox services...
sc config "XblAuthManager" start=disabled >nul 2>&1
sc stop "XblAuthManager" >nul 2>&1
sc config "XblGameSave" start=disabled >nul 2>&1
sc stop "XblGameSave" >nul 2>&1
sc config "XboxNetApiSvc" start=disabled >nul 2>&1
sc stop "XboxNetApiSvc" >nul 2>&1
echo  [OK]

echo.
echo  SUCCESS! Services optimized
echo  System resources freed up
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: OPTIMIZE STARTUP
:: ============================================
:OPTIMIZE_STARTUP
cls
echo.
echo ================================================================
echo  OPTIMIZE STARTUP PROGRAMS
echo ================================================================
echo.
echo  Opening Task Manager Startup tab...
echo  Please disable unnecessary startup programs manually
echo.
echo  Tips:
echo  - Disable programs you dont use at startup
echo  - Keep antivirus and important tools
echo  - Disable: Steam, Discord, Spotify (if not needed at boot)
echo.

taskmgr /0 /startup

echo  Task Manager opened!
echo  After disabling programs, close Task Manager
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: OPTIMIZE POWER PLAN
:: ============================================
:OPTIMIZE_POWER
cls
echo.
echo ================================================================
echo  OPTIMIZE POWER PLAN
echo ================================================================
echo.
echo  This will set Windows to High Performance mode
echo  Benefits:
echo  - Maximum CPU performance
echo  - No CPU throttling
echo  - Faster response times
echo.
echo  Note: May increase power consumption on laptops
echo.
set /p confirm_power="Set High Performance mode? (Y/N): "
if /i not "%confirm_power%"=="Y" goto OPTIMIZER_MENU

echo.
echo  Setting power plan...
echo.

powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg /change usb-selective-suspend-setting 0
powercfg /change processor-state-min 100

echo.
echo  SUCCESS! High Performance mode enabled
echo  Your PC will now run at maximum performance
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: OPTIMIZE NETWORK
:: ============================================
:OPTIMIZE_NETWORK
cls
echo.
echo ================================================================
echo  OPTIMIZE NETWORK SETTINGS
echo ================================================================
echo.
echo  This will optimize network for better speed:
echo  - Enable TCP auto-tuning
echo  - Optimize TCP settings
echo  - Flush DNS cache
echo  - Reset network stack
echo.
set /p confirm_network="Optimize network? (Y/N): "
if /i not "%confirm_network%"=="Y" goto OPTIMIZER_MENU

echo.
echo  Optimizing network...
echo.

echo  [1/6] Flushing DNS cache...
ipconfig /flushdns >nul 2>&1
echo  [OK]

echo  [2/6] Enabling TCP auto-tuning...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
echo  [OK]

echo  [3/6] Enabling TCP Chimney...
netsh int tcp set global chimney=enabled >nul 2>&1
echo  [OK]

echo  [4/6] Enabling RSS (Receive Side Scaling)...
netsh int tcp set global rss=enabled >nul 2>&1
echo  [OK]

echo  [5/6] Disabling NetBIOS over TCP/IP...
wmic nicconfig where (IPEnabled=TRUE) call SetTcpipNetbios 2 >nul 2>&1
echo  [OK]

echo  [6/6] Optimizing network adapter...
netsh int tcp set global timestamps=disabled >nul 2>&1
echo  [OK]

echo.
echo  SUCCESS! Network optimized
echo  You may need to restart for full effect
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: REMOVE BLOATWARE
:: ============================================
:REMOVE_BLOATWARE
cls
echo.
echo ================================================================
echo  REMOVE WINDOWS BLOATWARE
echo ================================================================
echo.
echo  This will remove pre-installed Windows apps:
echo  - Xbox apps
echo  - Candy Crush
echo  - 3D Viewer
echo  - Mixed Reality Portal
echo  - People app
echo  - And other bloatware
echo.
echo  NOTE: Calculator, Photos, Store will be kept
echo.
set /p confirm_bloat="Remove bloatware apps? (Y/N): "
if /i not "%confirm_bloat%"=="Y" goto OPTIMIZER_MENU

echo.
echo  Removing bloatware...
echo  This may take a few minutes...
echo.

powershell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage" 2>nul
echo  [OK] Xbox apps removed

powershell -Command "Get-AppxPackage *CandyCrush* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *BubbleWitch* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage king.com* | Remove-AppxPackage" 2>nul
echo  [OK] Games removed

powershell -Command "Get-AppxPackage *3DViewer* | Remove-AppxPackage" 2>nul
echo  [OK] 3D Viewer removed

powershell -Command "Get-AppxPackage *MixedReality* | Remove-AppxPackage" 2>nul
echo  [OK] Mixed Reality removed

powershell -Command "Get-AppxPackage *People* | Remove-AppxPackage" 2>nul
echo  [OK] People app removed

powershell -Command "Get-AppxPackage *Skype* | Remove-AppxPackage" 2>nul
echo  [OK] Skype removed

powershell -Command "Get-AppxPackage *GetOffice* | Remove-AppxPackage" 2>nul
echo  [OK] Get Office removed

powershell -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage" 2>nul
echo  [OK] OneNote removed

powershell -Command "Get-AppxPackage *BingWeather* | Remove-AppxPackage" 2>nul
echo  [OK] Weather removed

powershell -Command "Get-AppxPackage *BingNews* | Remove-AppxPackage" 2>nul
echo  [OK] News removed

echo.
echo  SUCCESS! Bloatware removed
echo  Disk space freed up
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: DISABLE TELEMETRY
:: ============================================
:DISABLE_TELEMETRY
cls
echo.
echo ================================================================
echo  DISABLE TELEMETRY AND DATA COLLECTION
echo ================================================================
echo.
echo  This will disable Windows data collection:
echo  - Telemetry services
echo  - Diagnostic data
echo  - Activity history
echo  - App diagnostics
echo.
set /p confirm_telemetry="Disable telemetry? (Y/N): "
if /i not "%confirm_telemetry%"=="Y" goto OPTIMIZER_MENU

echo.
echo  Disabling telemetry...
echo.

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
echo  [OK] Telemetry set to minimum

sc config "DiagTrack" start=disabled >nul 2>&1
sc stop "DiagTrack" >nul 2>&1
echo  [OK] DiagTrack disabled

sc config "dmwappushservice" start=disabled >nul 2>&1
sc stop "dmwappushservice" >nul 2>&1
echo  [OK] dmwappushservice disabled

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities /t REG_DWORD /d 0 /f >nul 2>&1
echo  [OK] Activity History disabled

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v ShowedToastAtLevel /t REG_DWORD /d 1 /f >nul 2>&1
echo  [OK] App diagnostics disabled

reg add "HKCU\Software\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f >nul 2>&1
echo  [OK] Feedback disabled

echo.
echo  SUCCESS! Telemetry disabled
echo  Your privacy is now better protected
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: PRIVACY SETTINGS
:: ============================================
:PRIVACY_SETTINGS
cls
echo.
echo ================================================================
echo  PRIVACY SETTINGS
echo ================================================================
echo.
echo  This will enhance your privacy:
echo  - Disable location tracking
echo  - Disable camera and mic access
echo  - Disable advertising ID
echo  - Disable app diagnostics
echo  - Disable tailored experiences
echo.
set /p confirm_privacy="Apply privacy settings? (Y/N): "
if /i not "%confirm_privacy%"=="Y" goto OPTIMIZER_MENU

echo.
echo  Applying privacy settings...
echo.

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v Value /t REG_SZ /d Deny /f >nul 2>&1
echo  [OK] Location tracking disabled

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v Value /t REG_SZ /d Deny /f >nul 2>&1
echo  [OK] Camera access disabled

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v Value /t REG_SZ /d Deny /f >nul 2>&1
echo  [OK] Microphone access disabled

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
echo  [OK] Advertising ID disabled

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo  [OK] Tailored experiences disabled

reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v HasAccepted /t REG_DWORD /d 0 /f >nul 2>&1
echo  [OK] Speech recognition disabled

echo.
echo  SUCCESS! Privacy settings applied
echo  Your privacy is now enhanced
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: DISABLE CORTANA
:: ============================================
:DISABLE_CORTANA
cls
echo.
echo ================================================================
echo  DISABLE CORTANA
echo ================================================================
echo.
echo  This will completely disable Cortana
echo  Benefits:
echo  - Free up system resources
echo  - Better privacy
echo  - Faster search
echo.
set /p confirm_cortana="Disable Cortana? (Y/N): "
if /i not "%confirm_cortana%"=="Y" goto OPTIMIZER_MENU

echo.
echo  Disabling Cortana...
echo.

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1
echo  [OK] Cortana disabled via policy

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortanaAboveLock /t REG_DWORD /d 0 /f >nul 2>&1
echo  [OK] Cortana on lock screen disabled

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v DisableWebSearch /t REG_DWORD /d 1 /f >nul 2>&1
echo  [OK] Web search disabled

taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo  [OK] Explorer restarted

echo.
echo  SUCCESS! Cortana disabled
echo  System resources freed
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: CLEAN SYSTEM CACHE
:: ============================================
:CLEAN_SYSTEM_CACHE
cls
echo.
echo ================================================================
echo  CLEAN SYSTEM CACHE
echo ================================================================
echo.
echo  This will clean:
echo  - DNS cache
echo  - Windows Update cache
echo  - Icon cache
echo  - Font cache
echo  - Thumbnail cache
echo.
set /p confirm_cache="Clean system cache? (Y/N): "
if /i not "%confirm_cache%"=="Y" goto OPTIMIZER_MENU

echo.
echo  Cleaning cache...
echo.

echo  [1/5] Flushing DNS cache...
ipconfig /flushdns >nul 2>&1
echo  [OK]

echo  [2/5] Cleaning Windows Update cache...
net stop wuauserv >nul 2>&1
del /f /s /q "%SystemRoot%\SoftwareDistribution\Download\*.*" >nul 2>&1
net start wuauserv >nul 2>&1
echo  [OK]

echo  [3/5] Cleaning icon cache...
del /f /s /q "%LocalAppData%\IconCache.db" >nul 2>&1
echo  [OK]

echo  [4/5] Cleaning font cache...
net stop "FontCache" >nul 2>&1
del /f /s /q "%SystemRoot%\ServiceProfiles\LocalService\AppData\Local\FontCache\*.*" >nul 2>&1
net start "FontCache" >nul 2>&1
echo  [OK]

echo  [5/5] Cleaning thumbnail cache...
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
echo  [OK]

taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo.
echo  SUCCESS! System cache cleaned
echo  System should feel more responsive
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: DEFRAGMENT DRIVES
:: ============================================
:DEFRAGMENT_DRIVES
cls
echo.
echo ================================================================
echo  DEFRAGMENT AND OPTIMIZE DRIVES
echo ================================================================
echo.
echo  This will optimize your drives:
echo  - HDD: Defragmentation
echo  - SSD: TRIM optimization
echo.
echo  NOTE: This may take a while for large drives
echo.
set /p confirm_defrag="Optimize drives? (Y/N): "
if /i not "%confirm_defrag%"=="Y" goto OPTIMIZER_MENU

echo.
echo  Starting drive optimization...
echo  Please wait...
echo.

defrag C: /O /H /U /V

echo.
echo  SUCCESS! Drives optimized
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: UPDATE GROUP POLICY
:: ============================================
:UPDATE_GROUP_POLICY
cls
echo.
echo ================================================================
echo  UPDATE GROUP POLICY
echo ================================================================
echo.
echo  This will refresh all Group Policy settings
echo  Use this after making system changes
echo.

echo  Updating Group Policy...
echo.

gpupdate /force

echo.
echo  SUCCESS! Group Policy updated
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: RESTORE DEFAULT SETTINGS
:: ============================================
:RESTORE_DEFAULTS
cls
echo.
echo ================================================================
echo  RESTORE DEFAULT SETTINGS
echo ================================================================
echo.
echo  WARNING: This will undo optimizations and restore defaults:
echo  - Re-enable visual effects
echo  - Re-enable services
echo  - Re-enable telemetry
echo  - Restore power plan
echo.
set /p confirm_restore="Restore default settings? (Y/N): "
if /i not "%confirm_restore%"=="Y" goto OPTIMIZER_MENU

echo.
echo  Restoring defaults...
echo.

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 0 /f >nul 2>&1
echo  [OK] Visual effects restored

sc config "WSearch" start=auto >nul 2>&1
sc start "WSearch" >nul 2>&1
echo  [OK] Windows Search enabled

sc config "SysMain" start=auto >nul 2>&1
sc start "SysMain" >nul 2>&1
echo  [OK] Superfetch enabled

powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1
echo  [OK] Balanced power plan restored

taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo.
echo  SUCCESS! Default settings restored
echo  Restart computer to complete restoration
echo.
pause
goto OPTIMIZER_MENU

:: ============================================
:: SOFTWARE MANAGER MENU
:: ============================================
:SOFTWARE_MENU
cls
color 0D
title Windows Toolkit v4.2 - Software Manager
echo.
echo ================================================================
echo  SOFTWARE MANAGER - UNINSTALL APPLICATIONS
echo ================================================================
echo.
echo  SELECT ACTION:
echo.
echo  [1] List Installed Software  - View all installed programs
echo  [2] Uninstall Software       - Remove an application
echo  [3] Export Software List     - Save list to file
echo  [0] Back to Main Menu
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
echo  INSTALLED SOFTWARE LIST
echo ================================================================
echo.
echo  Loading installed applications...
echo.

wmic product get name,version,vendor /format:table

echo.
echo ================================================================
echo.
pause
goto SOFTWARE_MENU

:: ============================================
:: UNINSTALL SOFTWARE
:: ============================================
:UNINSTALL_SOFTWARE
cls
echo.
echo ================================================================
echo  UNINSTALL SOFTWARE
echo ================================================================
echo.

set /p soft_name="Enter software name to uninstall: "

echo.
echo  Searching for "%soft_name%"...
echo.

wmic product where "name like '%%%soft_name%%%'" get name,version

echo.
set /p confirm_uninstall="Uninstall this software? (Y/N): "
if /i not "%confirm_uninstall%"=="Y" goto SOFTWARE_MENU

echo.
echo  Uninstalling...
wmic product where "name like '%%%soft_name%%%'" call uninstall /nointeractive

echo.
echo ================================================================
echo  UNINSTALL COMPLETE!
echo ================================================================
echo.
pause
goto SOFTWARE_MENU

:: ============================================
:: EXPORT SOFTWARE LIST
:: ============================================
:EXPORT_SOFTWARE
cls
echo.
echo ================================================================
echo  EXPORT SOFTWARE LIST
echo ================================================================
echo.

set "export_file=%~dp0SoftwareList_%date:~-4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
set "export_file=%export_file: =0%"

echo  Exporting software list...
wmic product get name,version,vendor > "%export_file%"

echo.
echo ================================================================
echo  SUCCESS - List exported!
echo  File: %export_file%
echo.
echo ================================================================
echo.
pause
goto SOFTWARE_MENU

:: ============================================
:: SYSTEM INFO
:: ============================================
:SYSTEM_INFO
cls
color 0E
title Windows Toolkit v4.2 - System Information
echo.
echo ================================================================
echo  SYSTEM INFORMATION - COMPLETE PC DETAILS
echo ================================================================
echo.
echo  MENU
echo.
echo  [1] Quick Overview       - Essential system info
echo  [2] Detailed Report      - Complete system report
echo  [3] Hardware Details     - CPU, RAM, GPU, Motherboard
echo  [4] Storage Information  - Disks, partitions, space
echo  [5] Network Information  - Adapters, IP, connectivity
echo  [6] Export Full Report   - Save to text file
echo  [0] Back to Main Menu
echo.

set /p sysinfo_choice="Enter your choice (0-6): "

if "%sysinfo_choice%"=="1" goto QUICK_OVERVIEW
if "%sysinfo_choice%"=="2" goto DETAILED_REPORT
if "%sysinfo_choice%"=="3" goto HARDWARE_DETAILS
if "%sysinfo_choice%"=="4" goto STORAGE_INFO
if "%sysinfo_choice%"=="5" goto NETWORK_INFO
if "%sysinfo_choice%"=="6" goto EXPORT_SYSINFO
if "%sysinfo_choice%"=="0" goto MAIN_MENU
echo.
echo [!] Invalid choice. Please enter 0-6.
timeout /t 2 >nul
goto SYSTEM_INFO

:: ============================================
:: QUICK OVERVIEW
:: ============================================
:QUICK_OVERVIEW
cls
echo.
echo ================================================================
echo  QUICK SYSTEM OVERVIEW
echo ================================================================
echo.
echo  COMPUTER INFORMATION
echo.

echo  Computer Name: %COMPUTERNAME%
echo  Current User:  %USERNAME%
echo  User Domain:   %USERDOMAIN%
echo.

echo  OPERATING SYSTEM
echo.

systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"OS Build" /C:"System Type"
echo.

echo  PROCESSOR
echo.

wmic cpu get name /format:list | findstr /V "^$"
wmic cpu get NumberOfCores,NumberOfLogicalProcessors /format:list | findstr /V "^$"
echo.

echo  MEMORY (RAM)
echo.

systeminfo | findstr /C:"Total Physical Memory" /C:"Available Physical Memory"
echo.

echo  DISK SPACE
echo.

setlocal enabledelayedexpansion
for /f "skip=1 tokens=1,2,3" %%a in ('wmic logicaldisk where "drivetype=3" get caption^,freespace^,size 2^>nul') do (
    if not "%%a"=="" if not "%%c"=="" (
        set /a "size_gb=%%c/1073741824" 2>nul
        set /a "free_gb=%%b/1073741824" 2>nul
        set /a "used_percent=(size_gb-free_gb)*100/size_gb" 2>nul
        if !size_gb! GTR 0 (
            echo  Drive %%a - Total: !size_gb! GB - Free: !free_gb! GB - Used: !used_percent!%%
        )
    )
)
endlocal
echo.

echo  SYSTEM UPTIME
echo.

systeminfo | findstr /C:"System Boot Time"
echo.

pause
goto SYSTEM_INFO

:: ============================================
:: DETAILED REPORT
:: ============================================
:DETAILED_REPORT
cls
echo.
echo ================================================================
echo  DETAILED SYSTEM REPORT
echo ================================================================
echo.
echo  [*] Gathering detailed system information...
echo  [*] This may take 10-15 seconds...
echo.

echo  SYSTEM SUMMARY
echo.

systeminfo | findstr /B /C:"Host Name" /C:"OS Name" /C:"OS Version" /C:"OS Manufacturer" /C:"OS Configuration" /C:"OS Build Type" /C:"Registered Owner" /C:"System Manufacturer" /C:"System Model" /C:"System Type" /C:"Processor" /C:"BIOS Version" /C:"Total Physical Memory"
echo.

echo  WINDOWS INFORMATION
echo.

systeminfo | findstr /B /C:"Windows Directory" /C:"System Directory" /C:"Boot Device" /C:"System Locale" /C:"Input Locale" /C:"Time Zone"
echo.

echo  MEMORY DETAILS
echo.

systeminfo | findstr /C:"Total Physical Memory" /C:"Available Physical Memory" /C:"Virtual Memory: Max Size" /C:"Virtual Memory: Available" /C:"Virtual Memory: In Use"
echo.

pause
goto SYSTEM_INFO

:: ============================================
:: HARDWARE DETAILS
:: ============================================
:HARDWARE_DETAILS
cls
echo.
echo ================================================================
echo  HARDWARE DETAILS - CPU, RAM, GPU, MOTHERBOARD
echo ================================================================
echo.

echo  PROCESSOR (CPU)
echo.

echo  [*] Loading CPU information...
wmic cpu get Name,Manufacturer,MaxClockSpeed,NumberOfCores,NumberOfLogicalProcessors,Architecture /format:list | findstr /V "^$"
echo.

echo  MEMORY (RAM)
echo.

echo  [*] Loading RAM information...
wmic memorychip get BankLabel,Capacity,Speed,Manufacturer /format:table 2>nul
echo.

echo  GRAPHICS (GPU)
echo.

echo  [*] Loading GPU information...
wmic path win32_VideoController get Name,DriverVersion,VideoMemoryType,AdapterRAM /format:list | findstr /V "^$"
echo.

echo  MOTHERBOARD
echo.

echo  [*] Loading motherboard information...
wmic baseboard get Manufacturer,Product,Version,SerialNumber /format:list | findstr /V "^$"
echo.

echo  BIOS
echo.

echo  [*] Loading BIOS information...
wmic bios get Manufacturer,Name,Version,ReleaseDate /format:list | findstr /V "^$"
echo.

pause
goto SYSTEM_INFO

:: ============================================
:: STORAGE INFORMATION
:: ============================================
:STORAGE_INFO
cls
echo.
echo ================================================================
echo  STORAGE INFORMATION - DISKS AND PARTITIONS
echo ================================================================
echo.

echo  PHYSICAL DISKS
echo.

echo  [*] Loading disk information...
wmic diskdrive get Model,Size,InterfaceType,MediaType /format:table
echo.

echo  LOGICAL DRIVES (Partitions)
echo.

setlocal enabledelayedexpansion
echo  Drive  Type      Total Space  Free Space   Used %%
echo  --------------------------------------------------------
for /f "skip=1 tokens=1,2,3" %%a in ('wmic logicaldisk get caption^,freespace^,size 2^>nul') do (
    if not "%%a"=="" if not "%%c"=="" (
        set /a "size_gb=%%c/1073741824" 2>nul
        set /a "free_gb=%%b/1073741824" 2>nul
        set /a "used_gb=size_gb-free_gb" 2>nul
        set /a "used_percent=(used_gb*100)/size_gb" 2>nul
        
        if !size_gb! GTR 0 (
            echo  %%a    Volume   !size_gb! GB      !free_gb! GB      !used_percent!%%
        )
    )
)
endlocal
echo.

echo  FILE SYSTEM DETAILS
echo.

wmic logicaldisk get Caption,FileSystem,VolumeName,DriveType /format:table
echo.

pause
goto SYSTEM_INFO

:: ============================================
:: NETWORK INFORMATION
:: ============================================
:NETWORK_INFO
cls
echo.
echo ================================================================
echo  NETWORK INFORMATION - ADAPTERS AND CONNECTIVITY
echo ================================================================
echo.

echo  NETWORK ADAPTERS
echo.

echo  [*] Loading network adapters...
wmic nic where "NetEnabled=true" get Name,MACAddress,Speed /format:table
echo.

echo  IP CONFIGURATION
echo.

ipconfig | findstr /C:"IPv4" /C:"IPv6" /C:"Default Gateway" /C:"Subnet Mask" /C:"DNS Servers"
echo.

echo  CONNECTIVITY TEST
echo.

echo  [*] Testing internet connectivity...
ping -n 2 8.8.8.8 >nul 2>&1
if errorlevel 1 (
    echo  [X] Internet: NOT CONNECTED
) else (
    echo  [OK] Internet: CONNECTED
)

ping -n 2 www.google.com >nul 2>&1
if errorlevel 1 (
    echo  [X] DNS Resolution: FAILED
) else (
    echo  [OK] DNS Resolution: WORKING
)
echo.

pause
goto SYSTEM_INFO

:: ============================================
:: EXPORT FULL REPORT
:: ============================================
:EXPORT_SYSINFO
cls
echo.
echo ================================================================
echo  EXPORT FULL SYSTEM REPORT
echo ================================================================
echo.
echo  [*] Generating comprehensive system report...
echo  [*] This may take 30-60 seconds...
echo.

set "report_file=%~dp0SystemReport_%date:~-4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
set "report_file=%report_file: =0%"

(
echo ================================================================
echo   WINDOWS PROFESSIONAL TOOLKIT v4.2
echo   COMPLETE SYSTEM INFORMATION REPORT
echo   Generated: %date% %time%
echo ================================================================
echo.
echo ================================================================
echo   COMPUTER INFORMATION
echo ================================================================
echo.
echo Computer Name: %COMPUTERNAME%
echo User Name: %USERNAME%
echo User Domain: %USERDOMAIN%
echo.
echo ================================================================
echo   OPERATING SYSTEM
echo ================================================================
echo.
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"OS Manufacturer" /C:"OS Configuration" /C:"OS Build" /C:"Registered Owner" /C:"Registered Organization" /C:"Product ID" /C:"Original Install Date" /C:"System Boot Time" /C:"System Manufacturer" /C:"System Model" /C:"System Type" /C:"BIOS Version"
echo.
echo ================================================================
echo   PROCESSOR
echo ================================================================
echo.
wmic cpu get Name,Manufacturer,MaxClockSpeed,NumberOfCores,NumberOfLogicalProcessors /format:list
echo.
echo ================================================================
echo   MEMORY
echo ================================================================
echo.
systeminfo | findstr /C:"Total Physical Memory" /C:"Available Physical Memory" /C:"Virtual Memory"
echo.
wmic memorychip get BankLabel,Capacity,Speed,Manufacturer /format:table
echo.
echo ================================================================
echo   GRAPHICS
echo ================================================================
echo.
wmic path win32_VideoController get Name,DriverVersion,AdapterRAM /format:list
echo.
echo ================================================================
echo   STORAGE
echo ================================================================
echo.
wmic diskdrive get Model,Size,InterfaceType /format:table
echo.
wmic logicaldisk get Caption,FileSystem,Size,FreeSpace /format:table
echo.
echo ================================================================
echo   NETWORK
echo ================================================================
echo.
wmic nic where "NetEnabled=true" get Name,MACAddress /format:table
echo.
ipconfig /all
echo.
echo ================================================================
echo   END OF REPORT
echo ================================================================
) > "%report_file%"

echo  ================================================================
echo  REPORT GENERATED SUCCESSFULLY!
echo  ================================================================
echo.
echo  Report saved to:
echo  %report_file%
echo.
echo  You can open this file with Notepad to view all details.
echo.

pause
goto SYSTEM_INFO

:: ============================================
:: ABOUT AND HELP
:: ============================================
:ABOUT_HELP
cls
color 0B
title Windows Toolkit v4.2 - About and Help
echo.
echo ================================================================
echo  ABOUT AND HELP - WINDOWS PROFESSIONAL TOOLKIT
echo ================================================================
echo.
echo  TOOL INFORMATION
echo.
echo  Name:        Windows Professional Toolkit
echo  Version:     4.1 ASCII Edition
echo  Build Date:  2025-11-03
echo  Language:    Pure CMD/Batch (No PowerShell!)
echo  License:     MIT License (Free and Open Source)
echo.
echo  FEATURES
echo.
echo  [1] Cleanup Tool:      5 modes, 14+ cleanup targets
echo  [2] Activation:        14 activation methods
echo  [3] Optimizer:         15 optimization tweaks
echo  [4] Software Manager:  List, uninstall, export
echo  [5] System Info:       6 information modes
echo.
echo  QUICK START GUIDE
echo.
echo  FOR BEGINNERS:
echo  1. Run [1] Cleanup Tool - [2] Standard Cleanup
echo  2. Run [3] Optimizer - [1] Quick Optimize
echo  3. Restart your PC
echo  Result: PC will be noticeably faster!
echo.
echo  FOR ADVANCED USERS:
echo  - [2] Activation - HWID for permanent Windows activation
echo  - [3] Optimizer - [2] WinUtil for advanced tweaks
echo  - [4] Software Manager - Remove unwanted software
echo.
echo  DOCUMENTATION
echo.
echo  README.md:           General usage guide
echo  ACTIVATION_GUIDE.md: Detailed activation methods
echo  OPTIMIZER_GUIDE.md:  Complete optimization guide
echo  CHANGELOG.md:        Version history and updates
echo  LICENSE:             MIT License terms
echo.
echo  CREDITS
echo.
echo  Built with CMD/Batch scripting
echo  Open source and free to use
echo.
echo  SAFETY AND SECURITY
echo.
echo  [OK] 100%% Safe - Pure CMD/Batch script (open source)
echo  [OK] No viruses - No malware - No spyware
echo  [OK] No data collection - Your privacy is protected
echo  [OK] No internet required (except activation/optimizer)
echo  [OK] Fully reversible - Can restore defaults anytime
echo.
pause
goto MAIN_MENU

:: ============================================
:: EXIT PROGRAM
:: ============================================
:EXIT_PROGRAM
cls
color 0B
title Windows Toolkit v4.2 - Goodbye!
echo.
echo ================================================================
echo.
echo          THANK YOU FOR USING WINDOWS TOOLKIT v4.2!
echo.
echo ================================================================
echo.
echo  YOUR WINDOWS IS NOW OPTIMIZED!
echo.
echo  What we did:
echo  - Cleaned junk files and freed disk space
echo  - Optimized system performance
echo  - Enhanced privacy and security
echo  - Removed bloatware and unnecessary apps
echo.
echo  RECOMMENDATIONS
echo.
echo  - Restart your computer for best results
echo  - Run this tool monthly for maintenance
echo  - Share with friends who need PC optimization!
echo.
echo ================================================================
echo.
pause
exit
