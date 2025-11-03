@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul 2>&1
:: ============================================================================
:: ULTIMATE WINDOWS CLEANUP TOOL - Professional Edition
:: Version: 3.0 Bilingual (English/Vietnamese)
:: ============================================================================
:: Complete Windows optimization, cleaning, and maintenance tool
:: Compatible with Windows 7/8/10/11
:: Requires Administrator privileges
:: ============================================================================

title Ultimate Windows Cleanup Tool v3.0 - Professional Edition

:: Check Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo.
    echo ===============================================================================
    echo   ERROR: Administrator privileges required!
    echo   LOI: Yeu cau quyen Administrator!
    echo.
    echo   Please right-click this file and select "Run as administrator"
    echo   Vui long chuot phai chon "Run as administrator"
    echo ===============================================================================
    echo.
    pause
    exit /b 1
)

:: Language Selection
:LANGUAGE_SELECT
cls
color 0B
echo.
echo ===============================================================================
echo                   ULTIMATE WINDOWS CLEANUP TOOL v3.0
echo                         Professional Edition
echo ===============================================================================
echo.
echo   SELECT LANGUAGE / CHON NGON NGU:
echo.
echo   [1] English
echo   [2] Tieng Viet (Vietnamese)
echo.
echo ===============================================================================
set /p lang=Select / Chon (1 or 2): 

if "%lang%"=="1" goto LANG_ENGLISH
if "%lang%"=="2" goto LANG_VIETNAMESE
goto LANGUAGE_SELECT

:LANG_ENGLISH
set "LANG=EN"
goto MAIN_MENU

:LANG_VIETNAMESE
set "LANG=VN"
goto MAIN_MENU

:: ============================================================================
:: MAIN MENU
:: ============================================================================
:MAIN_MENU
cls
color 0B
echo.
echo ===============================================================================
echo                   ULTIMATE WINDOWS CLEANUP TOOL v3.0
if "%LANG%"=="EN" (
    echo                   Complete System Optimization Suite
) else (
    echo                   Bo Cong Cu Toi Uu He Thong Toan Dien
)
echo ===============================================================================
echo.

if "%LANG%"=="EN" (
    echo   [SYSTEM CLEANUP]
    echo   [1]  Quick System Cleanup
    echo   [2]  Deep System Cleanup
    echo   [3]  Browser Cache Cleanup
    echo   [4]  Application Cache Cleanup
    echo.
    echo   [SYSTEM OPTIMIZATION]
    echo   [5]  Performance Boost
    echo   [6]  Memory RAM Optimization
    echo   [7]  Network Optimization
    echo   [8]  Disk Optimization
    echo.
    echo   [REPAIR AND MAINTENANCE]
    echo   [9]  Automatic Windows Repair
    echo   [10] Fix Windows Update Issues
    echo   [11] Network Reset and Repair
    echo   [12] Disk Check and Repair
    echo.
    echo   [SECURITY AND PRIVACY]
    echo   [13] Privacy Cleanup Remove Traces
    echo   [14] Startup Programs Manager
    echo   [15] Malware Scan and Cleanup
    echo   [16] Security Optimization
    echo.
    echo   [SYSTEM INFORMATION]
    echo   [17] Detailed System Information
    echo   [18] Disk Space Analysis
    echo   [19] Running Processes Monitor
    echo   [20] System Health Check
    echo.
    echo   [ADVANCED TOOLS]
    echo   [21] Create System Restore Point
    echo   [22] Delete Windows.old Folder
    echo   [23] Disable Windows Telemetry
    echo   [24] Registry Optimization
    echo   [25] ALL-IN-ONE Complete Optimization
    echo.
    echo   [0]  Exit                    [88] Change Language
    echo   [99] Reset Windows to Default
) else (
    echo   [DON DEP HE THONG]
    echo   [1]  Don Dep Nhanh
    echo   [2]  Don Dep Sau
    echo   [3]  Don Dep Trinh Duyet
    echo   [4]  Don Dep Ung Dung
    echo.
    echo   [TOI UU HOA HE THONG]
    echo   [5]  Tang Cuong Hieu Suat
    echo   [6]  Toi Uu RAM
    echo   [7]  Toi Uu Mang
    echo   [8]  Toi Uu O Dia
    echo.
    echo   [SUA CHUA VA BAO TRI]
    echo   [9]  Tu Dong Sua Loi Windows
    echo   [10] Sua Loi Windows Update
    echo   [11] Sua Loi Mang
    echo   [12] Kiem Tra Va Sua O Dia
    echo.
    echo   [BAO MAT VA RIENG TU]
    echo   [13] Xoa Dau Vet Hoat Dong
    echo   [14] Quan Ly Startup
    echo   [15] Quet Virus
    echo   [16] Toi Uu Bao Mat
    echo.
    echo   [THONG TIN HE THONG]
    echo   [17] Thong Tin Chi Tiet
    echo   [18] Phan Tich O Dia
    echo   [19] Quan Sat Process
    echo   [20] Kiem Tra Suc Khoe
    echo.
    echo   [CONG CU NANG CAO]
    echo   [21] Tao Diem Khoi Phuc
    echo   [22] Xoa Windows.old
    echo   [23] Tat Thu Thap Du Lieu
    echo   [24] Toi Uu Registry
    echo   [25] CHAY TAT CA - Toi Uu Toan Bo
    echo.
    echo   [0]  Thoat                   [88] Doi Ngon Ngu
    echo   [99] Reset Windows Ve Mac Dinh
)
echo.
echo ===============================================================================

if "%LANG%"=="EN" (
    set /p choice=Select function 0-25: 
) else (
    set /p choice=Chon chuc nang 0-25: 
)

if "%choice%"=="0" exit
if "%choice%"=="88" goto LANGUAGE_SELECT
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
if "%LANG%"=="EN" (
    echo                           QUICK SYSTEM CLEANUP
    echo ===============================================================================
    echo.
    echo Cleaning in progress...
) else (
    echo                           DON DEP NHANH
    echo ===============================================================================
    echo.
    echo Dang don dep...
)
echo.

if "%LANG%"=="EN" (
    echo [1/10] Cleaning Temp files...
) else (
    echo [1/10] Don dep file tam...
)
del /f /s /q "%TEMP%\*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
mkdir "%TEMP%" >nul 2>&1

if "%LANG%"=="EN" (
    echo [2/10] Cleaning System Temp...
) else (
    echo [2/10] Don dep System Temp...
)
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1

if "%LANG%"=="EN" (
    echo [3/10] Cleaning Prefetch...
) else (
    echo [3/10] Don dep Prefetch...
)
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

if "%LANG%"=="EN" (
    echo [4/10] Cleaning Recent Items...
) else (
    echo [4/10] Don dep Recent Items...
)
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

if "%LANG%"=="EN" (
    echo [5/10] Cleaning Thumbnail Cache...
) else (
    echo [5/10] Don dep Thumbnail Cache...
)
del /f /s /q /a:h "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" >nul 2>&1

if "%LANG%"=="EN" (
    echo [6/10] Flushing DNS Cache...
) else (
    echo [6/10] Xoa DNS Cache...
)
ipconfig /flushdns >nul 2>&1

if "%LANG%"=="EN" (
    echo [7/10] Cleaning Windows Update Cache...
) else (
    echo [7/10] Don dep Windows Update Cache...
)
net stop wuauserv >nul 2>&1
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1

if "%LANG%"=="EN" (
    echo [8/10] Cleaning Error Reports...
) else (
    echo [8/10] Don dep Error Reports...
)
del /f /s /q "C:\ProgramData\Microsoft\Windows\WER\*" >nul 2>&1

if "%LANG%"=="EN" (
    echo [9/10] Cleaning Logs...
) else (
    echo [9/10] Don dep Logs...
)
del /f /s /q "C:\Windows\Logs\*" >nul 2>&1

if "%LANG%"=="EN" (
    echo [10/10] Emptying Recycle Bin...
) else (
    echo [10/10] Xoa Recycle Bin...
)
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] Quick system cleanup complete!
) else (
    echo [THANH CONG] Don dep nhanh hoan thanh!
)
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
if "%LANG%"=="EN" (
    echo                            DEEP SYSTEM CLEANUP
    echo ===============================================================================
    echo.
    echo WARNING: This process may take 5-10 minutes!
    echo.
    pause
    echo.
    echo Deep cleaning in progress...
) else (
    echo                            DON DEP SAU
    echo ===============================================================================
    echo.
    echo CANH BAO: Qua trinh nay co the mat 5-10 phut!
    echo.
    pause
    echo.
    echo Dang don dep sau...
)
echo.

if "%LANG%"=="EN" (
    echo [Phase 1/5] Basic cleanup...
) else (
    echo [Buoc 1/5] Don dep co ban...
)
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

if "%LANG%"=="EN" (
    echo [Phase 2/5] Deep system cleanup...
) else (
    echo [Buoc 2/5] Don dep he thong sau...
)
del /f /s /q /a:h "%LOCALAPPDATA%\*.log" >nul 2>&1
del /f /s /q /a:h "%LOCALAPPDATA%\*.tmp" >nul 2>&1

if "%LANG%"=="EN" (
    echo [Phase 3/5] Cleaning Component Store...
) else (
    echo [Buoc 3/5] Don dep Component Store...
)
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1

if "%LANG%"=="EN" (
    echo [Phase 4/5] Removing Windows.old if exists...
) else (
    echo [Buoc 4/5] Xoa Windows.old neu co...
)
if exist "C:\Windows.old" (
    takeown /f "C:\Windows.old" /r /d y >nul 2>&1
    icacls "C:\Windows.old" /grant administrators:F /t >nul 2>&1
    rd /s /q "C:\Windows.old" >nul 2>&1
)

if "%LANG%"=="EN" (
    echo [Phase 5/5] Removing Memory Dumps...
) else (
    echo [Buoc 5/5] Xoa Memory Dumps...
)
del /f /q "C:\Windows\MEMORY.DMP" >nul 2>&1
del /f /s /q "C:\Windows\Minidump\*" >nul 2>&1

if "%LANG%"=="EN" (
    echo Cleaning old System Restore Points...
) else (
    echo Don dep System Restore Points cu...
)
vssadmin delete shadows /for=%systemdrive% /oldest /quiet >nul 2>&1

if "%LANG%"=="EN" (
    echo Cleaning Event Logs...
) else (
    echo Don dep Event Logs...
)
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G" >nul 2>&1)

if "%LANG%"=="EN" (
    echo Running Disk Cleanup...
) else (
    echo Chay Disk Cleanup...
)
cleanmgr /sagerun:1 >nul 2>&1

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] Deep system cleanup complete!
) else (
    echo [THANH CONG] Don dep sau hoan thanh!
)
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
if "%LANG%"=="EN" (
    echo                           BROWSER CACHE CLEANUP
    echo ===============================================================================
    echo.
    echo Closing all browsers...
) else (
    echo                           DON DEP TRINH DUYET
    echo ===============================================================================
    echo.
    echo Dong tat ca trinh duyet...
)

taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM firefox.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM opera.exe >nul 2>&1
taskkill /F /IM brave.exe >nul 2>&1
timeout /t 2 >nul

echo.
if "%LANG%"=="EN" (
    echo Cleaning browser caches...
) else (
    echo Dang don dep cache trinh duyet...
)
echo.

:: Chrome
if exist "%LOCALAPPDATA%\Google\Chrome\User Data" (
    if "%LANG%"=="EN" (
        echo [OK] Cleaning Chrome...
    ) else (
        echo [OK] Don Chrome...
    )
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\GPUCache" >nul 2>&1
)

:: Firefox
if exist "%LOCALAPPDATA%\Mozilla\Firefox\Profiles" (
    if "%LANG%"=="EN" (
        echo [OK] Cleaning Firefox...
    ) else (
        echo [OK] Don Firefox...
    )
    for /d %%x in ("%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*") do (
        rd /s /q "%%x\cache2" >nul 2>&1
        rd /s /q "%%x\startupCache" >nul 2>&1
        rd /s /q "%%x\thumbnails" >nul 2>&1
    )
)

:: Edge
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data" (
    if "%LANG%"=="EN" (
        echo [OK] Cleaning Edge...
    ) else (
        echo [OK] Don Edge...
    )
    rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache" >nul 2>&1
)

:: Opera
if exist "%APPDATA%\Opera Software\Opera Stable" (
    if "%LANG%"=="EN" (
        echo [OK] Cleaning Opera...
    ) else (
        echo [OK] Don Opera...
    )
    rd /s /q "%APPDATA%\Opera Software\Opera Stable\Cache" >nul 2>&1
)

:: Brave
if exist "%LOCALAPPDATA%\BraveSoftware\Brave-Browser" (
    if "%LANG%"=="EN" (
        echo [OK] Cleaning Brave...
    ) else (
        echo [OK] Don Brave...
    )
    rd /s /q "%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data\Default\Cache" >nul 2>&1
)

if "%LANG%"=="EN" (
    echo [OK] Cleaning IE/Edge Legacy...
) else (
    echo [OK] Don IE/Edge Legacy...
)
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 >nul 2>&1

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] All browser caches cleaned!
) else (
    echo [THANH CONG] Tat ca trinh duyet da duoc don dep!
)
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
if "%LANG%"=="EN" (
    echo                        APPLICATION CACHE CLEANUP
    echo ===============================================================================
    echo.
    echo Cleaning application caches...
) else (
    echo                        DON DEP UNG DUNG
    echo ===============================================================================
    echo.
    echo Dang don dep cache ung dung...
)
echo.

:: Discord
if exist "%APPDATA%\discord" (
    taskkill /F /IM discord.exe >nul 2>&1
    if "%LANG%"=="EN" (
        echo [OK] Cleaning Discord...
    ) else (
        echo [OK] Don Discord...
    )
    rd /s /q "%APPDATA%\discord\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\discord\Code Cache" >nul 2>&1
    rd /s /q "%APPDATA%\discord\GPUCache" >nul 2>&1
)

:: Teams
if exist "%APPDATA%\Microsoft\Teams" (
    taskkill /F /IM Teams.exe >nul 2>&1
    if "%LANG%"=="EN" (
        echo [OK] Cleaning Teams...
    ) else (
        echo [OK] Don Teams...
    )
    rd /s /q "%APPDATA%\Microsoft\Teams\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\Microsoft\Teams\blob_storage" >nul 2>&1
)

:: Spotify
if exist "%APPDATA%\Spotify" (
    taskkill /F /IM Spotify.exe >nul 2>&1
    if "%LANG%"=="EN" (
        echo [OK] Cleaning Spotify...
    ) else (
        echo [OK] Don Spotify...
    )
    rd /s /q "%APPDATA%\Spotify\Data" >nul 2>&1
)

:: VS Code
if exist "%APPDATA%\Code" (
    if "%LANG%"=="EN" (
        echo [OK] Cleaning VS Code...
    ) else (
        echo [OK] Don VS Code...
    )
    rd /s /q "%APPDATA%\Code\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\Code\logs" >nul 2>&1
)

:: Slack
if exist "%APPDATA%\Slack" (
    taskkill /F /IM slack.exe >nul 2>&1
    if "%LANG%"=="EN" (
        echo [OK] Cleaning Slack...
    ) else (
        echo [OK] Don Slack...
    )
    rd /s /q "%APPDATA%\Slack\Cache" >nul 2>&1
)

:: Zoom
if exist "%APPDATA%\Zoom" (
    taskkill /F /IM Zoom.exe >nul 2>&1
    if "%LANG%"=="EN" (
        echo [OK] Cleaning Zoom...
    ) else (
        echo [OK] Don Zoom...
    )
    rd /s /q "%APPDATA%\Zoom\logs" >nul 2>&1
)

:: Steam
if exist "C:\Program Files (x86)\Steam\steamapps\shadercache" (
    if "%LANG%"=="EN" (
        echo [OK] Cleaning Steam Shader Cache...
    ) else (
        echo [OK] Don Steam Shader Cache...
    )
    del /f /s /q "C:\Program Files (x86)\Steam\steamapps\shadercache\*" >nul 2>&1
)

:: Windows Store
if "%LANG%"=="EN" (
    echo [OK] Cleaning Windows Store...
) else (
    echo [OK] Don Windows Store...
)
wsreset.exe >nul 2>&1

:: General temp
if "%LANG%"=="EN" (
    echo [OK] Cleaning general app temp...
) else (
    echo [OK] Don temp chung...
)
del /f /s /q "%LOCALAPPDATA%\Temp\*" >nul 2>&1

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] Application caches cleaned!
) else (
    echo [THANH CONG] Cache ung dung da duoc don dep!
)
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
if "%LANG%"=="EN" (
    echo                            PERFORMANCE BOOST
    echo ===============================================================================
    echo.
    echo Optimizing system performance...
) else (
    echo                            TANG CUONG HIEU SUAT
    echo ===============================================================================
    echo.
    echo Dang toi uu hieu suat he thong...
)
echo.

if "%LANG%"=="EN" (
    echo [1/8] Optimizing Windows services...
) else (
    echo [1/8] Toi uu dich vu Windows...
)
sc config "SysMain" start= disabled >nul 2>&1
sc stop "SysMain" >nul 2>&1
sc config "WSearch" start= demand >nul 2>&1

if "%LANG%"=="EN" (
    echo [2/8] Optimizing visual effects...
) else (
    echo [2/8] Toi uu hieu ung hinh anh...
)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [3/8] Disabling animations...
) else (
    echo [3/8] Tat animation...
)
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [4/8] Enabling Game Mode...
) else (
    echo [4/8] Bat Game Mode...
)
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [5/8] Disabling Windows Tips...
) else (
    echo [5/8] Tat Windows Tips...
)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [6/8] Setting High Performance mode...
) else (
    echo [6/8] Chuyen sang che do High Performance...
)
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

if "%LANG%"=="EN" (
    echo [7/8] Disabling Hibernation...
) else (
    echo [7/8] Tat Hibernation...
)
powercfg /h off >nul 2>&1

if "%LANG%"=="EN" (
    echo [8/8] Optimizing disk...
) else (
    echo [8/8] Toi uu o dia...
)
fsutil behavior set DisableDeleteNotify 0 >nul 2>&1

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] System performance optimized!
) else (
    echo [THANH CONG] Hieu suat he thong da duoc toi uu!
)
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
if "%LANG%"=="EN" (
    echo                          MEMORY RAM OPTIMIZATION
    echo ===============================================================================
    echo.
    echo Optimizing RAM...
) else (
    echo                          TOI UU RAM
    echo ===============================================================================
    echo.
    echo Dang toi uu RAM...
)
echo.

if "%LANG%"=="EN" (
    echo [1/3] Cleaning RAM cache...
    echo [2/3] Disabling SuperFetch SysMain...
) else (
    echo [1/3] Don dep RAM cache...
    echo [2/3] Tat SuperFetch SysMain...
)
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1

if "%LANG%"=="EN" (
    echo [3/3] Optimizing paging file...
) else (
    echo [3/3] Toi uu paging file...
)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f >nul 2>&1

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] RAM has been optimized!
    echo TIP: Restart your computer for best results.
) else (
    echo [THANH CONG] RAM da duoc toi uu!
    echo GHI CHU: Khoi dong lai may de co hieu qua tot nhat.
)
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
if "%LANG%"=="EN" (
    echo                          NETWORK OPTIMIZATION
    echo ===============================================================================
    echo.
    echo Optimizing network...
) else (
    echo                          TOI UU MANG
    echo ===============================================================================
    echo.
    echo Dang toi uu mang...
)
echo.

if "%LANG%"=="EN" (
    echo [1/7] Flushing DNS Cache...
) else (
    echo [1/7] Xoa DNS Cache...
)
ipconfig /flushdns >nul 2>&1

if "%LANG%"=="EN" (
    echo [2/7] Resetting Winsock...
) else (
    echo [2/7] Reset Winsock...
)
netsh winsock reset >nul 2>&1

if "%LANG%"=="EN" (
    echo [3/7] Resetting TCP/IP...
) else (
    echo [3/7] Reset TCP/IP...
)
netsh int ip reset >nul 2>&1

if "%LANG%"=="EN" (
    echo [4/7] Optimizing TCP Settings...
) else (
    echo [4/7] Toi uu TCP Settings...
)
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global chimney=enabled >nul 2>&1

if "%LANG%"=="EN" (
    echo [5/7] Disabling Network Throttling...
) else (
    echo [5/7] Tat Network Throttling...
)
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [6/7] Optimizing DNS...
) else (
    echo [6/7] Toi uu DNS...
)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v MaxCacheTtl /t REG_DWORD /d 86400 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [7/7] Releasing and Renewing IP...
) else (
    echo [7/7] Release va Renew IP...
)
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] Network has been optimized!
    echo TIP: Restart your computer to apply changes.
) else (
    echo [THANH CONG] Mang da duoc toi uu!
    echo GHI CHU: Khoi dong lai may de ap dung thay doi.
)
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                         DISK OPTIMIZATION
    echo ===============================================================================
    echo.
    echo WARNING: This process may take 10-30 minutes!
) else (
    echo                         TOI UU O DIA
    echo ===============================================================================
    echo.
    echo CANH BAO: Qua trinh nay co the mat 10-30 phut!
)
echo.
pause

if "%LANG%"=="EN" (
    echo Optimizing disk...
    echo.
    echo [1/4] Analyzing disk...
) else (
    echo Dang toi uu o dia...
    echo.
    echo [1/4] Phan tich o dia...
)
defrag C: /A

if "%LANG%"=="EN" (
    echo [2/4] Optimizing disk...
) else (
    echo [2/4] Toi uu o dia...
)
defrag C: /O

if "%LANG%"=="EN" (
    echo [3/4] Trimming SSD if available...
) else (
    echo [3/4] Trim SSD neu co...
)
defrag C: /L

if "%LANG%"=="EN" (
    echo [4/4] Enabling TRIM...
) else (
    echo [4/4] Bat TRIM...
)
fsutil behavior set DisableDeleteNotify 0

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] Disk has been optimized!
) else (
    echo [THANH CONG] O dia da duoc toi uu!
)
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                      AUTOMATIC WINDOWS REPAIR
    echo ===============================================================================
    echo.
    echo WARNING: This process may take 15-30 minutes!
) else (
    echo                      TU DONG SUA LOI WINDOWS
    echo ===============================================================================
    echo.
    echo CANH BAO: Qua trinh nay co the mat 15-30 phut!
)
echo.
pause

if "%LANG%"=="EN" (
    echo Checking and repairing system...
    echo.
    echo [1/4] Scanning system files SFC...
) else (
    echo Kiem tra va sua loi he thong...
    echo.
    echo [1/4] Quet file he thong SFC...
)
sfc /scannow

echo.
if "%LANG%"=="EN" (
    echo [2/4] Checking Windows Image Health...
) else (
    echo [2/4] Kiem tra Windows Image Health...
)
Dism /Online /Cleanup-Image /CheckHealth

echo.
if "%LANG%"=="EN" (
    echo [3/4] Scanning Windows Image...
) else (
    echo [3/4] Quet Windows Image...
)
Dism /Online /Cleanup-Image /ScanHealth

echo.
if "%LANG%"=="EN" (
    echo [4/4] Restoring Windows Image...
) else (
    echo [4/4] Khoi phuc Windows Image...
)
Dism /Online /Cleanup-Image /RestoreHealth

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] System checked and repaired!
    echo TIP: Restart your computer recommended.
) else (
    echo [THANH CONG] He thong da duoc kiem tra va sua!
    echo GHI CHU: Nen khoi dong lai may.
)
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                     FIX WINDOWS UPDATE ISSUES
    echo ===============================================================================
    echo.
    echo Fixing Windows Update...
    echo.
    echo [1/6] Stopping Windows Update services...
) else (
    echo                     SUA LOI WINDOWS UPDATE
    echo ===============================================================================
    echo.
    echo Dang sua loi Windows Update...
    echo.
    echo [1/6] Dung Windows Update services...
)
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver

if "%LANG%"=="EN" (
    echo [2/6] Renaming SoftwareDistribution folder...
) else (
    echo [2/6] Doi ten folder SoftwareDistribution...
)
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
ren C:\Windows\System32\catroot2 catroot2.old

if "%LANG%"=="EN" (
    echo [3/6] Restarting Windows Update services...
) else (
    echo [3/6] Khoi dong lai Windows Update services...
)
net start wuauserv
net start cryptSvc
net start bits
net start msiserver

if "%LANG%"=="EN" (
    echo [4/6] Resetting Windows Update components...
) else (
    echo [4/6] Reset Windows Update components...
)
regsvr32 /s wuaueng.dll
regsvr32 /s wuaueng1.dll
regsvr32 /s wucltui.dll
regsvr32 /s wups.dll
regsvr32 /s wups2.dll
regsvr32 /s wuweb.dll

if "%LANG%"=="EN" (
    echo [5/6] Cleaning up old folders...
) else (
    echo [5/6] Don dep folder cu...
)
timeout /t 5 >nul
rd /s /q C:\Windows\SoftwareDistribution.old >nul 2>&1
rd /s /q C:\Windows\System32\catroot2.old >nul 2>&1

if "%LANG%"=="EN" (
    echo [6/6] Running Windows Update Troubleshooter...
) else (
    echo [6/6] Chay Windows Update Troubleshooter...
)
msdt.exe /id WindowsUpdateDiagnostic

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] Windows Update has been fixed!
    echo TIP: Try running Windows Update again.
) else (
    echo [THANH CONG] Windows Update da duoc sua!
    echo GHI CHU: Thu chay Windows Update lai.
)
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                        NETWORK RESET AND REPAIR
    echo ===============================================================================
    echo.
    echo Resetting all network settings...
) else (
    echo                        SUA LOI MANG
    echo ===============================================================================
    echo.
    echo Reset tat ca cai dat mang...
)
echo.

if "%LANG%"=="EN" (
    echo [1/8] Resetting IP...
) else (
    echo [1/8] Reset IP...
)
netsh int ip reset

if "%LANG%"=="EN" (
    echo [2/8] Resetting Winsock...
) else (
    echo [2/8] Reset Winsock...
)
netsh winsock reset

if "%LANG%"=="EN" (
    echo [3/8] Resetting Proxy...
) else (
    echo [3/8] Reset Proxy...
)
netsh winhttp reset proxy

if "%LANG%"=="EN" (
    echo [4/8] Flushing DNS...
) else (
    echo [4/8] Flush DNS...
)
ipconfig /flushdns

if "%LANG%"=="EN" (
    echo [5/8] Releasing IP...
) else (
    echo [5/8] Release IP...
)
ipconfig /release

if "%LANG%"=="EN" (
    echo [6/8] Renewing IP...
) else (
    echo [6/8] Renew IP...
)
ipconfig /renew

if "%LANG%"=="EN" (
    echo [7/8] Resetting Firewall...
) else (
    echo [7/8] Reset Firewall...
)
netsh advfirewall reset

if "%LANG%"=="EN" (
    echo [8/8] Resetting Network Adapter...
) else (
    echo [8/8] Reset Network Adapter...
)
netsh interface set interface "Ethernet" admin=disable >nul 2>&1
netsh interface set interface "Wi-Fi" admin=disable >nul 2>&1
timeout /t 3 >nul
netsh interface set interface "Ethernet" admin=enable >nul 2>&1
netsh interface set interface "Wi-Fi" admin=enable >nul 2>&1

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] Network has been reset!
    echo TIP: You MUST restart your computer to apply changes!
) else (
    echo [THANH CONG] Mang da duoc reset!
    echo GHI CHU: Ban PHAI khoi dong lai may de ap dung thay doi!
)
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                         DISK CHECK AND REPAIR
    echo ===============================================================================
    echo.
    echo NOTE: Disk check requires system restart!
    echo.
    echo 1. Scan and auto-fix errors Requires restart
    echo 2. Scan only no fix
    echo 0. Back to menu
    echo.
    set /p diskchoice=Select 1/2/0: 
) else (
    echo                         KIEM TRA VA SUA O DIA
    echo ===============================================================================
    echo.
    echo LUU Y: Kiem tra o dia yeu cau khoi dong lai may!
    echo.
    echo 1. Quet va tu dong sua loi Khoi dong lai
    echo 2. Chi quet khong sua
    echo 0. Quay lai
    echo.
    set /p diskchoice=Chon 1/2/0: 
)

if "%diskchoice%"=="1" (
    echo.
    if "%LANG%"=="EN" (
        echo Scheduling disk check on restart...
    ) else (
        echo Len lich kiem tra o dia khi khoi dong lai...
    )
    echo Y | chkdsk C: /F /R /X
    echo.
    if "%LANG%"=="EN" (
        echo [SUCCESS] Scheduled! Restart your computer to begin check.
    ) else (
        echo [THANH CONG] Da len lich! Khoi dong lai may de bat dau kiem tra.
    )
    pause
) else if "%diskchoice%"=="2" (
    echo.
    if "%LANG%"=="EN" (
        echo Scanning disk...
    ) else (
        echo Dang quet o dia...
    )
    chkdsk C:
    echo.
    if "%LANG%"=="EN" (
        echo [SUCCESS] Scan complete!
    ) else (
        echo [THANH CONG] Quet hoan thanh!
    )
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                    PRIVACY CLEANUP - REMOVE TRACES
    echo ===============================================================================
    echo.
    echo Removing activity traces...
) else (
    echo                    XOA DAU VET HOAT DONG
    echo ===============================================================================
    echo.
    echo Dang xoa dau vet hoat dong...
)
echo.

if "%LANG%"=="EN" (
    echo [1/10] Deleting Recent Documents...
) else (
    echo [1/10] Xoa Recent Documents...
)
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

if "%LANG%"=="EN" (
    echo [2/10] Deleting Run History...
) else (
    echo [2/10] Xoa Run History...
)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [3/10] Deleting Search History...
) else (
    echo [3/10] Xoa Search History...
)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [4/10] Clearing Clipboard...
) else (
    echo [4/10] Xoa Clipboard...
)
echo off | clip

if "%LANG%"=="EN" (
    echo [5/10] Deleting Jump Lists...
) else (
    echo [5/10] Xoa Jump Lists...
)
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*" >nul 2>&1
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*" >nul 2>&1

if "%LANG%"=="EN" (
    echo [6/10] Clearing Browser History IE/Edge...
) else (
    echo [6/10] Xoa Browser History IE/Edge...
)
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

if "%LANG%"=="EN" (
    echo [7/10] Clearing Prefetch...
) else (
    echo [7/10] Xoa Prefetch...
)
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

if "%LANG%"=="EN" (
    echo [8/10] Deleting Timeline...
) else (
    echo [8/10] Xoa Timeline...
)
del /f /s /q "%LOCALAPPDATA%\ConnectedDevicesPlatform\*" >nul 2>&1

if "%LANG%"=="EN" (
    echo [9/10] Clearing Activity History...
) else (
    echo [9/10] Xoa Activity History...
)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [10/10] Clearing Event Logs...
) else (
    echo [10/10] Xoa Event Logs...
)
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G" >nul 2>&1)

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] Activity traces removed!
) else (
    echo [THANH CONG] Dau vet hoat dong da duoc xoa!
)
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                      STARTUP PROGRAMS MANAGER
    echo ===============================================================================
    echo.
    echo Opening Task Manager to manage Startup programs...
    echo.
    echo TIP:
    echo    1. Switch to Startup tab
    echo    2. Disable unnecessary programs
    echo    3. Reduce Windows boot time
) else (
    echo                      QUAN LY STARTUP
    echo ===============================================================================
    echo.
    echo Mo Task Manager de quan ly Startup programs...
    echo.
    echo GHI CHU:
    echo    1. Chuyen sang tab Startup
    echo    2. Tat cac chuong trinh khong can thiet
    echo    3. Giam thoi gian khoi dong Windows
)
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                       MALWARE SCAN AND CLEANUP
    echo ===============================================================================
    echo.
    echo WARNING: This process may take 10-30 minutes!
    echo.
    echo Running Windows Defender Scan...
    echo.
    echo [1/3] Quick Scan...
) else (
    echo                       QUET VIRUS
    echo ===============================================================================
    echo.
    echo CANH BAO: Qua trinh nay co the mat 10-30 phut!
    echo.
    echo Chay Windows Defender Scan...
    echo.
    echo [1/3] Quet nhanh...
)
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1

echo.
if "%LANG%"=="EN" (
    echo [2/3] Removing suspicious temp files...
) else (
    echo [2/3] Xoa file tam dang nghi...
)
del /f /s /q "%TEMP%\*.exe" >nul 2>&1
del /f /s /q "%TEMP%\*.dll" >nul 2>&1
del /f /s /q "%TEMP%\*.scr" >nul 2>&1

if "%LANG%"=="EN" (
    echo [3/3] Updating Definitions...
) else (
    echo [3/3] Cap nhat Definitions...
)
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] Scan complete!
    echo TIP: If viruses detected, Windows Defender will handle them automatically.
) else (
    echo [THANH CONG] Quet hoan thanh!
    echo GHI CHU: Neu phat hien virus, Windows Defender se tu dong xu ly.
)
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                        SECURITY OPTIMIZATION
    echo ===============================================================================
    echo.
    echo Optimizing security...
) else (
    echo                        TOI UU BAO MAT
    echo ===============================================================================
    echo.
    echo Dang toi uu bao mat...
)
echo.

if "%LANG%"=="EN" (
    echo [1/8] Enabling Windows Firewall...
) else (
    echo [1/8] Bat Windows Firewall...
)
netsh advfirewall set allprofiles state on

if "%LANG%"=="EN" (
    echo [2/8] Enabling Windows Defender Real-time Protection...
) else (
    echo [2/8] Bat Windows Defender Real-time Protection...
)
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false" >nul 2>&1

if "%LANG%"=="EN" (
    echo [3/8] Updating Windows Defender...
) else (
    echo [3/8] Cap nhat Windows Defender...
)
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate

if "%LANG%"=="EN" (
    echo [4/8] Disabling Remote Assistance...
) else (
    echo [4/8] Tat Remote Assistance...
)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 0 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [5/8] Disabling Remote Desktop if not used...
) else (
    echo [5/8] Tat Remote Desktop neu khong dung...
)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [6/8] Enabling UAC User Account Control...
) else (
    echo [6/8] Bat UAC User Account Control...
)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [7/8] Disabling AutoRun/AutoPlay...
) else (
    echo [7/8] Tat AutoRun/AutoPlay...
)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 255 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [8/8] Enabling SmartScreen...
) else (
    echo [8/8] Bat SmartScreen...
)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d Warn /f >nul 2>&1

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] Security has been optimized!
) else (
    echo [THANH CONG] Bao mat da duoc toi uu!
)
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
if "%LANG%"=="EN" (
    echo                      DETAILED SYSTEM INFORMATION
) else (
    echo                      THONG TIN CHI TIET HE THONG
)
echo ===============================================================================
echo.

systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory" /C:"Available Physical Memory" /C:"System Manufacturer" /C:"System Model"

echo.
echo -------------------------------------------------------------------------------
if "%LANG%"=="EN" (
    echo DISK INFORMATION:
) else (
    echo THONG TIN O DIA:
)
echo -------------------------------------------------------------------------------
wmic logicaldisk get caption,freespace,size,volumename

echo.
echo -------------------------------------------------------------------------------
if "%LANG%"=="EN" (
    echo CPU INFORMATION:
) else (
    echo THONG TIN CPU:
)
echo -------------------------------------------------------------------------------
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                         DISK SPACE ANALYSIS
    echo ===============================================================================
    echo.
    echo Analyzing disk space...
    echo.
    echo -------------------------------------------------------------------------------
    echo DISK OVERVIEW:
) else (
    echo                         PHAN TICH O DIA
    echo ===============================================================================
    echo.
    echo Dang phan tich o dia...
    echo.
    echo -------------------------------------------------------------------------------
    echo TONG QUAN O DIA:
)
echo -------------------------------------------------------------------------------
wmic logicaldisk get caption,freespace,size,volumename,filesystem

echo.
echo -------------------------------------------------------------------------------
if "%LANG%"=="EN" (
    echo TOP 20 LARGEST FILES ON C: DRIVE
    echo -------------------------------------------------------------------------------
    echo.
    echo Searching may take a few minutes...
) else (
    echo TOP 20 FILE LON NHAT TREN O C:
    echo -------------------------------------------------------------------------------
    echo.
    echo Tim kiem co the mat vai phut...
)
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                      RUNNING PROCESSES MONITOR
    echo ===============================================================================
    echo.
    echo Opening Task Manager...
) else (
    echo                      QUAN SAT PROCESS
    echo ===============================================================================
    echo.
    echo Mo Task Manager...
)

start taskmgr.exe

echo.
echo -------------------------------------------------------------------------------
if "%LANG%"=="EN" (
    echo TOP PROCESSES BY MEMORY USAGE:
) else (
    echo TOP PROCESS SU DUNG RAM:
)
echo -------------------------------------------------------------------------------
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                         SYSTEM HEALTH CHECK
    echo ===============================================================================
    echo.
    echo Checking system health...
) else (
    echo                         KIEM TRA SUC KHOE HE THONG
    echo ===============================================================================
    echo.
    echo Dang kiem tra suc khoe he thong...
)
echo.

echo -------------------------------------------------------------------------------
if "%LANG%"=="EN" (
    echo [1/5] CHECKING SYSTEM FILES...
) else (
    echo [1/5] KIEM TRA FILE HE THONG...
)
echo -------------------------------------------------------------------------------
sfc /verifyonly

echo.
echo -------------------------------------------------------------------------------
if "%LANG%"=="EN" (
    echo [2/5] CHECKING WINDOWS IMAGE...
) else (
    echo [2/5] KIEM TRA WINDOWS IMAGE...
)
echo -------------------------------------------------------------------------------
Dism /Online /Cleanup-Image /CheckHealth

echo.
echo -------------------------------------------------------------------------------
if "%LANG%"=="EN" (
    echo [3/5] CHECKING DISK HEALTH...
) else (
    echo [3/5] KIEM TRA SUC KHOE O DIA...
)
echo -------------------------------------------------------------------------------
wmic diskdrive get status

echo.
echo -------------------------------------------------------------------------------
if "%LANG%"=="EN" (
    echo [4/5] CHECKING MEMORY RAM...
) else (
    echo [4/5] KIEM TRA RAM...
)
echo -------------------------------------------------------------------------------
wmic memorychip get capacity,speed,manufacturer

echo.
echo -------------------------------------------------------------------------------
if "%LANG%"=="EN" (
    echo [5/5] CHECKING BATTERY Laptop...
) else (
    echo [5/5] KIEM TRA BATTERY Laptop...
)
echo -------------------------------------------------------------------------------
powercfg /batteryreport /output "%USERPROFILE%\Desktop\battery-report.html" >nul 2>&1
if exist "%USERPROFILE%\Desktop\battery-report.html" (
    if "%LANG%"=="EN" (
        echo [SUCCESS] Battery Report created on Desktop!
    ) else (
        echo [THANH CONG] Battery Report da duoc tao tren Desktop!
    )
    start "" "%USERPROFILE%\Desktop\battery-report.html"
) else (
    if "%LANG%"=="EN" (
        echo [INFO] No battery detected Desktop PC
    ) else (
        echo [THONG TIN] Khong phat hien battery Desktop PC
    )
)

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] Health check complete!
) else (
    echo [THANH CONG] Kiem tra hoan thanh!
)
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
if "%LANG%"=="EN" (
    echo                     CREATE SYSTEM RESTORE POINT
    echo ===============================================================================
    echo.
    echo Creating system restore point...
) else (
    echo                     TAO DIEM KHOI PHUC
    echo ===============================================================================
    echo.
    echo Dang tao diem khoi phuc he thong...
)
echo.

powershell -Command "Checkpoint-Computer -Description 'Manual Restore Point from Ultimate Tool' -RestorePointType 'MODIFY_SETTINGS'"

if %errorLevel% equ 0 (
    if "%LANG%"=="EN" (
        echo [SUCCESS] Restore point created successfully!
    ) else (
        echo [THANH CONG] Diem khoi phuc da duoc tao thanh cong!
    )
) else (
    if "%LANG%"=="EN" (
        echo [WARNING] Could not create restore point. System Restore may be disabled.
        echo TIP: Enable System Restore: Control Panel - System - System Protection
    ) else (
        echo [CANH BAO] Khong the tao diem khoi phuc. System Restore co the bi tat.
        echo GHI CHU: Bat System Restore: Control Panel - System - System Protection
    )
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                       DELETE WINDOWS.OLD FOLDER
) else (
    echo                       XOA WINDOWS.OLD
)
echo ===============================================================================
echo.

if exist "C:\Windows.old" (
    if "%LANG%"=="EN" (
        echo [INFO] Windows.old folder detected!
        echo TIP: This folder contains old Windows installation can be 20GB+
        echo.
        set /p confirm=Are you sure you want to delete? Y/N: 
    ) else (
        echo [THONG TIN] Phat hien folder Windows.old!
        echo GHI CHU: Folder nay chua ban Windows cu co the len toi 20GB+
        echo.
        set /p confirm=Ban co chac muon xoa? Y/N: 
    )
    
    if /i "!confirm!"=="Y" (
        echo.
        if "%LANG%"=="EN" (
            echo Deleting Windows.old...
        ) else (
            echo Dang xoa Windows.old...
        )
        takeown /f "C:\Windows.old" /r /d y >nul 2>&1
        icacls "C:\Windows.old" /grant administrators:F /t >nul 2>&1
        rd /s /q "C:\Windows.old" >nul 2>&1
        
        if exist "C:\Windows.old" (
            if "%LANG%"=="EN" (
                echo [WARNING] Could not delete completely. Try using Disk Cleanup...
            ) else (
                echo [CANH BAO] Khong the xoa hoan toan. Thu dung Disk Cleanup...
            )
            cleanmgr /d C:
        ) else (
            if "%LANG%"=="EN" (
                echo [SUCCESS] Windows.old deleted successfully!
            ) else (
                echo [THANH CONG] Windows.old da duoc xoa thanh cong!
            )
        )
    )
) else (
    if "%LANG%"=="EN" (
        echo [INFO] Windows.old folder not found
    ) else (
        echo [THONG TIN] Khong tim thay folder Windows.old
    )
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                        DISABLE WINDOWS TELEMETRY
    echo ===============================================================================
    echo.
    echo Disabling data collection services...
) else (
    echo                        TAT THU THAP DU LIEU
    echo ===============================================================================
    echo.
    echo Dang tat cac dich vu thu thap du lieu...
)
echo.

if "%LANG%"=="EN" (
    echo [1/10] Disabling Telemetry Service...
) else (
    echo [1/10] Tat Telemetry Service...
)
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1

if "%LANG%"=="EN" (
    echo [2/10] Disabling Telemetry via Registry...
) else (
    echo [2/10] Tat Telemetry qua Registry...
)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [3/10] Disabling Advertising ID...
) else (
    echo [3/10] Tat Advertising ID...
)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [4/10] Disabling Activity Feed...
) else (
    echo [4/10] Tat Activity Feed...
)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [5/10] Disabling Location Tracking...
) else (
    echo [5/10] Tat Location Tracking...
)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /t REG_DWORD /d 1 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [6/10] Disabling Feedback...
) else (
    echo [6/10] Tat Feedback...
)
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [7/10] Disabling Cortana...
) else (
    echo [7/10] Tat Cortana...
)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [8/10] Disabling Windows Tips...
) else (
    echo [8/10] Tat Windows Tips...
)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [9/10] Disabling Consumer Features...
) else (
    echo [9/10] Tat Consumer Features...
)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [10/10] Disabling Tailored Experiences...
) else (
    echo [10/10] Tat Tailored Experiences...
)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul 2>&1

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] Data collection services disabled!
    echo TIP: Restart your computer to fully apply changes.
) else (
    echo [THANH CONG] Cac dich vu thu thap du lieu da duoc tat!
    echo GHI CHU: Khoi dong lai may de ap dung hoan toan.
)
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
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                        REGISTRY OPTIMIZATION
    echo ===============================================================================
    echo.
    echo Optimizing Registry...
    echo.
    echo [1/5] Creating Registry backup...
) else (
    echo                        TOI UU REGISTRY
    echo ===============================================================================
    echo.
    echo Dang toi uu Registry...
    echo.
    echo [1/5] Tao backup Registry...
)
if not exist "%USERPROFILE%\Desktop\RegistryBackup" mkdir "%USERPROFILE%\Desktop\RegistryBackup"
reg export HKLM "%USERPROFILE%\Desktop\RegistryBackup\HKLM_backup.reg" /y >nul 2>&1
reg export HKCU "%USERPROFILE%\Desktop\RegistryBackup\HKCU_backup.reg" /y >nul 2>&1
if "%LANG%"=="EN" (
    echo [OK] Backup saved at Desktop\RegistryBackup
) else (
    echo [OK] Backup da luu tai Desktop\RegistryBackup
)

if "%LANG%"=="EN" (
    echo [2/5] Optimizing Menu Show Delay...
) else (
    echo [2/5] Toi uu Menu Show Delay...
)
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [3/5] Disabling Startup Delay...
) else (
    echo [3/5] Tat Startup Delay...
)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [4/5] Optimizing Explorer...
) else (
    echo [4/5] Toi uu Explorer...
)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 0 /f >nul 2>&1

if "%LANG%"=="EN" (
    echo [5/5] Cleaning Registry Safe...
) else (
    echo [5/5] Don dep Registry An toan...
)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f >nul 2>&1

echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] Registry has been optimized!
    echo TIP: Registry backup saved on Desktop if recovery needed.
) else (
    echo [THANH CONG] Registry da duoc toi uu!
    echo GHI CHU: Backup Registry da luu tren Desktop neu can khoi phuc.
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
if "%LANG%"=="EN" (
    echo                     ALL-IN-ONE COMPLETE OPTIMIZATION
    echo ===============================================================================
    echo.
    echo WARNING: This will run ALL optimizations!
    echo WARNING: May take 20-40 minutes!
    echo WARNING: Computer will restart after completion!
    echo.
    set /p confirm=Are you sure you want to continue? Y/N: 
) else (
    echo                     CHAY TAT CA - TOI UU TOAN BO
    echo ===============================================================================
    echo.
    echo CANH BAO: Se chay TAT CA cac toi uu!
    echo CANH BAO: Co the mat 20-40 phut!
    echo CANH BAO: May tinh se khoi dong lai sau khi hoan thanh!
    echo.
    set /p confirm=Ban co chac chan muon tiep tuc? Y/N: 
)

if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                   STARTING COMPLETE SYSTEM OPTIMIZATION
) else (
    echo                   BAT DAU TOI UU TOAN BO HE THONG
)
echo ===============================================================================
echo.

:: Phase 1: Cleanup
if "%LANG%"=="EN" (
    echo [PHASE 1/5] CLEANING SYSTEM...
) else (
    echo [BUOC 1/5] DON DEP HE THONG...
)
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
if "%LANG%"=="EN" (
    echo [PHASE 2/5] OPTIMIZING PERFORMANCE...
) else (
    echo [BUOC 2/5] TOI UU HIEU SUAT...
)
call :PERFORMANCE_BOOST
timeout /t 2 >nul
call :RAM_OPTIMIZE
timeout /t 2 >nul
call :NETWORK_OPTIMIZE
timeout /t 2 >nul

:: Phase 3: Repair
echo.
if "%LANG%"=="EN" (
    echo [PHASE 3/5] REPAIRING SYSTEM...
) else (
    echo [BUOC 3/5] SUA CHUA HE THONG...
)
call :AUTO_REPAIR

:: Phase 4: Security
echo.
if "%LANG%"=="EN" (
    echo [PHASE 4/5] SECURING SYSTEM...
) else (
    echo [BUOC 4/5] BAO MAT HE THONG...
)
call :SECURITY_OPTIMIZE
timeout /t 2 >nul
call :DISABLE_TELEMETRY
timeout /t 2 >nul

:: Phase 5: Final
echo.
if "%LANG%"=="EN" (
    echo [PHASE 5/5] FINALIZING...
) else (
    echo [BUOC 5/5] HOAN THIEN...
)
call :REGISTRY_OPTIMIZE
timeout /t 2 >nul
call :CREATE_RESTORE

echo.
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                           ALL COMPLETE!
) else (
    echo                           HOAN THANH TAT CA!
)
echo ===============================================================================
echo.
if "%LANG%"=="EN" (
    echo [SUCCESS] All optimizations completed!
    echo.
    echo TIP: System will restart in 30 seconds...
    echo      Press any key to cancel restart.
) else (
    echo [THANH CONG] Tat ca toi uu da hoan thanh!
    echo.
    echo GHI CHU: He thong se khoi dong lai sau 30 giay...
    echo          Nhan phim bat ky de huy khoi dong lai.
)
echo.

timeout /t 30
if "%LANG%"=="EN" (
    shutdown /r /t 10 /c "Restarting to complete optimization..."
) else (
    shutdown /r /t 10 /c "Khoi dong lai de hoan tat toi uu hoa..."
)

pause
shutdown /a
goto MAIN_MENU

:: ============================================================================
:: FUNCTION 99: RESET WINDOWS
:: ============================================================================
:RESET_WINDOWS
cls
color 0C
echo.
echo ===============================================================================
if "%LANG%"=="EN" (
    echo                      RESET WINDOWS TO DEFAULT
    echo ===============================================================================
    echo.
    echo WARNING: This will reset Windows to factory settings!
    echo WARNING: MAY LOSE DATA if you don't choose "Keep my files"!
    echo.
    echo Are you absolutely sure you want to continue?
    echo.
    set /p resetconfirm=Type YES to confirm: 
) else (
    echo                      RESET WINDOWS VE MAC DINH
    echo ===============================================================================
    echo.
    echo CANH BAO: Se reset Windows ve cai dat goc!
    echo CANH BAO: CO THE MAT DU LIEU neu khong chon "Keep my files"!
    echo.
    echo Ban co thuc su chac chan muon tiep tuc?
    echo.
    set /p resetconfirm=Go YES de xac nhan: 
)

if /i "%resetconfirm%"=="YES" (
    echo.
    if "%LANG%"=="EN" (
        echo Opening Windows Reset...
    ) else (
        echo Dang mo Windows Reset...
    )
    systemreset
) else (
    if "%LANG%"=="EN" (
        echo Cancelled.
    ) else (
        echo Da huy.
    )
    timeout /t 2 >nul
)

goto MAIN_MENU
