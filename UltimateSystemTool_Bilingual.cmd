@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul 2>&1
:: ============================================================================
:: ULTIMATE WINDOWS SYSTEM TOOL - Bilingual Edition
:: Version: 3.0 Professional (English/Vietnamese)
:: ============================================================================
:: Complete system optimization, cleaning, and maintenance
:: Toi uu hoa, don dep va bao tri he thong toan dien
:: ============================================================================
:: Compatible: Windows 7/8/10/11 | Requires Administrator
:: ============================================================================

title Ultimate Windows System Tool v3.0 - Bilingual Professional Edition

:: Check Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo.
    echo ===============================================================================
    echo   ERROR: Administrator privileges required!
    echo   LOI: Can quyen Administrator de chay!
    echo.
    echo   Right-click this file and select "Run as administrator"
    echo   Chuot phai chon "Run as administrator"
    echo ===============================================================================
    echo.
    pause
    exit /b 1
)

:: ============================================================================
:: MAIN MENU - BILINGUAL
:: ============================================================================
:MAIN_MENU
cls
color 0B
echo.
echo ===============================================================================
echo              ULTIMATE WINDOWS SYSTEM TOOL v3.0 - Professional
echo              Complete System Optimization Suite - Song Ngu Anh-Viet
echo ===============================================================================
echo.
echo  [SYSTEM CLEANUP - DON DEP HE THONG]
echo  -----------------------------------
echo  [1]  Quick System Cleanup          - Don Dep Nhanh
echo  [2]  Deep System Cleanup           - Don Dep Sau
echo  [3]  Browser Cache Cleanup         - Don Dep Trinh Duyet
echo  [4]  Application Cache Cleanup     - Don Dep Cache Ung Dung
echo.
echo  [SYSTEM OPTIMIZATION - TOI UU HOA HE THONG]
echo  -------------------------------------------
echo  [5]  Performance Boost             - Tang Cuong Hieu Suat
echo  [6]  Memory (RAM) Optimization     - Toi Uu RAM
echo  [7]  Network Optimization          - Toi Uu Mang
echo  [8]  Disk Optimization             - Toi Uu O Dia
echo.
echo  [REPAIR AND MAINTENANCE - SUA CHUA VA BAO TRI]
echo  ----------------------------------------------
echo  [9]  Automatic Windows Repair      - Tu Dong Sua Loi Windows
echo  [10] Fix Windows Update Issues     - Sua Loi Windows Update
echo  [11] Network Reset and Repair      - Reset Va Sua Loi Mang
echo  [12] Disk Check and Repair         - Kiem Tra Va Sua O Dia
echo.
echo  [SECURITY AND PRIVACY - BAO MAT VA RIENG TU]
echo  --------------------------------------------
echo  [13] Privacy Cleanup Remove Traces - Xoa Dau Vet Hoat Dong
echo  [14] Startup Programs Manager      - Quan Ly Startup
echo  [15] Malware Scan and Cleanup      - Quet Va Xoa Virus
echo  [16] Security Optimization         - Toi Uu Bao Mat
echo.
echo  [SYSTEM INFORMATION - THONG TIN HE THONG]
echo  -----------------------------------------
echo  [17] Detailed System Information   - Thong Tin Chi Tiet
echo  [18] Disk Space Analysis           - Phan Tich Dung Luong
echo  [19] Running Processes Monitor     - Quan Sat Tien Trinh
echo  [20] System Health Check           - Kiem Tra Suc Khoe
echo.
echo  [ADVANCED TOOLS - CONG CU NANG CAO]
echo  -----------------------------------
echo  [21] Create System Restore Point   - Tao Diem Khoi Phuc
echo  [22] Delete Windows.old Folder     - Xoa Thu Muc Windows.old
echo  [23] Disable Windows Telemetry     - Tat Thu Thap Du Lieu
echo  [24] Registry Optimization         - Toi Uu Registry
echo  [25] ALL-IN-ONE Optimization       - Toi Uu Toan Bo
echo.
echo  [SPECIAL FUNCTIONS - CHUC NANG DAC BIET]
echo  ----------------------------------------
echo  [0]  Exit - Thoat
echo  [99] Reset Windows to Default - Reset Windows Ve Mac Dinh
echo.
echo ===============================================================================
set /p choice=Select function / Chon chuc nang (0-99): 

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
echo                   QUICK SYSTEM CLEANUP - DON DEP NHANH
echo ===============================================================================
echo.
echo Cleaning in progress... / Dang don dep...
echo.

echo [1/10] Cleaning Temp files... / Don dep file tam...
del /f /s /q "%TEMP%\*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
mkdir "%TEMP%" >nul 2>&1

echo [2/10] Cleaning System Temp... / Don dep System Temp...
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1

echo [3/10] Cleaning Prefetch... / Don dep Prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo [4/10] Cleaning Recent Items... / Don dep Recent Items...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

echo [5/10] Cleaning Thumbnail Cache... / Don dep Thumbnail Cache...
del /f /s /q /a:h "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" >nul 2>&1

echo [6/10] Flushing DNS Cache... / Xoa DNS Cache...
ipconfig /flushdns >nul 2>&1

echo [7/10] Cleaning Windows Update Cache... / Don dep Windows Update Cache...
net stop wuauserv >nul 2>&1
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1

echo [8/10] Cleaning Error Reports... / Don dep Error Reports...
del /f /s /q "C:\ProgramData\Microsoft\Windows\WER\*" >nul 2>&1

echo [9/10] Cleaning Logs... / Don dep Logs...
del /f /s /q "C:\Windows\Logs\*" >nul 2>&1

echo [10/10] Emptying Recycle Bin... / Xoa Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1

echo.
echo [SUCCESS / THANH CONG] Quick cleanup complete! / Don dep nhanh hoan thanh!
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
echo                    DEEP SYSTEM CLEANUP - DON DEP SAU
echo ===============================================================================
echo.
echo WARNING: This may take 5-10 minutes! / CANH BAO: Co the mat 5-10 phut!
echo.
pause

echo Deep cleaning in progress... / Dang don dep sau...
echo.

echo [Phase 1/5] Basic cleanup... / Don dep co ban...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo [Phase 2/5] Deep system cleanup... / Don dep he thong sau...
del /f /s /q /a:h "%LOCALAPPDATA%\*.log" >nul 2>&1
del /f /s /q /a:h "%LOCALAPPDATA%\*.tmp" >nul 2>&1

echo [Phase 3/5] Cleaning Component Store... / Don dep Component Store...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1

echo [Phase 4/5] Removing Windows.old... / Xoa Windows.old...
if exist "C:\Windows.old" (
    takeown /f "C:\Windows.old" /r /d y >nul 2>&1
    icacls "C:\Windows.old" /grant administrators:F /t >nul 2>&1
    rd /s /q "C:\Windows.old" >nul 2>&1
)

echo [Phase 5/5] Removing Memory Dumps... / Xoa Memory Dumps...
del /f /q "C:\Windows\MEMORY.DMP" >nul 2>&1
del /f /s /q "C:\Windows\Minidump\*" >nul 2>&1

echo Cleaning old Restore Points... / Don dep Restore Points cu...
vssadmin delete shadows /for=%systemdrive% /oldest /quiet >nul 2>&1

echo Cleaning Event Logs... / Don dep Event Logs...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G" >nul 2>&1)

echo Running Disk Cleanup... / Chay Disk Cleanup...
cleanmgr /sagerun:1 >nul 2>&1

echo.
echo [SUCCESS / THANH CONG] Deep cleanup complete! / Don dep sau hoan thanh!
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
echo              BROWSER CACHE CLEANUP - DON DEP TRINH DUYET
echo ===============================================================================
echo.

echo Closing all browsers... / Dong tat ca trinh duyet...
taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM firefox.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM opera.exe >nul 2>&1
taskkill /F /IM brave.exe >nul 2>&1
timeout /t 2 >nul

echo.
echo Cleaning browser caches... / Dang don dep cache trinh duyet...
echo.

if exist "%LOCALAPPDATA%\Google\Chrome\User Data" (
    echo [OK] Cleaning Chrome... / Don Chrome...
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\GPUCache" >nul 2>&1
)

if exist "%LOCALAPPDATA%\Mozilla\Firefox\Profiles" (
    echo [OK] Cleaning Firefox... / Don Firefox...
    for /d %%x in ("%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*") do (
        rd /s /q "%%x\cache2" >nul 2>&1
        rd /s /q "%%x\startupCache" >nul 2>&1
        rd /s /q "%%x\thumbnails" >nul 2>&1
    )
)

if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data" (
    echo [OK] Cleaning Edge... / Don Edge...
    rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache" >nul 2>&1
)

if exist "%APPDATA%\Opera Software\Opera Stable" (
    echo [OK] Cleaning Opera... / Don Opera...
    rd /s /q "%APPDATA%\Opera Software\Opera Stable\Cache" >nul 2>&1
)

if exist "%LOCALAPPDATA%\BraveSoftware\Brave-Browser" (
    echo [OK] Cleaning Brave... / Don Brave...
    rd /s /q "%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data\Default\Cache" >nul 2>&1
)

echo [OK] Cleaning IE/Edge Legacy... / Don IE/Edge Legacy...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 >nul 2>&1

echo.
echo [SUCCESS / THANH CONG] All browsers cleaned! / Tat ca trinh duyet da sach!
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
echo          APPLICATION CACHE CLEANUP - DON DEP CACHE UNG DUNG
echo ===============================================================================
echo.

echo Cleaning application caches... / Dang don dep cache ung dung...
echo.

if exist "%APPDATA%\discord" (
    taskkill /F /IM discord.exe >nul 2>&1
    echo [OK] Cleaning Discord... / Don Discord...
    rd /s /q "%APPDATA%\discord\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\discord\Code Cache" >nul 2>&1
)

if exist "%APPDATA%\Microsoft\Teams" (
    taskkill /F /IM Teams.exe >nul 2>&1
    echo [OK] Cleaning Teams... / Don Teams...
    rd /s /q "%APPDATA%\Microsoft\Teams\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\Microsoft\Teams\blob_storage" >nul 2>&1
)

if exist "%APPDATA%\Spotify" (
    taskkill /F /IM Spotify.exe >nul 2>&1
    echo [OK] Cleaning Spotify... / Don Spotify...
    rd /s /q "%APPDATA%\Spotify\Data" >nul 2>&1
)

if exist "%APPDATA%\Code" (
    echo [OK] Cleaning VS Code... / Don VS Code...
    rd /s /q "%APPDATA%\Code\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\Code\logs" >nul 2>&1
)

if exist "%APPDATA%\Slack" (
    taskkill /F /IM slack.exe >nul 2>&1
    echo [OK] Cleaning Slack... / Don Slack...
    rd /s /q "%APPDATA%\Slack\Cache" >nul 2>&1
)

if exist "%APPDATA%\Zoom" (
    taskkill /F /IM Zoom.exe >nul 2>&1
    echo [OK] Cleaning Zoom... / Don Zoom...
    rd /s /q "%APPDATA%\Zoom\logs" >nul 2>&1
)

if exist "C:\Program Files (x86)\Steam\steamapps\shadercache" (
    echo [OK] Cleaning Steam... / Don Steam...
    del /f /s /q "C:\Program Files (x86)\Steam\steamapps\shadercache\*" >nul 2>&1
)

echo [OK] Cleaning Windows Store... / Don Windows Store...
wsreset.exe >nul 2>&1

echo [OK] Cleaning general temp... / Don temp chung...
del /f /s /q "%LOCALAPPDATA%\Temp\*" >nul 2>&1

echo.
echo [SUCCESS / THANH CONG] Apps cleaned! / Ung dung da duoc don dep!
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
echo            PERFORMANCE BOOST - TANG CUONG HIEU SUAT
echo ===============================================================================
echo.

echo Optimizing... / Dang toi uu...
echo.

echo [1/8] Optimizing services... / Toi uu dich vu...
sc config "SysMain" start= disabled >nul 2>&1
sc stop "SysMain" >nul 2>&1

echo [2/8] Optimizing visual effects... / Toi uu hieu ung...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1

echo [3/8] Disabling animations... / Tat animation...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1

echo [4/8] Enabling Game Mode... / Bat Game Mode...
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul 2>&1

echo [5/8] Disabling Windows Tips... / Tat Windows Tips...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f >nul 2>&1

echo [6/8] Setting High Performance... / Bat High Performance...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

echo [7/8] Disabling Hibernation... / Tat Hibernation...
powercfg /h off >nul 2>&1

echo [8/8] Optimizing disk... / Toi uu o dia...
fsutil behavior set DisableDeleteNotify 0 >nul 2>&1

echo.
echo [SUCCESS / THANH CONG] Performance optimized! / Hieu suat da tang!
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
echo              MEMORY (RAM) OPTIMIZATION - TOI UU RAM
echo ===============================================================================
echo.

echo Optimizing RAM... / Dang toi uu RAM...
echo.

echo [1/3] Cleaning cache... / Don cache...
echo [2/3] Disabling SuperFetch... / Tat SuperFetch...
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1

echo [3/3] Optimizing paging... / Toi uu paging...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f >nul 2>&1

echo.
echo [SUCCESS / THANH CONG] RAM optimized! / RAM da duoc toi uu!
echo TIP / GHI CHU: Restart for best results / Khoi dong lai de hieu qua tot nhat
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
echo              NETWORK OPTIMIZATION - TOI UU MANG
echo ===============================================================================
echo.

echo Optimizing network... / Dang toi uu mang...
echo.

echo [1/7] Flushing DNS... / Xoa DNS...
ipconfig /flushdns >nul 2>&1

echo [2/7] Resetting Winsock... / Reset Winsock...
netsh winsock reset >nul 2>&1

echo [3/7] Resetting TCP/IP... / Reset TCP/IP...
netsh int ip reset >nul 2>&1

echo [4/7] Optimizing TCP... / Toi uu TCP...
netsh int tcp set global autotuninglevel=normal >nul 2>&1

echo [5/7] Disabling throttling... / Tat throttling...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul 2>&1

echo [6/7] Optimizing DNS... / Toi uu DNS...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v MaxCacheTtl /t REG_DWORD /d 86400 /f >nul 2>&1

echo [7/7] Renewing IP... / Lam moi IP...
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1

echo.
echo [SUCCESS / THANH CONG] Network optimized! / Mang da duoc toi uu!
echo TIP / GHI CHU: Restart to apply / Khoi dong lai de ap dung
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
echo                DISK OPTIMIZATION - TOI UU O DIA
echo ===============================================================================
echo.
echo WARNING: May take 10-30 minutes! / CANH BAO: Co the mat 10-30 phut!
echo.
pause

echo Optimizing disk... / Dang toi uu o dia...
echo.

echo [1/4] Analyzing... / Phan tich...
defrag C: /A

echo [2/4] Optimizing... / Toi uu...
defrag C: /O

echo [3/4] Trimming SSD... / Trim SSD...
defrag C: /L

echo [4/4] Enabling TRIM... / Bat TRIM...
fsutil behavior set DisableDeleteNotify 0

echo.
echo [SUCCESS / THANH CONG] Disk optimized! / O dia da duoc toi uu!
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
echo          AUTOMATIC WINDOWS REPAIR - TU DONG SUA LOI WINDOWS
echo ===============================================================================
echo.
echo WARNING: May take 15-30 minutes! / CANH BAO: Co the mat 15-30 phut!
echo.
pause

echo Checking and repairing... / Kiem tra va sua loi...
echo.

echo [1/4] System Files SFC... / Quet file he thong...
sfc /scannow

echo.
echo [2/4] Checking Image Health... / Kiem tra Image Health...
Dism /Online /Cleanup-Image /CheckHealth

echo.
echo [3/4] Scanning Image... / Quet Image...
Dism /Online /Cleanup-Image /ScanHealth

echo.
echo [4/4] Restoring Image... / Khoi phuc Image...
Dism /Online /Cleanup-Image /RestoreHealth

echo.
echo [SUCCESS / THANH CONG] System repaired! / He thong da duoc sua!
echo TIP / GHI CHU: Restart recommended / Nen khoi dong lai
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
echo        FIX WINDOWS UPDATE ISSUES - SUA LOI WINDOWS UPDATE
echo ===============================================================================
echo.

echo Fixing Windows Update... / Dang sua Windows Update...
echo.

echo [1/6] Stopping services... / Dung dich vu...
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver

echo [2/6] Renaming folders... / Doi ten folder...
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
ren C:\Windows\System32\catroot2 catroot2.old

echo [3/6] Restarting services... / Khoi dong lai...
net start wuauserv
net start cryptSvc
net start bits
net start msiserver

echo [4/6] Resetting components... / Reset components...
regsvr32 /s wuaueng.dll
regsvr32 /s wucltui.dll
regsvr32 /s wups.dll
regsvr32 /s wuweb.dll

echo [5/6] Cleaning old folders... / Don folder cu...
timeout /t 5 >nul
rd /s /q C:\Windows\SoftwareDistribution.old >nul 2>&1
rd /s /q C:\Windows\System32\catroot2.old >nul 2>&1

echo [6/6] Running troubleshooter... / Chay troubleshooter...
msdt.exe /id WindowsUpdateDiagnostic

echo.
echo [SUCCESS / THANH CONG] Windows Update fixed! / Da sua xong!
echo TIP / GHI CHU: Try Windows Update again / Thu chay Update lai
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
echo          NETWORK RESET AND REPAIR - RESET VA SUA LOI MANG
echo ===============================================================================
echo.

echo Resetting network... / Dang reset mang...
echo.

echo [1/8] Resetting IP... / Reset IP...
netsh int ip reset

echo [2/8] Resetting Winsock... / Reset Winsock...
netsh winsock reset

echo [3/8] Resetting Proxy... / Reset Proxy...
netsh winhttp reset proxy

echo [4/8] Flushing DNS... / Xoa DNS...
ipconfig /flushdns

echo [5/8] Releasing IP... / Release IP...
ipconfig /release

echo [6/8] Renewing IP... / Renew IP...
ipconfig /renew

echo [7/8] Resetting Firewall... / Reset Firewall...
netsh advfirewall reset

echo [8/8] Resetting Adapter... / Reset Adapter...
netsh interface set interface "Ethernet" admin=disable >nul 2>&1
netsh interface set interface "Wi-Fi" admin=disable >nul 2>&1
timeout /t 3 >nul
netsh interface set interface "Ethernet" admin=enable >nul 2>&1
netsh interface set interface "Wi-Fi" admin=enable >nul 2>&1

echo.
echo [SUCCESS / THANH CONG] Network reset! / Mang da duoc reset!
echo WARNING / CANH BAO: MUST restart! / PHAI khoi dong lai!
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
echo           DISK CHECK AND REPAIR - KIEM TRA VA SUA O DIA
echo ===============================================================================
echo.
echo NOTE: Requires restart! / LUU Y: Can khoi dong lai!
echo.
echo 1. Scan and auto-fix (restart) / Quet va sua (khoi dong lai)
echo 2. Scan only (no fix) / Chi quet (khong sua)
echo 0. Back to menu / Quay lai
echo.
set /p diskchoice=Select / Chon (1/2/0): 

if "%diskchoice%"=="1" (
    echo.
    echo Scheduling disk check... / Len lich kiem tra...
    echo Y | chkdsk C: /F /R /X
    echo.
    echo [SUCCESS / THANH CONG] Scheduled! Restart to begin / Da len lich! Khoi dong lai
    pause
) else if "%diskchoice%"=="2" (
    echo.
    echo Scanning... / Dang quet...
    chkdsk C:
    echo.
    echo [SUCCESS / THANH CONG] Scan complete! / Quet xong!
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
echo         PRIVACY CLEANUP - XOA DAU VET HOAT DONG
echo ===============================================================================
echo.

echo Removing traces... / Dang xoa dau vet...
echo.

echo [1/10] Recent Documents... / Xoa Recent Documents...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

echo [2/10] Run History... / Xoa Run History...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1

echo [3/10] Search History... / Xoa Search History...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f >nul 2>&1

echo [4/10] Clipboard... / Xoa Clipboard...
echo off | clip

echo [5/10] Jump Lists... / Xoa Jump Lists...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*" >nul 2>&1
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*" >nul 2>&1

echo [6/10] Browser History... / Xoa Browser History...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

echo [7/10] Prefetch... / Xoa Prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo [8/10] Timeline... / Xoa Timeline...
del /f /s /q "%LOCALAPPDATA%\ConnectedDevicesPlatform\*" >nul 2>&1

echo [9/10] Activity History... / Xoa Activity History...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1

echo [10/10] Event Logs... / Xoa Event Logs...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G" >nul 2>&1)

echo.
echo [SUCCESS / THANH CONG] Traces removed! / Dau vet da bi xoa!
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
echo          STARTUP PROGRAMS MANAGER - QUAN LY STARTUP
echo ===============================================================================
echo.

echo Opening Task Manager... / Mo Task Manager...
echo.
echo TIP / GHI CHU:
echo    1. Switch to Startup tab / Chuyen sang tab Startup
echo    2. Disable unnecessary programs / Tat chuong trinh khong can
echo    3. Reduce boot time / Giam thoi gian khoi dong
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
echo           MALWARE SCAN AND CLEANUP - QUET VA XOA VIRUS
echo ===============================================================================
echo.
echo WARNING: May take 10-30 minutes! / CANH BAO: Co the mat 10-30 phut!
echo.

echo Running scan... / Dang quet...
echo.

echo [1/3] Quick Scan... / Quet nhanh...
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1

echo.
echo [2/3] Removing suspicious files... / Xoa file nghi ngo...
del /f /s /q "%TEMP%\*.exe" >nul 2>&1
del /f /s /q "%TEMP%\*.dll" >nul 2>&1

echo [3/3] Updating Definitions... / Cap nhat...
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate

echo.
echo [SUCCESS / THANH CONG] Scan complete! / Quet xong!
echo TIP / GHI CHU: Defender will handle threats / Defender se xu ly virus
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
echo            SECURITY OPTIMIZATION - TOI UU BAO MAT
echo ===============================================================================
echo.

echo Optimizing security... / Dang toi uu bao mat...
echo.

echo [1/8] Enabling Firewall... / Bat Firewall...
netsh advfirewall set allprofiles state on

echo [2/8] Enabling Defender... / Bat Defender...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false" >nul 2>&1

echo [3/8] Updating Defender... / Cap nhat Defender...
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate

echo [4/8] Disabling Remote Assistance... / Tat Remote Assistance...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 0 /f >nul 2>&1

echo [5/8] Disabling Remote Desktop... / Tat Remote Desktop...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f >nul 2>&1

echo [6/8] Enabling UAC... / Bat UAC...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f >nul 2>&1

echo [7/8] Disabling AutoRun... / Tat AutoRun...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 255 /f >nul 2>&1

echo [8/8] Enabling SmartScreen... / Bat SmartScreen...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d Warn /f >nul 2>&1

echo.
echo [SUCCESS / THANH CONG] Security optimized! / Bao mat da tang!
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
echo        DETAILED SYSTEM INFORMATION - THONG TIN CHI TIET
echo ===============================================================================
echo.

systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory" /C:"Available Physical Memory"

echo.
echo -------------------------------------------------------------------------------
echo DISK INFORMATION / THONG TIN O DIA:
echo -------------------------------------------------------------------------------
wmic logicaldisk get caption,freespace,size,volumename

echo.
echo -------------------------------------------------------------------------------
echo CPU INFORMATION / THONG TIN CPU:
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
echo          DISK SPACE ANALYSIS - PHAN TICH DUNG LUONG
echo ===============================================================================
echo.

echo Analyzing... / Dang phan tich...
echo.
echo -------------------------------------------------------------------------------
echo DISK OVERVIEW / TONG QUAN:
echo -------------------------------------------------------------------------------
wmic logicaldisk get caption,freespace,size,volumename,filesystem

echo.
echo -------------------------------------------------------------------------------
echo TOP 20 LARGEST FILES / FILE LON NHAT:
echo -------------------------------------------------------------------------------
echo.
echo Searching... / Tim kiem... (may take time / co the lau)
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
echo         RUNNING PROCESSES MONITOR - QUAN SAT TIEN TRINH
echo ===============================================================================
echo.

echo Opening Task Manager... / Mo Task Manager...
start taskmgr.exe

echo.
echo -------------------------------------------------------------------------------
echo TOP PROCESSES BY RAM / TIEN TRINH SU DUNG RAM:
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
echo          SYSTEM HEALTH CHECK - KIEM TRA SUC KHOE HE THONG
echo ===============================================================================
echo.

echo Checking health... / Kiem tra suc khoe...
echo.

echo -------------------------------------------------------------------------------
echo [1/5] SYSTEM FILES / FILE HE THONG...
echo -------------------------------------------------------------------------------
sfc /verifyonly

echo.
echo -------------------------------------------------------------------------------
echo [2/5] WINDOWS IMAGE...
echo -------------------------------------------------------------------------------
Dism /Online /Cleanup-Image /CheckHealth

echo.
echo -------------------------------------------------------------------------------
echo [3/5] DISK HEALTH / SUC KHOE O DIA...
echo -------------------------------------------------------------------------------
wmic diskdrive get status

echo.
echo -------------------------------------------------------------------------------
echo [4/5] MEMORY / RAM...
echo -------------------------------------------------------------------------------
wmic memorychip get capacity,speed,manufacturer

echo.
echo -------------------------------------------------------------------------------
echo [5/5] BATTERY / PIN (Laptop only)...
echo -------------------------------------------------------------------------------
powercfg /batteryreport /output "%USERPROFILE%\Desktop\battery-report.html" >nul 2>&1
if exist "%USERPROFILE%\Desktop\battery-report.html" (
    echo [SUCCESS / THANH CONG] Report on Desktop / Bao cao tren Desktop!
    start "" "%USERPROFILE%\Desktop\battery-report.html"
) else (
    echo [INFO / THONG TIN] No battery / Khong co pin (Desktop PC)
)

echo.
echo [SUCCESS / THANH CONG] Check complete! / Kiem tra xong!
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
echo        CREATE SYSTEM RESTORE POINT - TAO DIEM KHOI PHUC
echo ===============================================================================
echo.

echo Creating restore point... / Dang tao diem khoi phuc...
echo.

powershell -Command "Checkpoint-Computer -Description 'Manual Restore Point from Ultimate Tool' -RestorePointType 'MODIFY_SETTINGS'"

if %errorLevel% equ 0 (
    echo [SUCCESS / THANH CONG] Restore point created! / Diem khoi phuc da tao!
) else (
    echo [WARNING / CANH BAO] Could not create / Khong the tao!
    echo TIP / GHI CHU: Enable in Control Panel / Bat trong Control Panel
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
echo          DELETE WINDOWS.OLD FOLDER - XOA THU MUC WINDOWS.OLD
echo ===============================================================================
echo.

if exist "C:\Windows.old" (
    echo [INFO / THONG TIN] Windows.old detected! / Phat hien Windows.old!
    echo TIP / GHI CHU: Can be 20GB+ / Co the 20GB+
    echo.
    set /p confirm=Delete? / Xoa? (Y/N): 
    
    if /i "!confirm!"=="Y" (
        echo.
        echo Deleting... / Dang xoa...
        takeown /f "C:\Windows.old" /r /d y >nul 2>&1
        icacls "C:\Windows.old" /grant administrators:F /t >nul 2>&1
        rd /s /q "C:\Windows.old" >nul 2>&1
        
        if exist "C:\Windows.old" (
            echo [WARNING / CANH BAO] Incomplete / Chua xong! Try Disk Cleanup / Thu Disk Cleanup
            cleanmgr /d C:
        ) else (
            echo [SUCCESS / THANH CONG] Deleted! / Da xoa!
        )
    )
) else (
    echo [INFO / THONG TIN] Not found / Khong tim thay Windows.old
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
echo       DISABLE WINDOWS TELEMETRY - TAT THU THAP DU LIEU
echo ===============================================================================
echo.

echo Disabling telemetry... / Dang tat thu thap du lieu...
echo.

echo [1/10] Telemetry Service... / Dich vu Telemetry...
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1

echo [2/10] Registry... / Registry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1

echo [3/10] Advertising ID... / Advertising ID...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1

echo [4/10] Activity Feed... / Activity Feed...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1

echo [5/10] Location Tracking... / Theo doi vi tri...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /t REG_DWORD /d 1 /f >nul 2>&1

echo [6/10] Feedback... / Phan hoi...
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f >nul 2>&1

echo [7/10] Cortana... / Cortana...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1

echo [8/10] Windows Tips... / Windows Tips...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f >nul 2>&1

echo [9/10] Consumer Features... / Consumer Features...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f >nul 2>&1

echo [10/10] Tailored Experiences... / Tailored Experiences...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul 2>&1

echo.
echo [SUCCESS / THANH CONG] Telemetry disabled! / Thu thap du lieu da tat!
echo TIP / GHI CHU: Restart to fully apply / Khoi dong lai de ap dung hoan toan
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
echo           REGISTRY OPTIMIZATION - TOI UU REGISTRY
echo ===============================================================================
echo.

echo Optimizing Registry... / Dang toi uu Registry...
echo.

echo [1/5] Creating backup... / Tao backup...
if not exist "%USERPROFILE%\Desktop\RegistryBackup" mkdir "%USERPROFILE%\Desktop\RegistryBackup"
reg export HKLM "%USERPROFILE%\Desktop\RegistryBackup\HKLM_backup.reg" /y >nul 2>&1
reg export HKCU "%USERPROFILE%\Desktop\RegistryBackup\HKCU_backup.reg" /y >nul 2>&1
echo [OK] Backup saved / Backup da luu: Desktop\RegistryBackup

echo [2/5] Menu delay... / Do tre menu...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1

echo [3/5] Startup delay... / Do tre startup...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f >nul 2>&1

echo [4/5] Explorer... / Explorer...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 0 /f >nul 2>&1

echo [5/5] Cleaning safe entries... / Don sach an toan...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f >nul 2>&1

echo.
echo [SUCCESS / THANH CONG] Registry optimized! / Registry da toi uu!
echo TIP / GHI CHU: Backup saved on Desktop / Backup da luu tren Desktop
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
echo         ALL-IN-ONE OPTIMIZATION - TOI UU TOAN BO
echo ===============================================================================
echo.
echo WARNING / CANH BAO:
echo - Runs ALL optimizations / Chay TAT CA toi uu
echo - May take 20-40 minutes / Co the mat 20-40 phut
echo - Computer will restart / May tinh se khoi dong lai
echo.
set /p confirm=Continue? / Tiep tuc? (Y/N): 

if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo ===============================================================================
echo            STARTING COMPLETE OPTIMIZATION / BAT DAU TOI UU TOAN BO
echo ===============================================================================
echo.

echo [PHASE 1/5] CLEANING / DON DEP...
call :QUICK_CLEAN
timeout /t 2 >nul
call :BROWSER_CLEAN
timeout /t 2 >nul
call :APP_CLEAN
timeout /t 2 >nul

echo.
echo [PHASE 2/5] OPTIMIZING / TOI UU...
call :PERFORMANCE_BOOST
timeout /t 2 >nul
call :RAM_OPTIMIZE
timeout /t 2 >nul
call :NETWORK_OPTIMIZE
timeout /t 2 >nul

echo.
echo [PHASE 3/5] REPAIRING / SUA CHUA...
call :AUTO_REPAIR

echo.
echo [PHASE 4/5] SECURING / BAO MAT...
call :SECURITY_OPTIMIZE
timeout /t 2 >nul
call :DISABLE_TELEMETRY
timeout /t 2 >nul

echo.
echo [PHASE 5/5] FINALIZING / HOAN THIEN...
call :REGISTRY_OPTIMIZE
timeout /t 2 >nul
call :CREATE_RESTORE

echo.
echo ===============================================================================
echo                  ALL COMPLETE! / HOAN THANH TAT CA!
echo ===============================================================================
echo.
echo [SUCCESS / THANH CONG] All optimizations complete! / Tat ca toi uu xong!
echo.
echo TIP / GHI CHU: Restarting in 30 seconds / Khoi dong lai sau 30 giay
echo                Press any key to cancel / Nhan phim de huy
echo.

timeout /t 30
shutdown /r /t 10 /c "Restarting to complete optimization / Khoi dong lai de hoan tat"

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
echo        RESET WINDOWS TO DEFAULT - RESET WINDOWS VE MAC DINH
echo ===============================================================================
echo.
echo WARNING / CANH BAO:
echo - Resets Windows to factory settings / Reset ve cai dat goc
echo - MAY LOSE DATA if don't keep files / CO THE MAT DU LIEU
echo.
echo Are you sure? / Ban chac chan?
echo.
set /p resetconfirm=Type YES to confirm / Go YES de xac nhan: 

if /i "%resetconfirm%"=="YES" (
    echo.
    echo Opening Windows Reset... / Mo Windows Reset...
    systemreset
) else (
    echo Cancelled. / Da huy.
    timeout /t 2 >nul
)

goto MAIN_MENU
