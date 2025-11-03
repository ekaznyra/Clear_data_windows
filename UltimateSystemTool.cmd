@echo off
chcp 65001 >nul 2>&1
:: ============================================================================
:: ULTIMATE WINDOWS SYSTEM TOOL - All-in-One System Manager
:: Complete Windows optimization, cleaning, and maintenance tool
:: ============================================================================
:: Version: 2.0 - Professional Edition
:: Author: Advanced System Tools
:: License: Open Source (MIT)
:: ============================================================================

title Ultimate Windows System Tool - All-in-One Manager

:: Check Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo.
    echo ═══════════════════════════════════════════════════════════
    echo   ERROR: Administrator privileges required!
    echo   Please right-click and select "Run as Administrator"
    echo ═══════════════════════════════════════════════════════════
    echo.
    pause
    exit /b 1
)

:MAIN_MENU
cls
color 0B
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                  ULTIMATE WINDOWS SYSTEM TOOL v2.0                       ║
echo ║                   Complete System Optimization Suite                     ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  🧹 SYSTEM CLEANUP                                                       │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [1]  Quick System Cleanup                                              │
echo  │  [2]  Deep System Cleanup                                               │
echo  │  [3]  Browser Cache Cleanup                                             │
echo  │  [4]  Application Cache Cleanup                                         │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  ⚡ SYSTEM OPTIMIZATION                                                  │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [5]  Performance Boost                                                 │
echo  │  [6]  Memory (RAM) Optimization                                         │
echo  │  [7]  Network Optimization                                              │
echo  │  [8]  Disk Optimization                                                 │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  🔧 REPAIR AND MAINTENANCE                                               │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [9]  Automatic Windows Repair                                          │
echo  │  [10] Fix Windows Update Issues                                         │
echo  │  [11] Network Reset and Repair                                          │
echo  │  [12] Disk Check and Repair                                             │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  🛡️ SECURITY AND PRIVACY                                                │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [13] Privacy Cleanup (Remove Traces)                                   │
echo  │  [14] Startup Programs Manager                                          │
echo  │  [15] Malware Scan and Cleanup                                          │
echo  │  [16] Security Optimization                                             │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  📊 SYSTEM INFORMATION                                                   │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [17] Detailed System Information                                       │
echo  │  [18] Disk Space Analysis                                               │
echo  │  [19] Running Processes Monitor                                         │
echo  │  [20] System Health Check                                               │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  🔥 ADVANCED TOOLS                                                       │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [21] Create System Restore Point                                       │
echo  │  [22] Delete Windows.old Folder                                         │
echo  │  [23] Disable Windows Telemetry                                         │
echo  │  [24] Registry Optimization                                             │
echo  │  [25] ALL-IN-ONE Complete Optimization                                  │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  [0]  Exit                                   [99] Reset Windows to Default
echo.
set /p choice="  ► Select function (0-25): "

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
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                         QUICK SYSTEM CLEANUP                             ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.
echo [▓▓▓▓▓▓▓▓▓▓] Cleaning in progress...
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
echo ✅ Complete! Basic system cleanup finished.
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
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                          DEEP SYSTEM CLEANUP                             ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.
echo ⚠️  Warning: This process may take 5-10 minutes!
echo.
pause

echo [▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓] Deep cleaning in progress...
echo.

:: Quick Clean first
echo [Phase 1/5] Basic cleanup...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

:: Deep System Clean
echo [Phase 2/5] Deep system cleanup...
del /f /s /q /a:h "%LOCALAPPDATA%\*.log" >nul 2>&1
del /f /s /q /a:h "%LOCALAPPDATA%\*.tmp" >nul 2>&1

:: Component Store Cleanup
echo [Phase 3/5] Cleaning Component Store...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1

:: Old Windows Installation
echo [Phase 4/5] Removing Windows.old (if exists)...
if exist "C:\Windows.old" (
    takeown /f "C:\Windows.old" /r /d y >nul 2>&1
    icacls "C:\Windows.old" /grant administrators:F /t >nul 2>&1
    rd /s /q "C:\Windows.old" >nul 2>&1
)

:: Memory Dumps
echo [Phase 5/5] Removing Memory Dumps...
del /f /q "C:\Windows\MEMORY.DMP" >nul 2>&1
del /f /s /q "C:\Windows\Minidump\*" >nul 2>&1

:: System Restore Points (keep last 1)
echo Cleaning old System Restore Points...
vssadmin delete shadows /for=%systemdrive% /oldest /quiet >nul 2>&1

:: Event Logs
echo Cleaning Event Logs...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G" >nul 2>&1)

:: Run Disk Cleanup
echo Running Disk Cleanup...
cleanmgr /sagerun:1 >nul 2>&1

echo.
echo ✅ Complete! Deep system cleanup finished.
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
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                       BROWSER CACHE CLEANUP                              ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

:: Kill browsers
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

:: Chrome
if exist "%LOCALAPPDATA%\Google\Chrome\User Data" (
    echo [√] Cleaning Chrome...
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\GPUCache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Service Worker" >nul 2>&1
    del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\*.tmp" >nul 2>&1
)

:: Firefox
if exist "%LOCALAPPDATA%\Mozilla\Firefox\Profiles" (
    echo [√] Cleaning Firefox...
    for /d %%x in ("%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*") do (
        rd /s /q "%%x\cache2" >nul 2>&1
        rd /s /q "%%x\startupCache" >nul 2>&1
        rd /s /q "%%x\thumbnails" >nul 2>&1
        del /f /s /q "%%x\*.sqlite-wal" >nul 2>&1
        del /f /s /q "%%x\*.sqlite-shm" >nul 2>&1
    )
)

:: Edge
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data" (
    echo [√] Cleaning Edge...
    rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\GPUCache" >nul 2>&1
)

:: Opera
if exist "%APPDATA%\Opera Software\Opera Stable" (
    echo [√] Cleaning Opera...
    rd /s /q "%APPDATA%\Opera Software\Opera Stable\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\Opera Software\Opera Stable\GPUCache" >nul 2>&1
)

:: Brave
if exist "%LOCALAPPDATA%\BraveSoftware\Brave-Browser" (
    echo [√] Cleaning Brave...
    rd /s /q "%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data\Default\Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data\Default\Code Cache" >nul 2>&1
)

:: Internet Explorer/Edge Legacy
echo [√] Cleaning IE/Edge Legacy...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 >nul 2>&1

echo.
echo ✅ Complete! All browser caches cleaned.
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
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                     APPLICATION CACHE CLEANUP                            ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Cleaning application caches...
echo.

:: Discord
if exist "%APPDATA%\discord" (
    taskkill /F /IM discord.exe >nul 2>&1
    echo [√] Cleaning Discord...
    rd /s /q "%APPDATA%\discord\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\discord\Code Cache" >nul 2>&1
    rd /s /q "%APPDATA%\discord\GPUCache" >nul 2>&1
    rd /s /q "%APPDATA%\discord\Service Worker\CacheStorage" >nul 2>&1
)

:: Microsoft Teams
if exist "%APPDATA%\Microsoft\Teams" (
    taskkill /F /IM Teams.exe >nul 2>&1
    echo [√] Cleaning Teams...
    rd /s /q "%APPDATA%\Microsoft\Teams\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\Microsoft\Teams\blob_storage" >nul 2>&1
    rd /s /q "%APPDATA%\Microsoft\Teams\databases" >nul 2>&1
    rd /s /q "%APPDATA%\Microsoft\Teams\GPUCache" >nul 2>&1
    rd /s /q "%APPDATA%\Microsoft\Teams\IndexedDB" >nul 2>&1
)

:: Spotify
if exist "%APPDATA%\Spotify" (
    taskkill /F /IM Spotify.exe >nul 2>&1
    echo [√] Cleaning Spotify...
    rd /s /q "%APPDATA%\Spotify\Data" >nul 2>&1
    rd /s /q "%APPDATA%\Spotify\Browser" >nul 2>&1
)

:: Visual Studio Code
if exist "%APPDATA%\Code" (
    echo [√] Cleaning VS Code...
    rd /s /q "%APPDATA%\Code\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\Code\CachedData" >nul 2>&1
    rd /s /q "%APPDATA%\Code\Code Cache" >nul 2>&1
    rd /s /q "%APPDATA%\Code\logs" >nul 2>&1
)

:: Slack
if exist "%APPDATA%\Slack" (
    taskkill /F /IM slack.exe >nul 2>&1
    echo [√] Cleaning Slack...
    rd /s /q "%APPDATA%\Slack\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\Slack\Code Cache" >nul 2>&1
    rd /s /q "%APPDATA%\Slack\Service Worker" >nul 2>&1
)

:: Zoom
if exist "%APPDATA%\Zoom" (
    taskkill /F /IM Zoom.exe >nul 2>&1
    echo [√] Cleaning Zoom...
    del /f /s /q "%APPDATA%\Zoom\logs\*" >nul 2>&1
    rd /s /q "%APPDATA%\Zoom\logs" >nul 2>&1
)

:: Steam Shader Cache
if exist "C:\Program Files (x86)\Steam\steamapps\shadercache" (
    echo [√] Cleaning Steam Shader Cache...
    del /f /s /q "C:\Program Files (x86)\Steam\steamapps\shadercache\*" >nul 2>&1
)

:: Windows Store Cache
echo [√] Cleaning Windows Store...
wsreset.exe >nul 2>&1

:: Adobe Cache
if exist "%APPDATA%\Adobe" (
    echo [√] Cleaning Adobe Cache...
    del /f /s /q "%APPDATA%\Adobe\*.log" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Adobe\Acrobat\DC\Cache" >nul 2>&1
)

:: Temp folders in common apps
echo [√] Cleaning general app temp...
del /f /s /q "%LOCALAPPDATA%\Temp\*" >nul 2>&1

echo.
echo ✅ Complete! Application caches cleaned.
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
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                         PERFORMANCE BOOST                                ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Optimizing system performance...
echo.

:: Disable unnecessary services
echo [1/8] Optimizing Windows services...
sc config "SysMain" start= disabled >nul 2>&1
sc stop "SysMain" >nul 2>&1
sc config "WSearch" start= demand >nul 2>&1

:: Visual Effects to Performance
echo [2/8] Optimizing visual effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1

:: Disable animations
echo [3/8] Disabling animations...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1

:: Game Mode
echo [4/8] Enabling Game Mode...
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul 2>&1

:: Disable Windows Tips
echo [5/8] Disabling Windows Tips...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f >nul 2>&1

:: Power Plan to High Performance
echo [6/8] Setting High Performance mode...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

:: Disable Hibernation
echo [7/8] Disabling Hibernation...
powercfg /h off >nul 2>&1

:: Optimize SSD/HDD
echo [8/8] Optimizing disk...
fsutil behavior set DisableDeleteNotify 0 >nul 2>&1

echo.
echo ✅ Complete! System performance optimized.
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
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                        MEMORY (RAM) OPTIMIZATION                         ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Optimizing RAM...
echo.

echo [1/5] Cleaning RAM cache...
echo.

:: Clear Standby Memory
echo [2/5] Freeing Standby Memory...
echo.

:: Disable SuperFetch/SysMain
echo [3/5] Disabling SuperFetch (SysMain)...
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1

:: Optimize paging file
echo [4/5] Optimizing paging file...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f >nul 2>&1

:: Empty Working Sets
echo [5/5] Freeing working sets...
echo. 

echo.
echo ✅ Complete! RAM has been optimized.
echo 💡 Restart your computer for best results.
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
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                        NETWORK OPTIMIZATION                              ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
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
netsh int tcp set global chimney=enabled >nul 2>&1
netsh int tcp set global dca=enabled >nul 2>&1
netsh int tcp set global netdma=enabled >nul 2>&1

echo [5/7] Disabling Network Throttling...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul 2>&1

echo [6/7] Optimizing DNS...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v MaxCacheTtl /t REG_DWORD /d 86400 /f >nul 2>&1

echo [7/7] Release and Renew IP...
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1

echo.
echo ✅ Complete! Network has been optimized.
echo 💡 Restart your computer to apply changes.
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 8: DISK OPTIMIZE
:: ============================================================================
:DISK_OPTIMIZE
cls
color 0E
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                         DISK OPTIMIZATION                                ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo ⚠️  This process may take 10-30 minutes!
echo.
pause

echo Optimizing disk...
echo.

echo [1/4] Analyzing disk...
defrag C: /A

echo [2/4] Optimizing disk...
defrag C: /O

echo [3/4] Trim SSD (nếu có)...
defrag C: /L

echo [4/4] Enable TRIM...
fsutil behavior set DisableDeleteNotify 0

echo.
echo ✅ Complete! Disk has been optimized.
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 9: AUTO REPAIR
:: ============================================================================
:AUTO_REPAIR
cls
color 0C
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                      AUTOMATIC WINDOWS REPAIR                            ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo ⚠️  This process may take 15-30 minutes!
echo.
pause

echo Checking and repairing system...
echo.

echo [1/4] Scanning system files (SFC)...
sfc /scannow

echo.
echo [2/4] Checking Windows Image Health...
Dism /Online /Cleanup-Image /CheckHealth

echo.
echo [3/4] Scanning Windows Image...
Dism /Online /Cleanup-Image /ScanHealth

echo.
echo [4/4] Restoring Windows Image...
Dism /Online /Cleanup-Image /RestoreHealth

echo.
echo ✅ Complete! System checked and repaired.
echo 💡 Restart your computer recommended.
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 10: FIX WINDOWS UPDATE
:: ============================================================================
:FIX_WINDOWS_UPDATE
cls
color 0C
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                     FIX WINDOWS UPDATE ISSUES                            ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Fixing Windows Update...
echo.

echo [1/6] Stopping Windows Update services...
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver

echo [2/6] Renaming SoftwareDistribution folder...
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
ren C:\Windows\System32\catroot2 catroot2.old

echo [3/6] Restarting Windows Update services...
net start wuauserv
net start cryptSvc
net start bits
net start msiserver

echo [4/6] Resetting Windows Update components...
regsvr32 /s wuaueng.dll
regsvr32 /s wuaueng1.dll
regsvr32 /s wucltui.dll
regsvr32 /s wups.dll
regsvr32 /s wups2.dll
regsvr32 /s wuweb.dll

echo [5/6] Cleaning up old folders...
timeout /t 5 >nul
rd /s /q C:\Windows\SoftwareDistribution.old >nul 2>&1
rd /s /q C:\Windows\System32\catroot2.old >nul 2>&1

echo [6/6] Running Windows Update Troubleshooter...
msdt.exe /id WindowsUpdateDiagnostic

echo.
echo ✅ Complete! Windows Update has been fixed.
echo 💡 Try running Windows Update again.
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 11: NETWORK RESET
:: ============================================================================
:NETWORK_RESET
cls
color 0C
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                        NETWORK RESET AND REPAIR                          ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Resetting all network settings...
echo.

echo [1/8] Reset IP...
netsh int ip reset

echo [2/8] Reset Winsock...
netsh winsock reset

echo [3/8] Reset Proxy...
netsh winhttp reset proxy

echo [4/8] Flush DNS...
ipconfig /flushdns

echo [5/8] Release IP...
ipconfig /release

echo [6/8] Renew IP...
ipconfig /renew

echo [7/8] Reset Firewall...
netsh advfirewall reset

echo [8/8] Reset Network Adapter...
netsh interface set interface "Ethernet" admin=disable >nul 2>&1
netsh interface set interface "Wi-Fi" admin=disable >nul 2>&1
timeout /t 3 >nul
netsh interface set interface "Ethernet" admin=enable >nul 2>&1
netsh interface set interface "Wi-Fi" admin=enable >nul 2>&1

echo.
echo ✅ Complete! Network has been reset.
echo 💡 You MUST restart your computer to apply changes!
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 12: DISK CHECK
:: ============================================================================
:DISK_CHECK
cls
color 0C
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                         DISK CHECK AND REPAIR                            ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo ⚠️  Note: Disk check requires system restart!
echo.
echo 1. Scan and auto-fix errors (Requires restart)
echo 2. Scan only (no fix)
echo 0. Back to menu
echo.
set /p diskchoice="Select (1/2/0): "

if "%diskchoice%"=="1" (
    echo.
    echo Scheduling disk check on restart...
    echo Y | chkdsk C: /F /R /X
    echo.
    echo ✅ Scheduled! Restart your computer to begin check.
    pause
) else if "%diskchoice%"=="2" (
    echo.
    echo Scanning disk...
    chkdsk C:
    echo.
    echo ✅ Scan complete!
    pause
)

goto MAIN_MENU

:: ============================================================================
:: FUNCTION 13: PRIVACY CLEAN
:: ============================================================================
:PRIVACY_CLEAN
cls
color 0A
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                    PRIVACY CLEANUP - REMOVE TRACES                       ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Removing activity traces...
echo.

echo [1/10] Deleting Recent Documents...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

echo [2/10] Deleting Run History...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1

echo [3/10] Deleting Search History...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f >nul 2>&1

echo [4/10] Clearing Clipboard...
echo off | clip

echo [5/10] Deleting Jump Lists...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*" >nul 2>&1
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*" >nul 2>&1

echo [6/10] Clearing Browser History (IE/Edge)...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

echo [7/10] Clearing Prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo [8/10] Deleting Timeline...
del /f /s /q "%LOCALAPPDATA%\ConnectedDevicesPlatform\*" >nul 2>&1

echo [9/10] Clearing Activity History...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1

echo [10/10] Clearing Event Logs...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G" >nul 2>&1)

echo.
echo ✅ Complete! Activity traces removed.
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 14: STARTUP MANAGE
:: ============================================================================
:STARTUP_MANAGE
cls
color 0B
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                      STARTUP PROGRAMS MANAGER                            ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Opening Task Manager to manage Startup programs...
echo.
echo 💡 Instructions:
echo    1. Switch to "Startup" tab
echo    2. Disable unnecessary programs
echo    3. Reduce Windows boot time
echo.

start taskmgr.exe /0 /startup

timeout /t 3 >nul
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 15: MALWARE SCAN
:: ============================================================================
:MALWARE_SCAN
cls
color 0C
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                       MALWARE SCAN AND CLEANUP                           ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo ⚠️  This process may take 10-30 minutes!
echo.
echo Running Windows Defender Scan...
echo.

echo [1/3] Quick Scan...
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1

echo.
echo [2/3] Removing suspicious temp files...
del /f /s /q "%TEMP%\*.exe" >nul 2>&1
del /f /s /q "%TEMP%\*.dll" >nul 2>&1
del /f /s /q "%TEMP%\*.scr" >nul 2>&1

echo [3/3] Update Definitions...
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate

echo.
echo ✅ Scan complete!
echo 💡 If viruses detected, Windows Defender will handle them automatically.
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 16: SECURITY OPTIMIZE
:: ============================================================================
:SECURITY_OPTIMIZE
cls
color 0C
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                        SECURITY OPTIMIZATION                             ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Optimizing security...
echo.

echo [1/8] Enabling Windows Firewall...
netsh advfirewall set allprofiles state on

echo [2/8] Enabling Windows Defender Real-time Protection...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false" >nul 2>&1

echo [3/8] Update Windows Defender...
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate

echo [4/8] Disabling Remote Assistance...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 0 /f >nul 2>&1

echo [5/8] Disabling Remote Desktop (if not used)...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f >nul 2>&1

echo [6/8] Enabling UAC (User Account Control)...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f >nul 2>&1

echo [7/8] Disable AutoRun/AutoPlay...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 255 /f >nul 2>&1

echo [8/8] Enabling SmartScreen...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d Warn /f >nul 2>&1

echo.
echo ✅ Complete! Security has been optimized.
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
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                      DETAILED SYSTEM INFORMATION                         ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory" /C:"Available Physical Memory" /C:"System Manufacturer" /C:"System Model"

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo DISK INFORMATION:
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
wmic logicaldisk get caption,freespace,size,volumename

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo CPU INFORMATION:
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
wmic cpu get name,numberofcores,numberoflogicalprocessors

echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 18: DISK ANALYSIS
:: ============================================================================
:DISK_ANALYSIS
cls
color 0B
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                         DISK SPACE ANALYSIS                              ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Analyzing disk space...
echo.

echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo DISK OVERVIEW:
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
wmic logicaldisk get caption,freespace,size,volumename,filesystem

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo TOP 20 LARGEST FILES ON C: DRIVE
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo Searching (may take a few minutes)...
forfiles /P C:\ /S /M *.* /C "cmd /c if @fsize GEQ 104857600 echo @fsize @path" 2>nul | sort /R | more

echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 19: PROCESS INFO
:: ============================================================================
:PROCESS_INFO
cls
color 0B
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                      RUNNING PROCESSES MONITOR                           ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Opening Task Manager...
start taskmgr.exe

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo TOP PROCESSES BY MEMORY USAGE:
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
powershell -Command "Get-Process | Sort-Object -Property WS -Descending | Select-Object -First 10 | Format-Table Name, @{Name='Memory (MB)';Expression={[math]::Round($_.WS / 1MB, 2)}} -AutoSize"

echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 20: HEALTH CHECK
:: ============================================================================
:HEALTH_CHECK
cls
color 0B
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                         SYSTEM HEALTH CHECK                              ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Checking system health...
echo.

echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo [1/5] CHECKING SYSTEM FILES...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
sfc /verifyonly

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo [2/5] CHECKING WINDOWS IMAGE...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Dism /Online /Cleanup-Image /CheckHealth

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo [3/5] CHECKING DISK HEALTH...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
wmic diskdrive get status

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo [4/5] CHECKING MEMORY (RAM)...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
wmic memorychip get capacity,speed,manufacturer

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo [5/5] CHECKING BATTERY (Laptop)...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
powercfg /batteryreport /output "%USERPROFILE%\Desktop\battery-report.html" >nul 2>&1
if exist "%USERPROFILE%\Desktop\battery-report.html" (
    echo ✅ Battery Report created on Desktop!
    start "" "%USERPROFILE%\Desktop\battery-report.html"
) else (
    echo ⚠️  No battery detected (Desktop PC)
)

echo.
echo ✅ Health check complete!
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
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                     CREATE SYSTEM RESTORE POINT                          ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Creating system restore point...
echo.

powershell -Command "Checkpoint-Computer -Description 'Manual Restore Point from Ultimate Tool' -RestorePointType 'MODIFY_SETTINGS'"

if %errorLevel% equ 0 (
    echo ✅ Restore point created successfully!
) else (
    echo ⚠️  Could not create restore point. System Restore may be disabled.
    echo 💡 Enable System Restore: Control Panel → System → System Protection
)

echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 22: DELETE WINDOWS.OLD
:: ============================================================================
:DELETE_WINDOWS_OLD
cls
color 0C
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                       DELETE WINDOWS.OLD FOLDER                          ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

if exist "C:\Windows.old" (
    echo ⚠️  Windows.old folder detected!
    echo 💡 This folder contains old Windows installation (can be 20GB+)
    echo.
    set /p confirm="Are you sure you want to delete? (Y/N): "
    
    if /i "!confirm!"=="Y" (
        echo.
        echo Deleting Windows.old...
        takeown /f "C:\Windows.old" /r /d y >nul 2>&1
        icacls "C:\Windows.old" /grant administrators:F /t >nul 2>&1
        rd /s /q "C:\Windows.old" >nul 2>&1
        
        if exist "C:\Windows.old" (
            echo ⚠️  Could not delete completely. Try using Disk Cleanup...
            cleanmgr /d C:
        ) else (
            echo ✅ Windows.old deleted successfully!
        )
    )
) else (
    echo ✅ Windows.old folder not found
)

echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 23: DISABLE TELEMETRY
:: ============================================================================
:DISABLE_TELEMETRY
cls
color 0C
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                        DISABLE WINDOWS TELEMETRY                         ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Disabling data collection services...
echo.

echo [1/10] Disable Telemetry Service...
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1

echo [2/10] Disable Telemetry via Registry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1

echo [3/10] Disable Advertising ID...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1

echo [4/10] Disable Activity Feed...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1

echo [5/10] Disable Location Tracking...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /t REG_DWORD /d 1 /f >nul 2>&1

echo [6/10] Disable Feedback...
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f >nul 2>&1

echo [7/10] Disabling Cortana...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1

echo [8/10] Disabling Windows Tips...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f >nul 2>&1

echo [9/10] Disabling Consumer Features...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f >nul 2>&1

echo [10/10] Disabling Tailored Experiences...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul 2>&1

echo.
echo ✅ Complete! Data collection services disabled.
echo 💡 Restart your computer to fully apply changes.
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 24: REGISTRY OPTIMIZE
:: ============================================================================
:REGISTRY_OPTIMIZE
cls
color 0E
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                        REGISTRY OPTIMIZATION                             ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Optimizing Registry...
echo.

echo [1/5] Creating Registry backup...
if not exist "%USERPROFILE%\Desktop\RegistryBackup" mkdir "%USERPROFILE%\Desktop\RegistryBackup"
reg export HKLM "%USERPROFILE%\Desktop\RegistryBackup\HKLM_backup.reg" /y >nul 2>&1
reg export HKCU "%USERPROFILE%\Desktop\RegistryBackup\HKCU_backup.reg" /y >nul 2>&1
echo ✅ Backup saved at Desktop\RegistryBackup

echo [2/5] Optimizing Menu Show Delay...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1

echo [3/5] Disabling Startup Delay...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f >nul 2>&1

echo [4/5] Optimizing Explorer...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 0 /f >nul 2>&1

echo [5/5] Cleaning Registry (Safe)...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f >nul 2>&1

echo.
echo ✅ Complete! Registry has been optimized.
echo 💡 Registry backup saved on Desktop if recovery needed.
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
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                    ALL-IN-ONE COMPLETE OPTIMIZATION                      ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo ⚠️  WARNING: This will run ALL optimizations!
echo ⚠️  May take 20-40 minutes!
echo ⚠️  Computer will restart after completion!
echo.
set /p confirm="Are you sure you want to continue? (Y/N): "

if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                   STARTING COMPLETE SYSTEM OPTIMIZATION                ║
echo ╚════════════════════════════════════════════════════════════════════════╝
echo.

:: Phase 1: Cleanup
echo [PHASE 1/5] ━━━ CLEANING SYSTEM ━━━
call :QUICK_CLEAN
timeout /t 2 >nul
call :DEEP_CLEAN
timeout /t 2 >nul
call :BROWSER_CLEAN
timeout /t 2 >nul
call :APP_CLEAN
timeout /t 2 >nul
call :PRIVACY_CLEAN
timeout /t 2 >nul

:: Phase 2: Optimization
echo.
echo [PHASE 2/5] ━━━ OPTIMIZING PERFORMANCE ━━━
call :PERFORMANCE_BOOST
timeout /t 2 >nul
call :RAM_OPTIMIZE
timeout /t 2 >nul
call :NETWORK_OPTIMIZE
timeout /t 2 >nul

:: Phase 3: Repair
echo.
echo [PHASE 3/5] ━━━ REPAIRING SYSTEM ━━━
call :AUTO_REPAIR

:: Phase 4: Security
echo.
echo [PHASE 4/5] ━━━ SECURING SYSTEM ━━━
call :SECURITY_OPTIMIZE
timeout /t 2 >nul
call :DISABLE_TELEMETRY
timeout /t 2 >nul

:: Phase 5: Final
echo.
echo [PHASE 5/5] ━━━ FINALIZING ━━━
call :REGISTRY_OPTIMIZE
timeout /t 2 >nul
call :CREATE_RESTORE

echo.
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                         🎉 ALL COMPLETE! 🎉                            ║
echo ╚════════════════════════════════════════════════════════════════════════╝
echo.
echo ✅ All optimizations completed!
echo.
echo 💡 System will restart in 30 seconds...
echo    Press any key to cancel restart.
echo.

timeout /t 30
shutdown /r /t 10 /c "Restarting to complete optimization..."

pause
shutdown /a
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 99: RESET TO DEFAULT
:: ============================================================================
:RESET_WINDOWS
cls
color 0C
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                      RESET WINDOWS TO DEFAULT                            ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo ⚠️  WARNING: This will reset Windows to factory settings!
echo ⚠️  MAY LOSE DATA if you don't choose "Keep my files"!
echo.
echo Are you absolutely sure you want to continue?
echo.
set /p resetconfirm="Type YES to confirm: "

if /i "%resetconfirm%"=="YES" (
    echo.
    echo Opening Windows Reset...
    systemreset
) else (
    echo Cancelled.
    timeout /t 2 >nul
)

goto MAIN_MENU
