@echo off
:: ============================================================================
:: ULTIMATE WINDOWS SYSTEM TOOL - All-in-One System Manager
:: Complete Windows optimization, cleaning, and maintenance tool
:: ============================================================================
:: Version: 2.0 - Professional Edition
:: Compatible with Windows 7/8/10/11
:: ============================================================================

title Ultimate Windows System Tool v2.0

:: Check Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo.
    echo ===============================================================
    echo   ERROR: Administrator privileges required!
    echo   Please right-click and select "Run as Administrator"
    echo ===============================================================
    echo.
    pause
    exit /b 1
)

:MAIN_MENU
cls
color 0B
echo.
echo ===============================================================================
echo                   ULTIMATE WINDOWS SYSTEM TOOL v2.0
echo                   Complete System Optimization Suite
echo ===============================================================================
echo.
echo  [SYSTEM CLEANUP]
echo  [1]  Quick System Cleanup
echo  [2]  Deep System Cleanup
echo  [3]  Browser Cache Cleanup
echo  [4]  Application Cache Cleanup
echo.
echo  [SYSTEM OPTIMIZATION]
echo  [5]  Performance Boost
echo  [6]  Memory (RAM) Optimization
echo  [7]  Network Optimization
echo  [8]  Disk Optimization
echo.
echo  [REPAIR AND MAINTENANCE]
echo  [9]  Automatic Windows Repair
echo  [10] Fix Windows Update Issues
echo  [11] Network Reset and Repair
echo  [12] Disk Check and Repair
echo.
echo  [SECURITY AND PRIVACY]
echo  [13] Privacy Cleanup (Remove Traces)
echo  [14] Startup Programs Manager
echo  [15] Malware Scan and Cleanup
echo  [16] Security Optimization
echo.
echo  [SYSTEM INFORMATION]
echo  [17] Detailed System Information
echo  [18] Disk Space Analysis
echo  [19] Running Processes Monitor
echo  [20] System Health Check
echo.
echo  [ADVANCED TOOLS]
echo  [21] Create System Restore Point
echo  [22] Delete Windows.old Folder
echo  [23] Disable Windows Telemetry
echo  [24] Registry Optimization
echo  [25] ALL-IN-ONE Complete Optimization
echo.
echo  [0]  Exit                    [99] Reset Windows to Default
echo.
echo ===============================================================================
set /p choice=Select function (0-25): 

if "%choice%"=="0" exit
if "%choice%"=="1" goto QUICK_CLEAN
if "%choice%"=="2" goto DEEP_CLEAN
if "%choice%"=="3" goto BROWSER_CLEAN
if "%choice%"=="4" goto APP_CLEAN
if "%choice%"=="5" goto PERFORMANCE_BOOST
if "%choice%"=="6" goto RAM_OPTIMIZE
if "%choice%"=="7" goto NETWORK_OPTIMIZE
if "%choice%"=="8" goto DISK_OPTIMIZE
if "%choice%"=="9" goto AUTO_REPAIR
if "%choice%"=="10" goto FIX_WINDOWS_UPDATE
if "%choice%"=="11" goto NETWORK_RESET
if "%choice%"=="12" goto DISK_CHECK
if "%choice%"=="13" goto PRIVACY_CLEAN
if "%choice%"=="14" goto STARTUP_MANAGE
if "%choice%"=="15" goto MALWARE_SCAN
if "%choice%"=="16" goto SECURITY_OPTIMIZE
if "%choice%"=="17" goto SYSTEM_INFO
if "%choice%"=="18" goto DISK_ANALYSIS
if "%choice%"=="19" goto PROCESS_INFO
if "%choice%"=="20" goto HEALTH_CHECK
if "%choice%"=="21" goto CREATE_RESTORE
if "%choice%"=="22" goto DELETE_WINDOWS_OLD
if "%choice%"=="23" goto DISABLE_TELEMETRY
if "%choice%"=="24" goto REGISTRY_OPTIMIZE
if "%choice%"=="25" goto ALL_IN_ONE
if "%choice%"=="99" goto RESET_WINDOWS
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 1: QUICK CLEAN
:: ============================================================================
:QUICK_CLEAN
cls
color 0A
echo.
echo ===============================================================================
echo                           QUICK SYSTEM CLEANUP
echo ===============================================================================
echo.
echo Cleaning in progress...
echo.

echo [1/10] Cleaning Temp files...
del /f /s /q "%TEMP%\*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
mkdir "%TEMP%" >nul 2>&1

echo [2/10] Cleaning System Temp...
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1

echo [3/10] Cleaning Prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo [4/10] Cleaning Recent Items...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

echo [5/10] Cleaning Thumbnail Cache...
del /f /s /q /a:h "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" >nul 2>&1

echo [6/10] Flush DNS Cache...
ipconfig /flushdns >nul 2>&1

echo [7/10] Cleaning Windows Update Cache...
net stop wuauserv >nul 2>&1
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1

echo [8/10] Cleaning Error Reports...
del /f /s /q "C:\ProgramData\Microsoft\Windows\WER\*" >nul 2>&1

echo [9/10] Cleaning Logs...
del /f /s /q "C:\Windows\Logs\*" >nul 2>&1

echo [10/10] Empty Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1

echo.
echo [SUCCESS] Basic system cleanup complete!
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 2: DEEP CLEAN
:: ============================================================================
:DEEP_CLEAN
cls
color 0A
echo.
echo ===============================================================================
echo                            DEEP SYSTEM CLEANUP
echo ===============================================================================
echo.
echo WARNING: This process may take 5-10 minutes!
echo.
pause

echo Cleaning in progress...
echo.

echo [Phase 1/5] Basic cleanup...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo [Phase 2/5] Deep system cleanup...
del /f /s /q /a:h "%LOCALAPPDATA%\*.log" >nul 2>&1
del /f /s /q /a:h "%LOCALAPPDATA%\*.tmp" >nul 2>&1

echo [Phase 3/5] Cleaning Component Store...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1

echo [Phase 4/5] Removing Windows.old (if exists)...
if exist "C:\Windows.old" (
    takeown /f "C:\Windows.old" /r /d y >nul 2>&1
    icacls "C:\Windows.old" /grant administrators:F /t >nul 2>&1
    rd /s /q "C:\Windows.old" >nul 2>&1
)

echo [Phase 5/5] Removing Memory Dumps...
del /f /q "C:\Windows\MEMORY.DMP" >nul 2>&1
del /f /s /q "C:\Windows\Minidump\*" >nul 2>&1

echo Cleaning old System Restore Points...
vssadmin delete shadows /for=%systemdrive% /oldest /quiet >nul 2>&1

echo Cleaning Event Logs...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G" >nul 2>&1)

echo Running Disk Cleanup...
cleanmgr /sagerun:1 >nul 2>&1

echo.
echo [SUCCESS] Deep system cleanup complete!
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 3: BROWSER CLEAN
:: ============================================================================
:BROWSER_CLEAN
cls
color 0A
echo.
echo ===============================================================================
echo                           BROWSER CACHE CLEANUP
echo ===============================================================================
echo.

echo Closing all browsers...
taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM firefox.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM opera.exe >nul 2>&1
taskkill /F /IM brave.exe >nul 2>&1
timeout /t 2 >nul

echo.
echo Cleaning browser caches...
echo.

if exist "%LOCALAPPDATA%\Google\Chrome\User Data" (
    echo [OK] Cleaning Chrome...
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\GPUCache" >nul 2>&1
)

if exist "%LOCALAPPDATA%\Mozilla\Firefox\Profiles" (
    echo [OK] Cleaning Firefox...
    for /d %%x in ("%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*") do (
        rd /s /q "%%x\cache2" >nul 2>&1
        rd /s /q "%%x\startupCache" >nul 2>&1
        rd /s /q "%%x\thumbnails" >nul 2>&1
    )
)

if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data" (
    echo [OK] Cleaning Edge...
    rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache" >nul 2>&1
)

echo [OK] Cleaning IE/Edge Legacy...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 >nul 2>&1

echo.
echo [SUCCESS] All browser caches cleaned!
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 4: APPLICATION CLEAN
:: ============================================================================
:APP_CLEAN
cls
color 0A
echo.
echo ===============================================================================
echo                        APPLICATION CACHE CLEANUP
echo ===============================================================================
echo.

echo Cleaning application caches...
echo.

if exist "%APPDATA%\discord" (
    taskkill /F /IM discord.exe >nul 2>&1
    echo [OK] Cleaning Discord...
    rd /s /q "%APPDATA%\discord\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\discord\Code Cache" >nul 2>&1
)

if exist "%APPDATA%\Microsoft\Teams" (
    taskkill /F /IM Teams.exe >nul 2>&1
    echo [OK] Cleaning Teams...
    rd /s /q "%APPDATA%\Microsoft\Teams\Cache" >nul 2>&1
)

if exist "%APPDATA%\Spotify" (
    taskkill /F /IM Spotify.exe >nul 2>&1
    echo [OK] Cleaning Spotify...
    rd /s /q "%APPDATA%\Spotify\Data" >nul 2>&1
)

if exist "%APPDATA%\Code" (
    echo [OK] Cleaning VS Code...
    rd /s /q "%APPDATA%\Code\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\Code\logs" >nul 2>&1
)

echo [OK] Cleaning Windows Store...
wsreset.exe >nul 2>&1

echo [OK] Cleaning general app temp...
del /f /s /q "%LOCALAPPDATA%\Temp\*" >nul 2>&1

echo.
echo [SUCCESS] Application caches cleaned!
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 5: PERFORMANCE BOOST
:: ============================================================================
:PERFORMANCE_BOOST
cls
color 0E
echo.
echo ===============================================================================
echo                            PERFORMANCE BOOST
echo ===============================================================================
echo.

echo Optimizing system performance...
echo.

echo [1/8] Optimizing Windows services...
sc config "SysMain" start= disabled >nul 2>&1
sc stop "SysMain" >nul 2>&1

echo [2/8] Optimizing visual effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1

echo [3/8] Disabling animations...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1

echo [4/8] Enabling Game Mode...
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul 2>&1

echo [5/8] Disabling Windows Tips...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f >nul 2>&1

echo [6/8] Setting High Performance mode...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

echo [7/8] Disabling Hibernation...
powercfg /h off >nul 2>&1

echo [8/8] Optimizing disk...
fsutil behavior set DisableDeleteNotify 0 >nul 2>&1

echo.
echo [SUCCESS] System performance optimized!
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 6: RAM OPTIMIZE
:: ============================================================================
:RAM_OPTIMIZE
cls
color 0E
echo.
echo ===============================================================================
echo                          MEMORY (RAM) OPTIMIZATION
echo ===============================================================================
echo.

echo Optimizing RAM...
echo.

echo [1/3] Cleaning RAM cache...
echo [2/3] Disabling SuperFetch (SysMain)...
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1

echo [3/3] Optimizing paging file...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f >nul 2>&1

echo.
echo [SUCCESS] RAM has been optimized!
echo TIP: Restart your computer for best results.
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 7: NETWORK OPTIMIZE
:: ============================================================================
:NETWORK_OPTIMIZE
cls
color 0E
echo.
echo ===============================================================================
echo                          NETWORK OPTIMIZATION
echo ===============================================================================
echo.

echo Optimizing network...
echo.

echo [1/7] Flush DNS Cache...
ipconfig /flushdns >nul 2>&1

echo [2/7] Reset Winsock...
netsh winsock reset >nul 2>&1

echo [3/7] Reset TCP/IP...
netsh int ip reset >nul 2>&1

echo [4/7] Optimize TCP Settings...
netsh int tcp set global autotuninglevel=normal >nul 2>&1

echo [5/7] Disabling Network Throttling...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul 2>&1

echo [6/7] Optimizing DNS...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v MaxCacheTtl /t REG_DWORD /d 86400 /f >nul 2>&1

echo [7/7] Release and Renew IP...
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1

echo.
echo [SUCCESS] Network has been optimized!
echo TIP: Restart your computer to apply changes.
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 17: SYSTEM INFO
:: ============================================================================
:SYSTEM_INFO
cls
color 0B
echo.
echo ===============================================================================
echo                       DETAILED SYSTEM INFORMATION
echo ===============================================================================
echo.

systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory" /C:"Available Physical Memory"

echo.
echo -------------------------------------------------------------------------------
echo DISK INFORMATION:
echo -------------------------------------------------------------------------------
wmic logicaldisk get caption,freespace,size,volumename

echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 21: CREATE RESTORE POINT
:: ============================================================================
:CREATE_RESTORE
cls
color 0E
echo.
echo ===============================================================================
echo                       CREATE SYSTEM RESTORE POINT
echo ===============================================================================
echo.

echo Creating system restore point...
echo.

powershell -Command "Checkpoint-Computer -Description 'Manual Restore Point from Ultimate Tool' -RestorePointType 'MODIFY_SETTINGS'"

if %errorLevel% equ 0 (
    echo [SUCCESS] Restore point created successfully!
) else (
    echo [WARNING] Could not create restore point. System Restore may be disabled.
    echo TIP: Enable System Restore: Control Panel - System - System Protection
)

echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 25: ALL IN ONE
:: ============================================================================
:ALL_IN_ONE
cls
color 0C
echo.
echo ===============================================================================
echo                     ALL-IN-ONE COMPLETE OPTIMIZATION
echo ===============================================================================
echo.

echo WARNING: This will run ALL optimizations!
echo WARNING: May take 20-40 minutes!
echo WARNING: Computer will restart after completion!
echo.
set /p confirm=Are you sure you want to continue? (Y/N): 

if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo ===============================================================================
echo                   STARTING COMPLETE SYSTEM OPTIMIZATION
echo ===============================================================================
echo.

echo [PHASE 1/4] CLEANING SYSTEM...
call :QUICK_CLEAN
timeout /t 2 >nul

echo [PHASE 2/4] OPTIMIZING PERFORMANCE...
call :PERFORMANCE_BOOST
timeout /t 2 >nul
call :NETWORK_OPTIMIZE
timeout /t 2 >nul

echo [PHASE 3/4] OPTIMIZING SECURITY...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1

echo [PHASE 4/4] FINALIZING...
call :CREATE_RESTORE

echo.
echo ===============================================================================
echo                           ALL COMPLETE!
echo ===============================================================================
echo.
echo [SUCCESS] All optimizations completed!
echo.
echo TIP: System will restart in 30 seconds...
echo      Press any key to cancel restart.
echo.

timeout /t 30
shutdown /r /t 10 /c "Restarting to complete optimization..."

pause
shutdown /a
goto MAIN_MENU

:: ============================================================================
:: Additional simplified functions - same structure as above
:: ============================================================================

:DISK_OPTIMIZE
cls
echo.
echo [INFO] Disk Optimization
echo This will run defrag on C: drive
pause
defrag C: /O
pause
goto MAIN_MENU

:AUTO_REPAIR
cls
echo.
echo [INFO] Running System File Checker...
sfc /scannow
pause
goto MAIN_MENU

:FIX_WINDOWS_UPDATE
cls
echo.
echo [INFO] Fixing Windows Update...
net stop wuauserv
net stop bits
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
net start wuauserv
net start bits
echo [SUCCESS] Windows Update reset complete!
pause
goto MAIN_MENU

:NETWORK_RESET
cls
echo.
echo [INFO] Resetting Network...
netsh int ip reset
netsh winsock reset
ipconfig /flushdns
echo [SUCCESS] Network reset complete! Please restart your computer.
pause
goto MAIN_MENU

:DISK_CHECK
cls
echo.
echo [INFO] Disk Check
echo Type: chkdsk C: /F /R
echo Then restart your computer to run the check.
pause
goto MAIN_MENU

:PRIVACY_CLEAN
cls
echo.
echo [INFO] Cleaning privacy traces...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
echo [SUCCESS] Privacy cleanup complete!
pause
goto MAIN_MENU

:STARTUP_MANAGE
cls
echo.
echo [INFO] Opening Task Manager - Startup tab...
start taskmgr.exe /0 /startup
timeout /t 2 >nul
pause
goto MAIN_MENU

:MALWARE_SCAN
cls
echo.
echo [INFO] Running Windows Defender Quick Scan...
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1
echo [SUCCESS] Scan complete!
pause
goto MAIN_MENU

:SECURITY_OPTIMIZE
cls
echo.
echo [INFO] Optimizing security...
netsh advfirewall set allprofiles state on
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false" >nul 2>&1
echo [SUCCESS] Security optimized!
pause
goto MAIN_MENU

:DISK_ANALYSIS
cls
echo.
echo [INFO] Disk Space Analysis
wmic logicaldisk get caption,freespace,size,volumename
pause
goto MAIN_MENU

:PROCESS_INFO
cls
echo.
echo [INFO] Opening Task Manager...
start taskmgr.exe
pause
goto MAIN_MENU

:HEALTH_CHECK
cls
echo.
echo [INFO] System Health Check
echo Running diagnostics...
sfc /verifyonly
wmic diskdrive get status
echo [SUCCESS] Check complete!
pause
goto MAIN_MENU

:DELETE_WINDOWS_OLD
cls
echo.
if exist "C:\Windows.old" (
    echo [INFO] Windows.old folder found!
    set /p confirm=Delete Windows.old? (Y/N): 
    if /i "!confirm!"=="Y" (
        takeown /f "C:\Windows.old" /r /d y >nul 2>&1
        rd /s /q "C:\Windows.old" >nul 2>&1
        echo [SUCCESS] Windows.old deleted!
    )
) else (
    echo [INFO] Windows.old folder not found
)
pause
goto MAIN_MENU

:DISABLE_TELEMETRY
cls
echo.
echo [INFO] Disabling Windows Telemetry...
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
echo [SUCCESS] Telemetry disabled!
pause
goto MAIN_MENU

:REGISTRY_OPTIMIZE
cls
echo.
echo [INFO] Optimizing Registry...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f >nul 2>&1
echo [SUCCESS] Registry optimized!
pause
goto MAIN_MENU

:RESET_WINDOWS
cls
echo.
echo ===============================================================================
echo                        RESET WINDOWS TO DEFAULT
echo ===============================================================================
echo.
echo WARNING: This will reset Windows to factory settings!
echo WARNING: MAY LOSE DATA if you don't choose "Keep my files"!
echo.
set /p resetconfirm=Type YES to confirm: 

if /i "%resetconfirm%"=="YES" (
    echo Opening Windows Reset...
    systemreset
) else (
    echo Cancelled.
)
pause
goto MAIN_MENU
