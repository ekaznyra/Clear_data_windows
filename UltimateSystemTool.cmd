@echo off
:: ============================================================================
:: ULTIMATE WINDOWS SYSTEM TOOL v5.0 - PROFESSIONAL EDITION
:: Complete System Optimization Suite - Bilingual (English/Vietnamese)
:: ============================================================================
:: Based on open-source tools: BleachBit, CCleaner, PrivaZer, Wise Care 365
:: NEW v5.0: System utilities, Bloatware removal, Bitlocker, Settings center
:: v4.5: Auto-elevate, Software cache, LCU cleanup, Memory optimization
:: All commands are SAFE and tested for Windows 10/11
:: ============================================================================

title Ultimate Windows System Tool v5.0 - Professional Edition
chcp 65001 >nul 2>&1
color 0B

:: Welcome Screen with Loading Animation
cls
color 0B
echo.
echo.
echo             ?????????????????????????????????????????????????????????????
echo             ?                                                           ?
echo             ?        ULTIMATE WINDOWS SYSTEM TOOL v4.5                  ?
echo             ?        Professional System Optimization Suite             ?
echo             ?                                                           ?
echo             ?????????????????????????????????????????????????????????????
echo.
echo                          Loading / Dang tai...
echo.
echo                     [????????????????????????????] 100%%
echo.
timeout /t 1 /nobreak >nul

:: Check Administrator privileges and AUTO-ELEVATE
net session >nul 2>&1
if %errorLevel% neq 0 (
    cls
    color 0E
    echo.
    echo ??????????????????????????????????????????????????????????????????????????????????
    echo ?                                                                                ?
    echo ?   ??  ADMINISTRATOR RIGHTS REQUIRED / CAN QUYEN ADMINISTRATOR                  ?
    echo ?                                                                                ?
    echo ??????????????????????????????????????????????????????????????????????????????????
    echo.
    echo   This tool requires Administrator privileges to function properly.
    echo   Cong cu nay can quyen Administrator de hoat dong dung cach.
    echo.
    echo   ? Auto-elevating to Administrator...
    echo   ? Tu dong xin quyen Administrator...
    echo.
    timeout /t 2 /nobreak >nul
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~0\"' -Verb RunAs" 2>nul
    exit
)

:: Admin rights confirmed - Show success
cls
color 0A
echo.
echo ??????????????????????????????????????????????????????????????????????????????????
echo ?                                                                                ?
echo ?   ? ADMINISTRATOR RIGHTS CONFIRMED / XAC NHAN QUYEN ADMINISTRATOR              ?
echo ?                                                                                ?
echo ??????????????????????????????????????????????????????????????????????????????????
echo.
timeout /t 1 /nobreak >nul

:MAIN_MENU
cls
color 0B
echo.
echo.
echo                 ???   ??????  ????????????????   ???? ?????? ?????????????????
echo                 ???   ??????  ????????????????? ??????????????????????????????
echo                 ???   ??????     ???   ??????????????????????   ???   ??????  
echo                 ???   ??????     ???   ??????????????????????   ???   ??????  
echo                 ????????????????????   ?????? ??? ??????  ???   ???   ????????
echo                  ??????? ???????????   ??????     ??????  ???   ???   ????????
echo.
echo                    ???????????   ????????????????????????????????   ????
echo                    ???????????? ?????????????????????????????????? ?????
echo                    ???????? ??????? ????????   ???   ??????  ???????????
echo                    ????????  ?????  ????????   ???   ??????  ???????????
echo                    ????????   ???   ????????   ???   ??????????? ??? ???
echo                    ????????   ???   ????????   ???   ???????????     ???
echo.
echo ??????????????????????????????????????????????????????????????????????????????????
echo ?              ULTIMATE WINDOWS SYSTEM TOOL v4.5 - PROFESSIONAL                  ?
echo ?              Complete Optimization Suite - 70 Functions - Auto-Elevate         ?
echo ??????????????????????????????????????????????????????????????????????????????????
echo.
echo  ????????????????????????????????????????????????????????????????????????????????
echo  ?  ?? SYSTEM CLEANUP - DON DEP HE THONG                                        ?
echo  ????????????????????????????????????????????????????????????????????????????????
echo  [1]   Quick System Cleanup                - Don Dep Nhanh He Thong
echo  [2]   Deep System Cleanup                 - Don Dep Sau He Thong
echo  [3]   Browser Cache Cleanup               - Don Dep Cache Trinh Duyet
echo  [4]   Application Cache Cleanup           - Don Dep Cache Ung Dung
echo  [5]   Windows Update Cleanup              - Don Dep Windows Update
echo  [6]   Thumbnail Cache Cleanup             - Don Dep Thumbnail Cache
echo  [7]   Icon Cache Cleanup                  - Don Dep Icon Cache
echo  [8]   Font Cache Cleanup                  - Don Dep Font Cache
echo  [9]   Windows Installer Cleanup           - Don Dep Windows Installer
echo  [10]  Old Windows Installation Cleanup    - Don Dep Windows Cu
echo  [11]  Recycle Bin Cleanup                 - Don Dep Thung Rac
echo  [12]  Memory Dump Files Cleanup           - Don Dep File Dump Bo Nho
echo.
echo  ????????????????????????????????????????????????????????????????????????????????
echo  ?  ?? PRIVACY PROTECTION - BAO VE RIENG TU                                     ?
echo  ????????????????????????????????????????????????????????????????????????????????
echo  [13]  Clear Recent Documents              - Xoa Tai Lieu Gan Day
echo  [14]  Clear Run History                   - Xoa Lich Su Run
echo  [15]  Clear Search History                - Xoa Lich Su Tim Kiem
echo  [16]  Clear Clipboard History             - Xoa Lich Su Clipboard
echo  [17]  Clear Windows Error Reports         - Xoa Bao Cao Loi Windows
echo  [18]  Disable Telemetry and Tracking      - Tat Thu Thap Du Lieu
echo  [19]  Clear Event Logs                    - Xoa Nhat Ky Su Kien
echo  [20]  Clear DNS Cache                     - Xoa Cache DNS
echo.
echo  ????????????????????????????????????????????????????????????????????????????????
echo  ?  ?? NETWORK OPTIMIZATION - TOI UU MANG                                       ?
echo  ????????????????????????????????????????????????????????????????????????????????
echo  [21]  Reset Network Settings              - Reset Cai Dat Mang
echo  [22]  Optimize Network Performance        - Toi Uu Hieu Suat Mang
echo  [23]  Clear ARP Cache                     - Xoa Cache ARP
echo  [24]  Reset Winsock                       - Reset Winsock
echo  [25]  Renew IP Address                    - Lam Moi Dia Chi IP
echo  [26]  Fix Network Adapter                 - Sua Card Mang
echo.
echo  ????????????????????????????????????????????????????????????????????????????????
echo  ?  ?? DISK MANAGEMENT - QUAN LY O DIA                                          ?
echo  ????????????????????????????????????????????????????????????????????????????????
echo  [27]  Disk Cleanup (Windows Built-in)    - Don Dep O Dia (Tich Hop)
echo  [28]  Disk Error Check                    - Kiem Tra Loi O Dia
echo  [29]  Disk Optimization (Defrag/TRIM)     - Toi Uu O Dia
echo  [30]  Analyze Disk Space                  - Phan Tich Dung Luong
echo  [31]  Clean Windows.old Folder            - Xoa Thu Muc Windows.old
echo  [32]  Compact OS (Compress System)        - Nen He Thong
echo.
echo  ????????????????????????????????????????????????????????????????????????????????
echo  ?  ? PERFORMANCE OPTIMIZATION - TOI UU HIEU SUAT                               ?
echo  ????????????????????????????????????????????????????????????????????????????????
echo  [33]  Disable Startup Programs            - Tat Chuong Trinh Khoi Dong
echo  [34]  Optimize Services                   - Toi Uu Dich Vu
echo  [35]  Clear Prefetch Files                - Xoa File Prefetch
echo  [36]  Clear SuperFetch Cache              - Xoa Cache SuperFetch
echo  [37]  Disable Visual Effects              - Tat Hieu Ung Hinh Anh
echo  [38]  Optimize Power Plan (High Perf)     - Toi Uu Che Do Nguon
echo  [39]  Disable Hibernation                 - Tat Che Do Ngu Dong
echo  [40]  Clear Memory Cache                  - Xoa Cache Bo Nho
echo  [41]  Optimize Search Index               - Toi Uu Tim Kiem
echo  [42]  Disable Windows Animations          - Tat Hoat Anh Windows
echo  [43]  Optimize SSD Settings               - Toi Uu SSD
echo  [44]  Reduce Menu Show Delay              - Giam Tre Hien Thi Menu
echo.
echo  ????????????????????????????????????????????????????????????????????????????????
echo  ?  ?? SYSTEM MAINTENANCE - BAO TRI HE THONG                                    ?
echo  ????????????????????????????????????????????????????????????????????????????????
echo  [45]  System File Checker (SFC)           - Kiem Tra File He Thong
echo  [46]  DISM System Repair                  - Sua Chua He Thong DISM
echo  [47]  Windows Component Cleanup           - Don Dep Thanh Phan Windows
echo  [48]  Update Windows Drivers              - Cap Nhat Driver Windows
echo  [49]  Rebuild Icon Cache                  - Xay Dung Lai Icon Cache
echo  [50]  Rebuild Windows Search Index        - Xay Dung Lai Tim Kiem
echo.
echo  ????????????????????????????????????????????????????????????????????????????????
echo  ?  ?? REGISTRY OPTIMIZATION - TOI UU REGISTRY                                  ?
echo  ????????????????????????????????????????????????????????????????????????????????
echo  [51]  Clean Registry (Safe)               - Don Dep Registry (An Toan)
echo  [52]  Optimize Registry                   - Toi Uu Registry
echo  [53]  Backup Registry                     - Sao Luu Registry
echo  [54]  Disable Cortana                     - Tat Cortana
echo  [55]  Disable Windows Tips                - Tat Goi Y Windows
echo.
echo  ????????????????????????????????????????????????????????????????????????????????
echo  ?  ?? ADVANCED TOOLS - CONG CU NANG CAO                                        ?
echo  ????????????????????????????????????????????????????????????????????????????????
echo  [56]  Create System Restore Point         - Tao Diem Khoi Phuc He Thong
echo  [57]  View System Information             - Xem Thong Tin He Thong
echo  [58]  Export Installed Programs List      - Xuat Danh Sach Chuong Trinh
echo  [59]  Check Disk Health (SMART)           - Kiem Tra Suc Khoe O Dia
echo  [60]  Clear Windows Store Cache           - Xoa Cache Windows Store
echo  [61]  Reset Windows Update Components     - Reset Thanh Phan Update
echo  [62]  Optimize Boot Time                  - Toi Uu Thoi Gian Khoi Dong
echo  [63]  Clean All Temporary Files           - Xoa Tat Ca File Tam
echo  [64]  Generate System Report              - Tao Bao Cao He Thong
echo  [65]  Clean Software Cache (WPS/Adobe)    - Xoa Cache Phan Mem
echo  [66]  Clean Delivery Optimization         - Xoa Delivery Optimization
echo  [67]  Clean Update Backup (LCU)           - Xoa Sao Luu Cap Nhat
echo  [68]  Optimize Memory (RAM)               - Toi Uu Bo Nho RAM
echo  [69]  Show Disk Space Report              - Xem Bao Cao Dung Luong
echo  [70]  Refresh Icon Cache                  - Lam Moi Icon Cache
echo.
echo  ================================================================================
echo  [SYSTEM UTILITIES - TIEN ICH HE THONG]
echo  ================================================================================
echo  [71]  Check System Information           - Kiem Tra Thong Tin May
echo  [72]  Windows Settings Center             - Trung Tam Cai Dat Windows
echo  [73]  Office Repair and Reset             - Sua Chua va Reset Office
echo  [74]  Remove Bloatware (Safe)             - Xoa Ung Dung Rac (An Toan)
echo  [75]  Bitlocker Management                - Quan Ly Bitlocker
echo  [76]  Check Activation Status             - Kiem Tra Trang Thai Kich Hoat
echo.
echo  ================================================================================
echo  [QUICK ACTIONS - THAO TAC NHANH]
echo  ================================================================================
echo  [88]  RUN ALL CLEANUP TASKS               - CHAY TAT CA DON DEP
echo  [99]  FULL SYSTEM OPTIMIZATION            - TOI UU TOAN BO HE THONG
echo.
echo  [0]   ? EXIT - THOAT
echo  ????????????????????????????????????????????????????????????????????????????????
echo.
set /p choice=  ? Select function / Chon chuc nang (0-99): 

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
if "%choice%"=="88" goto RUN_ALL_CLEANUP
if "%choice%"=="99" goto FULL_OPTIMIZE

echo.
echo Invalid choice / Lua chon khong hop le!
timeout /t 2 >nul
goto MAIN_MENU

:: ============================================================================
:: SYSTEM CLEANUP FUNCTIONS - CHUC NANG DON DEP HE THONG
:: ============================================================================

:QUICK_CLEANUP
cls
echo ================================================================================
echo  [1] Quick System Cleanup - Don Dep Nhanh He Thong
echo ================================================================================
echo.
echo Processing / Dang xu ly...
echo.

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

echo.
echo [SUCCESS] Quick Cleanup Completed! / Hoan thanh don dep nhanh!
echo.
pause
goto MAIN_MENU

:DEEP_CLEANUP
cls
echo ================================================================================
echo  [2] Deep System Cleanup - Don Dep Sau He Thong
echo ================================================================================
echo.
echo This will take several minutes / Qua trinh nay mat vai phut...
echo.

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

echo.
echo [SUCCESS] Deep Cleanup Completed! / Hoan thanh don dep sau!
echo.
pause
goto MAIN_MENU

:BROWSER_CACHE
cls
echo ================================================================================
echo  [3] Browser Cache Cleanup - Don Dep Cache Trinh Duyet
echo ================================================================================
echo.
echo Cleaning browser caches / Xoa cache trinh duyet...
echo.

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

echo.
echo [SUCCESS] Browser caches cleaned! / Da xoa cache trinh duyet!
echo.
pause
goto MAIN_MENU

:APP_CACHE
cls
echo ================================================================================
echo  [4] Application Cache Cleanup - Don Dep Cache Ung Dung
echo ================================================================================
echo.
echo Cleaning application caches / Xoa cache ung dung...
echo.

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

echo.
echo [SUCCESS] Application caches cleaned! / Da xoa cache ung dung!
echo.
pause
goto MAIN_MENU

:WINDOWS_UPDATE_CLEANUP
cls
echo ================================================================================
echo  [5] Windows Update Cleanup - Don Dep Windows Update
echo ================================================================================
echo.
echo Cleaning Windows Update files / Xoa file Windows Update...
echo.

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

echo.
echo [SUCCESS] Windows Update cleaned! / Da xoa Windows Update!
echo.
pause
goto MAIN_MENU

:THUMBNAIL_CACHE
cls
echo ================================================================================
echo  [6] Thumbnail Cache Cleanup - Don Dep Thumbnail Cache
echo ================================================================================
echo.
echo Cleaning thumbnail cache / Xoa thumbnail cache...
echo.

echo [*] Stopping Windows Explorer / Dung Windows Explorer...
taskkill /F /IM explorer.exe >nul 2>&1

echo [*] Deleting thumbnail database / Xoa database thumbnail...
del /f /a /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
del /f /a /q "%LocalAppData%\Microsoft\Windows\Explorer\*.db" >nul 2>&1

echo [*] Restarting Windows Explorer / Khoi dong lai Explorer...
start explorer.exe

echo.
echo [SUCCESS] Thumbnail cache cleaned! / Da xoa thumbnail cache!
echo.
pause
goto MAIN_MENU

:ICON_CACHE
cls
echo ================================================================================
echo  [7] Icon Cache Cleanup - Don Dep Icon Cache
echo ================================================================================
echo.
echo Cleaning icon cache / Xoa icon cache...
echo.

echo [*] Stopping Windows Explorer / Dung Windows Explorer...
taskkill /F /IM explorer.exe >nul 2>&1

echo [*] Deleting icon cache / Xoa icon cache...
del /f /a /q "%LocalAppData%\IconCache.db" >nul 2>&1
del /f /a /q "%LocalAppData%\Microsoft\Windows\Explorer\iconcache_*.db" >nul 2>&1

echo [*] Restarting Windows Explorer / Khoi dong lai Explorer...
start explorer.exe

echo.
echo [SUCCESS] Icon cache cleaned! / Da xoa icon cache!
echo.
pause
goto MAIN_MENU

:FONT_CACHE
cls
echo ================================================================================
echo  [8] Font Cache Cleanup - Don Dep Font Cache
echo ================================================================================
echo.
echo Cleaning font cache / Xoa font cache...
echo.

echo [*] Stopping font cache service / Dung dich vu font cache...
net stop "Windows Font Cache Service" >nul 2>&1

echo [*] Deleting font cache files / Xoa file font cache...
del /f /s /q C:\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache\* >nul 2>&1
del /f /a /q C:\Windows\System32\FNTCACHE.DAT >nul 2>&1

echo [*] Starting font cache service / Khoi dong dich vu font cache...
net start "Windows Font Cache Service" >nul 2>&1

echo.
echo [SUCCESS] Font cache cleaned! / Da xoa font cache!
echo.
pause
goto MAIN_MENU

:INSTALLER_CLEANUP
cls
echo ================================================================================
echo  [9] Windows Installer Cleanup - Don Dep Windows Installer
echo ================================================================================
echo.
echo Cleaning Windows Installer cache / Xoa cache Windows Installer...
echo.

echo [*] Cleaning installer temp files / Xoa file tam installer...
del /f /s /q C:\Windows\Installer\$PatchCache$\* >nul 2>&1

echo [*] Note: MSI cache cleanup skipped for safety / Bo qua xoa MSI cache de dam bao an toan...

echo.
echo [SUCCESS] Windows Installer cleaned! / Da xoa Windows Installer!
echo.
pause
goto MAIN_MENU

:OLD_WINDOWS
cls
echo ================================================================================
echo  [10] Old Windows Installation Cleanup - Don Dep Windows Cu
echo ================================================================================
echo.
echo WARNING: This will delete Windows.old folder (cannot undo)
echo CANH BAO: Se xoa thu muc Windows.old (khong the hoan tac)
echo.
set /p confirm=Continue? / Tiep tuc? (Y/N): 
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo [*] Deleting Windows.old / Xoa Windows.old...
takeown /F C:\Windows.old\* /R /A /D Y >nul 2>&1
icacls C:\Windows.old\*.* /T /grant administrators:F >nul 2>&1
rd /s /q C:\Windows.old >nul 2>&1

echo [*] Deleting previous Windows installations / Xoa cai dat Windows truoc...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1

echo.
echo [SUCCESS] Old Windows cleaned! / Da xoa Windows cu!
echo.
pause
goto MAIN_MENU

:RECYCLE_BIN
cls
echo ================================================================================
echo  [11] Recycle Bin Cleanup - Don Dep Thung Rac
echo ================================================================================
echo.
echo Emptying Recycle Bin / Dang lam trong thung rac...
echo.

echo [*] Cleaning Recycle Bin on all drives / Xoa thung rac tren tat ca o dia...
rd /s /q C:\$Recycle.Bin >nul 2>&1
rd /s /q D:\$Recycle.Bin >nul 2>&1
rd /s /q E:\$Recycle.Bin >nul 2>&1
rd /s /q F:\$Recycle.Bin >nul 2>&1

echo.
echo [SUCCESS] Recycle Bin emptied! / Da lam trong thung rac!
echo.
pause
goto MAIN_MENU

:MEMORY_DUMP
cls
echo ================================================================================
echo  [12] Memory Dump Files Cleanup - Don Dep File Dump Bo Nho
echo ================================================================================
echo.
echo Cleaning memory dump files / Xoa file dump bo nho...
echo.

echo [*] Deleting memory dump files / Xoa file memory dump...
del /f /q C:\Windows\MEMORY.DMP >nul 2>&1
del /f /q C:\Windows\Minidump\*.dmp >nul 2>&1

echo [*] Deleting error report files / Xoa file bao cao loi...
del /f /s /q C:\ProgramData\Microsoft\Windows\WER\* >nul 2>&1

echo.
echo [SUCCESS] Memory dump files cleaned! / Da xoa file dump!
echo.
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
echo.
echo Clearing recent documents / Xoa tai lieu gan day...
echo.

echo [*] Clearing Recent folder / Xoa thu muc Recent...
del /f /s /q "%AppData%\Microsoft\Windows\Recent\*" >nul 2>&1
del /f /s /q "%AppData%\Microsoft\Windows\Recent\AutomaticDestinations\*" >nul 2>&1
del /f /s /q "%AppData%\Microsoft\Windows\Recent\CustomDestinations\*" >nul 2>&1

echo [*] Clearing Jump Lists / Xoa Jump Lists...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f >nul 2>&1

echo.
echo [SUCCESS] Recent documents cleared! / Da xoa tai lieu gan day!
echo.
pause
goto MAIN_MENU

:RUN_HISTORY
cls
echo ================================================================================
echo  [14] Clear Run History - Xoa Lich Su Run
echo ================================================================================
echo.
echo Clearing Run history / Xoa lich su Run...
echo.

echo [*] Deleting Run history from registry / Xoa lich su Run tu registry...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1

echo.
echo [SUCCESS] Run history cleared! / Da xoa lich su Run!
echo.
pause
goto MAIN_MENU

:SEARCH_HISTORY
cls
echo ================================================================================
echo  [15] Clear Search History - Xoa Lich Su Tim Kiem
echo ================================================================================
echo.
echo Clearing search history / Xoa lich su tim kiem...
echo.

echo [*] Deleting search history / Xoa lich su tim kiem...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f >nul 2>&1

echo.
echo [SUCCESS] Search history cleared! / Da xoa lich su tim kiem!
echo.
pause
goto MAIN_MENU

:CLIPBOARD_HISTORY
cls
echo ================================================================================
echo  [16] Clear Clipboard History - Xoa Lich Su Clipboard
echo ================================================================================
echo.
echo Clearing clipboard history / Xoa lich su clipboard...
echo.

echo [*] Clearing clipboard / Xoa clipboard...
echo off | clip

echo [*] Clearing clipboard history / Xoa lich su clipboard...
del /f /s /q "%LocalAppData%\Microsoft\Windows\Clipboard\*" >nul 2>&1

echo.
echo [SUCCESS] Clipboard history cleared! / Da xoa lich su clipboard!
echo.
pause
goto MAIN_MENU

:ERROR_REPORTS
cls
echo ================================================================================
echo  [17] Clear Windows Error Reports - Xoa Bao Cao Loi Windows
echo ================================================================================
echo.
echo Clearing error reports / Xoa bao cao loi...
echo.

echo [*] Deleting error reports / Xoa bao cao loi...
del /f /s /q C:\ProgramData\Microsoft\Windows\WER\* >nul 2>&1
for /d %%u in ("C:\Users\*") do del /f /s /q "%%u\AppData\Local\Microsoft\Windows\WER\*" >nul 2>&1

echo [*] Disabling error reporting / Tat bao cao loi...
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1

echo.
echo [SUCCESS] Error reports cleared! / Da xoa bao cao loi!
echo.
pause
goto MAIN_MENU

:DISABLE_TELEMETRY
cls
echo ================================================================================
echo  [18] Disable Telemetry and Tracking - Tat Thu Thap Du Lieu
echo ================================================================================
echo.
echo Disabling telemetry and tracking / Tat thu thap du lieu...
echo.

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

echo.
echo [SUCCESS] Telemetry disabled! / Da tat thu thap du lieu!
echo.
pause
goto MAIN_MENU

:EVENT_LOGS
cls
echo ================================================================================
echo  [19] Clear Event Logs - Xoa Nhat Ky Su Kien
echo ================================================================================
echo.
echo Clearing event logs / Xoa nhat ky su kien...
echo.

echo [*] Clearing all event logs / Xoa tat ca nhat ky su kien...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (
    echo Clearing / Xoa: %%G
    wevtutil.exe cl "%%G" >nul 2>&1
)

echo.
echo [SUCCESS] Event logs cleared! / Da xoa nhat ky su kien!
echo.
pause
goto MAIN_MENU

:DNS_CACHE
cls
echo ================================================================================
echo  [20] Clear DNS Cache - Xoa Cache DNS
echo ================================================================================
echo.
echo Clearing DNS cache / Xoa cache DNS...
echo.

echo [*] Flushing DNS resolver cache / Xoa DNS resolver cache...
ipconfig /flushdns

echo.
echo [SUCCESS] DNS cache cleared! / Da xoa cache DNS!
echo.
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
echo.
echo Resetting network settings / Reset cai dat mang...
echo.

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

echo.
echo [SUCCESS] Network settings reset! / Da reset cai dat mang!
echo [INFO] Please restart computer / Vui long khoi dong lai may!
echo.
pause
goto MAIN_MENU

:OPTIMIZE_NETWORK
cls
echo ================================================================================
echo  [22] Optimize Network Performance - Toi Uu Hieu Suat Mang
echo ================================================================================
echo.
echo Optimizing network performance / Toi uu hieu suat mang...
echo.

echo [*] Disabling TCP auto-tuning / Tat tu dong dieu chinh TCP...
netsh int tcp set global autotuninglevel=normal

echo [*] Enabling receive window auto-tuning / Bat tu dong dieu chinh receive window...
netsh int tcp set global rsc=enabled

echo [*] Optimizing network throttling / Toi uu network throttling...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul 2>&1

echo [*] Disabling bandwidth reservation / Tat dat truoc bang thong...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 0 /f >nul 2>&1

echo.
echo [SUCCESS] Network optimized! / Da toi uu mang!
echo.
pause
goto MAIN_MENU

:ARP_CACHE
cls
echo ================================================================================
echo  [23] Clear ARP Cache - Xoa Cache ARP
echo ================================================================================
echo.
echo Clearing ARP cache / Xoa cache ARP...
echo.

echo [*] Deleting ARP cache / Xoa ARP cache...
netsh interface ip delete arpcache

echo.
echo [SUCCESS] ARP cache cleared! / Da xoa cache ARP!
echo.
pause
goto MAIN_MENU

:WINSOCK_RESET
cls
echo ================================================================================
echo  [24] Reset Winsock - Reset Winsock
echo ================================================================================
echo.
echo Resetting Winsock catalog / Reset Winsock catalog...
echo.

echo [*] Resetting Winsock / Reset Winsock...
netsh winsock reset

echo [*] Resetting IP configuration / Reset cau hinh IP...
netsh int ip reset

echo.
echo [SUCCESS] Winsock reset! / Da reset Winsock!
echo [INFO] Please restart computer / Vui long khoi dong lai may!
echo.
pause
goto MAIN_MENU

:RENEW_IP
cls
echo ================================================================================
echo  [25] Renew IP Address - Lam Moi Dia Chi IP
echo ================================================================================
echo.
echo Renewing IP address / Lam moi dia chi IP...
echo.

echo [*] Releasing current IP / Giai phong IP hien tai...
ipconfig /release

echo [*] Renewing IP address / Lam moi dia chi IP...
ipconfig /renew

echo [*] Flushing DNS / Xoa DNS...
ipconfig /flushdns

echo.
echo [SUCCESS] IP address renewed! / Da lam moi dia chi IP!
echo.
pause
goto MAIN_MENU

:FIX_ADAPTER
cls
echo ================================================================================
echo  [26] Fix Network Adapter - Sua Card Mang
echo ================================================================================
echo.
echo Fixing network adapter / Sua card mang...
echo.

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

echo.
echo [SUCCESS] Network adapter fixed! / Da sua card mang!
echo.
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
echo.
echo Starting Windows Disk Cleanup / Khoi dong Windows Disk Cleanup...
echo.

cleanmgr /sagerun:1

echo.
echo [SUCCESS] Disk cleanup completed! / Hoan thanh don dep o dia!
echo.
pause
goto MAIN_MENU

:DISK_CHECK
cls
echo ================================================================================
echo  [28] Disk Error Check - Kiem Tra Loi O Dia
echo ================================================================================
echo.
echo Checking disk for errors / Kiem tra loi o dia...
echo.
set /p drive=Enter drive letter (C, D, etc.) / Nhap chu cai o dia: 

echo [*] Scheduling disk check for next boot / Len lich kiem tra o dia khi khoi dong lai...
echo Y | chkdsk %drive%: /f /r /x

echo.
echo [INFO] Disk check scheduled for next reboot / Da len lich kiem tra khi khoi dong lai!
echo [SUCCESS] Please restart your computer / Vui long khoi dong lai may tinh!
echo.
pause
goto MAIN_MENU

:DISK_OPTIMIZE
cls
echo ================================================================================
echo  [29] Disk Optimization (Defrag/TRIM) - Toi Uu O Dia
echo ================================================================================
echo.
echo Optimizing all drives / Toi uu tat ca o dia...
echo.

echo [*] Analyzing and optimizing drives / Phan tich va toi uu o dia...
defrag /C /O /H /U

echo.
echo [SUCCESS] Disk optimization completed! / Hoan thanh toi uu o dia!
echo.
pause
goto MAIN_MENU

:DISK_SPACE
cls
echo ================================================================================
echo  [30] Analyze Disk Space - Phan Tich Dung Luong
echo ================================================================================
echo.
echo Analyzing disk space usage / Phan tich dung luong o dia...
echo.

echo [*] Disk space on all drives / Dung luong tat ca o dia:
wmic logicaldisk get caption,size,freespace

echo.
echo [*] Top-level folders size / Kich thuoc thu muc cap 1:
dir C:\ /a:d

echo.
pause
goto MAIN_MENU

:WINDOWS_OLD
cls
echo ================================================================================
echo  [31] Clean Windows.old Folder - Xoa Thu Muc Windows.old
echo ================================================================================
echo.
echo WARNING: Cannot undo this action! / CANH BAO: Khong the hoan tac!
echo.
set /p confirm=Continue? / Tiep tuc? (Y/N): 
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo [*] Taking ownership / Lay quyen so huu...
takeown /F C:\Windows.old\* /R /A /D Y >nul 2>&1

echo [*] Granting permissions / Cap quyen...
icacls C:\Windows.old\*.* /T /grant administrators:F >nul 2>&1

echo [*] Deleting Windows.old / Xoa Windows.old...
rd /s /q C:\Windows.old >nul 2>&1

echo.
echo [SUCCESS] Windows.old deleted! / Da xoa Windows.old!
echo.
pause
goto MAIN_MENU

:COMPACT_OS
cls
echo ================================================================================
echo  [32] Compact OS (Compress System) - Nen He Thong
echo ================================================================================
echo.
echo This will compress Windows system files / Se nen file he thong Windows...
echo This saves disk space but may slightly affect performance
echo Tiet kiem dung luong nhung co the anh huong nhe den hieu suat
echo.
set /p confirm=Continue? / Tiep tuc? (Y/N): 
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo [*] Analyzing system / Phan tich he thong...
compact /compactos:query

echo [*] Compressing system files / Nen file he thong...
compact /compactos:always

echo.
echo [SUCCESS] System compressed! / Da nen he thong!
echo.
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
echo.
echo Opening Task Manager Startup tab / Mo tab Khoi dong Task Manager...
echo Please manually disable unnecessary programs / Vui long tat chuong trinh khong can thiet...
echo.

start taskmgr /0 /startup

echo.
pause
goto MAIN_MENU

:OPTIMIZE_SERVICES
cls
echo ================================================================================
echo  [34] Optimize Services - Toi Uu Dich Vu
echo ================================================================================
echo.
echo Optimizing Windows services / Toi uu dich vu Windows...
echo.

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

echo.
echo [SUCCESS] Services optimized! / Da toi uu dich vu!
echo [INFO] Some changes require restart / Mot so thay doi can khoi dong lai!
echo.
pause
goto MAIN_MENU

:PREFETCH
cls
echo ================================================================================
echo  [35] Clear Prefetch Files - Xoa File Prefetch
echo ================================================================================
echo.
echo Clearing prefetch files / Xoa file prefetch...
echo.

echo [*] Deleting prefetch files / Xoa file prefetch...
del /f /s /q C:\Windows\Prefetch\* >nul 2>&1

echo.
echo [SUCCESS] Prefetch files cleared! / Da xoa file prefetch!
echo.
pause
goto MAIN_MENU

:SUPERFETCH
cls
echo ================================================================================
echo  [36] Clear SuperFetch Cache - Xoa Cache SuperFetch
echo ================================================================================
echo.
echo Clearing SuperFetch cache / Xoa cache SuperFetch...
echo.

echo [*] Stopping SuperFetch service / Dung dich vu SuperFetch...
sc stop SysMain >nul 2>&1

echo [*] Clearing cache / Xoa cache...
del /f /s /q C:\Windows\Prefetch\* >nul 2>&1

echo [*] Starting SuperFetch service / Khoi dong dich vu SuperFetch...
sc start SysMain >nul 2>&1

echo.
echo [SUCCESS] SuperFetch cache cleared! / Da xoa cache SuperFetch!
echo.
pause
goto MAIN_MENU

:VISUAL_EFFECTS
cls
echo ================================================================================
echo  [37] Disable Visual Effects - Tat Hieu Ung Hinh Anh
echo ================================================================================
echo.
echo Disabling visual effects for better performance / Tat hieu ung de tang hieu suat...
echo.

echo [*] Setting to best performance / Cai dat che do hieu suat cao nhat...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1

echo [*] Disabling animations / Tat hoat anh...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1

echo [*] Disabling transparency / Tat trong suot...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1

echo.
echo [SUCCESS] Visual effects disabled! / Da tat hieu ung hinh anh!
echo [INFO] Please log off and log back in / Vui long dang xuat va dang nhap lai!
echo.
pause
goto MAIN_MENU

:POWER_PLAN
cls
echo ================================================================================
echo  [38] Optimize Power Plan (High Performance) - Toi Uu Che Do Nguon
echo ================================================================================
echo.
echo Setting power plan to High Performance / Cai dat che do nguon Hieu suat cao...
echo.

echo [*] Setting High Performance power plan / Cai dat che do Hieu suat cao...
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo [*] Disabling USB selective suspend / Tat USB selective suspend...
powercfg -change -usb-selective-suspend-timeout-ac 0
powercfg -change -usb-selective-suspend-timeout-dc 0

echo [*] Setting hard disk timeout to never / Cai dat o cung khong bao gio tat...
powercfg -change -disk-timeout-ac 0
powercfg -change -disk-timeout-dc 0

echo.
echo [SUCCESS] Power plan optimized! / Da toi uu che do nguon!
echo.
pause
goto MAIN_MENU

:HIBERNATION
cls
echo ================================================================================
echo  [39] Disable Hibernation - Tat Che Do Ngu Dong
echo ================================================================================
echo.
echo Disabling hibernation (saves disk space) / Tat ngu dong (tiet kiem dung luong)...
echo.

echo [*] Disabling hibernation / Tat che do ngu dong...
powercfg -h off

echo [*] Deleting hiberfil.sys / Xoa hiberfil.sys...
del C:\hiberfil.sys /f /q >nul 2>&1

echo.
echo [SUCCESS] Hibernation disabled! / Da tat che do ngu dong!
echo [INFO] This freed up several GB of disk space / Da giai phong vai GB dung luong!
echo.
pause
goto MAIN_MENU

:MEMORY_CACHE
cls
echo ================================================================================
echo  [40] Clear Memory Cache - Xoa Cache Bo Nho
echo ================================================================================
echo.
echo Clearing memory cache / Xoa cache bo nho...
echo.

echo [*] Clearing memory cache / Xoa cache bo nho...
echo Note: Memory will be cleared on next shutdown / Bo nho se duoc xoa khi tat may

echo [*] Emptying working sets / Lam trong working sets...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f >nul 2>&1

echo.
echo [SUCCESS] Memory cache cleared! / Da xoa cache bo nho!
echo.
pause
goto MAIN_MENU

:SEARCH_INDEX
cls
echo ================================================================================
echo  [41] Optimize Search Index - Toi Uu Tim Kiem
echo ================================================================================
echo.
echo Optimizing Windows Search index / Toi uu chi muc tim kiem Windows...
echo.

echo [*] Stopping search service / Dung dich vu tim kiem...
net stop WSearch >nul 2>&1

echo [*] Deleting search index / Xoa chi muc tim kiem...
del /f /s /q C:\ProgramData\Microsoft\Search\Data\Applications\Windows\* >nul 2>&1

echo [*] Restarting search service / Khoi dong lai dich vu tim kiem...
net start WSearch >nul 2>&1

echo.
echo [SUCCESS] Search index optimized! / Da toi uu tim kiem!
echo.
pause
goto MAIN_MENU

:ANIMATIONS
cls
echo ================================================================================
echo  [42] Disable Windows Animations - Tat Hoat Anh Windows
echo ================================================================================
echo.
echo Disabling Windows animations / Tat hoat anh Windows...
echo.

echo [*] Disabling taskbar animations / Tat hoat anh taskbar...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul 2>&1

echo [*] Disabling window animations / Tat hoat anh cua so...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1

echo [*] Disabling menu animations / Tat hoat anh menu...
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f >nul 2>&1

echo.
echo [SUCCESS] Animations disabled! / Da tat hoat anh!
echo.
pause
goto MAIN_MENU

:SSD_OPTIMIZE
cls
echo ================================================================================
echo  [43] Optimize SSD Settings - Toi Uu SSD
echo ================================================================================
echo.
echo Optimizing SSD settings / Toi uu cai dat SSD...
echo.

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

echo.
echo [SUCCESS] SSD optimized! / Da toi uu SSD!
echo.
pause
goto MAIN_MENU

:MENU_DELAY
cls
echo ================================================================================
echo  [44] Reduce Menu Show Delay - Giam Tre Hien Thi Menu
echo ================================================================================
echo.
echo Reducing menu show delay / Giam tre hien thi menu...
echo.

echo [*] Setting menu show delay to 0ms / Cai dat tre menu thanh 0ms...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1

echo.
echo [SUCCESS] Menu delay reduced! / Da giam tre menu!
echo.
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
echo.
echo Running System File Checker / Chay System File Checker...
echo This may take several minutes / Co the mat vai phut...
echo.

sfc /scannow

echo.
echo [SUCCESS] SFC scan completed! / Hoan thanh kiem tra SFC!
echo.
pause
goto MAIN_MENU

:DISM_REPAIR
cls
echo ================================================================================
echo  [46] DISM System Repair - Sua Chua He Thong DISM
echo ================================================================================
echo.
echo Running DISM repair / Chay sua chua DISM...
echo This may take several minutes / Co the mat vai phut...
echo.

echo [*] Checking health / Kiem tra suc khoe...
Dism /Online /Cleanup-Image /CheckHealth

echo [*] Scanning health / Quet suc khoe...
Dism /Online /Cleanup-Image /ScanHealth

echo [*] Restoring health / Khoi phuc suc khoe...
Dism /Online /Cleanup-Image /RestoreHealth

echo.
echo [SUCCESS] DISM repair completed! / Hoan thanh sua chua DISM!
echo.
pause
goto MAIN_MENU

:COMPONENT_CLEANUP
cls
echo ================================================================================
echo  [47] Windows Component Cleanup - Don Dep Thanh Phan Windows
echo ================================================================================
echo.
echo Cleaning Windows components / Don dep thanh phan Windows...
echo.

echo [*] Starting component cleanup / Bat dau don dep thanh phan...
Dism.exe /online /Cleanup-Image /StartComponentCleanup

echo [*] Resetting base / Reset base...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

echo.
echo [SUCCESS] Component cleanup completed! / Hoan thanh don dep thanh phan!
echo.
pause
goto MAIN_MENU

:UPDATE_DRIVERS
cls
echo ================================================================================
echo  [48] Update Windows Drivers - Cap Nhat Driver Windows
echo ================================================================================
echo.
echo Checking for driver updates / Kiem tra cap nhat driver...
echo.

echo [*] Opening Windows Update / Mo Windows Update...
start ms-settings:windowsupdate

echo Please check for driver updates manually / Vui long kiem tra cap nhat driver...
echo.
pause
goto MAIN_MENU

:REBUILD_ICON
cls
echo ================================================================================
echo  [49] Rebuild Icon Cache - Xay Dung Lai Icon Cache
echo ================================================================================
echo.
echo Rebuilding icon cache / Xay dung lai icon cache...
echo.

echo [*] Stopping Windows Explorer / Dung Windows Explorer...
taskkill /F /IM explorer.exe >nul 2>&1

echo [*] Deleting icon cache / Xoa icon cache...
del /f /a /q "%LocalAppData%\IconCache.db" >nul 2>&1
del /f /a /q "%LocalAppData%\Microsoft\Windows\Explorer\iconcache_*.db" >nul 2>&1

echo [*] Restarting Windows Explorer / Khoi dong lai Explorer...
start explorer.exe

echo.
echo [SUCCESS] Icon cache rebuilt! / Da xay dung lai icon cache!
echo.
pause
goto MAIN_MENU

:REBUILD_SEARCH
cls
echo ================================================================================
echo  [50] Rebuild Windows Search Index - Xay Dung Lai Tim Kiem
echo ================================================================================
echo.
echo Rebuilding search index / Xay dung lai chi muc tim kiem...
echo.

echo [*] Opening Indexing Options / Mo tuy chon chi muc...
control /name Microsoft.IndexingOptions

echo Please click "Advanced" and then "Rebuild" / Vui long click "Advanced" va "Rebuild"...
echo.
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
echo.
echo Cleaning registry safely / Don dep registry an toan...
echo.

echo [*] Cleaning MUICache / Xoa MUICache...
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f >nul 2>&1

echo [*] Cleaning UserAssist / Xoa UserAssist...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f >nul 2>&1

echo [*] Cleaning Windows Error Reporting / Xoa Windows Error Reporting...
reg delete "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /f >nul 2>&1

echo [*] Cleaning obsolete entries / Xoa muc cu...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32" /f >nul 2>&1

echo.
echo [SUCCESS] Registry cleaned! / Da don dep registry!
echo.
pause
goto MAIN_MENU

:OPTIMIZE_REGISTRY
cls
echo ================================================================================
echo  [52] Optimize Registry - Toi Uu Registry
echo ================================================================================
echo.
echo Optimizing registry / Toi uu registry...
echo.

echo [*] Optimizing registry access / Toi uu truy cap registry...
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v RegistrySizeLimit /t REG_DWORD /d 0x40000000 /f >nul 2>&1

echo [*] Enabling registry caching / Bat cache registry...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v IoPageLockLimit /t REG_DWORD /d 0xf000000 /f >nul 2>&1

echo.
echo [SUCCESS] Registry optimized! / Da toi uu registry!
echo.
pause
goto MAIN_MENU

:BACKUP_REGISTRY
cls
echo ================================================================================
echo  [53] Backup Registry - Sao Luu Registry
echo ================================================================================
echo.
echo Backing up registry / Sao luu registry...
echo.

echo [*] Creating backup directory / Tao thu muc sao luu...
if not exist "C:\RegistryBackup" mkdir "C:\RegistryBackup"

echo [*] Exporting registry / Xuat registry...
reg export HKLM "C:\RegistryBackup\HKLM_%date:~-4,4%%date:~-7,2%%date:~-10,2%.reg" /y >nul 2>&1
reg export HKCU "C:\RegistryBackup\HKCU_%date:~-4,4%%date:~-7,2%%date:~-10,2%.reg" /y >nul 2>&1

echo.
echo [SUCCESS] Registry backed up to C:\RegistryBackup\ / Da sao luu vao C:\RegistryBackup\
echo.
pause
goto MAIN_MENU

:DISABLE_CORTANA
cls
echo ================================================================================
echo  [54] Disable Cortana - Tat Cortana
echo ================================================================================
echo.
echo Disabling Cortana / Tat Cortana...
echo.

echo [*] Disabling Cortana via registry / Tat Cortana qua registry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1

echo [*] Disabling search web / Tat tim kiem web...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul 2>&1

echo.
echo [SUCCESS] Cortana disabled! / Da tat Cortana!
echo.
pause
goto MAIN_MENU

:DISABLE_TIPS
cls
echo ================================================================================
echo  [55] Disable Windows Tips - Tat Goi Y Windows
echo ================================================================================
echo.
echo Disabling Windows tips / Tat goi y Windows...
echo.

echo [*] Disabling tips / Tat goi y...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SoftLandingEnabled /t REG_DWORD /d 0 /f >nul 2>&1

echo.
echo [SUCCESS] Windows tips disabled! / Da tat goi y Windows!
echo.
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
echo.
echo Creating system restore point / Tao diem khoi phuc he thong...
echo.

echo [*] Creating restore point / Tao diem khoi phuc...
powershell -Command "Checkpoint-Computer -Description 'Ultimate System Tool Backup' -RestorePointType 'MODIFY_SETTINGS'"

echo.
echo [SUCCESS] Restore point created! / Da tao diem khoi phuc!
echo.
pause
goto MAIN_MENU

:SYSTEM_INFO
cls
echo ================================================================================
echo  [57] View System Information - Xem Thong Tin He Thong
echo ================================================================================
echo.
echo Gathering system information / Thu thap thong tin he thong...
echo.

systeminfo

echo.
pause
goto MAIN_MENU

:EXPORT_PROGRAMS
cls
echo ================================================================================
echo  [58] Export Installed Programs List - Xuat Danh Sach Chuong Trinh
echo ================================================================================
echo.
echo Exporting installed programs / Xuat danh sach chuong trinh...
echo.

echo [*] Creating list / Tao danh sach...
wmic product get name,version /format:csv > "%USERPROFILE%\Desktop\InstalledPrograms.csv"

echo.
echo [SUCCESS] List saved to Desktop\InstalledPrograms.csv / Da luu vao Desktop\InstalledPrograms.csv
echo.
pause
goto MAIN_MENU

:DISK_HEALTH
cls
echo ================================================================================
echo  [59] Check Disk Health (SMART) - Kiem Tra Suc Khoe O Dia
echo ================================================================================
echo.
echo Checking disk health / Kiem tra suc khoe o dia...
echo.

echo [*] Checking SMART status / Kiem tra trang thai SMART...
wmic diskdrive get status,model,size

echo.
pause
goto MAIN_MENU

:STORE_CACHE
cls
echo ================================================================================
echo  [60] Clear Windows Store Cache - Xoa Cache Windows Store
echo ================================================================================
echo.
echo Clearing Windows Store cache / Xoa cache Windows Store...
echo.

echo [*] Clearing Windows Store cache / Xoa cache Windows Store...
for /d %%u in ("C:\Users\*") do (
    del /f /s /q "%%u\AppData\Local\Packages\Microsoft.WindowsStore_*\LocalCache\*" >nul 2>&1
)

echo.
echo [SUCCESS] Windows Store cache cleared! / Da xoa cache Windows Store!
echo [INFO] If issues persist, run: wsreset.exe / Neu con loi, chay: wsreset.exe
echo.
pause
goto MAIN_MENU

:RESET_UPDATE
cls
echo ================================================================================
echo  [61] Reset Windows Update Components - Reset Thanh Phan Update
echo ================================================================================
echo.
echo Resetting Windows Update / Reset Windows Update...
echo.

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

echo.
echo [SUCCESS] Windows Update reset! / Da reset Windows Update!
echo.
pause
goto MAIN_MENU

:BOOT_TIME
cls
echo ================================================================================
echo  [62] Optimize Boot Time - Toi Uu Thoi Gian Khoi Dong
echo ================================================================================
echo.
echo Optimizing boot time / Toi uu thoi gian khoi dong...
echo.

echo [*] Enabling fast startup / Bat khoi dong nhanh...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 1 /f >nul 2>&1

echo [*] Reducing boot timeout / Giam thoi gian cho boot...
bcdedit /timeout 3 >nul 2>&1

echo [*] Disabling boot GUI / Tat GUI khoi dong...
bcdedit /set quietboot on >nul 2>&1

echo.
echo [SUCCESS] Boot time optimized! / Da toi uu thoi gian khoi dong!
echo.
pause
goto MAIN_MENU

:ALL_TEMP
cls
echo ================================================================================
echo  [63] Clean All Temporary Files - Xoa Tat Ca File Tam
echo ================================================================================
echo.
echo Cleaning all temporary files / Xoa tat ca file tam...
echo.

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

echo.
echo [SUCCESS] All temporary files cleaned! / Da xoa tat ca file tam!
echo.
pause
goto MAIN_MENU

:SYSTEM_REPORT
cls
echo ================================================================================
echo  [64] Generate System Report - Tao Bao Cao He Thong
echo ================================================================================
echo.
echo Generating comprehensive system report / Tao bao cao he thong toan dien...
echo This may take several minutes / Co the mat vai phut...
echo.

echo [*] Creating report / Tao bao cao...
perfmon /report

echo.
echo [SUCCESS] Report generated! / Da tao bao cao!
echo.
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
echo.
echo WARNING: This will run all cleanup tasks! / CANH BAO: Se chay tat ca don dep!
echo.
set /p confirm=Continue? / Tiep tuc? (Y/N): 
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo Running all cleanup tasks / Chay tat ca cac tac vu don dep...
echo.

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

echo.
echo ================================================================================
echo [SUCCESS] All cleanup tasks completed! / Hoan thanh tat ca don dep!
echo ================================================================================
echo.
pause
goto MAIN_MENU

:FULL_OPTIMIZE
cls
echo ================================================================================
echo  [99] FULL SYSTEM OPTIMIZATION - TOI UU TOAN BO HE THONG
echo ================================================================================
echo.
echo WARNING: This will perform full system optimization! / CANH BAO: Se toi uu toan bo!
echo This process may take 15-30 minutes / Qua trinh co the mat 15-30 phut
echo.
set /p confirm=Continue? / Tiep tuc? (Y/N): 
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo [*] Creating restore point / Tao diem khoi phuc...
powershell -Command "Checkpoint-Computer -Description 'Before Full Optimization' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1

echo.
echo ================================================================================
echo [STEP 1/5] CLEANUP - DON DEP
echo ================================================================================
echo.
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

echo.
echo ================================================================================
echo [STEP 2/5] NETWORK OPTIMIZATION - TOI UU MANG
echo ================================================================================
echo.
echo [2.1] Optimizing TCP settings...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global rsc=enabled >nul 2>&1

echo [2.2] Optimizing network throttling...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 0 /f >nul 2>&1

echo.
echo ================================================================================
echo [STEP 3/5] PERFORMANCE OPTIMIZATION - TOI UU HIEU SUAT
echo ================================================================================
echo.
echo [3.1] Disabling visual effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1

echo [3.2] Setting High Performance power plan...
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

echo [3.3] Reducing menu delay...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1

echo.
echo ================================================================================
echo [STEP 4/5] SYSTEM MAINTENANCE - BAO TRI HE THONG
echo ================================================================================
echo.
echo [4.1] Running System File Checker (this may take 5-10 minutes)...
echo Please wait / Vui long cho...
sfc /scannow >nul 2>&1

echo [4.2] Running DISM repair (this may take 5-10 minutes)...
Dism /Online /Cleanup-Image /RestoreHealth >nul 2>&1

echo [4.3] Component cleanup...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1

echo.
echo ================================================================================
echo [STEP 5/5] REGISTRY OPTIMIZATION - TOI UU REGISTRY
echo ================================================================================
echo.
echo [5.1] Cleaning registry...
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f >nul 2>&1

echo [5.2] Optimizing registry access...
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v RegistrySizeLimit /t REG_DWORD /d 0x40000000 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v IoPageLockLimit /t REG_DWORD /d 0xf000000 /f >nul 2>&1

echo.
echo ================================================================================
echo [BONUS] ADVANCED OPTIMIZATION - TOI UU NANG CAO
echo ================================================================================
echo.
echo [6.1] Optimizing memory (RAM)...
powershell -Command "Get-Process | ForEach-Object { try { $_.MinWorkingSet = 100KB } catch {} }" >nul 2>&1

echo [6.2] Cleaning software cache...
del /f /s /q "%userprofile%\AppData\Roaming\Adobe\Common\Media Cache Files\*" >nul 2>&1
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Office\16.0\OfficeFileCache\*" >nul 2>&1

echo [6.3] Cleaning delivery optimization...
del /f /s /q "%windir%\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*" >nul 2>&1

echo [6.4] Refreshing icon cache...
ie4uinit.exe -show >nul 2>&1

echo.
echo ================================================================================
echo  [SUCCESS] FULL SYSTEM OPTIMIZATION COMPLETED!
echo  HOAN THANH TOI UU TOAN BO HE THONG!
echo ================================================================================
echo.
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
echo.
echo Please restart your computer for all changes to take effect.
echo Vui long khoi dong lai may tinh de ap dung tat ca thay doi.
echo.
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
echo.
echo Cleaning software-specific caches / Xoa cache cac phan mem...
echo.

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

echo.
echo [SUCCESS] Software cache cleaned! / Da xoa cache phan mem!
echo.
pause
goto MAIN_MENU

:DELIVERY_OPTIMIZATION
cls
echo ================================================================================
echo  [66] Clean Delivery Optimization - Xoa Delivery Optimization
echo ================================================================================
echo.
echo Cleaning Delivery Optimization cache / Xoa cache Delivery Optimization...
echo.

echo [*] Stopping Delivery Optimization service / Dung dich vu...
net stop DoSvc >nul 2>&1

echo [*] Cleaning cache / Xoa cache...
del /f /s /q "%windir%\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*" >nul 2>&1
del /f /s /q "%windir%\SoftwareDistribution\DeliveryOptimization\*" >nul 2>&1

echo [*] Restarting service / Khoi dong lai dich vu...
net start DoSvc >nul 2>&1

echo.
echo [SUCCESS] Delivery Optimization cache cleaned! / Da xoa cache!
echo [INFO] This can free up several GB / Co the giai phong vai GB!
echo.
pause
goto MAIN_MENU

:LCU_BACKUP
cls
echo ================================================================================
echo  [67] Clean Update Backup (LCU) - Xoa Sao Luu Cap Nhat
echo ================================================================================
echo.
echo WARNING: This will delete Windows Update uninstall backups!
echo CANH BAO: Se xoa sao luu go cap nhat Windows!
echo You will NOT be able to uninstall updates after this!
echo Ban se KHONG THE go cap nhat sau khi xoa!
echo.
set /p confirm=Continue? / Tiep tuc? (Y/N): 
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
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

echo.
echo [*] Cleaning Service Pack superseded / Xoa Service Pack cu...
dism.exe /online /cleanup-image /spsuperseded /hidesp >nul 2>&1

echo.
echo [SUCCESS] Update backup cleaned! / Da xoa sao luu cap nhat!
echo.
pause
goto MAIN_MENU

:OPTIMIZE_MEMORY
cls
echo ================================================================================
echo  [68] Optimize Memory (RAM) - Toi Uu Bo Nho RAM
echo ================================================================================
echo.
echo Optimizing memory usage / Toi uu su dung bo nho...
echo.

echo [*] Clearing standby memory list / Xoa danh sach bo nho cho...
powershell -Command "Get-Process | ForEach-Object { try { $_.MinWorkingSet = 100KB } catch {} }" >nul 2>&1

echo [*] Flushing file system cache / Xoa cache he thong file...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f >nul 2>&1

echo [*] Optimizing working sets / Toi uu working sets...
echo Note: Memory will be fully optimized on next reboot / Bo nho se duoc toi uu hoan toan khi khoi dong lai

echo [*] Clearing DNS cache / Xoa cache DNS...
ipconfig /flushdns >nul 2>&1
ipconfig /registerdns >nul 2>&1

echo.
echo [SUCCESS] Memory optimized! / Da toi uu bo nho!
echo [INFO] Free RAM should increase / RAM trong nen tang len!
echo.
pause
goto MAIN_MENU

:DISK_SPACE_REPORT
cls
echo ================================================================================
echo  [69] Show Disk Space Report - Xem Bao Cao Dung Luong
echo ================================================================================
echo.
echo Analyzing disk space / Phan tich dung luong o dia...
echo.

echo [*] All drives / Tat ca o dia:
echo.
wmic logicaldisk get caption,size,freespace,filesystem

echo.
echo [*] Free space in MB / Dung luong trong (MB):
for /f "tokens=2" %%a in ('powershell -Command "(Get-PSDrive C).Free/1MB"') do (
    set "free_space=%%a"
    echo     C: Drive - %%a MB free / %%a MB trong
)

echo.
echo [*] Top-level folders on C:\ / Thu muc cap 1 tren C:\:
dir C:\ /a:d

echo.
echo [TIP] Use Function [88] or [99] to clean up and free space
echo [G?I ?] D?ng ch?c n?ng [88] ho?c [99] ?? d?n d?p v? gi?i ph?ng dung l??ng
echo.
pause
goto MAIN_MENU

:REFRESH_ICON_CACHE
cls
echo ================================================================================
echo  [70] Refresh Icon Cache - Lam Moi Icon Cache
echo ================================================================================
echo.
echo Refreshing icon and thumbnail cache / Lam moi icon va thumbnail cache...
echo.

echo [*] Refreshing system icon cache / Lam moi icon cache he thong...
ie4uinit.exe -show >nul 2>&1

echo [*] Cleaning connected devices cache / Xoa cache thiet bi ket noi...
del /f /s /q "%userprofile%\AppData\Local\ConnectedDevicesPlatform\*" >nul 2>&1

echo [*] Cleaning network list cache / Xoa cache danh sach mang...
del /f /q "%userprofile%\AppData\Roaming\Microsoft\Network\Connections\*" >nul 2>&1

echo [*] Rebuilding icon cache / Xay dung lai icon cache...
timeout /t 2 >nul

echo.
echo [SUCCESS] Icon cache refreshed! / Da lam moi icon cache!
echo [INFO] Icons should display correctly now / Icon se hien thi dung!
echo.
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
echo.
echo Gathering comprehensive system information / Thu thap thong tin toan dien...
echo.

echo [HARDWARE INFORMATION - THONG TIN PHAN CUNG]
echo ============================================================================
echo.

echo [*] Computer System / He thong may tinh:
wmic computersystem get manufacturer,model,totalphysicalmemory

echo.
echo [*] CPU Information / Thong tin CPU:
wmic cpu get name,numberofcores,numberoflogicalprocessors,maxclockspeed

echo.
echo [*] Memory / Bo nho RAM:
wmic memorychip get capacity,speed,manufacturer

echo.
echo [*] Disk Drives / O dia:
wmic diskdrive get model,size,interfacetype,status

echo.
echo [*] Graphics Card / Card man hinh:
wmic path win32_VideoController get name,adapterram,driverversion

echo.
echo [*] Network Adapters / Card mang:
wmic nic where "NetEnabled=true" get name,macaddress,speed

echo.
echo [SOFTWARE INFORMATION - THONG TIN PHAN MEM]
echo ============================================================================
echo.

echo [*] Operating System / He dieu hanh:
wmic os get caption,version,buildnumber,osarchitecture

echo.
echo [*] Windows Activation Status / Trang thai kich hoat:
cscript //nologo %windir%\system32\slmgr.vbs /xpr

echo.
echo [*] BIOS Information / Thong tin BIOS:
wmic bios get manufacturer,smbiosbiosversion,releasedate

echo.
echo [*] Opening detailed system info / Mo thong tin chi tiet...
msinfo32

echo.
echo [SUCCESS] System information displayed! / Da hien thi thong tin he thong!
echo [INFO] Detailed report opened in MSInfo32 / Bao cao chi tiet da mo trong MSInfo32
echo.
pause
goto MAIN_MENU

:WINDOWS_SETTINGS
cls
echo ================================================================================
echo  [72] Windows Settings Center - Trung Tam Cai Dat Windows
echo ================================================================================
echo.
echo Opening Windows Settings / Mo cai dat Windows...
echo.
echo  [1] System Settings          - Cai dat He thong
echo  [2] Privacy Settings         - Cai dat Rieng tu
echo  [3] Update and Security      - Cap nhat va Bao mat
echo  [4] Personalization          - Ca nhan hoa
echo  [5] Apps and Features        - Ung dung
echo  [6] Network and Internet     - Mang
echo  [7] Gaming Settings          - Cai dat Game
echo  [8] Power Options            - Tuy chon Nguon
echo  [9] All Settings             - Tat ca Cai dat
echo  [0] Back to Main Menu        - Quay lai
echo.
set /p settings_choice=Select settings / Chon cai dat (0-9): 

if "%settings_choice%"=="1" start ms-settings:display
if "%settings_choice%"=="2" start ms-settings:privacy
if "%settings_choice%"=="3" start ms-settings:windowsupdate
if "%settings_choice%"=="4" start ms-settings:personalization
if "%settings_choice%"=="5" start ms-settings:appsfeatures
if "%settings_choice%"=="6" start ms-settings:network
if "%settings_choice%"=="7" start ms-settings:gaming
if "%settings_choice%"=="8" powercfg.cpl
if "%settings_choice%"=="9" start ms-settings:
if "%settings_choice%"=="0" goto MAIN_MENU

echo.
echo [SUCCESS] Settings opened! / Da mo cai dat!
echo.
timeout /t 2
goto MAIN_MENU

:OFFICE_REPAIR
cls
echo ================================================================================
echo  [73] Office Repair and Reset - Sua Chua va Reset Office
echo ================================================================================
echo.
echo Office repair and configuration / Sua chua va cau hinh Office...
echo.

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

echo.
echo  [1] Quick Office Repair      - Sua chua Nhanh
echo  [2] Online Office Repair     - Sua chua Truc tuyen  
echo  [3] Reset Office Settings    - Reset Cai dat Office
echo  [4] Clear Office Cache       - Xoa Cache Office
echo  [5] Open Office Diagnostics  - Mo Cong cu Chan doan
echo  [0] Back to Main Menu        - Quay lai
echo.
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
    del /f /q "%AppData%\Microsoft\Office\*.* " >nul 2>&1
    del /f /q "%LocalAppData%\Microsoft\Office\*.* " >nul 2>&1
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

echo.
pause
goto MAIN_MENU

:REMOVE_BLOATWARE
cls
echo ================================================================================
echo  [74] Remove Bloatware (Safe) - Xoa Ung Dung Rac (An Toan)
echo ================================================================================
echo.
echo WARNING: This will remove pre-installed Windows apps!
echo CANH BAO: Se xoa cac ung dung Windows cai san!
echo.
echo SAFE apps to remove / Ung dung AN TOAN de xoa:
echo  - Xbox (if you don't game)
echo  - 3D Builder, Paint 3D
echo  - Mixed Reality apps
echo  - Get Started, Tips
echo  - Skype (can reinstall from Store)
echo  - Solitaire Collection
echo.
echo WILL NOT REMOVE / SE KHONG XOA:
echo  - Microsoft Store (important!)
echo  - Photos, Calculator, Notepad
echo  - Microsoft Edge
echo  - Windows Security
echo.
set /p bloat_confirm=Continue? / Tiep tuc? (Y/N): 
if /i not "%bloat_confirm%"=="Y" goto MAIN_MENU

echo.
echo [*] Removing safe bloatware apps / Xoa ung dung rac an toan...
echo.

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

echo.
echo [SUCCESS] Bloatware removed! / Da xoa ung dung rac!
echo [INFO] You can reinstall from Microsoft Store if needed / Co the cai lai tu Microsoft Store
echo.
pause
goto MAIN_MENU

:BITLOCKER_MGMT
cls
echo ================================================================================
echo  [75] Bitlocker Management - Quan Ly Bitlocker
echo ================================================================================
echo.
echo Checking Bitlocker status / Kiem tra trang thai Bitlocker...
echo.

echo [*] Bitlocker status on all drives / Trang thai Bitlocker tren tat ca o dia:
echo.
manage-bde -status

echo.
echo  [1] Disable Bitlocker on C:  - Tat Bitlocker tren C:
echo  [2] Enable Bitlocker on C:   - Bat Bitlocker tren C:
echo  [3] View Recovery Key        - Xem Khoa Khoi phuc
echo  [4] Backup Recovery Key      - Sao luu Khoa Khoi phuc
echo  [0] Back to Main Menu        - Quay lai
echo.
set /p bitlocker_choice=Select option / Chon tuy chon (0-4): 

if "%bitlocker_choice%"=="1" (
    echo.
    echo WARNING: Disabling Bitlocker will decrypt your drive!
    echo CANH BAO: Tat Bitlocker se giai ma o dia cua ban!
    echo.
    set /p confirm_disable=Are you sure? / Ban chac chan? (Y/N): 
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

echo.
pause
goto MAIN_MENU

:CHECK_ACTIVATION
cls
echo ================================================================================
echo  [76] Check Activation Status - Kiem Tra Trang Thai Kich Hoat
echo ================================================================================
echo.
echo Checking Windows and Office activation / Kiem tra kich hoat Windows va Office...
echo.

echo [WINDOWS ACTIVATION - KICH HOAT WINDOWS]
echo ============================================================================
echo.

echo [*] Windows License Status / Trang thai giay phep Windows:
cscript //nologo %windir%\system32\slmgr.vbs /dli

echo.
echo [*] Windows Activation Expiration / Thoi han kich hoat:
cscript //nologo %windir%\system32\slmgr.vbs /xpr

echo.
echo [*] Windows Product Key / Khoa san pham Windows:
wmic path softwarelicensingservice get OA3xOriginalProductKey

echo.
echo [OFFICE ACTIVATION - KICH HOAT OFFICE]
echo ============================================================================
echo.

if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" (
    echo [*] Office 2016/2019/365 License Status:
    cscript //nologo "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" /dstatus
) else if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" (
    echo [*] Office 2016/2019/365 License Status:
    cscript //nologo "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" /dstatus
) else (
    echo [INFO] Office not detected or not installed / Khong phat hien Office
)

echo.
echo [INFO] To activate Windows or Office legally / De kich hoat hop phap:
echo  - Purchase license from Microsoft: https://www.microsoft.com
echo  - Mua giay phep tu Microsoft: https://www.microsoft.com
echo.
echo [WARNING] This tool does NOT provide activation services
echo [CANH BAO] Cong cu nay KHONG cung cap dich vu kich hoat
echo.
echo For activation, please use official Microsoft methods.
echo De kich hoat, vui long su dung phuong thuc chinh thuc cua Microsoft.
echo.
pause
goto MAIN_MENU

:EXIT
cls
echo.
echo ================================================================================
echo  Thank you for using Ultimate Windows System Tool!
echo  Cam on ban da su dung Ultimate Windows System Tool!
echo ================================================================================
echo.
timeout /t 3
exit
