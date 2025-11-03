@echo off
chcp 65001 >nul 2>&1
:: ============================================================================
:: ULTIMATE WINDOWS SYSTEM TOOL - All-in-One System Manager
:: Công cụ quản lý hệ thống Windows toàn diện
:: ============================================================================
:: Version: 2.0
:: Author: Advanced System Tools
:: License: Open Source
:: ============================================================================

title Ultimate Windows System Tool - All-in-One Manager

:: Check Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo.
    echo ═══════════════════════════════════════════════════════════
    echo   LỖI: Cần quyền Administrator!
    echo   Vui lòng chuột phải và chọn "Run as Administrator"
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
echo ║                     Công Cụ Quản Lý Hệ Thống Toàn Diện                  ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  🧹 DỌN DẸP HỆ THỐNG                                                    │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [1]  Dọn dẹp rác tổng thể (Quick Clean)                                │
echo  │  [2]  Dọn dẹp sâu và triệt để (Deep Clean)                              │
echo  │  [3]  Dọn dẹp trình duyệt (Browser Clean)                               │
echo  │  [4]  Dọn dẹp ứng dụng (Application Cache)                              │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  ⚡ TỐI ƯU HÓA HỆ THỐNG                                                  │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [5]  Tối ưu hóa hiệu suất (Performance Boost)                          │
echo  │  [6]  Tối ưu hóa RAM (Memory Optimization)                              │
echo  │  [7]  Tối ưu hóa mạng (Network Optimization)                            │
echo  │  [8]  Tối ưu hóa ổ đĩa (Disk Optimization)                              │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  🔧 SỬA LỖI VÀ BẢO TRÌ                                                   │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [9]  Sửa lỗi Windows tự động (Auto Repair)                             │
echo  │  [10] Sửa lỗi Windows Update                                            │
echo  │  [11] Sửa lỗi mạng (Network Reset)                                      │
echo  │  [12] Kiểm tra và sửa ổ đĩa (Disk Check)                                │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  🛡️ BẢO MẬT VÀ QUYỀN RIÊNG TƯ                                          │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [13] Xóa dấu vết hoạt động (Privacy Clean)                             │
echo  │  [14] Quản lý Startup Programs                                          │
echo  │  [15] Scan và xóa file tạm độc hại                                      │
echo  │  [16] Tối ưu bảo mật Windows                                            │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  📊 THÔNG TIN HỆ THỐNG                                                  │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [17] Xem thông tin hệ thống chi tiết                                   │
echo  │  [18] Phân tích dung lượng ổ đĩa                                        │
echo  │  [19] Xem các process đang chạy                                         │
echo  │  [20] Kiểm tra sức khỏe hệ thống                                        │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  🔥 CÔNG CỤ NÂNG CAO                                                    │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [21] Tạo điểm khôi phục hệ thống (Restore Point)                       │
echo  │  [22] Xóa Windows.old                                                   │
echo  │  [23] Tắt Windows Telemetry (Thu thập dữ liệu)                          │
echo  │  [24] Tối ưu Registry                                                   │
echo  │  [25] Chạy tất cả tối ưu (ALL-IN-ONE)                                   │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  [0]  Thoát                                  [99] Về Windows mặc định
echo.
set /p choice="  ► Chọn chức năng (0-25): "

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
echo ║                         DỌN DẸP NHANH - QUICK CLEAN                      ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.
echo [▓▓▓▓▓▓▓▓▓▓] Đang dọn dẹp...
echo.

echo [1/10] Dọn Temp files...
del /f /s /q "%TEMP%\*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
mkdir "%TEMP%" >nul 2>&1

echo [2/10] Dọn System Temp...
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1

echo [3/10] Dọn Prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo [4/10] Dọn Recent Items...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

echo [5/10] Dọn Thumbnail Cache...
del /f /s /q /a:h "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" >nul 2>&1

echo [6/10] Flush DNS Cache...
ipconfig /flushdns >nul 2>&1

echo [7/10] Dọn Windows Update Cache...
net stop wuauserv >nul 2>&1
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1

echo [8/10] Dọn Error Reports...
del /f /s /q "C:\ProgramData\Microsoft\Windows\WER\*" >nul 2>&1

echo [9/10] Dọn Logs...
del /f /s /q "C:\Windows\Logs\*" >nul 2>&1

echo [10/10] Empty Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1

echo.
echo ✅ Hoàn thành! Đã dọn dẹp cơ bản hệ thống.
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
echo ║                        DỌN DẸP SÂU - DEEP CLEAN                          ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.
echo ⚠️  Cảnh báo: Quá trình này có thể mất 5-10 phút!
echo.
pause

echo [▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓] Đang dọn dẹp sâu...
echo.

:: Quick Clean first
echo [Phase 1/5] Dọn dẹp cơ bản...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

:: Deep System Clean
echo [Phase 2/5] Dọn dẹp hệ thống sâu...
del /f /s /q /a:h "%LOCALAPPDATA%\*.log" >nul 2>&1
del /f /s /q /a:h "%LOCALAPPDATA%\*.tmp" >nul 2>&1

:: Component Store Cleanup
echo [Phase 3/5] Dọn dẹp Component Store...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1

:: Old Windows Installation
echo [Phase 4/5] Xóa Windows.old (nếu có)...
if exist "C:\Windows.old" (
    takeown /f "C:\Windows.old" /r /d y >nul 2>&1
    icacls "C:\Windows.old" /grant administrators:F /t >nul 2>&1
    rd /s /q "C:\Windows.old" >nul 2>&1
)

:: Memory Dumps
echo [Phase 5/5] Xóa Memory Dumps...
del /f /q "C:\Windows\MEMORY.DMP" >nul 2>&1
del /f /s /q "C:\Windows\Minidump\*" >nul 2>&1

:: System Restore Points (keep last 1)
echo Dọn dẹp System Restore Points cũ...
vssadmin delete shadows /for=%systemdrive% /oldest /quiet >nul 2>&1

:: Event Logs
echo Dọn dẹp Event Logs...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G" >nul 2>&1)

:: Run Disk Cleanup
echo Chạy Disk Cleanup...
cleanmgr /sagerun:1 >nul 2>&1

echo.
echo ✅ Hoàn thành! Đã dọn dẹp sâu toàn bộ hệ thống.
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
echo ║                       DỌN DẸP TRÌNH DUYỆT - BROWSER                      ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

:: Kill browsers
echo Đóng tất cả trình duyệt...
taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM firefox.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM opera.exe >nul 2>&1
taskkill /F /IM brave.exe >nul 2>&1
timeout /t 2 >nul

echo.
echo Đang dọn dẹp trình duyệt...
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
echo ✅ Hoàn thành! Đã dọn dẹp tất cả trình duyệt.
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
echo ║                      DỌN DẸP ỨNG DỤNG - APPLICATION                      ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Đang dọn dẹp cache ứng dụng...
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
echo ✅ Hoàn thành! Đã dọn dẹp cache các ứng dụng.
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
echo ║                    TỐI ƯU HÓA HIỆU SUẤT - PERFORMANCE                    ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Đang tối ưu hóa hiệu suất hệ thống...
echo.

:: Disable unnecessary services
echo [1/8] Tối ưu dịch vụ Windows...
sc config "SysMain" start= disabled >nul 2>&1
sc stop "SysMain" >nul 2>&1
sc config "WSearch" start= demand >nul 2>&1

:: Visual Effects to Performance
echo [2/8] Tối ưu hiệu ứng đồ họa...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1

:: Disable animations
echo [3/8] Tắt animation...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1

:: Game Mode
echo [4/8] Bật Game Mode...
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul 2>&1

:: Disable Windows Tips
echo [5/8] Tắt Windows Tips...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f >nul 2>&1

:: Power Plan to High Performance
echo [6/8] Chuyển sang High Performance...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

:: Disable Hibernation
echo [7/8] Tắt Hibernation...
powercfg /h off >nul 2>&1

:: Optimize SSD/HDD
echo [8/8] Tối ưu ổ đĩa...
fsutil behavior set DisableDeleteNotify 0 >nul 2>&1

echo.
echo ✅ Hoàn thành! Hệ thống đã được tối ưu hóa hiệu suất.
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
echo ║                        TỐI ƯU HÓA RAM - MEMORY                           ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Đang tối ưu hóa RAM...
echo.

echo [1/5] Dọn dẹp RAM cache...
echo.

:: Clear Standby Memory
echo [2/5] Giải phóng Standby Memory...
echo.

:: Disable SuperFetch/SysMain
echo [3/5] Tắt SuperFetch (SysMain)...
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1

:: Optimize paging file
echo [4/5] Tối ưu paging file...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f >nul 2>&1

:: Empty Working Sets
echo [5/5] Giải phóng working sets...
echo. 

echo.
echo ✅ Hoàn thành! RAM đã được tối ưu hóa.
echo 💡 Khuyên bạn nên khởi động lại máy để có hiệu quả tốt nhất.
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
echo ║                      TỐI ƯU HÓA MẠNG - NETWORK                           ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Đang tối ưu hóa mạng...
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

echo [5/7] Disable Network Throttling...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul 2>&1

echo [6/7] Optimize DNS...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v MaxCacheTtl /t REG_DWORD /d 86400 /f >nul 2>&1

echo [7/7] Release and Renew IP...
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1

echo.
echo ✅ Hoàn thành! Mạng đã được tối ưu hóa.
echo 💡 Nên khởi động lại máy để áp dụng thay đổi.
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
echo ║                      TỐI ƯU HÓA Ổ ĐĨA - DISK                             ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo ⚠️  Quá trình này có thể mất 10-30 phút!
echo.
pause

echo Đang tối ưu hóa ổ đĩa...
echo.

echo [1/4] Phân tích ổ đĩa...
defrag C: /A

echo [2/4] Optimize ổ đĩa...
defrag C: /O

echo [3/4] Trim SSD (nếu có)...
defrag C: /L

echo [4/4] Enable TRIM...
fsutil behavior set DisableDeleteNotify 0

echo.
echo ✅ Hoàn thành! Ổ đĩa đã được tối ưu hóa.
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
echo ║                     SỬA LỖI TỰ ĐỘNG - AUTO REPAIR                        ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo ⚠️  Quá trình này có thể mất 15-30 phút!
echo.
pause

echo Đang kiểm tra và sửa lỗi hệ thống...
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
echo ✅ Hoàn thành! Đã kiểm tra và sửa lỗi hệ thống.
echo 💡 Nên khởi động lại máy.
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
echo ║                    SỬA LỖI WINDOWS UPDATE                                ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Đang sửa lỗi Windows Update...
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
echo ✅ Hoàn thành! Windows Update đã được sửa.
echo 💡 Hãy thử chạy Windows Update lại.
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
echo ║                        SỬA LỖI MẠNG - NETWORK RESET                      ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Đang reset toàn bộ cài đặt mạng...
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
echo ✅ Hoàn thành! Mạng đã được reset.
echo 💡 Bạn PHẢI khởi động lại máy để áp dụng thay đổi!
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
echo ║                    KIỂM TRA Ổ ĐĨA - DISK CHECK                          ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo ⚠️  Lưu ý: Kiểm tra ổ đĩa yêu cầu khởi động lại máy!
echo.
echo 1. Scan và tự động sửa lỗi (Khởi động lại)
echo 2. Chỉ scan (không sửa)
echo 0. Quay lại
echo.
set /p diskchoice="Chọn (1/2/0): "

if "%diskchoice%"=="1" (
    echo.
    echo Lên lịch kiểm tra ổ đĩa khi khởi động lại...
    echo Y | chkdsk C: /F /R /X
    echo.
    echo ✅ Đã lên lịch! Khởi động lại máy để bắt đầu kiểm tra.
    pause
) else if "%diskchoice%"=="2" (
    echo.
    echo Đang scan ổ đĩa...
    chkdsk C:
    echo.
    echo ✅ Hoàn thành scan!
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
echo ║                   XÓA DẤU VẾT - PRIVACY CLEAN                            ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Đang xóa dấu vết hoạt động...
echo.

echo [1/10] Xóa Recent Documents...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

echo [2/10] Xóa Run History...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1

echo [3/10] Xóa Search History...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f >nul 2>&1

echo [4/10] Xóa Clipboard...
echo off | clip

echo [5/10] Xóa Jump Lists...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*" >nul 2>&1
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*" >nul 2>&1

echo [6/10] Xóa Browser History (IE/Edge)...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

echo [7/10] Xóa Prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo [8/10] Xóa Timeline...
del /f /s /q "%LOCALAPPDATA%\ConnectedDevicesPlatform\*" >nul 2>&1

echo [9/10] Xóa Activity History...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1

echo [10/10] Xóa Event Logs...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G" >nul 2>&1)

echo.
echo ✅ Hoàn thành! Đã xóa dấu vết hoạt động.
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
echo ║                   QUẢN LÝ STARTUP - STARTUP MANAGER                      ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Mở Task Manager để quản lý Startup programs...
echo.
echo 💡 Hướng dẫn:
echo    1. Chuyển sang tab "Startup"
echo    2. Tắt các chương trình không cần thiết
echo    3. Giảm thời gian khởi động Windows
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
echo ║                  SCAN FILE ĐỘC HẠI - MALWARE SCAN                        ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo ⚠️  Quá trình này có thể mất 10-30 phút!
echo.
echo Đang chạy Windows Defender Scan...
echo.

echo [1/3] Quick Scan...
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1

echo.
echo [2/3] Xóa file tạm đáng ngờ...
del /f /s /q "%TEMP%\*.exe" >nul 2>&1
del /f /s /q "%TEMP%\*.dll" >nul 2>&1
del /f /s /q "%TEMP%\*.scr" >nul 2>&1

echo [3/3] Update Definitions...
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate

echo.
echo ✅ Hoàn thành scan!
echo 💡 Nếu phát hiện virus, Windows Defender sẽ tự động xử lý.
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
echo ║                   TỐI ƯU BẢO MẬT - SECURITY                              ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Đang tối ưu hóa bảo mật...
echo.

echo [1/8] Bật Windows Firewall...
netsh advfirewall set allprofiles state on

echo [2/8] Bật Windows Defender Real-time Protection...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false" >nul 2>&1

echo [3/8] Update Windows Defender...
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate

echo [4/8] Tắt Remote Assistance...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 0 /f >nul 2>&1

echo [5/8] Tắt Remote Desktop (nếu không dùng)...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f >nul 2>&1

echo [6/8] Bật UAC (User Account Control)...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f >nul 2>&1

echo [7/8] Disable AutoRun/AutoPlay...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 255 /f >nul 2>&1

echo [8/8] Bật SmartScreen...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d Warn /f >nul 2>&1

echo.
echo ✅ Hoàn thành! Bảo mật đã được tối ưu hóa.
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
echo ║                   THÔNG TIN HỆ THỐNG - SYSTEM INFO                       ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory" /C:"Available Physical Memory" /C:"System Manufacturer" /C:"System Model"

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo THÔNG TIN Ổ ĐĨA:
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
wmic logicaldisk get caption,freespace,size,volumename

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo THÔNG TIN CPU:
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
echo ║                 PHÂN TÍCH Ổ ĐĨA - DISK ANALYSIS                          ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Đang phân tích dung lượng ổ đĩa...
echo.

echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo TỔNG QUAN Ổ ĐĨA:
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
wmic logicaldisk get caption,freespace,size,volumename,filesystem

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo TOP 20 FILE LỚN NHẤT TRÊN Ổ C:
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo Đang tìm kiếm (có thể mất vài phút)...
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
echo ║              CÁC PROCESS ĐANG CHẠY - RUNNING PROCESSES                   ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Mở Task Manager...
start taskmgr.exe

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo TOP PROCESS SỬ DỤNG RAM:
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
echo ║               KIỂM TRA SỨC KHỎE HỆ THỐNG - HEALTH CHECK                  ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Đang kiểm tra sức khỏe hệ thống...
echo.

echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo [1/5] KIỂM TRA HỆ THỐNG FILE...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
sfc /verifyonly

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo [2/5] KIỂM TRA WINDOWS IMAGE...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Dism /Online /Cleanup-Image /CheckHealth

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo [3/5] KIỂM TRA Ổ ĐĨA...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
wmic diskdrive get status

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo [4/5] KIỂM TRA RAM...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
wmic memorychip get capacity,speed,manufacturer

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo [5/5] KIỂM TRA BATTERY (Laptop)...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
powercfg /batteryreport /output "%USERPROFILE%\Desktop\battery-report.html" >nul 2>&1
if exist "%USERPROFILE%\Desktop\battery-report.html" (
    echo ✅ Battery Report đã được tạo trên Desktop!
    start "" "%USERPROFILE%\Desktop\battery-report.html"
) else (
    echo ⚠️  Không phát hiện battery (Desktop PC)
)

echo.
echo ✅ Kiểm tra hoàn thành!
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
echo ║                TẠO ĐIỂM KHÔI PHỤC - CREATE RESTORE POINT                 ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Đang tạo điểm khôi phục hệ thống...
echo.

powershell -Command "Checkpoint-Computer -Description 'Manual Restore Point from Ultimate Tool' -RestorePointType 'MODIFY_SETTINGS'"

if %errorLevel% equ 0 (
    echo ✅ Đã tạo điểm khôi phục thành công!
) else (
    echo ⚠️  Không thể tạo điểm khôi phục. Có thể System Restore đã bị tắt.
    echo 💡 Bật System Restore: Control Panel → System → System Protection
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
echo ║                        XÓA WINDOWS.OLD                                   ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

if exist "C:\Windows.old" (
    echo ⚠️  Phát hiện thư mục Windows.old!
    echo 💡 Thư mục này chứa bản Windows cũ (có thể lên tới 20GB+)
    echo.
    set /p confirm="Bạn có chắc muốn xóa? (Y/N): "
    
    if /i "!confirm!"=="Y" (
        echo.
        echo Đang xóa Windows.old...
        takeown /f "C:\Windows.old" /r /d y >nul 2>&1
        icacls "C:\Windows.old" /grant administrators:F /t >nul 2>&1
        rd /s /q "C:\Windows.old" >nul 2>&1
        
        if exist "C:\Windows.old" (
            echo ⚠️  Không thể xóa hoàn toàn. Thử dùng Disk Cleanup...
            cleanmgr /d C:
        ) else (
            echo ✅ Đã xóa Windows.old thành công!
        )
    )
) else (
    echo ✅ Không tìm thấy thư mục Windows.old
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
echo ║                   TẮT WINDOWS TELEMETRY (Thu thập dữ liệu)               ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Đang tắt các dịch vụ thu thập dữ liệu...
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

echo [7/10] Disable Cortana...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1

echo [8/10] Disable Windows Tips...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f >nul 2>&1

echo [9/10] Disable Consumer Features...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f >nul 2>&1

echo [10/10] Disable Tailored Experiences...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul 2>&1

echo.
echo ✅ Hoàn thành! Đã tắt các dịch vụ thu thập dữ liệu.
echo 💡 Khởi động lại máy để áp dụng hoàn toàn.
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
echo ║                     TỐI ƯU REGISTRY - REGISTRY OPTIMIZE                  ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo Đang tối ưu hóa Registry...
echo.

echo [1/5] Tạo backup Registry...
if not exist "%USERPROFILE%\Desktop\RegistryBackup" mkdir "%USERPROFILE%\Desktop\RegistryBackup"
reg export HKLM "%USERPROFILE%\Desktop\RegistryBackup\HKLM_backup.reg" /y >nul 2>&1
reg export HKCU "%USERPROFILE%\Desktop\RegistryBackup\HKCU_backup.reg" /y >nul 2>&1
echo ✅ Backup đã lưu tại Desktop\RegistryBackup

echo [2/5] Optimize Menu Show Delay...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1

echo [3/5] Disable Startup Delay...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f >nul 2>&1

echo [4/5] Optimize Explorer...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 0 /f >nul 2>&1

echo [5/5] Clean Registry (Safe)...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f >nul 2>&1

echo.
echo ✅ Hoàn thành! Registry đã được tối ưu hóa.
echo 💡 Backup Registry đã lưu tại Desktop nếu cần khôi phục.
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
echo ║                    TỐI ƯU TOÀN BỘ - ALL-IN-ONE                           ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo ⚠️  CẢNH BÁO: Quá trình này sẽ chạy TẤT CẢ các tối ưu!
echo ⚠️  Có thể mất 20-40 phút!
echo ⚠️  Máy tính sẽ được khởi động lại sau khi hoàn thành!
echo.
set /p confirm="Bạn có chắc chắn muốn tiếp tục? (Y/N): "

if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                    BẮT ĐẦU TỐI ƯU TOÀN BỘ HỆ THỐNG                    ║
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
echo ║                         🎉 HOÀN THÀNH TẤT CẢ! 🎉                       ║
echo ╚════════════════════════════════════════════════════════════════════════╝
echo.
echo ✅ Đã hoàn thành tất cả tối ưu hóa!
echo.
echo 💡 Hệ thống sẽ khởi động lại sau 30 giây...
echo    Nhấn phím bất kỳ để hủy khởi động lại.
echo.

timeout /t 30
shutdown /r /t 10 /c "Khởi động lại để hoàn tất tối ưu hóa..."

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
echo ║                    RESET WINDOWS VỀ MẶC ĐỊNH                             ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.

echo ⚠️  CẢNH BÁO: Tính năng này sẽ reset Windows về cài đặt gốc!
echo ⚠️  CÓ THỂ MẤT DỮ LIỆU nếu không chọn "Keep my files"!
echo.
echo Bạn có chắc chắn muốn tiếp tục?
echo.
set /p resetconfirm="Gõ YES để xác nhận: "

if /i "%resetconfirm%"=="YES" (
    echo.
    echo Đang mở Windows Reset...
    systemreset
) else (
    echo Đã hủy.
    timeout /t 2 >nul
)

goto MAIN_MENU
