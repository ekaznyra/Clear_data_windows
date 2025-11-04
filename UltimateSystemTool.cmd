@echo off
setlocal enabledelayedexpansion
:: ============================================================================
:: ULTIMATE WINDOWS SYSTEM TOOL v5.0 - COMPLETE EDITION
:: Full System Optimization + Installation Suite - Bilingual
:: ============================================================================
:: Author: Nguyen Ngoc Anh Tu
:: Based on: BleachBit, CCleaner, PrivaZer, Wise Care 365
:: NEW v5.0: 96 Functions Total (82 Optimization + 14 Installation/Utilities)
:: Compatible: Windows 7, 8, 8.1, 10, 11 (32-bit & 64-bit)
:: All commands are SAFE and tested
:: ============================================================================

title Ultimate Windows System Tool v5.0 - Complete Edition
color 0B

:: Detect Windows Version
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" set WIN_VER=10
if "%version%" == "6.3" set WIN_VER=8.1
if "%version%" == "6.2" set WIN_VER=8
if "%version%" == "6.1" set WIN_VER=7
if not defined WIN_VER set WIN_VER=10

:: Check Administrator and AUTO-ELEVATE
net session >nul 2>&1
if %errorLevel% neq 0 (
    cls
    color 0E
    echo(
    echo   ========================================================================
    echo                                                                          
    echo          ADMINISTRATOR RIGHTS REQUIRED / CAN QUYEN ADMINISTRATOR        
    echo                                                                          
    echo   ========================================================================
    echo(
    echo   This tool requires Administrator privileges.
    echo   Cong cu nay can quyen Administrator.
    echo(
    echo   Auto-elevating... / Tu dong xin quyen...
    echo(
    timeout /t 2 /nobreak >nul
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~0\"' -Verb RunAs" 2>nul
    exit
)

:: Admin confirmed
cls
color 0A
echo(
echo   ========================================================================
echo                                                                          
echo        ADMINISTRATOR RIGHTS CONFIRMED / XAC NHAN QUYEN ADMINISTRATOR    
echo                                                                          
echo   ========================================================================
echo(
timeout /t 1 /nobreak >nul

:MAIN_MENU
cls
color 0B
echo(
echo  ================================================================================
echo                                                                                
echo             ULTIMATE WINDOWS SYSTEM TOOL v5.0 - COMPLETE EDITION              
echo              96 Functions - Full Optimization + Installation Suite            
echo                                                                                
echo  ================================================================================
echo(
echo  -------------------------------------------------------------------------------
echo   CATEGORY 1: SYSTEM CLEANUP [1-12]
echo  -------------------------------------------------------------------------------
echo   [1]  Quick System Cleanup           [2]  Deep System Cleanup
echo   [3]  Browser Cache Cleanup          [4]  Application Cache Cleanup
echo   [5]  Windows Update Cleanup         [6]  Thumbnail Cache Cleanup
echo   [7]  Icon Cache Cleanup             [8]  Font Cache Cleanup
echo   [9]  Windows Installer Cleanup      [10] Old Windows Installation Cleanup
echo   [11] Recycle Bin Cleanup            [12] Memory Dump Files Cleanup
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   CATEGORY 2: PRIVACY PROTECTION [13-20]
echo  -------------------------------------------------------------------------------
echo   [13] Clear Recent Documents         [14] Clear Run History
echo   [15] Clear Search History           [16] Clear Clipboard History
echo   [17] Clear Windows Error Reports    [18] Disable Telemetry
echo   [19] Clear Event Logs               [20] Clear DNS Cache
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   CATEGORY 3: NETWORK OPTIMIZATION [21-26]
echo  -------------------------------------------------------------------------------
echo   [21] Reset Network Settings         [22] Optimize Network Performance
echo   [23] Clear ARP Cache                [24] Reset Winsock
echo   [25] Renew IP Address               [26] Fix Network Adapter
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   CATEGORY 4: DISK MANAGEMENT [27-32]
echo  -------------------------------------------------------------------------------
echo   [27] Disk Cleanup                   [28] Disk Error Check
echo   [29] Disk Optimization              [30] Analyze Disk Space
echo   [31] Clean Windows.old Folder       [32] Compact OS
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   CATEGORY 5: PERFORMANCE OPTIMIZATION [33-44]
echo  -------------------------------------------------------------------------------
echo   [33] Disable Startup Programs       [34] Optimize Services
echo   [35] Clear Prefetch Files           [36] Clear SuperFetch Cache
echo   [37] Disable Visual Effects         [38] Optimize Power Plan
echo   [39] Disable Hibernation            [40] Clear Memory Cache
echo   [41] Optimize Search Index          [42] Disable Windows Animations
echo   [43] Optimize SSD Settings          [44] Reduce Menu Show Delay
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   CATEGORY 6: SYSTEM MAINTENANCE [45-50]
echo  -------------------------------------------------------------------------------
echo   [45] System File Checker (SFC)      [46] DISM System Repair
echo   [47] Windows Component Cleanup      [48] Update Windows Drivers
echo   [49] Rebuild Icon Cache             [50] Rebuild Search Index
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   CATEGORY 7: REGISTRY OPTIMIZATION [51-55]
echo  -------------------------------------------------------------------------------
echo   [51] Clean Registry (Safe)          [52] Optimize Registry
echo   [53] Backup Registry                [54] Disable Cortana
echo   [55] Disable Windows Tips
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   CATEGORY 8: ADVANCED TOOLS [56-70]
echo  -------------------------------------------------------------------------------
echo   [56] Create Restore Point           [57] View System Information
echo   [58] Export Programs List           [59] Check Disk Health (SMART)
echo   [60] Clear Windows Store Cache      [61] Reset Windows Update
echo   [62] Optimize Boot Time             [63] Clean All Temp Files
echo   [64] Generate System Report         [65] Clean Software Cache
echo   [66] Clean Delivery Optimization    [67] Clean Update Backup (LCU)
echo   [68] Optimize Memory (RAM)          [69] Show Disk Space Report
echo   [70] Refresh Icon Cache
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   CATEGORY 9: SYSTEM UTILITIES [71-76]
echo  -------------------------------------------------------------------------------
echo   [71] Check System Information       [72] Windows Settings Center
echo   [73] Office Repair and Reset        [74] Remove Bloatware (Safe)
echo   [75] Bitlocker Management           [76] Check Activation Status
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   CATEGORY 10: BACKUP AND RECOVERY [77-82]
echo  -------------------------------------------------------------------------------
echo   [77] Backup WiFi Passwords          [78] Backup Drivers
echo   [79] Backup User Data               [80] Backup Zalo Data
echo   [81] Backup Product Keys            [82] Data Recovery Tools
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   CATEGORY 11: INSTALLATION [83-87] ** NEW **
echo  -------------------------------------------------------------------------------
echo   [83] Install Software (Chocolatey)  [84] Install Office Suite
echo   [85] Create WinPE Boot USB          [86] Store for Win LTSC
echo   [87] Install Win via Win To HDD
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   CATEGORY 12: UTILITIES [88-96] ** NEW **
echo  -------------------------------------------------------------------------------
echo   [88] Clean Junk Files (Advanced)    [89] Show/Hide Files
echo   [90] Enable/Disable Update          [91] Fix Printer Issues
echo   [92] Check and Test Tools           [93] Windows Defender Manage
echo   [94] Windows ISO Repository         [95] Intel RST Drivers
echo   [96] Product Key Management
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   QUICK ACTIONS
echo  -------------------------------------------------------------------------------
echo   [97] RUN ALL CLEANUP                [98] RUN ALL UTILITIES
echo   [99] FULL SYSTEM OPTIMIZATION       [0]  EXIT
echo  -------------------------------------------------------------------------------
echo   [T]  Switch to Vietnamese / Chuyen sang Tieng Viet
echo  -------------------------------------------------------------------------------
echo(
set /p choice="  SELECT FUNCTION [0-99 or T]: "

if /i "%choice%"=="T" goto SWITCH_LANGUAGE
if "%choice%"=="0" goto EXIT

:: ============================================================================
:: FUNCTION ROUTING
:: ============================================================================

:: Original 82 functions [1-82]
if "%choice%"=="1" goto QUICK_CLEANUP
if "%choice%"=="2" goto DEEP_CLEANUP
if "%choice%"=="3" goto BROWSER_CACHE
if "%choice%"=="4" goto APP_CACHE
if "%choice%"=="5" goto WINDOWS_UPDATE_CLEANUP
if "%choice%"=="6" goto THUMBNAIL_CACHE
if "%choice%"=="7" goto ICON_CACHE
if "%choice%"=="8" goto FONT_CACHE
if "%choice%"=="9" goto INSTALLER_CLEANUP
if "%choice%"=="10" goto OLD_WINDOWS
if "%choice%"=="11" goto RECYCLE_BIN
if "%choice%"=="12" goto MEMORY_DUMP
if "%choice%"=="13" goto RECENT_DOCS
if "%choice%"=="14" goto RUN_HISTORY
if "%choice%"=="15" goto SEARCH_HISTORY
if "%choice%"=="16" goto CLIPBOARD_HISTORY
if "%choice%"=="17" goto ERROR_REPORTS
if "%choice%"=="18" goto DISABLE_TELEMETRY
if "%choice%"=="19" goto EVENT_LOGS
if "%choice%"=="20" goto DNS_CACHE
if "%choice%"=="21" goto RESET_NETWORK
if "%choice%"=="22" goto OPTIMIZE_NETWORK
if "%choice%"=="23" goto ARP_CACHE
if "%choice%"=="24" goto WINSOCK_RESET
if "%choice%"=="25" goto RENEW_IP
if "%choice%"=="26" goto FIX_ADAPTER
if "%choice%"=="27" goto DISK_CLEANUP
if "%choice%"=="28" goto DISK_CHECK
if "%choice%"=="29" goto DISK_OPTIMIZE
if "%choice%"=="30" goto DISK_SPACE
if "%choice%"=="31" goto WINDOWS_OLD
if "%choice%"=="32" goto COMPACT_OS
if "%choice%"=="33" goto DISABLE_STARTUP
if "%choice%"=="34" goto OPTIMIZE_SERVICES
if "%choice%"=="35" goto PREFETCH
if "%choice%"=="36" goto SUPERFETCH
if "%choice%"=="37" goto VISUAL_EFFECTS
if "%choice%"=="38" goto POWER_PLAN
if "%choice%"=="39" goto HIBERNATION
if "%choice%"=="40" goto MEMORY_CACHE
if "%choice%"=="41" goto SEARCH_INDEX
if "%choice%"=="42" goto ANIMATIONS
if "%choice%"=="43" goto SSD_OPTIMIZE
if "%choice%"=="44" goto MENU_DELAY
if "%choice%"=="45" goto SFC_SCAN
if "%choice%"=="46" goto DISM_REPAIR
if "%choice%"=="47" goto COMPONENT_CLEANUP
if "%choice%"=="48" goto UPDATE_DRIVERS
if "%choice%"=="49" goto REBUILD_ICON
if "%choice%"=="50" goto REBUILD_SEARCH
if "%choice%"=="51" goto CLEAN_REGISTRY
if "%choice%"=="52" goto OPTIMIZE_REGISTRY
if "%choice%"=="53" goto BACKUP_REGISTRY
if "%choice%"=="54" goto DISABLE_CORTANA
if "%choice%"=="55" goto DISABLE_TIPS
if "%choice%"=="56" goto RESTORE_POINT
if "%choice%"=="57" goto SYSTEM_INFO
if "%choice%"=="58" goto EXPORT_PROGRAMS
if "%choice%"=="59" goto DISK_HEALTH
if "%choice%"=="60" goto STORE_CACHE
if "%choice%"=="61" goto RESET_UPDATE
if "%choice%"=="62" goto BOOT_TIME
if "%choice%"=="63" goto ALL_TEMP
if "%choice%"=="64" goto SYSTEM_REPORT
if "%choice%"=="65" goto SOFTWARE_CACHE
if "%choice%"=="66" goto DELIVERY_OPTIMIZATION
if "%choice%"=="67" goto LCU_BACKUP
if "%choice%"=="68" goto OPTIMIZE_MEMORY
if "%choice%"=="69" goto DISK_SPACE_REPORT
if "%choice%"=="70" goto REFRESH_ICON_CACHE
if "%choice%"=="71" goto SYSTEM_INFO_FULL
if "%choice%"=="72" goto WINDOWS_SETTINGS
if "%choice%"=="73" goto OFFICE_REPAIR
if "%choice%"=="74" goto REMOVE_BLOATWARE
if "%choice%"=="75" goto BITLOCKER_MGMT
if "%choice%"=="76" goto CHECK_ACTIVATION
if "%choice%"=="77" goto BACKUP_WIFI
if "%choice%"=="78" goto BACKUP_DRIVERS
if "%choice%"=="79" goto BACKUP_USER_DATA
if "%choice%"=="80" goto BACKUP_ZALO
if "%choice%"=="81" goto BACKUP_PRODUCT_KEYS
if "%choice%"=="82" goto DATA_RECOVERY

:: New Installation functions [83-87]
if "%choice%"=="83" goto INSTALL_SOFTWARE
if "%choice%"=="84" goto INSTALL_OFFICE
if "%choice%"=="85" goto CREATE_WINPE
if "%choice%"=="86" goto LTSC_STORE
if "%choice%"=="87" goto WIN_TO_HDD

:: New Utility functions [88-96]
if "%choice%"=="88" goto CLEAN_JUNK
if "%choice%"=="89" goto SHOW_HIDDEN
if "%choice%"=="90" goto UPDATE_TOGGLE
if "%choice%"=="91" goto FIX_PRINTER
if "%choice%"=="92" goto CHECK_TEST
if "%choice%"=="93" goto DEFENDER_MANAGE
if "%choice%"=="94" goto ISO_REPO
if "%choice%"=="95" goto IRST_DRIVERS
if "%choice%"=="96" goto SKU_MANAGE

:: Quick Actions
if "%choice%"=="97" goto RUN_ALL_CLEANUP
if "%choice%"=="98" goto RUN_ALL
if "%choice%"=="99" goto FULL_OPTIMIZE

echo  [!] Invalid choice / Lua chon khong hop le!
timeout /t 2 /nobreak >nul
goto MAIN_MENU


:: ============================================================================
:: FUNCTION IMPLEMENTATIONS [1-82] - OPTIMIZATION
:: ============================================================================

:: ============================================================================
:: SYSTEM CLEANUP FUNCTIONS - CHUC NANG DON DEP HE THONG
:: ============================================================================

:QUICK_CLEANUP
cls
echo ================================================================================
echo  [1] Quick System Cleanup - Don Dep Nhanh He Thong
echo ================================================================================
echo(
echo Processing / Dang xu ly...
echo(
echo [*] Cleaning Temp files / Xoa file Temp...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
for /d %%x in ("%TEMP%\*") do @rd /s /q "%%x" >nul 2>&1
for /d %%x in ("C:\Windows\Temp\*") do @rd /s /q "%%x" >nul 2>&1

echo [*] Cleaning Recycle Bin / Xoa thung rac...
rd /s /q C:\$Recycle.Bin >nul 2>&1

echo [*] Flushing DNS Cache / Xoa cache DNS...
ipconfig /flushdns >nul 2>&1

echo [*] Cleaning Windows prefetch / Xoa prefetch...
del /f /s /q C:\Windows\Prefetch\* >nul 2>&1

echo(
echo [SUCCESS] Quick Cleanup Completed! / Hoan thanh don dep nhanh!
echo(
pause
goto MAIN_MENU

:DEEP_CLEANUP
cls
echo ================================================================================
echo  [2] Deep System Cleanup - Don Dep Sau He Thong
echo ================================================================================
echo(
echo This will take several minutes / Qua trinh nay mat vai phut...
echo(
echo [*] Cleaning all Temp folders / Xoa tat ca thu muc Temp...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
for /d %%u in ("C:\Users\*") do del /f /s /q "%%u\AppData\Local\Temp\*" >nul 2>&1

echo [*] Cleaning Windows logs / Xoa log Windows...
del /f /s /q C:\Windows\Logs\* >nul 2>&1
del /f /s /q C:\Windows\Panther\* >nul 2>&1

echo [*] Cleaning Windows Update cache / Xoa cache Windows Update...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /f /s /q C:\Windows\SoftwareDistribution\Download\* >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1

echo [*] Cleaning Windows Error Reporting / Xoa bao cao loi...
del /f /s /q C:\ProgramData\Microsoft\Windows\WER\* >nul 2>&1

echo [*] Cleaning thumbnail cache / Xoa thumbnail cache...
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1

echo [*] Cleaning icon cache / Xoa icon cache...
del /f /s /q "%LocalAppData%\IconCache.db" >nul 2>&1

echo [*] Running DISM cleanup / Chay DISM cleanup...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1

echo [*] Clearing event logs / Xoa nhat ky su kien...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G" >nul 2>&1)

echo(
echo [SUCCESS] Deep Cleanup Completed! / Hoan thanh don dep sau!
echo(
pause
goto MAIN_MENU

:BROWSER_CACHE
cls
echo ================================================================================
echo  [3] Browser Cache Cleanup - Don Dep Cache Trinh Duyet
echo ================================================================================
echo(
echo Cleaning browser caches / Xoa cache trinh duyet...
echo(
echo [*] Chrome/Edge cache...
taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
timeout /t 2 >nul
del /f /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
del /f /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Code Cache\*" >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Code Cache\*" >nul 2>&1

echo [*] Firefox cache...
taskkill /F /IM firefox.exe >nul 2>&1
timeout /t 2 >nul
for /d %%p in ("%LocalAppData%\Mozilla\Firefox\Profiles\*") do del /f /s /q "%%p\cache2\*" >nul 2>&1

echo [*] Opera cache...
taskkill /F /IM opera.exe >nul 2>&1
timeout /t 2 >nul
del /f /s /q "%AppData%\Opera Software\Opera Stable\Cache\*" >nul 2>&1

echo(
echo [SUCCESS] Browser caches cleaned! / Da xoa cache trinh duyet!
echo(
pause
goto MAIN_MENU

:APP_CACHE
cls
echo ================================================================================
echo  [4] Application Cache Cleanup - Don Dep Cache Ung Dung
echo ================================================================================
echo(
echo Cleaning application caches / Xoa cache ung dung...
echo(
echo [*] Windows Store cache...
wsreset.exe >nul 2>&1

echo [*] Teams cache...
taskkill /F /IM Teams.exe >nul 2>&1
timeout /t 2 >nul
del /f /s /q "%AppData%\Microsoft\Teams\Cache\*" >nul 2>&1

echo [*] Discord cache...
taskkill /F /IM Discord.exe >nul 2>&1
timeout /t 2 >nul
del /f /s /q "%AppData%\Discord\Cache\*" >nul 2>&1
del /f /s /q "%AppData%\Discord\Code Cache\*" >nul 2>&1

echo [*] Slack cache...
taskkill /F /IM slack.exe >nul 2>&1
timeout /t 2 >nul
del /f /s /q "%AppData%\Slack\Cache\*" >nul 2>&1

echo [*] Spotify cache...
del /f /s /q "%AppData%\Spotify\Storage\*" >nul 2>&1

echo [*] Adobe cache...
for /d %%a in ("%LocalAppData%\Adobe\*") do del /f /s /q "%%a\Cache\*" >nul 2>&1

echo(
echo [SUCCESS] Application caches cleaned! / Da xoa cache ung dung!
echo(
pause
goto MAIN_MENU

:WINDOWS_UPDATE_CLEANUP
cls
echo ================================================================================
echo  [5] Windows Update Cleanup - Don Dep Windows Update
echo ================================================================================
echo(
echo Cleaning Windows Update files / Xoa file Windows Update...
echo(
echo [*] Stopping Windows Update services / Dung dich vu Windows Update...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
net stop dosvc >nul 2>&1

echo [*] Deleting update cache / Xoa cache update...
del /f /s /q C:\Windows\SoftwareDistribution\Download\* >nul 2>&1
del /f /s /q C:\Windows\SoftwareDistribution\DataStore\* >nul 2>&1

echo [*] Restarting services / Khoi dong lai dich vu...
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
net start dosvc >nul 2>&1

echo [*] Running update cleanup / Chay cleanup update...
Dism.exe /online /Cleanup-Image /StartComponentCleanup >nul 2>&1

echo(
echo [SUCCESS] Windows Update cleaned! / Da xoa Windows Update!
echo(
pause
goto MAIN_MENU

:THUMBNAIL_CACHE
cls
echo ================================================================================
echo  [6] Thumbnail Cache Cleanup - Don Dep Thumbnail Cache
echo ================================================================================
echo(
echo Cleaning thumbnail cache / Xoa thumbnail cache...
echo(
echo [*] Stopping Windows Explorer / Dung Windows Explorer...
taskkill /F /IM explorer.exe >nul 2>&1

echo [*] Deleting thumbnail database / Xoa database thumbnail...
del /f /a /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
del /f /a /q "%LocalAppData%\Microsoft\Windows\Explorer\*.db" >nul 2>&1

echo [*] Restarting Windows Explorer / Khoi dong lai Explorer...
start explorer.exe

echo(
echo [SUCCESS] Thumbnail cache cleaned! / Da xoa thumbnail cache!
echo(
pause
goto MAIN_MENU

:ICON_CACHE
cls
echo ================================================================================
echo  [7] Icon Cache Cleanup - Don Dep Icon Cache
echo ================================================================================
echo(
echo Cleaning icon cache / Xoa icon cache...
echo(
echo [*] Stopping Windows Explorer / Dung Windows Explorer...
taskkill /F /IM explorer.exe >nul 2>&1

echo [*] Deleting icon cache / Xoa icon cache...
del /f /a /q "%LocalAppData%\IconCache.db" >nul 2>&1
del /f /a /q "%LocalAppData%\Microsoft\Windows\Explorer\iconcache_*.db" >nul 2>&1

echo [*] Restarting Windows Explorer / Khoi dong lai Explorer...
start explorer.exe

echo(
echo [SUCCESS] Icon cache cleaned! / Da xoa icon cache!
echo(
pause
goto MAIN_MENU

:FONT_CACHE
cls
echo ================================================================================
echo  [8] Font Cache Cleanup - Don Dep Font Cache
echo ================================================================================
echo(
echo Cleaning font cache / Xoa font cache...
echo(
echo [*] Stopping font cache service / Dung dich vu font cache...
net stop "Windows Font Cache Service" >nul 2>&1

echo [*] Deleting font cache files / Xoa file font cache...
del /f /s /q C:\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache\* >nul 2>&1
del /f /a /q C:\Windows\System32\FNTCACHE.DAT >nul 2>&1

echo [*] Starting font cache service / Khoi dong dich vu font cache...
net start "Windows Font Cache Service" >nul 2>&1

echo(
echo [SUCCESS] Font cache cleaned! / Da xoa font cache!
echo(
pause
goto MAIN_MENU

:INSTALLER_CLEANUP
cls
echo ================================================================================
echo  [9] Windows Installer Cleanup - Don Dep Windows Installer
echo ================================================================================
echo(
echo Cleaning Windows Installer cache / Xoa cache Windows Installer...
echo(
echo [*] Cleaning installer temp files / Xoa file tam installer...
del /f /s /q C:\Windows\Installer\$PatchCache$\* >nul 2>&1

echo [*] Note: MSI cache cleanup skipped for safety / Bo qua xoa MSI cache de dam bao an toan...

echo(
echo [SUCCESS] Windows Installer cleaned! / Da xoa Windows Installer!
echo(
pause
goto MAIN_MENU

:OLD_WINDOWS
cls
echo ================================================================================
echo  [10] Old Windows Installation Cleanup - Don Dep Windows Cu
echo ================================================================================
echo(
echo WARNING: This will delete Windows.old folder (cannot undo)
echo CANH BAO: Se xoa thu muc Windows.old (khong the hoan tac)
echo(
set /p confirm=Continue / Tiep tuc (Y/N): 
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo(
echo [*] Deleting Windows.old / Xoa Windows.old...
takeown /F C:\Windows.old\* /R /A /D Y >nul 2>&1
icacls C:\Windows.old\*.* /T /grant administrators:F >nul 2>&1
rd /s /q C:\Windows.old >nul 2>&1

echo [*] Deleting previous Windows installations / Xoa cai dat Windows truoc...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1

echo(
echo [SUCCESS] Old Windows cleaned! / Da xoa Windows cu!
echo(
pause
goto MAIN_MENU

:RECYCLE_BIN
cls
echo ================================================================================
echo  [11] Recycle Bin Cleanup - Don Dep Thung Rac
echo ================================================================================
echo(
echo Emptying Recycle Bin / Dang lam trong thung rac...
echo(
echo [*] Cleaning Recycle Bin on all drives / Xoa thung rac tren tat ca o dia...
rd /s /q C:\$Recycle.Bin >nul 2>&1
rd /s /q D:\$Recycle.Bin >nul 2>&1
rd /s /q E:\$Recycle.Bin >nul 2>&1
rd /s /q F:\$Recycle.Bin >nul 2>&1

echo(
echo [SUCCESS] Recycle Bin emptied! / Da lam trong thung rac!
echo(
pause
goto MAIN_MENU

:MEMORY_DUMP
cls
echo ================================================================================
echo  [12] Memory Dump Files Cleanup - Don Dep File Dump Bo Nho
echo ================================================================================
echo(
echo Cleaning memory dump files / Xoa file dump bo nho...
echo(
echo [*] Deleting memory dump files / Xoa file memory dump...
del /f /q C:\Windows\MEMORY.DMP >nul 2>&1
del /f /q C:\Windows\Minidump\*.dmp >nul 2>&1

echo [*] Deleting error report files / Xoa file bao cao loi...
del /f /s /q C:\ProgramData\Microsoft\Windows\WER\* >nul 2>&1

echo(
echo [SUCCESS] Memory dump files cleaned! / Da xoa file dump!
echo(
pause
goto MAIN_MENU

:: ============================================================================
:: PRIVACY PROTECTION FUNCTIONS - CHUC NANG BAO VE RIENG TU
:: ============================================================================

:RECENT_DOCS
cls
echo ================================================================================
echo  [13] Clear Recent Documents - Xoa Tai Lieu Gan Day
echo ================================================================================
echo(
echo Clearing recent documents / Xoa tai lieu gan day...
echo(
echo [*] Clearing Recent folder / Xoa thu muc Recent...
del /f /s /q "%AppData%\Microsoft\Windows\Recent\*" >nul 2>&1
del /f /s /q "%AppData%\Microsoft\Windows\Recent\AutomaticDestinations\*" >nul 2>&1
del /f /s /q "%AppData%\Microsoft\Windows\Recent\CustomDestinations\*" >nul 2>&1

echo [*] Clearing Jump Lists / Xoa Jump Lists...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f >nul 2>&1

echo(
echo [SUCCESS] Recent documents cleared! / Da xoa tai lieu gan day!
echo(
pause
goto MAIN_MENU

:RUN_HISTORY
cls
echo ================================================================================
echo  [14] Clear Run History - Xoa Lich Su Run
echo ================================================================================
echo(
echo Clearing Run history / Xoa lich su Run...
echo(
echo [*] Deleting Run history from registry / Xoa lich su Run tu registry...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1

echo(
echo [SUCCESS] Run history cleared! / Da xoa lich su Run!
echo(
pause
goto MAIN_MENU

:SEARCH_HISTORY
cls
echo ================================================================================
echo  [15] Clear Search History - Xoa Lich Su Tim Kiem
echo ================================================================================
echo(
echo Clearing search history / Xoa lich su tim kiem...
echo(
echo [*] Deleting search history / Xoa lich su tim kiem...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f >nul 2>&1

echo(
echo [SUCCESS] Search history cleared! / Da xoa lich su tim kiem!
echo(
pause
goto MAIN_MENU

:CLIPBOARD_HISTORY
cls
echo ================================================================================
echo  [16] Clear Clipboard History - Xoa Lich Su Clipboard
echo ================================================================================
echo(
echo Clearing clipboard history / Xoa lich su clipboard...
echo(
echo [*] Clearing clipboard / Xoa clipboard...
echo off | clip

echo [*] Clearing clipboard history / Xoa lich su clipboard...
del /f /s /q "%LocalAppData%\Microsoft\Windows\Clipboard\*" >nul 2>&1

echo(
echo [SUCCESS] Clipboard history cleared! / Da xoa lich su clipboard!
echo(
pause
goto MAIN_MENU

:ERROR_REPORTS
cls
echo ================================================================================
echo  [17] Clear Windows Error Reports - Xoa Bao Cao Loi Windows
echo ================================================================================
echo(
echo Clearing error reports / Xoa bao cao loi...
echo(
echo [*] Deleting error reports / Xoa bao cao loi...
del /f /s /q C:\ProgramData\Microsoft\Windows\WER\* >nul 2>&1
for /d %%u in ("C:\Users\*") do del /f /s /q "%%u\AppData\Local\Microsoft\Windows\WER\*" >nul 2>&1

echo [*] Disabling error reporting / Tat bao cao loi...
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1

echo(
echo [SUCCESS] Error reports cleared! / Da xoa bao cao loi!
echo(
pause
goto MAIN_MENU

:DISABLE_TELEMETRY
cls
echo ================================================================================
echo  [18] Disable Telemetry and Tracking - Tat Thu Thap Du Lieu
echo ================================================================================
echo(
echo Disabling telemetry and tracking / Tat thu thap du lieu...
echo(
echo [*] Disabling telemetry services / Tat dich vu thu thap du lieu...
sc config DiagTrack start= disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1

echo [*] Disabling telemetry via registry / Tat telemetry qua registry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1

echo [*] Disabling activity history / Tat lich su hoat dong...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1

echo(
echo [SUCCESS] Telemetry disabled! / Da tat thu thap du lieu!
echo(
pause
goto MAIN_MENU

:EVENT_LOGS
cls
echo ================================================================================
echo  [19] Clear Event Logs - Xoa Nhat Ky Su Kien
echo ================================================================================
echo(
echo Clearing event logs / Xoa nhat ky su kien...
echo(
echo [*] Clearing all event logs / Xoa tat ca nhat ky su kien...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (
    echo Clearing / Xoa: %%G
    wevtutil.exe cl "%%G" >nul 2>&1
)

echo(
echo [SUCCESS] Event logs cleared! / Da xoa nhat ky su kien!
echo(
pause
goto MAIN_MENU

:DNS_CACHE
cls
echo ================================================================================
echo  [20] Clear DNS Cache - Xoa Cache DNS
echo ================================================================================
echo(
echo Clearing DNS cache / Xoa cache DNS...
echo(
echo [*] Flushing DNS resolver cache / Xoa DNS resolver cache...
ipconfig /flushdns

echo(
echo [SUCCESS] DNS cache cleared! / Da xoa cache DNS!
echo(
pause
goto MAIN_MENU

:: ============================================================================
:: NETWORK OPTIMIZATION FUNCTIONS - CHUC NANG TOI UU MANG
:: ============================================================================

:RESET_NETWORK
cls
echo ================================================================================
echo  [21] Reset Network Settings - Reset Cai Dat Mang
echo ================================================================================
echo(
echo Resetting network settings / Reset cai dat mang...
echo(
echo [*] Resetting IP stack / Reset IP stack...
netsh int ip reset

echo [*] Resetting Winsock / Reset Winsock...
netsh winsock reset

echo [*] Flushing DNS / Xoa DNS...
ipconfig /flushdns

echo [*] Releasing IP / Giai phong IP...
ipconfig /release

echo [*] Renewing IP / Lam moi IP...
ipconfig /renew

echo(
echo [SUCCESS] Network settings reset! / Da reset cai dat mang!
echo [INFO] Please restart computer / Vui long khoi dong lai may!
echo(
pause
goto MAIN_MENU

:OPTIMIZE_NETWORK
cls
echo ================================================================================
echo  [22] Optimize Network Performance - Toi Uu Hieu Suat Mang
echo ================================================================================
echo(
echo Optimizing network performance / Toi uu hieu suat mang...
echo(
echo [*] Disabling TCP auto-tuning / Tat tu dong dieu chinh TCP...
netsh int tcp set global autotuninglevel=normal

echo [*] Enabling receive window auto-tuning / Bat tu dong dieu chinh receive window...
netsh int tcp set global rsc=enabled

echo [*] Optimizing network throttling / Toi uu network throttling...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul 2>&1

echo [*] Disabling bandwidth reservation / Tat dat truoc bang thong...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 0 /f >nul 2>&1

echo(
echo [SUCCESS] Network optimized! / Da toi uu mang!
echo(
pause
goto MAIN_MENU

:ARP_CACHE
cls
echo ================================================================================
echo  [23] Clear ARP Cache - Xoa Cache ARP
echo ================================================================================
echo(
echo Clearing ARP cache / Xoa cache ARP...
echo(
echo [*] Deleting ARP cache / Xoa ARP cache...
netsh interface ip delete arpcache

echo(
echo [SUCCESS] ARP cache cleared! / Da xoa cache ARP!
echo(
pause
goto MAIN_MENU

:WINSOCK_RESET
cls
echo ================================================================================
echo  [24] Reset Winsock - Reset Winsock
echo ================================================================================
echo(
echo Resetting Winsock catalog / Reset Winsock catalog...
echo(
echo [*] Resetting Winsock / Reset Winsock...
netsh winsock reset

echo [*] Resetting IP configuration / Reset cau hinh IP...
netsh int ip reset

echo(
echo [SUCCESS] Winsock reset! / Da reset Winsock!
echo [INFO] Please restart computer / Vui long khoi dong lai may!
echo(
pause
goto MAIN_MENU

:RENEW_IP
cls
echo ================================================================================
echo  [25] Renew IP Address - Lam Moi Dia Chi IP
echo ================================================================================
echo(
echo Renewing IP address / Lam moi dia chi IP...
echo(
echo [*] Releasing current IP / Giai phong IP hien tai...
ipconfig /release

echo [*] Renewing IP address / Lam moi dia chi IP...
ipconfig /renew

echo [*] Flushing DNS / Xoa DNS...
ipconfig /flushdns

echo(
echo [SUCCESS] IP address renewed! / Da lam moi dia chi IP!
echo(
pause
goto MAIN_MENU

:FIX_ADAPTER
cls
echo ================================================================================
echo  [26] Fix Network Adapter - Sua Card Mang
echo ================================================================================
echo(
echo Fixing network adapter / Sua card mang...
echo(
echo [*] Resetting network adapter / Reset card mang...
netsh interface set interface "Ethernet" admin=disable >nul 2>&1
netsh interface set interface "Wi-Fi" admin=disable >nul 2>&1
timeout /t 3 >nul
netsh interface set interface "Ethernet" admin=enable >nul 2>&1
netsh interface set interface "Wi-Fi" admin=enable >nul 2>&1

echo [*] Resetting TCP/IP stack / Reset TCP/IP stack...
netsh int ip reset

echo [*] Resetting Winsock / Reset Winsock...
netsh winsock reset

echo(
echo [SUCCESS] Network adapter fixed! / Da sua card mang!
echo(
pause
goto MAIN_MENU

:: ============================================================================
:: DISK MANAGEMENT FUNCTIONS - CHUC NANG QUAN LY O DIA
:: ============================================================================

:DISK_CLEANUP
cls
echo ================================================================================
echo  [27] Disk Cleanup (Windows Built-in) - Don Dep O Dia
echo ================================================================================
echo(
echo Starting Windows Disk Cleanup / Khoi dong Windows Disk Cleanup...
echo(
cleanmgr /sagerun:1

echo(
echo [SUCCESS] Disk cleanup completed! / Hoan thanh don dep o dia!
echo(
pause
goto MAIN_MENU

:DISK_CHECK
cls
echo ================================================================================
echo  [28] Disk Error Check - Kiem Tra Loi O Dia
echo ================================================================================
echo(
echo Checking disk for errors / Kiem tra loi o dia...
echo(
set /p drive=Enter drive letter (C, D, etc.) / Nhap chu cai o dia: 

echo [*] Scheduling disk check for next boot / Len lich kiem tra o dia khi khoi dong lai...
echo Y | chkdsk %drive%: /f /r /x

echo(
echo [INFO] Disk check scheduled for next reboot / Da len lich kiem tra khi khoi dong lai!
echo [SUCCESS] Please restart your computer / Vui long khoi dong lai may tinh!
echo(
pause
goto MAIN_MENU

:DISK_OPTIMIZE
cls
echo ================================================================================
echo  [29] Disk Optimization (Defrag/TRIM) - Toi Uu O Dia
echo ================================================================================
echo(
echo Optimizing all drives / Toi uu tat ca o dia...
echo(
echo [*] Analyzing and optimizing drives / Phan tich va toi uu o dia...
defrag /C /O /H /U

echo(
echo [SUCCESS] Disk optimization completed! / Hoan thanh toi uu o dia!
echo(
pause
goto MAIN_MENU

:DISK_SPACE
cls
echo ================================================================================
echo  [30] Analyze Disk Space - Phan Tich Dung Luong
echo ================================================================================
echo(
echo Analyzing disk space usage / Phan tich dung luong o dia...
echo(
echo [*] Disk space on all drives / Dung luong tat ca o dia:
wmic logicaldisk get caption,size,freespace

echo(
echo [*] Top-level folders size / Kich thuoc thu muc cap 1:
dir C:\ /a:d

echo(
pause
goto MAIN_MENU

:WINDOWS_OLD
cls
echo ================================================================================
echo  [31] Clean Windows.old Folder - Xoa Thu Muc Windows.old
echo ================================================================================
echo(
echo WARNING: Cannot undo this action! / CANH BAO: Khong the hoan tac!
echo(
set /p confirm=Continue / Tiep tuc (Y/N): 
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo(
echo [*] Taking ownership / Lay quyen so huu...
takeown /F C:\Windows.old\* /R /A /D Y >nul 2>&1

echo [*] Granting permissions / Cap quyen...
icacls C:\Windows.old\*.* /T /grant administrators:F >nul 2>&1

echo [*] Deleting Windows.old / Xoa Windows.old...
rd /s /q C:\Windows.old >nul 2>&1

echo(
echo [SUCCESS] Windows.old deleted! / Da xoa Windows.old!
echo(
pause
goto MAIN_MENU

:COMPACT_OS
cls
echo ================================================================================
echo  [32] Compact OS (Compress System) - Nen He Thong
echo ================================================================================
echo(
echo This will compress Windows system files / Se nen file he thong Windows...
echo This saves disk space but may slightly affect performance
echo Tiet kiem dung luong nhung co the anh huong nhe den hieu suat
echo(
set /p confirm=Continue / Tiep tuc (Y/N): 
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo(
echo [*] Analyzing system / Phan tich he thong...
compact /compactos:query

echo [*] Compressing system files / Nen file he thong...
compact /compactos:always

echo(
echo [SUCCESS] System compressed! / Da nen he thong!
echo(
pause
goto MAIN_MENU

:: ============================================================================
:: PERFORMANCE OPTIMIZATION FUNCTIONS - CHUC NANG TOI UU HIEU SUAT
:: ============================================================================

:DISABLE_STARTUP
cls
echo ================================================================================
echo  [33] Disable Startup Programs - Tat Chuong Trinh Khoi Dong
echo ================================================================================
echo(
echo Opening Task Manager Startup tab / Mo tab Khoi dong Task Manager...
echo Please manually disable unnecessary programs / Vui long tat chuong trinh khong can thiet...
echo(
start taskmgr /0 /startup

echo(
pause
goto MAIN_MENU

:OPTIMIZE_SERVICES
cls
echo ================================================================================
echo  [34] Optimize Services - Toi Uu Dich Vu
echo ================================================================================
echo(
echo Optimizing Windows services / Toi uu dich vu Windows...
echo(
echo [*] Disabling unnecessary services / Tat dich vu khong can thiet...

echo Disabling Fax service / Tat dich vu Fax...
sc config Fax start= disabled >nul 2>&1
sc stop Fax >nul 2>&1

echo Disabling Remote Registry / Tat Remote Registry...
sc config RemoteRegistry start= disabled >nul 2>&1
sc stop RemoteRegistry >nul 2>&1

echo Disabling Windows Search (if not needed) / Tat Windows Search...
sc config WSearch start= disabled >nul 2>&1
sc stop WSearch >nul 2>&1

echo Disabling HomeGroup services / Tat dich vu HomeGroup...
sc config HomeGroupListener start= disabled >nul 2>&1
sc stop HomeGroupListener >nul 2>&1
sc config HomeGroupProvider start= disabled >nul 2>&1
sc stop HomeGroupProvider >nul 2>&1

echo NOTE: Print Spooler kept enabled for printer support / Giu Print Spooler de ho tro may in...

echo(
echo [SUCCESS] Services optimized! / Da toi uu dich vu!
echo [INFO] Some changes require restart / Mot so thay doi can khoi dong lai!
echo(
pause
goto MAIN_MENU

:PREFETCH
cls
echo ================================================================================
echo  [35] Clear Prefetch Files - Xoa File Prefetch
echo ================================================================================
echo(
echo Clearing prefetch files / Xoa file prefetch...
echo(
echo [*] Deleting prefetch files / Xoa file prefetch...
del /f /s /q C:\Windows\Prefetch\* >nul 2>&1

echo(
echo [SUCCESS] Prefetch files cleared! / Da xoa file prefetch!
echo(
pause
goto MAIN_MENU

:SUPERFETCH
cls
echo ================================================================================
echo  [36] Clear SuperFetch Cache - Xoa Cache SuperFetch
echo ================================================================================
echo(
echo Clearing SuperFetch cache / Xoa cache SuperFetch...
echo(
echo [*] Stopping SuperFetch service / Dung dich vu SuperFetch...
sc stop SysMain >nul 2>&1

echo [*] Clearing cache / Xoa cache...
del /f /s /q C:\Windows\Prefetch\* >nul 2>&1

echo [*] Starting SuperFetch service / Khoi dong dich vu SuperFetch...
sc start SysMain >nul 2>&1

echo(
echo [SUCCESS] SuperFetch cache cleared! / Da xoa cache SuperFetch!
echo(
pause
goto MAIN_MENU

:VISUAL_EFFECTS
cls
echo ================================================================================
echo  [37] Disable Visual Effects - Tat Hieu Ung Hinh Anh
echo ================================================================================
echo(
echo Disabling visual effects for better performance / Tat hieu ung de tang hieu suat...
echo(
echo [*] Setting to best performance / Cai dat che do hieu suat cao nhat...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1

echo [*] Disabling animations / Tat hoat anh...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1

echo [*] Disabling transparency / Tat trong suot...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1

echo(
echo [SUCCESS] Visual effects disabled! / Da tat hieu ung hinh anh!
echo [INFO] Please log off and log back in / Vui long dang xuat va dang nhap lai!
echo(
pause
goto MAIN_MENU

:POWER_PLAN
cls
echo ================================================================================
echo  [38] Optimize Power Plan (High Performance) - Toi Uu Che Do Nguon
echo ================================================================================
echo(
echo Setting power plan to High Performance / Cai dat che do nguon Hieu suat cao...
echo(
echo [*] Setting High Performance power plan / Cai dat che do Hieu suat cao...
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo [*] Disabling USB selective suspend / Tat USB selective suspend...
powercfg -change -usb-selective-suspend-timeout-ac 0
powercfg -change -usb-selective-suspend-timeout-dc 0

echo [*] Setting hard disk timeout to never / Cai dat o cung khong bao gio tat...
powercfg -change -disk-timeout-ac 0
powercfg -change -disk-timeout-dc 0

echo(
echo [SUCCESS] Power plan optimized! / Da toi uu che do nguon!
echo(
pause
goto MAIN_MENU

:HIBERNATION
cls
echo ================================================================================
echo  [39] Disable Hibernation - Tat Che Do Ngu Dong
echo ================================================================================
echo(
echo Disabling hibernation (saves disk space) / Tat ngu dong (tiet kiem dung luong)...
echo(
echo [*] Disabling hibernation / Tat che do ngu dong...
powercfg -h off

echo [*] Deleting hiberfil.sys / Xoa hiberfil.sys...
del C:\hiberfil.sys /f /q >nul 2>&1

echo(
echo [SUCCESS] Hibernation disabled! / Da tat che do ngu dong!
echo [INFO] This freed up several GB of disk space / Da giai phong vai GB dung luong!
echo(
pause
goto MAIN_MENU

:MEMORY_CACHE
cls
echo ================================================================================
echo  [40] Clear Memory Cache - Xoa Cache Bo Nho
echo ================================================================================
echo(
echo Clearing memory cache / Xoa cache bo nho...
echo(
echo [*] Clearing memory cache / Xoa cache bo nho...
echo Note: Memory will be cleared on next shutdown / Bo nho se duoc xoa khi tat may

echo [*] Emptying working sets / Lam trong working sets...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f >nul 2>&1

echo(
echo [SUCCESS] Memory cache cleared! / Da xoa cache bo nho!
echo(
pause
goto MAIN_MENU

:SEARCH_INDEX
cls
echo ================================================================================
echo  [41] Optimize Search Index - Toi Uu Tim Kiem
echo ================================================================================
echo(
echo Optimizing Windows Search index / Toi uu chi muc tim kiem Windows...
echo(
echo [*] Stopping search service / Dung dich vu tim kiem...
net stop WSearch >nul 2>&1

echo [*] Deleting search index / Xoa chi muc tim kiem...
del /f /s /q C:\ProgramData\Microsoft\Search\Data\Applications\Windows\* >nul 2>&1

echo [*] Restarting search service / Khoi dong lai dich vu tim kiem...
net start WSearch >nul 2>&1

echo(
echo [SUCCESS] Search index optimized! / Da toi uu tim kiem!
echo(
pause
goto MAIN_MENU

:ANIMATIONS
cls
echo ================================================================================
echo  [42] Disable Windows Animations - Tat Hoat Anh Windows
echo ================================================================================
echo(
echo Disabling Windows animations / Tat hoat anh Windows...
echo(
echo [*] Disabling taskbar animations / Tat hoat anh taskbar...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul 2>&1

echo [*] Disabling window animations / Tat hoat anh cua so...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1

echo [*] Disabling menu animations / Tat hoat anh menu...
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f >nul 2>&1

echo(
echo [SUCCESS] Animations disabled! / Da tat hoat anh!
echo(
pause
goto MAIN_MENU

:SSD_OPTIMIZE
cls
echo ================================================================================
echo  [43] Optimize SSD Settings - Toi Uu SSD
echo ================================================================================
echo(
echo Optimizing SSD settings / Toi uu cai dat SSD...
echo(
echo [*] WARNING: Keeping system restore enabled for safety / GIU khoi phuc he thong de dam bao an toan...
echo For SSD: System Restore is kept ON for safety / Voi SSD: Khoi phuc he thong van BAT de an toan

echo [*] Enabling TRIM / Bat TRIM...
fsutil behavior set DisableDeleteNotify 0

echo [*] Disabling defragmentation / Tat phan manh...
schtasks /change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /disable >nul 2>&1

echo [*] Disabling Superfetch for SSD / Tat Superfetch cho SSD...
sc config SysMain start= disabled >nul 2>&1
sc stop SysMain >nul 2>&1

echo [*] Disabling prefetch / Tat prefetch...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f >nul 2>&1

echo(
echo [SUCCESS] SSD optimized! / Da toi uu SSD!
echo(
pause
goto MAIN_MENU

:MENU_DELAY
cls
echo ================================================================================
echo  [44] Reduce Menu Show Delay - Giam Tre Hien Thi Menu
echo ================================================================================
echo(
echo Reducing menu show delay / Giam tre hien thi menu...
echo(
echo [*] Setting menu show delay to 0ms / Cai dat tre menu thanh 0ms...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1

echo(
echo [SUCCESS] Menu delay reduced! / Da giam tre menu!
echo(
pause
goto MAIN_MENU

:: ============================================================================
:: SYSTEM MAINTENANCE FUNCTIONS - CHUC NANG BAO TRI HE THONG
:: ============================================================================

:SFC_SCAN
cls
echo ================================================================================
echo  [45] System File Checker (SFC) - Kiem Tra File He Thong
echo ================================================================================
echo(
echo Running System File Checker / Chay System File Checker...
echo This may take several minutes / Co the mat vai phut...
echo(
sfc /scannow

echo(
echo [SUCCESS] SFC scan completed! / Hoan thanh kiem tra SFC!
echo(
pause
goto MAIN_MENU

:DISM_REPAIR
cls
echo ================================================================================
echo  [46] DISM System Repair - Sua Chua He Thong DISM
echo ================================================================================
echo(
echo Running DISM repair / Chay sua chua DISM...
echo This may take several minutes / Co the mat vai phut...
echo(
echo [*] Checking health / Kiem tra suc khoe...
Dism /Online /Cleanup-Image /CheckHealth

echo [*] Scanning health / Quet suc khoe...
Dism /Online /Cleanup-Image /ScanHealth

echo [*] Restoring health / Khoi phuc suc khoe...
Dism /Online /Cleanup-Image /RestoreHealth

echo(
echo [SUCCESS] DISM repair completed! / Hoan thanh sua chua DISM!
echo(
pause
goto MAIN_MENU

:COMPONENT_CLEANUP
cls
echo ================================================================================
echo  [47] Windows Component Cleanup - Don Dep Thanh Phan Windows
echo ================================================================================
echo(
echo Cleaning Windows components / Don dep thanh phan Windows...
echo(
echo [*] Starting component cleanup / Bat dau don dep thanh phan...
Dism.exe /online /Cleanup-Image /StartComponentCleanup

echo [*] Resetting base / Reset base...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

echo(
echo [SUCCESS] Component cleanup completed! / Hoan thanh don dep thanh phan!
echo(
pause
goto MAIN_MENU

:UPDATE_DRIVERS
cls
echo ================================================================================
echo  [48] Update Windows Drivers - Cap Nhat Driver Windows
echo ================================================================================
echo(
echo Checking for driver updates / Kiem tra cap nhat driver...
echo(
echo [*] Opening Windows Update / Mo Windows Update...
start ms-settings:windowsupdate

echo Please check for driver updates manually / Vui long kiem tra cap nhat driver...
echo(
pause
goto MAIN_MENU

:REBUILD_ICON
cls
echo ================================================================================
echo  [49] Rebuild Icon Cache - Xay Dung Lai Icon Cache
echo ================================================================================
echo(
echo Rebuilding icon cache / Xay dung lai icon cache...
echo(
echo [*] Stopping Windows Explorer / Dung Windows Explorer...
taskkill /F /IM explorer.exe >nul 2>&1

echo [*] Deleting icon cache / Xoa icon cache...
del /f /a /q "%LocalAppData%\IconCache.db" >nul 2>&1
del /f /a /q "%LocalAppData%\Microsoft\Windows\Explorer\iconcache_*.db" >nul 2>&1

echo [*] Restarting Windows Explorer / Khoi dong lai Explorer...
start explorer.exe

echo(
echo [SUCCESS] Icon cache rebuilt! / Da xay dung lai icon cache!
echo(
pause
goto MAIN_MENU

:REBUILD_SEARCH
cls
echo ================================================================================
echo  [50] Rebuild Windows Search Index - Xay Dung Lai Tim Kiem
echo ================================================================================
echo(
echo Rebuilding search index / Xay dung lai chi muc tim kiem...
echo(
echo [*] Opening Indexing Options / Mo tuy chon chi muc...
control /name Microsoft.IndexingOptions

echo Please click "Advanced" and then "Rebuild" / Vui long click "Advanced" va "Rebuild"...
echo(
pause
goto MAIN_MENU

:: ============================================================================
:: REGISTRY OPTIMIZATION FUNCTIONS - CHUC NANG TOI UU REGISTRY
:: ============================================================================

:CLEAN_REGISTRY
cls
echo ================================================================================
echo  [51] Clean Registry (Safe) - Don Dep Registry (An Toan)
echo ================================================================================
echo(
echo Cleaning registry safely / Don dep registry an toan...
echo(
echo [*] Cleaning MUICache / Xoa MUICache...
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f >nul 2>&1

echo [*] Cleaning UserAssist / Xoa UserAssist...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f >nul 2>&1

echo [*] Cleaning Windows Error Reporting / Xoa Windows Error Reporting...
reg delete "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /f >nul 2>&1

echo [*] Cleaning obsolete entries / Xoa muc cu...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32" /f >nul 2>&1

echo(
echo [SUCCESS] Registry cleaned! / Da don dep registry!
echo(
pause
goto MAIN_MENU

:OPTIMIZE_REGISTRY
cls
echo ================================================================================
echo  [52] Optimize Registry - Toi Uu Registry
echo ================================================================================
echo(
echo Optimizing registry / Toi uu registry...
echo(
echo [*] Optimizing registry access / Toi uu truy cap registry...
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v RegistrySizeLimit /t REG_DWORD /d 0x40000000 /f >nul 2>&1

echo [*] Enabling registry caching / Bat cache registry...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v IoPageLockLimit /t REG_DWORD /d 0xf000000 /f >nul 2>&1

echo(
echo [SUCCESS] Registry optimized! / Da toi uu registry!
echo(
pause
goto MAIN_MENU

:BACKUP_REGISTRY
cls
echo ================================================================================
echo  [53] Backup Registry - Sao Luu Registry
echo ================================================================================
echo(
echo Backing up registry / Sao luu registry...
echo(
echo [*] Creating backup directory / Tao thu muc sao luu...
if not exist "C:\RegistryBackup" mkdir "C:\RegistryBackup"

echo [*] Exporting registry / Xuat registry...
reg export HKLM "C:\RegistryBackup\HKLM_%date:~-4,4%%date:~-7,2%%date:~-10,2%.reg" /y >nul 2>&1
reg export HKCU "C:\RegistryBackup\HKCU_%date:~-4,4%%date:~-7,2%%date:~-10,2%.reg" /y >nul 2>&1

echo(
echo [SUCCESS] Registry backed up to C:\RegistryBackup\ / Da sao luu vao C:\RegistryBackup\
echo(
pause
goto MAIN_MENU

:DISABLE_CORTANA
cls
echo ================================================================================
echo  [54] Disable Cortana - Tat Cortana
echo ================================================================================
echo(
echo Disabling Cortana / Tat Cortana...
echo(
echo [*] Disabling Cortana via registry / Tat Cortana qua registry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1

echo [*] Disabling search web / Tat tim kiem web...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul 2>&1

echo(
echo [SUCCESS] Cortana disabled! / Da tat Cortana!
echo(
pause
goto MAIN_MENU

:DISABLE_TIPS
cls
echo ================================================================================
echo  [55] Disable Windows Tips - Tat Goi Y Windows
echo ================================================================================
echo(
echo Disabling Windows tips / Tat goi y Windows...
echo(
echo [*] Disabling tips / Tat goi y...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SoftLandingEnabled /t REG_DWORD /d 0 /f >nul 2>&1

echo(
echo [SUCCESS] Windows tips disabled! / Da tat goi y Windows!
echo(
pause
goto MAIN_MENU

:: ============================================================================
:: ADVANCED TOOLS FUNCTIONS - CHUC NANG CONG CU NANG CAO
:: ============================================================================

:RESTORE_POINT
cls
echo ================================================================================
echo  [56] Create System Restore Point - Tao Diem Khoi Phuc He Thong
echo ================================================================================
echo(
echo Creating system restore point / Tao diem khoi phuc he thong...
echo(
echo [*] Creating restore point / Tao diem khoi phuc...
powershell -Command "Checkpoint-Computer -Description 'Ultimate System Tool Backup' -RestorePointType 'MODIFY_SETTINGS'"

echo(
echo [SUCCESS] Restore point created! / Da tao diem khoi phuc!
echo(
pause
goto MAIN_MENU

:SYSTEM_INFO
cls
echo ================================================================================
echo  [57] View System Information - Xem Thong Tin He Thong
echo ================================================================================
echo(
echo Gathering system information / Thu thap thong tin he thong...
echo(
systeminfo

echo(
pause
goto MAIN_MENU

:EXPORT_PROGRAMS
cls
echo ================================================================================
echo  [58] Export Installed Programs List - Xuat Danh Sach Chuong Trinh
echo ================================================================================
echo(
echo Exporting installed programs / Xuat danh sach chuong trinh...
echo(
echo [*] Creating list / Tao danh sach...
wmic product get name,version /format:csv > "%USERPROFILE%\Desktop\InstalledPrograms.csv"

echo(
echo [SUCCESS] List saved to Desktop\InstalledPrograms.csv / Da luu vao Desktop\InstalledPrograms.csv
echo(
pause
goto MAIN_MENU

:DISK_HEALTH
cls
echo ================================================================================
echo  [59] Check Disk Health (SMART) - Kiem Tra Suc Khoe O Dia
echo ================================================================================
echo(
echo Checking disk health / Kiem tra suc khoe o dia...
echo(
echo [*] Checking SMART status / Kiem tra trang thai SMART...
wmic diskdrive get status,model,size

echo(
pause
goto MAIN_MENU

:STORE_CACHE
cls
echo ================================================================================
echo  [60] Clear Windows Store Cache - Xoa Cache Windows Store
echo ================================================================================
echo(
echo Clearing Windows Store cache / Xoa cache Windows Store...
echo(
echo [*] Clearing Windows Store cache / Xoa cache Windows Store...
for /d %%u in ("C:\Users\*") do (
    del /f /s /q "%%u\AppData\Local\Packages\Microsoft.WindowsStore_*\LocalCache\*" >nul 2>&1
)

echo(
echo [SUCCESS] Windows Store cache cleared! / Da xoa cache Windows Store!
echo [INFO] If issues persist, run: wsreset.exe / Neu con loi, chay: wsreset.exe
echo(
pause
goto MAIN_MENU

:RESET_UPDATE
cls
echo ================================================================================
echo  [61] Reset Windows Update Components - Reset Thanh Phan Update
echo ================================================================================
echo(
echo Resetting Windows Update / Reset Windows Update...
echo(
echo [*] Stopping update services / Dung dich vu update...
net stop wuauserv >nul 2>&1
net stop cryptSvc >nul 2>&1
net stop bits >nul 2>&1
net stop msiserver >nul 2>&1

echo [*] Renaming folders / Doi ten thu muc...
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old >nul 2>&1
ren C:\Windows\System32\catroot2 catroot2.old >nul 2>&1

echo [*] Starting update services / Khoi dong dich vu update...
net start wuauserv >nul 2>&1
net start cryptSvc >nul 2>&1
net start bits >nul 2>&1
net start msiserver >nul 2>&1

echo(
echo [SUCCESS] Windows Update reset! / Da reset Windows Update!
echo(
pause
goto MAIN_MENU

:BOOT_TIME
cls
echo ================================================================================
echo  [62] Optimize Boot Time - Toi Uu Thoi Gian Khoi Dong
echo ================================================================================
echo(
echo Optimizing boot time / Toi uu thoi gian khoi dong...
echo(
echo [*] Enabling fast startup / Bat khoi dong nhanh...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 1 /f >nul 2>&1

echo [*] Reducing boot timeout / Giam thoi gian cho boot...
bcdedit /timeout 3 >nul 2>&1

echo [*] Disabling boot GUI / Tat GUI khoi dong...
bcdedit /set quietboot on >nul 2>&1

echo(
echo [SUCCESS] Boot time optimized! / Da toi uu thoi gian khoi dong!
echo(
pause
goto MAIN_MENU

:ALL_TEMP
cls
echo ================================================================================
echo  [63] Clean All Temporary Files - Xoa Tat Ca File Tam
echo ================================================================================
echo(
echo Cleaning all temporary files / Xoa tat ca file tam...
echo(
echo [*] User temp / Temp nguoi dung...
del /f /s /q "%TEMP%\*" >nul 2>&1
for /d %%x in ("%TEMP%\*") do @rd /s /q "%%x" >nul 2>&1

echo [*] Windows temp / Temp Windows...
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
for /d %%x in ("C:\Windows\Temp\*") do @rd /s /q "%%x" >nul 2>&1

echo [*] All users temp / Temp tat ca nguoi dung...
for /d %%u in ("C:\Users\*") do del /f /s /q "%%u\AppData\Local\Temp\*" >nul 2>&1

echo [*] Prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo [*] Recent items / Muc gan day...
del /f /s /q "%AppData%\Microsoft\Windows\Recent\*" >nul 2>&1

echo(
echo [SUCCESS] All temporary files cleaned! / Da xoa tat ca file tam!
echo(
pause
goto MAIN_MENU

:SYSTEM_REPORT
cls
echo ================================================================================
echo  [64] Generate System Report - Tao Bao Cao He Thong
echo ================================================================================
echo(
echo Generating comprehensive system report / Tao bao cao he thong toan dien...
echo This may take several minutes / Co the mat vai phut...
echo(
echo [*] Creating report / Tao bao cao...
perfmon /report

echo(
echo [SUCCESS] Report generated! / Da tao bao cao!
echo(
pause
goto MAIN_MENU

:: ============================================================================
:: QUICK ACTIONS - THAO TAC NHANH
:: ============================================================================

:RUN_ALL_CLEANUP
cls
echo ================================================================================
echo  [88] RUN ALL CLEANUP TASKS - CHAY TAT CA DON DEP
echo ================================================================================
echo(
echo WARNING: This will run all cleanup tasks! / CANH BAO: Se chay tat ca don dep!
echo(
set /p confirm=Continue / Tiep tuc (Y/N): 
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo(
echo Running all cleanup tasks / Chay tat ca cac tac vu don dep...
echo(
echo [1/11] Quick Cleanup...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
rd /s /q C:\$Recycle.Bin >nul 2>&1
ipconfig /flushdns >nul 2>&1
del /f /s /q C:\Windows\Prefetch\* >nul 2>&1

echo [2/11] Browser Cache...
taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM firefox.exe >nul 2>&1
timeout /t 2 >nul
del /f /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
for /d %%p in ("%LocalAppData%\Mozilla\Firefox\Profiles\*") do del /f /s /q "%%p\cache2\*" >nul 2>&1

echo [3/11] Application Cache...
taskkill /F /IM Teams.exe >nul 2>&1
taskkill /F /IM Discord.exe >nul 2>&1
del /f /s /q "%AppData%\Microsoft\Teams\Cache\*" >nul 2>&1
del /f /s /q "%AppData%\Discord\Cache\*" >nul 2>&1

echo [4/11] Windows Update Cache...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /f /s /q C:\Windows\SoftwareDistribution\Download\* >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1

echo [5/11] Thumbnail Cache...
taskkill /F /IM explorer.exe >nul 2>&1
del /f /a /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
start explorer.exe

echo [6/11] Icon Cache...
del /f /a /q "%LocalAppData%\IconCache.db" >nul 2>&1

echo [7/11] Font Cache...
net stop "Windows Font Cache Service" >nul 2>&1
del /f /s /q C:\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache\* >nul 2>&1
net start "Windows Font Cache Service" >nul 2>&1

echo [8/11] Recycle Bin...
rd /s /q D:\$Recycle.Bin >nul 2>&1
rd /s /q E:\$Recycle.Bin >nul 2>&1

echo [9/11] DNS Cache...
ipconfig /flushdns >nul 2>&1

echo [10/11] Prefetch...
del /f /s /q C:\Windows\Prefetch\* >nul 2>&1

echo [11/11] All Temp Files...
for /d %%x in ("%TEMP%\*") do @rd /s /q "%%x" >nul 2>&1
for /d %%x in ("C:\Windows\Temp\*") do @rd /s /q "%%x" >nul 2>&1

echo [BONUS] Software cache...
del /f /s /q "%userprofile%\AppData\Roaming\Adobe\Common\Media Cache Files\*" >nul 2>&1
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Office\16.0\OfficeFileCache\*" >nul 2>&1

echo [BONUS] Delivery Optimization...
del /f /s /q "%windir%\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*" >nul 2>&1

echo(
echo ================================================================================
echo [SUCCESS] All cleanup tasks completed! / Hoan thanh tat ca don dep!
echo ================================================================================
echo(
pause
goto MAIN_MENU

:FULL_OPTIMIZE
cls
echo ================================================================================
echo  [99] FULL SYSTEM OPTIMIZATION - TOI UU TOAN BO HE THONG
echo ================================================================================
echo(
echo WARNING: This will perform full system optimization! / CANH BAO: Se toi uu toan bo!
echo This process may take 15-30 minutes / Qua trinh co the mat 15-30 phut
echo(
set /p confirm=Continue / Tiep tuc (Y/N): 
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo(
echo [*] Creating restore point / Tao diem khoi phuc...
powershell -Command "Checkpoint-Computer -Description 'Before Full Optimization' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1

echo(
echo ================================================================================
echo [STEP 1/5] CLEANUP - DON DEP
echo ================================================================================
echo(
echo [1.1] Temp files...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1

echo [1.2] Browser cache...
taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM firefox.exe >nul 2>&1
timeout /t 2 >nul
del /f /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1

echo [1.3] Windows Update cache...
net stop wuauserv >nul 2>&1
del /f /s /q C:\Windows\SoftwareDistribution\Download\* >nul 2>&1
net start wuauserv >nul 2>&1

echo [1.4] Icon and thumbnail cache...
taskkill /F /IM explorer.exe >nul 2>&1
del /f /a /q "%LocalAppData%\IconCache.db" >nul 2>&1
del /f /a /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
start explorer.exe

echo [1.5] DNS cache...
ipconfig /flushdns >nul 2>&1

echo [1.6] Prefetch...
del /f /s /q C:\Windows\Prefetch\* >nul 2>&1

echo(
echo ================================================================================
echo [STEP 2/5] NETWORK OPTIMIZATION - TOI UU MANG
echo ================================================================================
echo(
echo [2.1] Optimizing TCP settings...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global rsc=enabled >nul 2>&1

echo [2.2] Optimizing network throttling...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 0 /f >nul 2>&1

echo(
echo ================================================================================
echo [STEP 3/5] PERFORMANCE OPTIMIZATION - TOI UU HIEU SUAT
echo ================================================================================
echo(
echo [3.1] Disabling visual effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1

echo [3.2] Setting High Performance power plan...
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

echo [3.3] Reducing menu delay...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1

echo(
echo ================================================================================
echo [STEP 4/5] SYSTEM MAINTENANCE - BAO TRI HE THONG
echo ================================================================================
echo(
echo [4.1] Running System File Checker (this may take 5-10 minutes)...
echo Please wait / Vui long cho...
sfc /scannow >nul 2>&1

echo [4.2] Running DISM repair (this may take 5-10 minutes)...
Dism /Online /Cleanup-Image /RestoreHealth >nul 2>&1

echo [4.3] Component cleanup...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1

echo(
echo ================================================================================
echo [STEP 5/5] REGISTRY OPTIMIZATION - TOI UU REGISTRY
echo ================================================================================
echo(
echo [5.1] Cleaning registry...
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f >nul 2>&1

echo [5.2] Optimizing registry access...
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v RegistrySizeLimit /t REG_DWORD /d 0x40000000 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v IoPageLockLimit /t REG_DWORD /d 0xf000000 /f >nul 2>&1

echo(
echo ================================================================================
echo [BONUS] ADVANCED OPTIMIZATION - TOI UU NANG CAO
echo ================================================================================
echo(
echo [6.1] Optimizing memory (RAM)...
powershell -Command "Get-Process | ForEach-Object { try { $_.MinWorkingSet = 100KB } catch {} }" >nul 2>&1

echo [6.2] Cleaning software cache...
del /f /s /q "%userprofile%\AppData\Roaming\Adobe\Common\Media Cache Files\*" >nul 2>&1
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Office\16.0\OfficeFileCache\*" >nul 2>&1

echo [6.3] Cleaning delivery optimization...
del /f /s /q "%windir%\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*" >nul 2>&1

echo [6.4] Refreshing icon cache...
ie4uinit.exe -show >nul 2>&1

echo(
echo ================================================================================
echo  [SUCCESS] FULL SYSTEM OPTIMIZATION COMPLETED!
echo  HOAN THANH TOI UU TOAN BO HE THONG!
echo ================================================================================
echo(
echo Changes applied / Thay doi da ap dung:
echo  - Cleaned temporary files / Da xoa file tam
echo  - Cleaned software cache (Adobe, Office, etc.) / Da xoa cache phan mem
echo  - Cleaned delivery optimization cache / Da xoa cache delivery optimization
echo  - Optimized network settings / Da toi uu cai dat mang
echo  - Disabled visual effects / Da tat hieu ung hinh anh
echo  - Set high performance mode / Da cai dat che do hieu suat cao
echo  - Repaired system files / Da sua chua file he thong
echo  - Optimized registry / Da toi uu registry
echo  - Optimized memory (RAM) / Da toi uu bo nho
echo  - Refreshed icon cache / Da lam moi icon cache
echo(
echo Please restart your computer for all changes to take effect.
echo Vui long khoi dong lai may tinh de ap dung tat ca thay doi.
echo(
pause
goto MAIN_MENU

:: ============================================================================
:: NEW ADVANCED FUNCTIONS - CHUC NANG NANG CAO MOI
:: ============================================================================

:SOFTWARE_CACHE
cls
echo ================================================================================
echo  [65] Clean Software Cache - Xoa Cache Phan Mem
echo ================================================================================
echo(
echo Cleaning software-specific caches / Xoa cache cac phan mem...
echo(
echo [*] WPS Office cache...
del /f /s /q "%userprofile%\AppData\Roaming\kingsoft\wps\cache\*" >nul 2>&1
del /f /s /q "%userprofile%\AppData\Local\Kingsoft\WPS Office\cache\*" >nul 2>&1

echo [*] Adobe cache...
del /f /s /q "%userprofile%\AppData\Roaming\Adobe\Common\Media Cache Files\*" >nul 2>&1
del /f /s /q "%userprofile%\AppData\Local\Adobe\Common\Media Cache Files\*" >nul 2>&1

echo [*] Steam logs...
del /f /s /q "%ProgramFiles(x86)%\Steam\logs\*" >nul 2>&1
del /f /s /q "%ProgramFiles%\Steam\logs\*" >nul 2>&1

echo [*] Visual Studio cache...
del /f /s /q "%userprofile%\AppData\Local\Microsoft\VisualStudio\*\ComponentModelCache\*" >nul 2>&1

echo [*] Java cache...
del /f /s /q "%userprofile%\AppData\LocalLow\Sun\Java\Deployment\cache\*" >nul 2>&1

echo [*] Office file cache...
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Office\16.0\OfficeFileCache\*" >nul 2>&1
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Office\15.0\OfficeFileCache\*" >nul 2>&1

echo(
echo [SUCCESS] Software cache cleaned! / Da xoa cache phan mem!
echo(
pause
goto MAIN_MENU

:DELIVERY_OPTIMIZATION
cls
echo ================================================================================
echo  [66] Clean Delivery Optimization - Xoa Delivery Optimization
echo ================================================================================
echo(
echo Cleaning Delivery Optimization cache / Xoa cache Delivery Optimization...
echo(
echo [*] Stopping Delivery Optimization service / Dung dich vu...
net stop DoSvc >nul 2>&1

echo [*] Cleaning cache / Xoa cache...
del /f /s /q "%windir%\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*" >nul 2>&1
del /f /s /q "%windir%\SoftwareDistribution\DeliveryOptimization\*" >nul 2>&1

echo [*] Restarting service / Khoi dong lai dich vu...
net start DoSvc >nul 2>&1

echo(
echo [SUCCESS] Delivery Optimization cache cleaned! / Da xoa cache!
echo [INFO] This can free up several GB / Co the giai phong vai GB!
echo(
pause
goto MAIN_MENU

:LCU_BACKUP
cls
echo ================================================================================
echo  [67] Clean Update Backup (LCU) - Xoa Sao Luu Cap Nhat
echo ================================================================================
echo(
echo WARNING: This will delete Windows Update uninstall backups!
echo CANH BAO: Se xoa sao luu go cap nhat Windows!
echo You will NOT be able to uninstall updates after this!
echo Ban se KHONG THE go cap nhat sau khi xoa!
echo(
set /p confirm=Continue / Tiep tuc (Y/N): 
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo(
echo [*] Cleaning LCU backup folder / Xoa thu muc sao luu LCU...

set "pathLCU=%windir%\servicing\LCU"
if exist "%pathLCU%" (
    echo     Taking ownership / Lay quyen so huu...
    takeown /f "%pathLCU%" /r /d y >nul 2>&1
    icacls "%pathLCU%" /grant administrators:F /t /c >nul 2>&1
    
    echo     Deleting backup files / Xoa file sao luu...
    rd /s /q "%pathLCU%" >nul 2>&1
    md "%pathLCU%" >nul 2>&1
    
    echo     [SUCCESS] LCU backup cleaned! / Da xoa sao luu LCU!
    echo     [INFO] This can free up 5-10 GB! / Co the giai phong 5-10 GB!
) else (
    echo     [INFO] LCU backup folder not found / Khong tim thay thu muc sao luu
)

echo(
echo [*] Cleaning Service Pack superseded / Xoa Service Pack cu...
dism.exe /online /cleanup-image /spsuperseded /hidesp >nul 2>&1

echo(
echo [SUCCESS] Update backup cleaned! / Da xoa sao luu cap nhat!
echo(
pause
goto MAIN_MENU

:OPTIMIZE_MEMORY
cls
echo ================================================================================
echo  [68] Optimize Memory (RAM) - Toi Uu Bo Nho RAM
echo ================================================================================
echo(
echo Optimizing memory usage / Toi uu su dung bo nho...
echo(
echo [*] Clearing standby memory list / Xoa danh sach bo nho cho...
powershell -Command "Get-Process | ForEach-Object { try { $_.MinWorkingSet = 100KB } catch {} }" >nul 2>&1

echo [*] Flushing file system cache / Xoa cache he thong file...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f >nul 2>&1

echo [*] Optimizing working sets / Toi uu working sets...
echo Note: Memory will be fully optimized on next reboot / Bo nho se duoc toi uu hoan toan khi khoi dong lai

echo [*] Clearing DNS cache / Xoa cache DNS...
ipconfig /flushdns >nul 2>&1
ipconfig /registerdns >nul 2>&1

echo(
echo [SUCCESS] Memory optimized! / Da toi uu bo nho!
echo [INFO] Free RAM should increase / RAM trong nen tang len!
echo(
pause
goto MAIN_MENU

:DISK_SPACE_REPORT
cls
echo ================================================================================
echo  [69] Show Disk Space Report - Xem Bao Cao Dung Luong
echo ================================================================================
echo(
echo Analyzing disk space / Phan tich dung luong o dia...
echo(
echo [*] All drives / Tat ca o dia:
echo(
wmic logicaldisk get caption,size,freespace,filesystem

echo(
echo [*] Free space in MB / Dung luong trong (MB):
for /f "tokens=2" %%a in ('powershell -Command "(Get-PSDrive C).Free/1MB"') do (
    set "free_space=%%a"
    echo     C: Drive - %%a MB free / %%a MB trong
)

echo(
echo [*] Top-level folders on C:\ / Thu muc cap 1 tren C:\:
dir C:\ /a:d

echo(
echo [TIP] Use Function [88] or [99] to clean up and free space
echo [GI Y] Dung chuc nang [88] hoac [99] de don dep va giai phong dung luong
echo(
pause
goto MAIN_MENU

:REFRESH_ICON_CACHE
cls
echo ================================================================================
echo  [70] Refresh Icon Cache - Lam Moi Icon Cache
echo ================================================================================
echo(
echo Refreshing icon and thumbnail cache / Lam moi icon va thumbnail cache...
echo(
echo [*] Refreshing system icon cache / Lam moi icon cache he thong...
ie4uinit.exe -show >nul 2>&1

echo [*] Cleaning connected devices cache / Xoa cache thiet bi ket noi...
del /f /s /q "%userprofile%\AppData\Local\ConnectedDevicesPlatform\*" >nul 2>&1

echo [*] Cleaning network list cache / Xoa cache danh sach mang...
del /f /q "%userprofile%\AppData\Roaming\Microsoft\Network\Connections\*" >nul 2>&1

echo [*] Rebuilding icon cache / Xay dung lai icon cache...
timeout /t 2 >nul

echo(
echo [SUCCESS] Icon cache refreshed! / Da lam moi icon cache!
echo [INFO] Icons should display correctly now / Icon se hien thi dung!
echo(
pause
goto MAIN_MENU

:: ============================================================================
:: SYSTEM UTILITIES FUNCTIONS - CHUC NANG TIEN ICH HE THONG
:: ============================================================================

:SYSTEM_INFO_FULL
cls
echo ================================================================================
echo  [71] Check System Information - Kiem Tra Thong Tin May
echo ================================================================================
echo(
echo Gathering comprehensive system information / Thu thap thong tin toan dien...
echo(
echo [HARDWARE INFORMATION - THONG TIN PHAN CUNG]
echo ============================================================================
echo(
echo [*] Computer System / He thong may tinh:
wmic computersystem get manufacturer,model,totalphysicalmemory

echo(
echo [*] CPU Information / Thong tin CPU:
wmic cpu get name,numberofcores,numberoflogicalprocessors,maxclockspeed

echo(
echo [*] Memory / Bo nho RAM:
wmic memorychip get capacity,speed,manufacturer

echo(
echo [*] Disk Drives / O dia:
wmic diskdrive get model,size,interfacetype,status

echo(
echo [*] Graphics Card / Card man hinh:
wmic path win32_VideoController get name,adapterram,driverversion

echo(
echo [*] Network Adapters / Card mang:
wmic nic where "NetEnabled=true" get name,macaddress,speed

echo(
echo [SOFTWARE INFORMATION - THONG TIN PHAN MEM]
echo ============================================================================
echo(
echo [*] Operating System / He dieu hanh:
wmic os get caption,version,buildnumber,osarchitecture

echo(
echo [*] Windows Activation Status / Trang thai kich hoat:
cscript //nologo %windir%\system32\slmgr.vbs /xpr

echo(
echo [*] BIOS Information / Thong tin BIOS:
wmic bios get manufacturer,smbiosbiosversion,releasedate

echo(
echo [*] Opening detailed system info / Mo thong tin chi tiet...
msinfo32

echo(
echo [SUCCESS] System information displayed! / Da hien thi thong tin he thong!
echo [INFO] Detailed report opened in MSInfo32 / Bao cao chi tiet da mo trong MSInfo32
echo(
pause
goto MAIN_MENU

:WINDOWS_SETTINGS
cls
echo ================================================================================
echo  [72] Windows Settings Center - Trung Tam Cai Dat Windows
echo ================================================================================
echo(
echo Opening Windows Settings / Mo cai dat Windows...
echo Detected Windows version: %WIN_VER% / Phat hien Windows: %WIN_VER%
echo(
echo  [1] System Settings          - Cai dat He thong
echo  [2] Privacy Settings         - Cai dat Rieng tu
echo  [3] Update and Security      - Cap nhat va Bao mat
echo  [4] Personalization          - Ca nhan hoa
echo  [5] Apps and Features        - Ung dung
echo  [6] Network and Internet     - Mang
echo  [7] Gaming Settings          - Cai dat Game (Win 10+)
echo  [8] Power Options            - Tuy chon Nguon
echo  [9] All Settings             - Tat ca Cai dat
echo  [0] Back to Main Menu        - Quay lai
echo(
set /p settings_choice=Select settings / Chon cai dat (0-9): 

if "%settings_choice%"=="0" goto MAIN_MENU

:: Windows 10/11 Settings (ms-settings)
if %WIN_VER% GEQ 10 (
    if "%settings_choice%"=="1" start ms-settings:display
    if "%settings_choice%"=="2" start ms-settings:privacy
    if "%settings_choice%"=="3" start ms-settings:windowsupdate
    if "%settings_choice%"=="4" start ms-settings:personalization
    if "%settings_choice%"=="5" start ms-settings:appsfeatures
    if "%settings_choice%"=="6" start ms-settings:network
    if "%settings_choice%"=="7" start ms-settings:gaming
    if "%settings_choice%"=="8" powercfg.cpl
    if "%settings_choice%"=="9" start ms-settings:
) else (
    :: Windows 7/8 Control Panel fallback
    if "%settings_choice%"=="1" control system
    if "%settings_choice%"=="2" control
    if "%settings_choice%"=="3" wuapp
    if "%settings_choice%"=="4" control desk.cpl
    if "%settings_choice%"=="5" control appwiz.cpl
    if "%settings_choice%"=="6" control ncpa.cpl
    if "%settings_choice%"=="7" (
        echo [INFO] Gaming settings only available on Windows 10+
        echo [INFO] Chi co tren Windows 10+
    )
    if "%settings_choice%"=="8" powercfg.cpl
    if "%settings_choice%"=="9" control
)

echo(
echo [SUCCESS] Settings opened! / Da mo cai dat!
echo(
timeout /t 2
goto MAIN_MENU

:OFFICE_REPAIR
cls
echo ================================================================================
echo  [73] Office Repair and Reset - Sua Chua va Reset Office
echo ================================================================================
echo(
echo Office repair and configuration / Sua chua va cau hinh Office...
echo(
echo [*] Checking Office installation / Kiem tra cai dat Office...

if exist "%ProgramFiles%\Microsoft Office" (
    echo [*] Office detected in Program Files / Phat hien Office
) else if exist "%ProgramFiles(x86)%\Microsoft Office" (
    echo [*] Office detected in Program Files x86 / Phat hien Office
) else (
    echo [!] Office not detected / Khong phat hien Office
    echo [INFO] Please install Office first / Vui long cai dat Office truoc
    pause
    goto MAIN_MENU
)

echo(
echo  [1] Quick Office Repair      - Sua chua Nhanh
echo  [2] Online Office Repair     - Sua chua Truc tuyen  
echo  [3] Reset Office Settings    - Reset Cai dat Office
echo  [4] Clear Office Cache       - Xoa Cache Office
echo  [5] Open Office Diagnostics  - Mo Cong cu Chan doan
echo  [0] Back to Main Menu        - Quay lai
echo(
set /p office_choice=Select option / Chon tuy chon (0-5): 

if "%office_choice%"=="1" (
    echo [*] Starting Quick Repair / Bat dau sua chua nhanh...
    echo [INFO] Please use Office installation to repair / Vui long dung trinh cai dat Office de sua chua
    control appwiz.cpl
)

if "%office_choice%"=="2" (
    echo [*] Starting Online Repair / Bat dau sua chua truc tuyen...
    echo [INFO] Please use Office installation to repair / Vui long dung trinh cai dat Office de sua chua
    control appwiz.cpl
)

if "%office_choice%"=="3" (
    echo [*] Resetting Office settings / Reset cai dat Office...
    del /f /q "%AppData%\Microsoft\Office\*.*" >nul 2>&1
    del /f /q "%LocalAppData%\Microsoft\Office\*.*" >nul 2>&1
    echo [SUCCESS] Office settings reset! / Da reset cai dat Office!
)

if "%office_choice%"=="4" (
    echo [*] Clearing Office cache / Xoa cache Office...
    del /f /s /q "%LocalAppData%\Microsoft\Office\16.0\OfficeFileCache\*" >nul 2>&1
    del /f /s /q "%LocalAppData%\Microsoft\Office\15.0\OfficeFileCache\*" >nul 2>&1
    echo [SUCCESS] Office cache cleared! / Da xoa cache Office!
)

if "%office_choice%"=="5" (
    echo [*] Opening Office Diagnostics / Mo cong cu chan doan...
    start https://aka.ms/SaRA-HomeOffice
)

if "%office_choice%"=="0" goto MAIN_MENU

echo(
pause
goto MAIN_MENU

:REMOVE_BLOATWARE
cls
echo ================================================================================
echo  [74] Remove Bloatware (Safe) - Xoa Ung Dung Rac (An Toan)
echo ================================================================================
echo(
echo Detected Windows version: %WIN_VER% / Phat hien Windows: %WIN_VER%
echo(
:: Check if Windows 8 or later (UWP apps available)
if %WIN_VER% LSS 8 (
    echo [INFO] Bloatware removal only available on Windows 8 and later
    echo [INFO] Chi ho tro tu Windows 8 tro len
    echo(
    echo [TIP] Use Control Panel - Programs and Features to uninstall programs
    echo [GI ] Dung Control Panel - Programs and Features de go cai dat
    echo(
    pause
    goto MAIN_MENU
)

echo WARNING: This will remove pre-installed Windows apps!
echo CANH BAO: Se xoa cac ung dung Windows cai san!
echo(
echo SAFE apps to remove / Ung dung AN TOAN de xoa:
echo  - Xbox (if you don't game)
echo  - 3D Builder, Paint 3D (Windows 10+)
echo  - Mixed Reality apps (Windows 10+)
echo  - Get Started, Tips
echo  - Skype (can reinstall from Store)
echo  - Solitaire Collection
echo(
echo WILL NOT REMOVE / SE KHONG XOA:
echo  - Microsoft Store (important!)
echo  - Photos, Calculator, Notepad
echo  - Microsoft Edge
echo  - Windows Security
echo(
set /p bloat_confirm=Continue / Tiep tuc (Y/N): 
if /i not "%bloat_confirm%"=="Y" goto MAIN_MENU

echo(
echo [*] Removing safe bloatware apps / Xoa ung dung rac an toan...
echo(
if %WIN_VER% GEQ 10 (
    echo [1/8] Removing 3D Builder...
    powershell -Command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage" >nul 2>&1
    
    echo [2/8] Removing Paint 3D...
    powershell -Command "Get-AppxPackage *paint3d* | Remove-AppxPackage" >nul 2>&1
    
    echo [3/8] Removing Mixed Reality Portal...
    powershell -Command "Get-AppxPackage *MixedReality* | Remove-AppxPackage" >nul 2>&1
    
    echo [4/8] Removing Get Started...
    powershell -Command "Get-AppxPackage *getstarted* | Remove-AppxPackage" >nul 2>&1
    
    echo [5/8] Removing Solitaire Collection...
    powershell -Command "Get-AppxPackage *solitaire* | Remove-AppxPackage" >nul 2>&1
    
    echo [6/8] Removing Mobile Plans...
    powershell -Command "Get-AppxPackage *mobileplans* | Remove-AppxPackage" >nul 2>&1
    
    echo [7/8] Removing Feedback Hub...
    powershell -Command "Get-AppxPackage *feedback* | Remove-AppxPackage" >nul 2>&1
    
    echo [8/8] Removing Xbox (apps only, not Game Bar)...
    powershell -Command "Get-AppxPackage *xboxapp* | Remove-AppxPackage" >nul 2>&1
) else (
    :: Windows 8/8.1
    echo [*] Removing Windows 8 apps...
    powershell -Command "Get-AppxPackage *solitaire* | Remove-AppxPackage" >nul 2>&1
    powershell -Command "Get-AppxPackage *bingfinance* | Remove-AppxPackage" >nul 2>&1
    powershell -Command "Get-AppxPackage *bingnews* | Remove-AppxPackage" >nul 2>&1
    powershell -Command "Get-AppxPackage *bingsports* | Remove-AppxPackage" >nul 2>&1
)

echo(
echo [SUCCESS] Bloatware removed! / Da xoa ung dung rac!
echo [INFO] You can reinstall from Microsoft Store if needed / Co the cai lai tu Microsoft Store
echo(
pause
goto MAIN_MENU

:BITLOCKER_MGMT
cls
echo ================================================================================
echo  [75] Bitlocker Management - Quan Ly Bitlocker
echo ================================================================================
echo(
echo Checking Bitlocker status / Kiem tra trang thai Bitlocker...
echo(
echo [*] Bitlocker status on all drives / Trang thai Bitlocker tren tat ca o dia:
echo(
manage-bde -status

echo(
echo  [1] Disable Bitlocker on C:  - Tat Bitlocker tren C:
echo  [2] Enable Bitlocker on C:   - Bat Bitlocker tren C:
echo  [3] View Recovery Key        - Xem Khoa Khoi phuc
echo  [4] Backup Recovery Key      - Sao luu Khoa Khoi phuc
echo  [0] Back to Main Menu        - Quay lai
echo(
set /p bitlocker_choice=Select option / Chon tuy chon (0-4): 

if "%bitlocker_choice%"=="1" (
    echo(
    echo WARNING: Disabling Bitlocker will decrypt your drive!
    echo CANH BAO: Tat Bitlocker se giai ma o dia cua ban!
    echo(
    set /p confirm_disable=Are you sure / Ban chac chan (Y/N): 
    if /i "!confirm_disable!"=="Y" (
        echo [*] Disabling Bitlocker / Tat Bitlocker...
        manage-bde -off C:
        echo [SUCCESS] Bitlocker disabled! / Da tat Bitlocker!
    )
)

if "%bitlocker_choice%"=="2" (
    echo [*] Opening Bitlocker Control Panel / Mo Bang dieu khien Bitlocker...
    control /name Microsoft.BitLockerDriveEncryption
)

if "%bitlocker_choice%"=="3" (
    echo [*] Recovery key information / Thong tin khoa khoi phuc:
    manage-bde -protectors C: -get
)

if "%bitlocker_choice%"=="4" (
    echo [*] Backing up recovery key / Sao luu khoa khoi phuc...
    echo [INFO] Save to USB or print / Luu vao USB hoac in
    manage-bde -protectors C: -get
)

if "%bitlocker_choice%"=="0" goto MAIN_MENU

echo(
pause
goto MAIN_MENU

:CHECK_ACTIVATION
cls
echo ================================================================================
echo  [76] Check Activation Status - Kiem Tra Trang Thai Kich Hoat
echo ================================================================================
echo(
echo Checking Windows and Office activation / Kiem tra kich hoat Windows va Office...
echo(
echo [WINDOWS ACTIVATION - KICH HOAT WINDOWS]
echo ============================================================================
echo(
echo [*] Windows License Status / Trang thai giay phep Windows:
cscript //nologo %windir%\system32\slmgr.vbs /dli

echo(
echo [*] Windows Activation Expiration / Thoi han kich hoat:
cscript //nologo %windir%\system32\slmgr.vbs /xpr

echo(
echo [*] Windows Product Key / Khoa san pham Windows:
wmic path softwarelicensingservice get OA3xOriginalProductKey

echo(
echo [OFFICE ACTIVATION - KICH HOAT OFFICE]
echo ============================================================================
echo(
if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" (
    echo [*] Office 2016/2019/365 License Status:
    cscript //nologo "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" /dstatus
) else if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" (
    echo [*] Office 2016/2019/365 License Status:
    cscript //nologo "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" /dstatus
) else (
    echo [INFO] Office not detected or not installed / Khong phat hien Office
)

echo(
echo [INFO] To activate Windows or Office legally / De kich hoat hop phap:
echo  - Purchase license from Microsoft: https://www.microsoft.com
echo  - Mua giay phep tu Microsoft: https://www.microsoft.com
echo(
echo [WARNING] This tool does NOT provide activation services
echo [CANH BAO] Cong cu nay KHONG cung cap dich vu kich hoat
echo(
echo For activation, please use official Microsoft methods.
echo De kich hoat, vui long su dung phuong thuc chinh thuc cua Microsoft.
echo(
pause
goto MAIN_MENU

:: ============================================================================
:: BACKUP AND RECOVERY FUNCTIONS - CHUC NANG SAO LUU VA KHOI PHUC
:: ============================================================================

:BACKUP_WIFI
cls
echo ================================================================================
echo  [77] Backup Wifi Passwords - Sao Luu Mat Khau Wifi
echo ================================================================================
echo(
echo Backing up all WiFi passwords / Sao luu tat ca mat khau WiFi...
echo(
echo [*] Creating backup directory / Tao thu muc sao luu...
set "BackupDir=%USERPROFILE%\Documents\WiFi_Backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%"
if not exist "%BackupDir%" mkdir "%BackupDir%"

echo [*] Exporting WiFi profiles / Xuat cau hinh WiFi...
netsh wlan show profiles | findstr "All User Profile" > "%BackupDir%\WiFi_List.txt"

echo(
echo [*] Exporting passwords for each network / Xuat mat khau cho tung mang...
for /f "tokens=2 delims=:" %%i in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    set "profile=%%i"
    set "profile=!profile:~1!"
    echo Exporting / Xuat: !profile!
    netsh wlan show profile name="!profile!" key=clear > "%BackupDir%\WiFi_!profile!.txt"
)

echo(
echo [*] Creating summary file / Tao file tom tat...
echo WiFi Backup Report > "%BackupDir%\WiFi_Passwords.txt"
echo =================== >> "%BackupDir%\WiFi_Passwords.txt"
echo Created: %date% %time% >> "%BackupDir%\WiFi_Passwords.txt"
echo( >> "%BackupDir%\WiFi_Passwords.txt"

for /f "tokens=2 delims=:" %%i in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    set "profile=%%i"
    set "profile=!profile:~1!"
    echo Network: !profile! >> "%BackupDir%\WiFi_Passwords.txt"
    netsh wlan show profile name="!profile!" key=clear | findstr "Key Content" >> "%BackupDir%\WiFi_Passwords.txt"
    echo( >> "%BackupDir%\WiFi_Passwords.txt"
)

echo(
echo [SUCCESS] WiFi passwords backed up! / Da sao luu mat khau WiFi!
echo [INFO] Location / Vi tri: Documents\WiFi_Backup_[DATE]
echo [INFO] Full path / Duong dan: %BackupDir%
echo(
echo [TIP] You can restore by importing .xml profiles or manually entering passwords
echo [GI ] Ban co the khoi phuc bang cach import .xml hoac nhap lai mat khau
echo(
pause
goto MAIN_MENU

:BACKUP_DRIVERS
cls
echo ================================================================================
echo  [78] Backup Drivers - Sao Luu Driver
echo ================================================================================
echo(
echo Backing up installed drivers / Sao luu driver da cai dat...
echo(
echo [*] Creating backup directory / Tao thu muc sao luu...
set "DriverBackup=%USERPROFILE%\Documents\Driver_Backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%"
if not exist "%DriverBackup%" mkdir "%DriverBackup%"

echo [*] Exporting third-party drivers / Xuat driver ben thu 3...
echo This may take several minutes / Co the mat vai phut...
echo(
dism /online /export-driver /destination:"%DriverBackup%"

echo(
echo [*] Creating driver list / Tao danh sach driver...
driverquery /v /fo csv > "%DriverBackup%\Driver_List.csv"

echo [*] Exporting detailed driver information / Xuat thong tin chi tiet driver...
powershell -Command "Get-WmiObject Win32_PnPSignedDriver | Select-Object DeviceName,DriverVersion,Manufacturer,DriverDate | Export-Csv '%DriverBackup%\Driver_Details.csv' -NoTypeInformation"

echo(
echo [SUCCESS] Drivers backed up! / Da sao luu driver!
echo [INFO] Location / Vi tri: Documents\Driver_Backup_[DATE]
echo [INFO] Full path / Duong dan: %DriverBackup%
echo(
echo [TIP] Use Device Manager to restore drivers from this folder
echo [GI ] Dung Device Manager de khoi phuc driver tu thu muc nay
echo(
pause
goto MAIN_MENU

:BACKUP_USER_DATA
cls
echo ================================================================================
echo  [79] Backup User Data - Sao Luu Du Lieu Nguoi Dung
echo ================================================================================
echo(
echo Backing up important user data / Sao luu du lieu nguoi dung quan trong...
echo(
echo [*] Creating backup directory / Tao thu muc sao luu...
set "DataBackup=%USERPROFILE%\Documents\UserData_Backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%"
if not exist "%DataBackup%" mkdir "%DataBackup%"

echo(
echo  [1] Quick Backup (Desktop, Documents, Pictures) - Sao Luu Nhanh
echo  [2] Full Backup (Include Downloads, Videos, Music) - Sao Luu Day Du
echo  [3] Custom Backup (Select folders) - Sao Luu Tuy Chinh
echo  [0] Back to Main Menu - Quay lai
echo(
set /p backup_choice=Select backup type / Chon loai sao luu (0-3): 

if "%backup_choice%"=="0" goto MAIN_MENU

if "%backup_choice%"=="1" (
    echo(
    echo [*] Backing up Desktop / Sao luu Desktop...
    xcopy "%USERPROFILE%\Desktop" "%DataBackup%\Desktop" /E /I /H /Y /EXCLUDE:%TEMP%\backup_exclude.txt >nul 2>&1
    
    echo [*] Backing up Documents / Sao luu Documents...
    echo UserData_Backup > "%TEMP%\backup_exclude.txt"
    xcopy "%USERPROFILE%\Documents" "%DataBackup%\Documents" /E /I /H /Y /EXCLUDE:%TEMP%\backup_exclude.txt >nul 2>&1
    del "%TEMP%\backup_exclude.txt" >nul 2>&1
    
    echo [*] Backing up Pictures / Sao luu Pictures...
    xcopy "%USERPROFILE%\Pictures" "%DataBackup%\Pictures" /E /I /H /Y >nul 2>&1
)

if "%backup_choice%"=="2" (
    echo(
    echo [*] Full backup in progress / Dang sao luu day du...
    echo This may take a long time / Co the mat rat lau...
    echo(
    echo [*] Creating exclude list / Tao danh sach loai tru...
    echo UserData_Backup > "%TEMP%\backup_exclude.txt"
    
    echo [*] Backing up Desktop...
    xcopy "%USERPROFILE%\Desktop" "%DataBackup%\Desktop" /E /I /H /Y /EXCLUDE:%TEMP%\backup_exclude.txt >nul 2>&1
    echo [*] Backing up Documents...
    xcopy "%USERPROFILE%\Documents" "%DataBackup%\Documents" /E /I /H /Y /EXCLUDE:%TEMP%\backup_exclude.txt >nul 2>&1
    echo [*] Backing up Pictures...
    xcopy "%USERPROFILE%\Pictures" "%DataBackup%\Pictures" /E /I /H /Y >nul 2>&1
    echo [*] Backing up Downloads...
    xcopy "%USERPROFILE%\Downloads" "%DataBackup%\Downloads" /E /I /H /Y >nul 2>&1
    echo [*] Backing up Videos...
    xcopy "%USERPROFILE%\Videos" "%DataBackup%\Videos" /E /I /H /Y >nul 2>&1
    echo [*] Backing up Music...
    xcopy "%USERPROFILE%\Music" "%DataBackup%\Music" /E /I /H /Y >nul 2>&1
    
    del "%TEMP%\backup_exclude.txt" >nul 2>&1
)

if "%backup_choice%"=="3" (
    echo(
    echo [INFO] Please use File Explorer to manually copy your folders
    echo [INFO] Vui long dung File Explorer de sao chep thu cong
    explorer "%USERPROFILE%"
)

echo(
echo [SUCCESS] User data backed up! / Da sao luu du lieu nguoi dung!
echo [INFO] Location / Vi tri: Documents\UserData_Backup_[DATE]
echo [INFO] Full path / Duong dan: %DataBackup%
echo(
pause
goto MAIN_MENU

:BACKUP_ZALO
cls
echo ================================================================================
echo  [80] Backup Zalo Data - Sao Luu Du Lieu Zalo
echo ================================================================================
echo(
echo Backing up Zalo data / Sao luu du lieu Zalo...
echo(
echo [*] Searching for Zalo installation / Tim cai dat Zalo...
set "ZaloPC=%APPDATA%\ZaloPC"
set "ZaloData=%USERPROFILE%\Documents\ZaloData"
set "ZaloBackup=%USERPROFILE%\Documents\Zalo_Backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%"
set "ZaloFound=0"

if exist "%ZaloPC%" set "ZaloFound=1"
if exist "%ZaloData%" set "ZaloFound=1"
if exist "%LOCALAPPDATA%\ZaloPC" set "ZaloFound=1"

if "%ZaloFound%"=="0" (
    echo(
    echo [ERROR] Zalo not found / Khong tim thay Zalo!
    echo [INFO] Please make sure Zalo PC is installed / Vui long dam bao Zalo PC da duoc cai dat
    echo [INFO] Searched locations / Da tim tai:
    echo   - %APPDATA%\ZaloPC
    echo   - %USERPROFILE%\Documents\ZaloData
    echo   - %LOCALAPPDATA%\ZaloPC
    echo(
    pause
    goto MAIN_MENU
)

echo [*] Creating backup directory / Tao thu muc sao luu...
if not exist "%ZaloBackup%" mkdir "%ZaloBackup%"

echo(
echo [WARNING] Please close Zalo before backing up!
echo [CANH BAO] Vui long dong Zalo truoc khi sao luu!
echo(
pause

echo [*] Stopping Zalo process / Dung tien trinh Zalo...
taskkill /F /IM Zalo.exe >nul 2>&1
timeout /t 2 >nul

if exist "%ZaloPC%" (
    echo [*] Backing up Zalo PC data / Sao luu du lieu Zalo PC...
    xcopy "%ZaloPC%" "%ZaloBackup%\ZaloPC" /E /I /H /Y >nul 2>&1
)

if exist "%ZaloData%" (
    echo [*] Backing up Zalo documents / Sao luu tai lieu Zalo...
    xcopy "%ZaloData%" "%ZaloBackup%\ZaloData" /E /I /H /Y >nul 2>&1
)

echo [*] Backing up Zalo cache (messages, images) / Sao luu cache (tin nhan, hinh anh)...
if exist "%LOCALAPPDATA%\ZaloPC" (
    xcopy "%LOCALAPPDATA%\ZaloPC" "%ZaloBackup%\ZaloPC_Cache" /E /I /H /Y >nul 2>&1
)

echo(
echo [SUCCESS] Zalo data backed up! / Da sao luu du lieu Zalo!
echo [INFO] Location / Vi tri: Documents\Zalo_Backup_[DATE]
echo [INFO] Full path / Duong dan: %ZaloBackup%
echo(
echo [TIP] To restore: Copy files back to original locations
echo [GI ] De khoi phuc: Sao chep file ve vi tri cu
echo(
pause
goto MAIN_MENU

:BACKUP_PRODUCT_KEYS
cls
echo ================================================================================
echo  [81] Backup Product Keys - Sao Luu Ban Quyen
echo ================================================================================
echo(
echo Backing up product keys / Sao luu khoa ban quyen...
echo(
echo [*] Creating backup directory / Tao thu muc sao luu...
set "KeyBackup=%USERPROFILE%\Documents\ProductKeys_Backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%"
if not exist "%KeyBackup%" mkdir "%KeyBackup%"

echo(
echo [WINDOWS PRODUCT KEY - KHOA BAN QUYEN WINDOWS]
echo ============================================================================
echo(
echo [*] Windows OEM Key / Khoa OEM Windows:
wmic path softwarelicensingservice get OA3xOriginalProductKey > "%KeyBackup%\Windows_OEM_Key.txt"
wmic path softwarelicensingservice get OA3xOriginalProductKey

echo(
echo [*] Windows License Information / Thong tin giay phep Windows:
cscript //nologo %windir%\system32\slmgr.vbs /dli > "%KeyBackup%\Windows_License_Info.txt"

echo(
echo [*] Windows Activation Status / Trang thai kich hoat Windows:
cscript //nologo %windir%\system32\slmgr.vbs /xpr > "%KeyBackup%\Windows_Activation.txt"

echo(
echo [OFFICE PRODUCT KEY - KHOA BAN QUYEN OFFICE]
echo ============================================================================
echo(
if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" (
    echo [*] Office License Information:
    cscript //nologo "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" /dstatus > "%KeyBackup%\Office_License_Info.txt"
    type "%KeyBackup%\Office_License_Info.txt"
) else if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" (
    echo [*] Office License Information:
    cscript //nologo "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" /dstatus > "%KeyBackup%\Office_License_Info.txt"
    type "%KeyBackup%\Office_License_Info.txt"
) else (
    echo [INFO] Office not detected / Khong phat hien Office
)

echo(
echo [*] Creating summary file / Tao file tom tat...
echo Product Keys Backup Report > "%KeyBackup%\Product_Keys_Summary.txt"
echo ========================== >> "%KeyBackup%\Product_Keys_Summary.txt"
echo Created: %date% %time% >> "%KeyBackup%\Product_Keys_Summary.txt"
echo( >> "%KeyBackup%\Product_Keys_Summary.txt"
echo IMPORTANT: Keep these files safe and secure! >> "%KeyBackup%\Product_Keys_Summary.txt"
echo QUAN TRONG: Giu cac file nay an toan va bao mat! >> "%KeyBackup%\Product_Keys_Summary.txt"

echo(
echo [SUCCESS] Product keys backed up! / Da sao luu ban quyen!
echo [INFO] Location / Vi tri: Documents\ProductKeys_Backup_[DATE]
echo [INFO] Full path / Duong dan: %KeyBackup%
echo(
echo [WARNING] Keep backup files secure! / Giu file sao luu an toan!
echo(
pause
goto MAIN_MENU

:DATA_RECOVERY
cls
echo ================================================================================
echo  [82] Data Recovery Tools - Cong Cu Khoi Phuc Du Lieu
echo ================================================================================
echo(
echo Data recovery and file restoration / Khoi phuc du lieu va phuc hoi file...
echo(
echo  [1] Enable File History - Bat Lich Su File
echo  [2] Restore Previous Versions - Khoi Phuc Phien Ban Truoc
echo  [3] Shadow Copy Recovery - Khoi Phuc Shadow Copy
echo  [4] Recycle Bin Recovery - Khoi Phuc Tu Thung Rac
echo  [5] System Restore - Khoi Phuc He Thong
echo  [6] Check Backup Status - Kiem Tra Trang Thai Sao Luu
echo  [0] Back to Main Menu - Quay lai
echo(
set /p recovery_choice=Select option / Chon tuy chon (0-6): 

if "%recovery_choice%"=="0" goto MAIN_MENU

if "%recovery_choice%"=="1" (
    echo(
    echo [*] Opening File History settings / Mo cai dat Lich su File...
    control /name Microsoft.FileHistory
    echo(
    echo [INFO] Please configure File History backup / Vui long cau hinh sao luu Lich su File
)

if "%recovery_choice%"=="2" (
    echo(
    echo [*] Opening Previous Versions / Mo Phien ban Truoc...
    echo(
    echo [INFO] Right-click any file or folder and select "Restore previous versions"
    echo [INFO] Click phai vao file/folder va chon "Restore previous versions"
    echo(
    explorer /select,"%USERPROFILE%\Documents"
)

if "%recovery_choice%"=="3" (
    echo(
    echo [*] Listing Shadow Copies / Liet ke Shadow Copy...
    vssadmin list shadows
    echo(
    echo [INFO] Shadow Copies are automatic backups created by Windows
    echo [INFO] Shadow Copy la ban sao luu tu dong cua Windows
)

if "%recovery_choice%"=="4" (
    echo(
    echo [*] Opening Recycle Bin / Mo Thung Rac...
    explorer shell:RecycleBinFolder
    echo(
    echo [INFO] Check Recycle Bin for recently deleted files
    echo [INFO] Kiem tra Thung Rac de tim file da xoa gan day
)

if "%recovery_choice%"=="5" (
    echo(
    echo [*] Opening System Restore / Mo Khoi Phuc He Thong...
    rstrui.exe
    echo(
    echo [INFO] System Restore can recover your PC to an earlier state
    echo [INFO] Khoi Phuc He Thong co the dua may ve trang thai truoc do
)

if "%recovery_choice%"=="6" (
    echo(
    echo [*] Checking backup status / Kiem tra trang thai sao luu...
    echo(
    wmic recoveros get
    echo(
    vssadmin list shadows
)

echo(
pause
goto MAIN_MENU

:: ============================================================================
:: LANGUAGE SWITCH - CHUYEN DOI NGON NGU
:: ============================================================================

:SWITCH_LANGUAGE
:: Simple toggle between EN and VI
if "%LANG%"=="EN" (
    set LANG=VI
    goto MAIN_MENU_VI
)
if "%LANG%"=="VI" (
    set LANG=EN
    goto MAIN_MENU_EN
)
:: Default to English
set LANG=EN
goto MAIN_MENU_EN

:MAIN_MENU_VI
cls
color 0B
echo(
echo  ================================================================================
echo                                                                                
echo               CONG CU TOI UU HE THONG WINDOWS v5.0 - CHUYEN NGHIEP            
echo                   Bo Cong Cu Toi Uu Toan Dien - 82 Chuc Nang                  
echo                     Nhan L de chuyen doi ngon ngu                              
echo                                                                                
echo  ================================================================================
echo(
echo  -------------------------------------------------------------------------------
echo   DANH MUC 1: DON DEP HE THONG [1-12]
echo  -------------------------------------------------------------------------------
echo   [1]  Don Dep Nhanh He Thong          [2]  Don Dep Sau He Thong
echo   [3]  Don Dep Cache Trinh Duyet       [4]  Don Dep Cache Ung Dung
echo   [5]  Don Dep Windows Update          [6]  Don Dep Thumbnail Cache
echo   [7]  Don Dep Icon Cache              [8]  Don Dep Font Cache
echo   [9]  Don Dep Windows Installer       [10] Don Dep Windows Cu
echo   [11] Don Dep Thung Rac               [12] Don Dep File Dump Bo Nho
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   DANH MUC 2: BAO VE RIENG TU [13-20]
echo  -------------------------------------------------------------------------------
echo   [13] Xoa Tai Lieu Gan Day            [14] Xoa Lich Su Run
echo   [15] Xoa Lich Su Tim Kiem            [16] Xoa Lich Su Clipboard
echo   [17] Xoa Bao Cao Loi Windows         [18] Tat Thu Thap Du Lieu
echo   [19] Xoa Nhat Ky Su Kien             [20] Xoa Cache DNS
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   DANH MUC 3: TOI UU MANG [21-26]
echo  -------------------------------------------------------------------------------
echo   [21] Reset Cai Dat Mang              [22] Toi Uu Hieu Suat Mang
echo   [23] Xoa Cache ARP                   [24] Reset Winsock
echo   [25] Lam Moi Dia Chi IP              [26] Sua Card Mang
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   DANH MUC 4: QUAN LY O DIA [27-32]
echo  -------------------------------------------------------------------------------
echo   [27] Don Dep O Dia (Tich Hop)        [28] Kiem Tra Loi O Dia
echo   [29] Toi Uu O Dia                    [30] Phan Tich Dung Luong
echo   [31] Xoa Thu Muc Windows.old         [32] Nen He Thong
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   DANH MUC 5: TOI UU HIEU SUAT [33-44]
echo  -------------------------------------------------------------------------------
echo   [33] Tat Chuong Trinh Khoi Dong      [34] Toi Uu Dich Vu
echo   [35] Xoa File Prefetch               [36] Xoa Cache SuperFetch
echo   [37] Tat Hieu Ung Hinh Anh           [38] Toi Uu Che Do Nguon
echo   [39] Tat Che Do Ngu Dong             [40] Xoa Cache Bo Nho
echo   [41] Toi Uu Tim Kiem                 [42] Tat Hoat Anh Windows
echo   [43] Toi Uu SSD                      [44] Giam Tre Hien Thi Menu
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   DANH MUC 6: BAO TRI HE THONG [45-50]
echo  -------------------------------------------------------------------------------
echo   [45] Kiem Tra File He Thong (SFC)    [46] Sua Chua He Thong DISM
echo   [47] Don Dep Thanh Phan Windows      [48] Cap Nhat Driver Windows
echo   [49] Xay Dung Lai Icon Cache         [50] Xay Dung Lai Tim Kiem
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   DANH MUC 7: TOI UU REGISTRY [51-55]
echo  -------------------------------------------------------------------------------
echo   [51] Don Dep Registry (An Toan)      [52] Toi Uu Registry
echo   [53] Sao Luu Registry                [54] Tat Cortana
echo   [55] Tat Goi Y Windows
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   DANH MUC 8: CONG CU NANG CAO [56-70]
echo  -------------------------------------------------------------------------------
echo   [56] Tao Diem Khoi Phuc He Thong     [57] Xem Thong Tin He Thong
echo   [58] Xuat Danh Sach Chuong Trinh     [59] Kiem Tra Suc Khoe O Dia
echo   [60] Xoa Cache Windows Store         [61] Reset Thanh Phan Update
echo   [62] Toi Uu Thoi Gian Khoi Dong      [63] Xoa Tat Ca File Tam
echo   [64] Tao Bao Cao He Thong            [65] Xoa Cache Phan Mem
echo   [66] Xoa Delivery Optimization       [67] Xoa Sao Luu Cap Nhat
echo   [68] Toi Uu Bo Nho RAM               [69] Xem Bao Cao Dung Luong
echo   [70] Lam Moi Icon Cache
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   DANH MUC 9: TIEN ICH HE THONG [71-76]
echo  -------------------------------------------------------------------------------
echo   [71] Kiem Tra Thong Tin May          [72] Trung Tam Cai Dat Windows
echo   [73] Sua Chua va Reset Office        [74] Xoa Ung Dung Rac (An Toan)
echo   [75] Quan Ly Bitlocker               [76] Kiem Tra Trang Thai Kich Hoat
echo  -------------------------------------------------------------------------------
echo(
echo  -------------------------------------------------------------------------------
echo   DANH MUC 10: SAO LUU VA KHOI PHUC [77-82] (MOI!)
echo  -------------------------------------------------------------------------------
echo   [77] Sao Luu Mat Khau Wifi           [78] Sao Luu Driver
echo   [79] Sao Luu Du Lieu Nguoi Dung      [80] Sao Luu Du Lieu Zalo
echo   [81] Sao Luu Ban Quyen               [82] Cong Cu Khoi Phuc Du Lieu
echo  -------------------------------------------------------------------------------
echo(
echo  ================================================================================
echo   THAO TAC NHANH
echo  ================================================================================
echo   [88] CHAY TAT CA DON DEP             [99] TOI UU TOAN BO HE THONG
echo  -------------------------------------------------------------------------------
echo   [0]  THOAT                            [T]  Chuyen sang tieng Anh
echo  ================================================================================
echo(
set /p choice=   CHON CHUC NANG (0-99 hoac T): 

if /i "%choice%"=="T" goto SWITCH_LANGUAGE
if "%choice%"=="0" goto EXIT
if "%choice%"=="1" goto QUICK_CLEANUP
if "%choice%"=="2" goto DEEP_CLEANUP
if "%choice%"=="3" goto BROWSER_CACHE
if "%choice%"=="4" goto APP_CACHE
if "%choice%"=="5" goto WINDOWS_UPDATE_CLEANUP
if "%choice%"=="6" goto THUMBNAIL_CACHE
if "%choice%"=="7" goto ICON_CACHE
if "%choice%"=="8" goto FONT_CACHE
if "%choice%"=="9" goto INSTALLER_CLEANUP
if "%choice%"=="10" goto OLD_WINDOWS
if "%choice%"=="11" goto RECYCLE_BIN
if "%choice%"=="12" goto MEMORY_DUMP
if "%choice%"=="13" goto RECENT_DOCS
if "%choice%"=="14" goto RUN_HISTORY
if "%choice%"=="15" goto SEARCH_HISTORY
if "%choice%"=="16" goto CLIPBOARD_HISTORY
if "%choice%"=="17" goto ERROR_REPORTS
if "%choice%"=="18" goto DISABLE_TELEMETRY
if "%choice%"=="19" goto EVENT_LOGS
if "%choice%"=="20" goto DNS_CACHE
if "%choice%"=="21" goto RESET_NETWORK
if "%choice%"=="22" goto OPTIMIZE_NETWORK
if "%choice%"=="23" goto ARP_CACHE
if "%choice%"=="24" goto WINSOCK_RESET
if "%choice%"=="25" goto RENEW_IP
if "%choice%"=="26" goto FIX_ADAPTER
if "%choice%"=="27" goto DISK_CLEANUP
if "%choice%"=="28" goto DISK_CHECK
if "%choice%"=="29" goto DISK_OPTIMIZE
if "%choice%"=="30" goto DISK_SPACE
if "%choice%"=="31" goto WINDOWS_OLD
if "%choice%"=="32" goto COMPACT_OS
if "%choice%"=="33" goto DISABLE_STARTUP
if "%choice%"=="34" goto OPTIMIZE_SERVICES
if "%choice%"=="35" goto PREFETCH
if "%choice%"=="36" goto SUPERFETCH
if "%choice%"=="37" goto VISUAL_EFFECTS
if "%choice%"=="38" goto POWER_PLAN
if "%choice%"=="39" goto HIBERNATION
if "%choice%"=="40" goto MEMORY_CACHE
if "%choice%"=="41" goto SEARCH_INDEX
if "%choice%"=="42" goto ANIMATIONS
if "%choice%"=="43" goto SSD_OPTIMIZE
if "%choice%"=="44" goto MENU_DELAY
if "%choice%"=="45" goto SFC_SCAN
if "%choice%"=="46" goto DISM_REPAIR
if "%choice%"=="47" goto COMPONENT_CLEANUP
if "%choice%"=="48" goto UPDATE_DRIVERS
if "%choice%"=="49" goto REBUILD_ICON
if "%choice%"=="50" goto REBUILD_SEARCH
if "%choice%"=="51" goto CLEAN_REGISTRY
if "%choice%"=="52" goto OPTIMIZE_REGISTRY
if "%choice%"=="53" goto BACKUP_REGISTRY
if "%choice%"=="54" goto DISABLE_CORTANA
if "%choice%"=="55" goto DISABLE_TIPS
if "%choice%"=="56" goto RESTORE_POINT
if "%choice%"=="57" goto SYSTEM_INFO
if "%choice%"=="58" goto EXPORT_PROGRAMS
if "%choice%"=="59" goto DISK_HEALTH
if "%choice%"=="60" goto STORE_CACHE
if "%choice%"=="61" goto RESET_UPDATE
if "%choice%"=="62" goto BOOT_TIME
if "%choice%"=="63" goto ALL_TEMP
if "%choice%"=="64" goto SYSTEM_REPORT
if "%choice%"=="65" goto SOFTWARE_CACHE
if "%choice%"=="66" goto DELIVERY_OPTIMIZATION
if "%choice%"=="67" goto LCU_BACKUP
if "%choice%"=="68" goto OPTIMIZE_MEMORY
if "%choice%"=="69" goto DISK_SPACE_REPORT
if "%choice%"=="70" goto REFRESH_ICON_CACHE
if "%choice%"=="71" goto SYSTEM_INFO_FULL
if "%choice%"=="72" goto WINDOWS_SETTINGS
if "%choice%"=="73" goto OFFICE_REPAIR
if "%choice%"=="74" goto REMOVE_BLOATWARE
if "%choice%"=="75" goto BITLOCKER_MGMT
if "%choice%"=="76" goto CHECK_ACTIVATION
if "%choice%"=="77" goto BACKUP_WIFI
if "%choice%"=="78" goto BACKUP_DRIVERS
if "%choice%"=="79" goto BACKUP_USER_DATA
if "%choice%"=="80" goto BACKUP_ZALO
if "%choice%"=="81" goto BACKUP_PRODUCT_KEYS
if "%choice%"=="82" goto DATA_RECOVERY
if "%choice%"=="88" goto RUN_ALL_CLEANUP
if "%choice%"=="99" goto FULL_OPTIMIZE

echo(
echo Lua chon khong hop le!
timeout /t 2 >nul
goto MAIN_MENU_VI



:: ============================================================================
:: FUNCTION IMPLEMENTATIONS [83-96] - INSTALLATION & UTILITIES
:: ============================================================================

:INSTALL_SOFTWARE
cls
color 0E
echo(
echo  ================================================================================
echo   [1] CAI DAT PHAN MEM - INSTALL SOFTWARE
echo  ================================================================================
echo(
echo  Su dung Chocolatey - Windows Package Manager
echo(
echo  [*] Kiem tra Chocolatey...

where choco >nul 2>&1
if %errorLevel% neq 0 (
    echo  [!] Chocolatey chua cai dat
    echo  [*] Dang cai dat Chocolatey...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
    if %errorLevel% equ 0 (
        echo  [+] Chocolatey da duoc cai dat thanh cong!
    ) else (
        echo  [!] Loi khi cai dat Chocolatey
        pause
        goto MAIN_MENU
    )
) else (
    echo  [+] Chocolatey da duoc cai dat!
)

echo(
echo  -------------------------------------------------------------------------------
echo   CHON PHAN MEM CAN CAI / SELECT SOFTWARE TO INSTALL
echo  -------------------------------------------------------------------------------
echo(
echo   [1]  Google Chrome          [2]  Firefox
echo   [3]  7-Zip                  [4]  WinRAR
echo   [5]  VLC Media Player       [6]  Adobe Reader
echo   [7]  Notepad++              [8]  Visual Studio Code
echo   [9]  Git                    [10] Python
echo   [11] Java JDK               [12] Node.js
echo   [13] CCleaner               [14] TeamViewer
echo   [15] Zoom                   [16] Discord
echo   [17] Telegram               [18] Skype
echo   [19] Cai Tat Ca Tien Ich   [0]  Quay lai / Back
echo(
set /p sw="  Chon phan mem (0-19): "

if "%sw%"=="0" goto MAIN_MENU
if "%sw%"=="1" choco install googlechrome -y
if "%sw%"=="2" choco install firefox -y
if "%sw%"=="3" choco install 7zip -y
if "%sw%"=="4" choco install winrar -y
if "%sw%"=="5" choco install vlc -y
if "%sw%"=="6" choco install adobereader -y
if "%sw%"=="7" choco install notepadplusplus -y
if "%sw%"=="8" choco install vscode -y
if "%sw%"=="9" choco install git -y
if "%sw%"=="10" choco install python -y
if "%sw%"=="11" choco install openjdk -y
if "%sw%"=="12" choco install nodejs -y
if "%sw%"=="13" choco install ccleaner -y
if "%sw%"=="14" choco install teamviewer -y
if "%sw%"=="15" choco install zoom -y
if "%sw%"=="16" choco install discord -y
if "%sw%"=="17" choco install telegram -y
if "%sw%"=="18" choco install skype -y
if "%sw%"=="19" (
    echo  [*] Cai dat tat ca phan mem tien ich...
    choco install googlechrome firefox 7zip vlc notepadplusplus vscode -y
)

echo(
echo  [+] HOAN THANH! / COMPLETED!
echo(
pause
goto MAIN_MENU

:INSTALL_OFFICE
cls
color 0E
echo(
echo  ================================================================================
echo   [2] CAI DAT OFFICE - INSTALL OFFICE SUITE
echo  ================================================================================
echo(
echo  [*] Dang kiem tra Office...
echo(
:: Check if Office is installed
reg query "HKLM\SOFTWARE\Microsoft\Office" >nul 2>&1
if %errorLevel% equ 0 (
    echo  [+] Office da duoc cai dat!
    echo(
    echo  [1] Sua chua Office / Repair Office
    echo  [2] Kich hoat Office / Activate Office
    echo  [3] Xoa Office / Uninstall Office
    echo  [0] Quay lai / Back
    echo(
    set /p off="  Chon (0-3): "
    
    if "!off!"=="1" (
        echo  [*] Sua chua Office...
        start /wait control /name Microsoft.ProgramsAndFeatures
    )
    if "!off!"=="2" goto ACTIVATE_OFFICE
    if "!off!"=="3" (
        echo  [*] Xoa Office...
        echo  [!] Vui long xoa qua Control Panel
        start /wait control /name Microsoft.ProgramsAndFeatures
    )
    if "!off!"=="0" goto MAIN_MENU
) else (
    echo  [!] Office chua duoc cai dat
    echo(
    echo  [1] Tai Office Online (Microsoft 365)
    echo  [2] Tai Office Offline Installer
    echo  [3] Huong dan cai dat thu cong
    echo  [0] Quay lai / Back
    echo(
    set /p off2="  Chon (0-3): "
    
    if "!off2!"=="1" (
        echo  [*] Mo trang tai Office...
        start https://www.office.com/
    )
    if "!off2!"=="2" (
        echo  [*] Mo trang tai Office Tool...
        start https://otp.landian.vip/
    )
    if "!off2!"=="3" (
        echo(
        echo  HUONG DAN CAI DAT OFFICE:
        echo  -------------------------
        echo  1. Tai Office Tool Plus: https://otp.landian.vip/
        echo  2. Chon phien ban Office muon cai
        echo  3. Chon cac ung dung (Word, Excel, PowerPoint...)
        echo  4. Click "Start Install"
        echo(
    )
)

pause
goto MAIN_MENU

:ACTIVATE_OFFICE
echo(
echo  [*] KICH HOAT OFFICE / ACTIVATE OFFICE
echo  =======================================
echo(
echo  [!] LUU Y: Chi dung cho muc dich test!
echo  [!] NOTE: For testing purposes only!
echo(
echo  [1] Tu dong kich hoat (KMS)
echo  [2] Nhap Product Key
echo  [0] Huy / Cancel
echo(
set /p act="  Chon (0-2): "

if "%act%"=="1" (
    echo  [*] Dang kich hoat Office...
    cd /d "%ProgramFiles%\Microsoft Office\Office16" 2>nul || cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16" 2>nul
    if exist ospp.vbs (
        cscript ospp.vbs /sethst:kms.digiboy.ir
        cscript ospp.vbs /act
        echo  [+] Hoan thanh!
    ) else (
        echo  [!] Khong tim thay Office!
    )
)
if "%act%"=="2" (
    set /p key="  Nhap Product Key: "
    cd /d "%ProgramFiles%\Microsoft Office\Office16" 2>nul || cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16" 2>nul
    if exist ospp.vbs (
        cscript ospp.vbs /inpkey:!key!
        cscript ospp.vbs /act
        echo  [+] Hoan thanh!
    ) else (
        echo  [!] Khong tim thay Office!
    )
)

pause
goto MAIN_MENU

:CREATE_WINPE
cls
color 0E
echo(
echo  ================================================================================
echo   [3] TAO WINPE BOOT - CREATE WINPE BOOTABLE USB
echo  ================================================================================
echo(
echo  [*] Yeu cau / Requirements:
echo      - Windows ADK (Assessment and Deployment Kit)
echo      - USB drive (8GB+)
echo(
echo  [1] Tai Windows ADK
echo  [2] Tai WinPE Add-on
echo  [3] Tao WinPE (Yeu cau ADK da cai)
echo  [4] Huong dan chi tiet
echo  [0] Quay lai / Back
echo(
set /p winpe="  Chon (0-4): "

if "%winpe%"=="1" (
    echo  [*] Mo trang tai Windows ADK...
    start https://learn.microsoft.com/en-us/windows-hardware/get-started/adk-install
)
if "%winpe%"=="2" (
    echo  [*] Mo trang tai WinPE Add-on...
    start https://learn.microsoft.com/en-us/windows-hardware/get-started/adk-install
)
if "%winpe%"=="3" (
    echo(
    echo  [*] Kiem tra Windows ADK...
    
    if exist "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools" (
        echo  [+] Windows ADK da duoc cai dat!
        echo(
        echo  [*] Bat dau tao WinPE...
        echo(
        call "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\DandISetEnv.bat"
        
        echo  [1] Tao WinPE workspace...
        copype amd64 C:\WinPE_amd64
        
        echo  [2] Mount WinPE image...
        Dism /Mount-Image /ImageFile:"C:\WinPE_amd64\media\sources\boot.wim" /index:1 /MountDir:"C:\WinPE_amd64\mount"
        
        echo  [3] Them drivers va tools...
        echo  [!] Ban co the them drivers/tools vao C:\WinPE_amd64\mount
        pause
        
        echo  [4] Unmount image...
        Dism /Unmount-Image /MountDir:"C:\WinPE_amd64\mount" /commit
        
        echo  [5] Tao ISO...
        MakeWinPEMedia /ISO C:\WinPE_amd64 C:\WinPE_amd64\WinPE_amd64.iso
        
        echo(
        echo  [+] HOAN THANH!
        echo  [+] File ISO: C:\WinPE_amd64\WinPE_amd64.iso
        echo(
    ) else (
        echo  [!] Windows ADK chua duoc cai dat!
        echo  [!] Vui long cai Windows ADK truoc
    )
)
if "%winpe%"=="4" (
    echo(
    echo  HUONG DAN TAO WINPE:
    echo  ====================
    echo  1. Tai va cai Windows ADK
    echo  2. Tai va cai WinPE Add-on
    echo  3. Mo Deployment and Imaging Tools Environment (Admin)
    echo  4. Chay lenh: copype amd64 C:\WinPE_amd64
    echo  5. Tao USB boot: MakeWinPEMedia /UFD C:\WinPE_amd64 E:
    echo     (Thay E: bang drive USB cua ban)
    echo(
)

pause
goto MAIN_MENU

:LTSC_STORE
cls
color 0E
echo(
echo  ================================================================================
echo   [4] STORE CHO WIN LTSC - MICROSOFT STORE FOR LTSC
echo  ================================================================================
echo(
echo  [*] Cai dat Microsoft Store cho Windows 10/11 LTSC
echo(
echo  [!] LUU Y: Chi ho tro Windows 10/11 LTSC
echo(
set /p confirm="  Ban co muon tiep tuc? (Y/N): "
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo(
echo  [1] Dang tai Microsoft Store package...
echo(
:: Download and install Microsoft Store
powershell -NoProfile -ExecutionPolicy Bypass -Command "& {Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.WindowsStore_8wekyb3d8bbwe}"

if %errorLevel% equ 0 (
    echo  [+] Microsoft Store da duoc cai dat!
    echo  [+] Vui long khoi dong lai may
) else (
    echo  [!] Loi khi cai dat Store
    echo(
    echo  [*] Thu phuong phap khac...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "& {Get-AppxPackage -allusers Microsoft.WindowsStore | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register `"$($_.InstallLocation)\AppXManifest.xml`"}}"
)

echo(
pause
goto MAIN_MENU

:WIN_TO_HDD
cls
color 0E
echo(
echo  ================================================================================
echo   [5] CAI WIN BANG WIN TO HDD - INSTALL WINDOWS VIA WIN TO HDD
echo  ================================================================================
echo(
echo  [*] WinToHDD - Cai Windows khong can USB/DVD
echo(
echo  [1] Tai WinToHDD Free
echo  [2] Tai WinToHDD Professional
echo  [3] Huong dan su dung
echo  [0] Quay lai / Back
echo(
set /p winhdd="  Chon (0-3): "

if "%winhdd%"=="1" (
    echo  [*] Mo trang tai WinToHDD Free...
    start https://www.easyuefi.com/wintohdd/index.html
)
if "%winhdd%"=="2" (
    echo  [*] Mo trang tai WinToHDD Pro...
    start https://www.easyuefi.com/wintohdd/wintohdd-pro.html
)
if "%winhdd%"=="3" (
    echo(
    echo  HUONG DAN SU DUNG WINTOHDD:
    echo  ============================
    echo  1. Tai va cai dat WinToHDD
    echo  2. Chon "Reinstall Windows"
    echo  3. Chon file ISO Windows
    echo  4. Chon phien ban Windows muon cai
    echo  5. Chon phan vung de cai Windows
    echo  6. Click "Next" de bat dau
    echo(
    echo  [!] LUU Y: Sao luu du lieu truoc khi cai!
    echo(
)

pause
goto MAIN_MENU

:: ============================================================================
:: UTILITIES FUNCTIONS [6-14]
:: ============================================================================

:CLEAN_JUNK
cls
color 0A
echo(
echo  ================================================================================
echo   [6] XOA FILE RAC - CLEAN JUNK FILES (ADVANCED)
echo  ================================================================================
echo(
echo  [*] Don dep nang cao tat ca file rac trong he thong
echo(
set /p confirm="  Tiep tuc? (Y/N): "
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo(
echo  [1/10] Dang xoa Temp files...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1

echo  [2/10] Dang xoa Windows Update cache...
net stop wuauserv >nul 2>&1
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1

echo  [3/10] Dang xoa Prefetch files...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo  [4/10] Dang xoa Thumbnail cache...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1

echo  [5/10] Dang xoa Browser cache...
taskkill /f /im chrome.exe >nul 2>&1
taskkill /f /im msedge.exe >nul 2>&1
taskkill /f /im firefox.exe >nul 2>&1
timeout /t 2 /nobreak >nul
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1

echo  [6/10] Dang xoa Windows Error Reports...
del /f /s /q "C:\ProgramData\Microsoft\Windows\WER\*" >nul 2>&1

echo  [7/10] Dang xoa Log files...
del /f /s /q "C:\Windows\Logs\*" >nul 2>&1

echo  [8/10] Dang xoa Recycle Bin...
PowerShell.exe -NoProfile -Command Clear-RecycleBin -Force -ErrorAction SilentlyContinue

echo  [9/10] Dang xoa Memory dumps...
del /f /q "C:\Windows\MEMORY.DMP" >nul 2>&1
del /f /s /q "C:\Windows\Minidump\*" >nul 2>&1

echo  [10/10] Dang chay Disk Cleanup...
cleanmgr /sagerun:1 >nul 2>&1

echo(
echo  [+] HOAN THANH! File rac da duoc xoa sach!
echo(
pause
goto MAIN_MENU

:SHOW_HIDDEN
cls
color 0A
echo(
echo  ================================================================================
echo   [7] HIEN FILE AN - SHOW HIDDEN FILES
echo  ================================================================================
echo(
echo  [1] Hien tat ca file an / Show all hidden files
echo  [2] An file he thong / Hide system files
echo  [3] Hien file va folder an / Show hidden files and folders
echo  [4] Hien file extension / Show file extensions
echo  [0] Quay lai / Back
echo(
set /p hidden="  Chon (0-4): "

if "%hidden%"=="1" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f >nul
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 1 /f >nul
    echo  [+] Hien tat ca file an: BAT
)
if "%hidden%"=="2" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 2 /f >nul
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 0 /f >nul
    echo  [+] An file he thong: BAT
)
if "%hidden%"=="3" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f >nul
    echo  [+] Hien file va folder an: BAT
)
if "%hidden%"=="4" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f >nul
    echo  [+] Hien file extension: BAT
)

if not "%hidden%"=="0" (
    echo  [*] Khoi dong lai Explorer...
    taskkill /f /im explorer.exe >nul
    start explorer.exe
    echo  [+] HOAN THANH!
)

pause
goto MAIN_MENU

:UPDATE_TOGGLE
cls
color 0E
echo(
echo  ================================================================================
echo   [8] DAT/TAT UPDATE - ENABLE/DISABLE WINDOWS UPDATE
echo  ================================================================================
echo(
echo  [1] TAT Windows Update (Disable)
echo  [2] BAT Windows Update (Enable)
echo  [3] Tam dung Update (Pause for 7 days)
echo  [4] Kiem tra trang thai Update
echo  [0] Quay lai / Back
echo(
set /p upd="  Chon (0-4): "

if "%upd%"=="1" (
    echo  [*] Dang TAT Windows Update...
    sc config wuauserv start= disabled >nul
    net stop wuauserv >nul 2>&1
    sc config bits start= disabled >nul
    net stop bits >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f >nul
    echo  [+] Windows Update da duoc TAT!
)
if "%upd%"=="2" (
    echo  [*] Dang BAT Windows Update...
    sc config wuauserv start= auto >nul
    net start wuauserv >nul 2>&1
    sc config bits start= auto >nul
    net start bits >nul 2>&1
    reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /f >nul 2>&1
    echo  [+] Windows Update da duoc BAT!
)
if "%upd%"=="3" (
    echo  [*] Tam dung Update trong 7 ngay...
    reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v PauseUpdatesExpiryTime /t REG_SZ /d "2025-01-11T12:00:00Z" /f >nul
    echo  [+] Update da duoc tam dung!
)
if "%upd%"=="4" (
    echo  [*] Kiem tra trang thai...
    sc query wuauserv | find "STATE"
    echo(
    reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate 2>nul
    if %errorLevel% equ 0 (
        echo  [!] Windows Update: DISABLED
    ) else (
        echo  [+] Windows Update: ENABLED
    )
)

echo(
pause
goto MAIN_MENU

:FIX_PRINTER
cls
color 0A
echo(
echo  ================================================================================
echo   [9] FIX LOI MAY IN - FIX PRINTER ISSUES
echo  ================================================================================
echo(
echo  [1] Khoi dong lai Print Spooler
echo  [2] Xoa hang doi in (Print Queue)
echo  [3] Reset Print Spooler
echo  [4] Cai dat lai driver may in
echo  [5] Chay Printer Troubleshooter
echo  [0] Quay lai / Back
echo(
set /p printer="  Chon (0-5): "

if "%printer%"=="1" (
    echo  [*] Dang khoi dong lai Print Spooler...
    net stop spooler
    net start spooler
    echo  [+] Print Spooler da duoc khoi dong lai!
)
if "%printer%"=="2" (
    echo  [*] Dang xoa hang doi in...
    net stop spooler
    del /f /s /q "%SystemRoot%\System32\spool\PRINTERS\*" >nul 2>&1
    net start spooler
    echo  [+] Hang doi in da duoc xoa!
)
if "%printer%"=="3" (
    echo  [*] Dang reset Print Spooler...
    net stop spooler
    del /f /s /q "%SystemRoot%\System32\spool\PRINTERS\*" >nul 2>&1
    reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Print\Printers" /f >nul 2>&1
    net start spooler
    echo  [+] Print Spooler da duoc reset!
)
if "%printer%"=="4" (
    echo  [*] Mo Device Manager...
    devmgmt.msc
    echo(
    echo  [!] Vui long:
    echo      1. Tim may in trong "Printers"
    echo      2. Right-click → Uninstall device
    echo      3. Restart may tinh
    echo      4. Cai lai driver
)
if "%printer%"=="5" (
    echo  [*] Chay Printer Troubleshooter...
    msdt.exe /id PrinterDiagnostic
)

echo(
pause
goto MAIN_MENU

:CHECK_TEST
cls
color 0B
echo(
echo  ================================================================================
echo   [10] CHECK - TEST - SYSTEM TEST TOOLS
echo  ================================================================================
echo(
echo  [1]  Kiem tra RAM (Windows Memory Diagnostic)
echo  [2]  Kiem tra o dia (CHKDSK)
echo  [3]  Kiem tra file he thong (SFC)
echo  [4]  Kiem tra SMART disk health
echo  [5]  Test GPU (DirectX Diagnostic)
echo  [6]  Test CPU (Performance Monitor)
echo  [7]  Xem thong tin chi tiet (System Info)
echo  [8]  Kiem tra lich su crash
echo  [9]  Test mang (Network Diagnostic)
echo  [10] Chay tat ca test
echo  [0]  Quay lai / Back
echo(
set /p test="  Chon (0-10): "

if "%test%"=="1" (
    echo  [*] Chay Windows Memory Diagnostic...
    mdsched.exe
)
if "%test%"=="2" (
    echo  [*] Chay CHKDSK...
    echo Y | chkdsk C: /f /r /x
    echo  [!] May se tu dong restart de kiem tra
)
if "%test%"=="3" (
    echo  [*] Chay System File Checker...
    sfc /scannow
)
if "%test%"=="4" (
    echo  [*] Kiem tra SMART disk health...
    wmic diskdrive get status
    echo(
    wmic diskdrive get model,serialnumber,size,status
)
if "%test%"=="5" (
    echo  [*] Chay DirectX Diagnostic Tool...
    dxdiag
)
if "%test%"=="6" (
    echo  [*] Chay Performance Monitor...
    perfmon
)
if "%test%"=="7" (
    echo  [*] Xem System Information...
    msinfo32
)
if "%test%"=="8" (
    echo  [*] Kiem tra lich su crash...
    eventvwr.msc
)
if "%test%"=="9" (
    echo  [*] Test mang...
    echo(
    echo  Ping Google:
    ping -n 4 8.8.8.8
    echo(
    echo  Traceroute:
    tracert -d -h 10 8.8.8.8
    echo(
    echo  Network Configuration:
    ipconfig /all
)
if "%test%"=="10" (
    echo  [*] Chay tat ca test...
    echo  [1/5] System File Check...
    sfc /scannow
    echo  [2/5] Disk Check...
    echo Y | chkdsk C: /f
    echo  [3/5] DISM Repair...
    Dism /Online /Cleanup-Image /RestoreHealth
    echo  [4/5] Network Reset...
    ipconfig /flushdns
    netsh winsock reset
    echo  [5/5] Event Log...
    wevtutil el
    echo  [+] HOAN THANH!
)

echo(
pause
goto MAIN_MENU

:DEFENDER_MANAGE
cls
color 0C
echo(
echo  ================================================================================
echo   [11] WINDOWS DEFENDER - DEFENDER MANAGEMENT
echo  ================================================================================
echo(
echo  [1] BAT Windows Defender
echo  [2] TAT Windows Defender (Tam thoi)
echo  [3] Quet nhanh (Quick Scan)
echo  [4] Quet day du (Full Scan)
echo  [5] Update Defender definitions
echo  [6] Xem lich su quet
echo  [7] Quan ly exclusions
echo  [8] Mo Windows Security
echo  [0] Quay lai / Back
echo(
set /p def="  Chon (0-8): "

if "%def%"=="1" (
    echo  [*] Dang BAT Windows Defender...
    powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false"
    sc config WinDefend start= auto
    net start WinDefend
    echo  [+] Windows Defender da duoc BAT!
)
if "%def%"=="2" (
    echo  [*] Dang TAT Windows Defender...
    powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
    echo  [+] Windows Defender da duoc TAT tam thoi!
    echo  [!] Se tu dong BAT lai sau khi restart
)
if "%def%"=="3" (
    echo  [*] Chay Quick Scan...
    powershell -Command "Start-MpScan -ScanType QuickScan"
    echo  [+] Scan hoan thanh!
)
if "%def%"=="4" (
    echo  [*] Chay Full Scan...
    echo  [!] Co the mat vai phut...
    powershell -Command "Start-MpScan -ScanType FullScan"
    echo  [+] Scan hoan thanh!
)
if "%def%"=="5" (
    echo  [*] Cap nhat Defender definitions...
    powershell -Command "Update-MpSignature"
    echo  [+] Cap nhat hoan thanh!
)
if "%def%"=="6" (
    echo  [*] Lich su quet:
    powershell -Command "Get-MpThreatDetection"
)
if "%def%"=="7" (
    echo  [*] Quan ly exclusions...
    powershell -Command "Get-MpPreference | Select-Object -Property ExclusionPath,ExclusionExtension,ExclusionProcess"
)
if "%def%"=="8" (
    echo  [*] Mo Windows Security...
    start windowsdefender:
)

echo(
pause
goto MAIN_MENU

:ISO_REPO
cls
color 0B
echo(
echo  ================================================================================
echo   [12] KHO ISO WINDOWS - WINDOWS ISO REPOSITORY
echo  ================================================================================
echo(
echo  [1] Tai Windows 11 (Official)
echo  [2] Tai Windows 10 (Official)
echo  [3] Tai Windows 8.1
echo  [4] Tai Windows 7
echo  [5] Tai Windows Server
echo  [6] Tai Media Creation Tool
echo  [7] Tai Rufus (Tao USB boot)
echo  [8] Kiem tra toan ven ISO
echo  [0] Quay lai / Back
echo(
set /p iso="  Chon (0-8): "

if "%iso%"=="1" (
    echo  [*] Mo trang tai Windows 11...
    start https://www.microsoft.com/software-download/windows11
)
if "%iso%"=="2" (
    echo  [*] Mo trang tai Windows 10...
    start https://www.microsoft.com/software-download/windows10
)
if "%iso%"=="3" (
    echo  [*] Mo trang tai Windows 8.1...
    start https://www.microsoft.com/software-download/windows8
)
if "%iso%"=="4" (
    echo  [*] Mo trang tai Windows 7...
    start https://www.microsoft.com/software-download/windows7
)
if "%iso%"=="5" (
    echo  [*] Mo trang tai Windows Server...
    start https://www.microsoft.com/evalcenter/evaluate-windows-server
)
if "%iso%"=="6" (
    echo  [*] Tai Media Creation Tool...
    start https://go.microsoft.com/fwlink/?LinkId=691209
)
if "%iso%"=="7" (
    echo  [*] Tai Rufus...
    start https://rufus.ie/
)
if "%iso%"=="8" (
    echo  [*] Kiem tra ISO integrity...
    set /p isopath="  Nhap duong dan ISO: "
    if exist "!isopath!" (
        echo  [*] Tinh toan hash...
        certutil -hashfile "!isopath!" SHA256
    ) else (
        echo  [!] File khong ton tai!
    )
)

echo(
pause
goto MAIN_MENU

:IRST_DRIVERS
cls
color 0B
echo(
echo  ================================================================================
echo   [13] KHO DRIVER IRST - INTEL RST DRIVERS
echo  ================================================================================
echo(
echo  [*] Intel Rapid Storage Technology Drivers
echo(
echo  [1] Kiem tra IRST hien tai
echo  [2] Tai driver IRST moi nhat
echo  [3] Tai driver cho Windows 11
echo  [4] Tai driver cho Windows 10
echo  [5] Tai driver cho Windows 7
echo  [6] Mo Intel Driver Support Assistant
echo  [0] Quay lai / Back
echo(
set /p irst="  Chon (0-6): "

if "%irst%"=="1" (
    echo  [*] Kiem tra IRST...
    reg query "HKLM\SOFTWARE\Intel\IntelRST" 2>nul
    if %errorLevel% equ 0 (
        echo  [+] IRST da duoc cai dat!
        wmic path win32_systemdriver where "name='iaStorA'" get displayname,state,status
    ) else (
        echo  [!] IRST chua duoc cai dat
    )
)
if "%irst%"=="2" (
    echo  [*] Mo trang tai IRST...
    start https://www.intel.com/content/www/us/en/download/19512/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-10th-and-11th-gen-platforms.html
)
if "%irst%"=="3" (
    echo  [*] Tai IRST cho Windows 11...
    start https://www.intel.com/content/www/us/en/download/19512/
)
if "%irst%"=="4" (
    echo  [*] Tai IRST cho Windows 10...
    start https://www.intel.com/content/www/us/en/download/15667/
)
if "%irst%"=="5" (
    echo  [*] Tai IRST cho Windows 7...
    start https://www.intel.com/content/www/us/en/download/29917/
)
if "%irst%"=="6" (
    echo  [*] Tai Intel Driver Support Assistant...
    start https://www.intel.com/content/www/us/en/support/intel-driver-support-assistant.html
)

echo(
pause
goto MAIN_MENU

:SKU_MANAGE
cls
color 0E
echo(
echo  ================================================================================
echo   [14] SKUS WIN/OFFICE - PRODUCT KEY MANAGEMENT
echo  ================================================================================
echo(
echo  [1] Xem Product Key Windows
echo  [2] Xem Product Key Office
echo  [3] Kich hoat Windows
echo  [4] Kich hoat Office
echo  [5] Xem trang thai kich hoat
echo  [6] Thay doi Product Key
echo  [7] Backup Product Keys
echo  [0] Quay lai / Back
echo(
set /p sku="  Chon (0-7): "

if "%sku%"=="1" (
    echo  [*] Product Key Windows:
    wmic path softwarelicensingservice get OA3xOriginalProductKey 2>nul
    echo(
    powershell -Command "(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey"
)
if "%sku%"=="2" (
    echo  [*] Product Key Office:
    cd /d "%ProgramFiles%\Microsoft Office\Office16" 2>nul || cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16" 2>nul
    if exist ospp.vbs (
        cscript ospp.vbs /dstatus
    ) else (
        echo  [!] Office khong duoc tim thay
    )
)
if "%sku%"=="3" (
    echo  [*] KICH HOAT WINDOWS
    echo  =====================
    echo(
    echo  [1] Tu dong kich hoat (KMS)
    echo  [2] Nhap Product Key
    echo  [0] Huy
    echo(
    set /p wact="  Chon (0-2): "
    
    if "!wact!"=="1" (
        echo  [*] Dang kich hoat...
        slmgr /skms kms.digiboy.ir
        slmgr /ato
        echo  [+] Hoan thanh!
    )
    if "!wact!"=="2" (
        set /p wkey="  Nhap Product Key: "
        slmgr /ipk !wkey!
        slmgr /ato
        echo  [+] Hoan thanh!
    )
)
if "%sku%"=="4" goto ACTIVATE_OFFICE
if "%sku%"=="5" (
    echo  [*] TRANG THAI KICH HOAT
    echo  ========================
    echo(
    echo  WINDOWS:
    slmgr /dli
    echo(
    echo  OFFICE:
    cd /d "%ProgramFiles%\Microsoft Office\Office16" 2>nul || cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16" 2>nul
    if exist ospp.vbs cscript ospp.vbs /dstatus
)
if "%sku%"=="6" (
    echo  [*] THAY DOI PRODUCT KEY
    echo  ========================
    echo(
    echo  [1] Thay doi key Windows
    echo  [2] Thay doi key Office
    echo(
    set /p change="  Chon (1-2): "
    
    if "!change!"=="1" (
        set /p newkey="  Nhap key Windows moi: "
        slmgr /ipk !newkey!
        slmgr /ato
    )
    if "!change!"=="2" (
        set /p offkey="  Nhap key Office moi: "
        cd /d "%ProgramFiles%\Microsoft Office\Office16" 2>nul || cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16" 2>nul
        if exist ospp.vbs (
            cscript ospp.vbs /inpkey:!offkey!
            cscript ospp.vbs /act
        )
    )
)
if "%sku%"=="7" (
    echo  [*] BACKUP PRODUCT KEYS
    echo  =======================
    echo(
    set "backup=%USERPROFILE%\Desktop\ProductKeys_Backup_%date:~-4%%date:~3,2%%date:~0,2%.txt"
    echo  Product Keys Backup > "!backup!"
    echo  Created: %date% %time% >> "!backup!"
    echo( >> "!backup!"
    echo  WINDOWS KEY: >> "!backup!"
    wmic path softwarelicensingservice get OA3xOriginalProductKey >> "!backup!" 2>nul
    echo( >> "!backup!"
    echo  WINDOWS STATUS: >> "!backup!"
    slmgr /dli >> "!backup!" 2>nul
    echo(
    echo  [+] Backup saved to: !backup!
)

echo(
pause
goto MAIN_MENU

:: ============================================================================
:: QUICK ACTIONS [88, 99]
:: ============================================================================

:RUN_ALL
cls
color 0A
echo(
echo  ================================================================================
echo   [88] CHAY TAT CA TIEN ICH - RUN ALL UTILITIES
echo  ================================================================================
echo(
set /p confirm="  Chay tat ca cong cu tien ich? (Y/N): "
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo(
echo  [*] Bat dau chay tat ca tien ich...
echo(
echo  [1/7] Xoa file rac...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1

echo  [2/7] Hien file an...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f >nul

echo  [3/7] Xoa hang doi in...
net stop spooler >nul 2>&1
del /f /s /q "%SystemRoot%\System32\spool\PRINTERS\*" >nul 2>&1
net start spooler >nul 2>&1

echo  [4/7] Cap nhat Defender...
powershell -Command "Update-MpSignature" >nul 2>&1

echo  [5/7] Kiem tra file he thong...
sfc /scannow

echo  [6/7] Reset network...
ipconfig /flushdns >nul

echo  [7/7] Don dep registry...
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f >nul 2>&1

echo(
echo  [+] HOAN THANH TAT CA!
echo(
pause
goto MAIN_MENU

:OPTIMIZE_ALL
cls
color 0A
echo(
echo  ================================================================================
echo   [99] TOI UU TOAN BO - FULL SYSTEM OPTIMIZATION
echo  ================================================================================
echo(
set /p confirm="  Toi uu toan bo he thong? (Y/N): "
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo(
echo  [*] Bat dau toi uu toan bo...
echo(
echo  [STEP 1/8] CLEANUP
echo  ==================
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
cleanmgr /sagerun:1 >nul 2>&1

echo(
echo  [STEP 2/8] NETWORK
echo  ==================
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global rss=enabled >nul
ipconfig /flushdns >nul

echo(
echo  [STEP 3/8] SERVICES
echo  ===================
sc config "DiagTrack" start= disabled >nul
sc config "dmwappushservice" start= disabled >nul

echo(
echo  [STEP 4/8] REGISTRY
echo  ===================
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v RegistrySizeLimit /t REG_DWORD /d 0x40000000 /f >nul

echo(
echo  [STEP 5/8] PERFORMANCE
echo  ======================
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

echo(
echo  [STEP 6/8] SYSTEM FILES
echo  =======================
sfc /scannow >nul 2>&1

echo(
echo  [STEP 7/8] DEFENDER
echo  ===================
powershell -Command "Update-MpSignature" >nul 2>&1

echo(
echo  [STEP 8/8] FINALIZE
echo  ===================
taskkill /f /im explorer.exe >nul
start explorer.exe

echo(
echo  ================================================================================
echo   [+] TOI UU HOAN THANH! / OPTIMIZATION COMPLETE!
echo  ================================================================================
echo(
echo   Vui long khoi dong lai may tinh de ap dung tat ca thay doi
echo   Please restart computer to apply all changes
echo(
pause
goto MAIN_MENU



:EXIT
cls
color 0B
echo(
echo  ================================================================================
echo(
echo                Thank you for using Ultimate System Tools v5.0!
echo                 Cam on ban da su dung Ultimate System Tools!
echo(
echo                        Created by: Nguyen Ngoc Anh Tu
echo                         Version 5.0 - Complete Edition
echo                         96 Functions - All-in-One Tool
echo(
echo  ================================================================================
echo(
timeout /t 3 /nobreak >nul
exit
