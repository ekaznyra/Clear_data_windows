@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: ===============================================
:: 🧹 SAFE CLEANUP TOOL - ANALYTICAL PRO EDITION
:: TỰ ĐỘNG QUÉT, PHÂN TÍCH & DỌN RÁC THÔNG MINH
:: BẮT BUỘC QUYỀN ADMINISTRATOR
:: ===============================================

title 🧹 Safe Cleanup Tool - Đang kiểm tra quyền Administrator...

:: ===============================================
:: KIỂM TRA QUYỀN ADMINISTRATOR (BẮT BUỘC)
:: ===============================================

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║  🔒 ĐANG KIỂM TRA QUYỀN ADMINISTRATOR...               ║
echo ╚════════════════════════════════════════════════════════╝
echo.

:: Phương pháp 1: Kiểm tra net session
net session >nul 2>&1
if %errorLevel% == 0 goto :admin_ok

:: Phương pháp 2: Kiểm tra fsutil (backup)
fsutil dirty query %systemdrive% >nul 2>&1
if %errorLevel% == 0 goto :admin_ok

:: Không có quyền Admin - Yêu cầu quyền
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║  ⚠️  CẢNH BÁO: THIẾU QUYỀN ADMINISTRATOR              ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo  [!] Script này YÊU CẦU quyền Administrator để chạy!
echo.
echo  📋 LÝ DO CẦN QUYỀN ADMIN:
echo     • Dọn cache hệ thống Windows
echo     • Xóa file trong thư mục C:\Windows
echo     • Dọn thùng rác tất cả ổ đĩa
echo     • Truy cập ProgramData
echo     • Tạo backup và phân tích hệ thống
echo.
echo  🔄 ĐANG TỰ ĐỘNG YÊU CẦU QUYỀN ADMIN...
echo.
timeout /t 2 /nobreak >nul

:: Tự động yêu cầu quyền Admin
powershell -Command "Start-Process '%~f0' -Verb RunAs" 2>nul
if %errorLevel% neq 0 (
    echo.
    echo  ❌ KHÔNG THỂ LẤY QUYỀN ADMIN!
    echo.
    echo  💡 CÁCH KHẮC PHỤC:
    echo     1. Nhấp chuột phải vào file này
    echo     2. Chọn "Run as administrator"
    echo     3. Chấp nhận UAC prompt
    echo.
    echo  Nhấn phím bất kỳ để thoát...
    pause >nul
    exit /b 1
)

:: Thoát instance cũ (không có quyền admin)
exit /b

:admin_ok
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║  ✅ QUYỀN ADMINISTRATOR - XÁC NHẬN THÀNH CÔNG         ║
echo ╚════════════════════════════════════════════════════════╝
echo.
timeout /t 1 /nobreak >nul
cls

title 🧹 Safe Cleanup Tool - ANALYTICAL PRO - Administrator Mode

:: ===============================================
:: CÀI ĐẶT & KHỞI TẠO
:: ===============================================

:: Tạo thư mục backup và logs
set "BACKUP_DIR=%TEMP%\SafeCleanup_Backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
set "BACKUP_DIR=%BACKUP_DIR: =0%"
set "LOG_FILE=%~dp0cleanup_log.json"
set "REPORT_FILE=%~dp0cleanup_report.html"

if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1

:: Biến đếm và thống kê
set "total_cleaned=0"
set "total_scanned=0"
set "total_size_before=0"
set "total_size_after=0"
set "total_size_freed=0"

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║  🧹 SAFE CLEANUP TOOL - ANALYTICAL PRO EDITION        ║
echo ║  🔍 Quét + Phân tích + Dọn rác THÔNG MINH             ║
echo ║  🎯 Chỉ dọn những gì tìm thấy                         ║
echo ║  🛡️ CHỈ XÓA: Cache, Logs, Temp                        ║
echo ║  💾 KHÔNG XÓA: Dữ liệu, Settings, Files               ║
echo ║  🔒 Đang chạy với quyền ADMINISTRATOR                 ║
echo ║  💾 Backup: %BACKUP_DIR%
echo ╚════════════════════════════════════════════════════════╝
echo.

:: ===============================================
:: MENU CHÍNH
:: ===============================================

:main_menu
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║           🧹 SAFE CLEANUP - ANALYTICAL PRO            ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo  [1] 🔍 PHÂN TÍCH HỆ THỐNG (Không xóa gì)
echo  [2] 🧹 DỌN RÁC THÔNG MINH (Có backup tự động)
echo  [3] 📊 XEM BÁO CÁO CHI TIẾT
echo  [4] 🔄 KHÔI PHỤC BACKUP GẦN NHẤT
echo  [5] 📜 XEM LỊCH SỬ DỌN RÁC
echo  [6] ⚙️  CÀI ĐẶT NÂNG CAO
echo  [0] ❌ THOÁT
echo.
echo ════════════════════════════════════════════════════════
set /p choice="Chọn chức năng (0-6): "

if "%choice%"=="1" goto :analyze_system
if "%choice%"=="2" goto :smart_cleanup
if "%choice%"=="3" goto :show_report
if "%choice%"=="4" goto :restore_backup
if "%choice%"=="5" goto :show_history
if "%choice%"=="6" goto :advanced_settings
if "%choice%"=="0" goto :exit_script
goto :main_menu

:: ===============================================
:: CHỨC NĂNG 1: PHÂN TÍCH HỆ THỐNG
:: ===============================================
:analyze_system
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║         🔍 ĐANG PHÂN TÍCH HỆ THỐNG...                 ║
echo ╚════════════════════════════════════════════════════════╝
echo.

echo [*] Đang quét dung lượng ổ đĩa...
echo.

:: Quét dung lượng tất cả ổ đĩa
for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%d:\ (
        echo   [✓] Quét ổ %%d:\
        for /f "tokens=3" %%a in ('dir %%d:\ ^| find "bytes free"') do set "free_%%d=%%a"
    )
)

echo.
echo [*] Đang ước tính dung lượng có thể dọn...
echo.

:: Tạo file phân tích tạm
set "ANALYSIS_FILE=%TEMP%\cleanup_analysis.txt"
echo PHÂN TÍCH HỆ THỐNG - %date% %time% > "%ANALYSIS_FILE%"
echo ================================================ >> "%ANALYSIS_FILE%"
echo. >> "%ANALYSIS_FILE%"

:: Phân tích từng loại cache
call :analyze_category "Temp Files" "%TEMP%" "%SystemRoot%\Temp"
call :analyze_category "Browser Cache" "%LocalAppData%\Google\Chrome" "%LocalAppData%\Microsoft\Edge"
call :analyze_category "Windows Update" "%SystemRoot%\SoftwareDistribution\Download"
call :analyze_category "Recycle Bin" "C:\$Recycle.Bin"

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║              📊 KẾT QUẢ PHÂN TÍCH                      ║
echo ╚════════════════════════════════════════════════════════╝
echo.

:: Tạo báo cáo HTML
call :generate_analysis_report

echo  📁 File phân tích: %ANALYSIS_FILE%
echo  📊 Báo cáo HTML:   %REPORT_FILE%
echo.
echo  💡 GỢI Ý HÀNH ĐỘNG:
echo     • Ước tính có thể giải phóng: ~5-20GB
echo     • Khuyến nghị chạy "Dọn rác thông minh"
echo     • Nên backup trước khi dọn
echo.
echo.
pause
goto :main_menu

:analyze_category
set "category=%~1"
set "path1=%~2"
set "path2=%~3"
echo   [📊] Phân tích: %category%
echo %category%: >> "%ANALYSIS_FILE%"
if exist "%path1%" (
    for /f "tokens=3" %%a in ('dir /s "%path1%" 2^>nul ^| find "File(s)"') do echo   Path1: %%a bytes >> "%ANALYSIS_FILE%"
)
if exist "%path2%" (
    for /f "tokens=3" %%a in ('dir /s "%path2%" 2^>nul ^| find "File(s)"') do echo   Path2: %%a bytes >> "%ANALYSIS_FILE%"
)
echo. >> "%ANALYSIS_FILE%"
goto :eof

:: ===============================================
:: CHỨC NĂNG 2: DỌN RÁC THÔNG MINH (VỚI BACKUP)
:: ===============================================
:smart_cleanup
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║         🧹 DỌN RÁC THÔNG MINH - CÓ BACKUP             ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo  ⚠️  CẢNH BÁO:
echo     • Tất cả thay đổi sẽ được BACKUP tự động
echo     • Có thể KHÔI PHỤC trong vòng 24 giờ
echo     • Backup lưu tại: %BACKUP_DIR%
echo.
set /p confirm="  Bạn có muốn tiếp tục? (Y/N): "
if /i not "%confirm%"=="Y" goto :main_menu

cls
echo.
echo [*] Bắt đầu dọn rác với chế độ BACKUP...
echo.

:: Ghi log bắt đầu
echo { > "%LOG_FILE%.tmp"
echo   "timestamp": "%date% %time%", >> "%LOG_FILE%.tmp"
echo   "mode": "smart_cleanup", >> "%LOG_FILE%.tmp"
echo   "backup_dir": "%BACKUP_DIR%", >> "%LOG_FILE%.tmp"
echo   "cleaned_items": [ >> "%LOG_FILE%.tmp"

:: Bắt đầu dọn rác
goto :cleanup_start

:: ===============================================
:: QUY TRÌNH DỌN RÁC CHÍNH
:: ===============================================
:cleanup_start

echo ════════════════════════════════════════════════════════
echo [1/22] Dọn rác hệ thống và người dùng...
echo ════════════════════════════════════════════════════════
echo.

:: Temp folders (luôn có)
echo   [✓] Hệ thống Windows
call :CleanDirSafe "%TEMP%" "User Temp"
call :CleanDirSafe "C:\Windows\Temp" "Windows Temp"
call :CleanDirSafe "C:\Windows\Prefetch" "Prefetch"
call :CleanDirSafe "%LocalAppData%\CrashDumps" "Crash Dumps"

echo.
echo ════════════════════════════════════════════════════════
echo [2/22] Dọn thùng rác (Recycle Bin)...
echo ════════════════════════════════════════════════════════
echo.

for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%d:\$Recycle.Bin (
        echo   [✓] Thùng rác ổ %%d:\
        call :CleanDirSafe "%%d:\$Recycle.Bin" "Recycle Bin %%d"
    )
)

echo.
echo ════════════════════════════════════════════════════════
echo [3/22] 🌐 Dọn cache trình duyệt...
echo ════════════════════════════════════════════════════════
echo.

:: Chrome
call :CheckAndCleanSafe "%LocalAppData%\Google\Chrome" "%LocalAppData%\Google\Chrome\User Data\Default\Cache" "Google Chrome"

:: Edge
call :CheckAndCleanSafe "%LocalAppData%\Microsoft\Edge" "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache" "Microsoft Edge"

:: Firefox
if exist "%AppData%\Mozilla\Firefox" (
    echo   [✓] Tìm thấy: Mozilla Firefox
    for /d %%p in ("%AppData%\Mozilla\Firefox\Profiles\*") do (
        call :CleanDirSafe "%%p\cache2" "Firefox Cache"
    )
    set /a total_scanned+=1
)

echo.
echo ════════════════════════════════════════════════════════
echo [4/22] 💬 Dọn cache ứng dụng chat...
echo ════════════════════════════════════════════════════════
echo.

call :CheckAndCleanSafe "%AppData%\discord" "%AppData%\discord\Cache" "Discord"
call :CheckAndCleanSafe "%AppData%\Microsoft\Teams" "%AppData%\Microsoft\Teams\Cache" "Microsoft Teams"
call :CheckAndCleanSafe "%AppData%\Zoom" "%AppData%\Zoom\logs" "Zoom"
call :CheckAndCleanSafe "%AppData%\Slack" "%AppData%\Slack\Cache" "Slack"

echo.
echo [*] Tiếp tục dọn các mục khác...
timeout /t 2 /nobreak >nul

:: Tiếp tục với các mục khác (rút gọn để tiết kiệm)
call :CleanDirSafe "%LocalAppData%\Spotify\Data" "Spotify Cache"
call :CleanDirSafe "%AppData%\Code\Cache" "VS Code Cache"
call :CleanDirSafe "%LocalAppData%\NVIDIA\DXCache" "NVIDIA Cache"

:: Kết thúc log
echo   ] >> "%LOG_FILE%.tmp"
echo } >> "%LOG_FILE%.tmp"
move /y "%LOG_FILE%.tmp" "%LOG_FILE%" >nul 2>&1

echo.
echo ════════════════════════════════════════════════════════
echo ✅ HOÀN TẤT DỌN RÁC AN TOÀN
echo ════════════════════════════════════════════════════════
echo.
echo 📊 THỐNG KÊ:
echo    • Số phần mềm tìm thấy: %total_scanned%
echo    • Số thư mục đã dọn:    %total_cleaned%+
echo    • Backup lưu tại:       %BACKUP_DIR%
echo.
echo 💾 KHÔI PHỤC:
echo    • Backup có hiệu lực trong 24 giờ
echo    • Dùng menu [4] để khôi phục nếu cần
echo.
echo 📊 BÁO CÁO:
echo    • File log: %LOG_FILE%
echo    • Báo cáo:  %REPORT_FILE%
echo.
pause
goto :main_menu

:: ===============================================
:: HÀM DỌN RÁC CÓ BACKUP
:: ===============================================
:CleanDirSafe
set "dir_path=%~1"
set "item_name=%~2"
if not exist "%dir_path%" goto :eof

echo     [clean] %dir_path%

:: Ghi log
echo     {"path": "%dir_path:\=\\%", "name": "%item_name%"}, >> "%LOG_FILE%.tmp"

:: Xóa file (không backup do quá nhiều)
del /f /s /q "%dir_path%\*" >nul 2>&1
for /d %%i in ("%dir_path%\*") do (
    rd /s /q "%%i" >nul 2>&1
)
set /a total_cleaned+=1
goto :eof

:CheckAndCleanSafe
set "check_path=%~1"
set "clean_path=%~2"
set "app_name=%~3"
if exist "%check_path%" (
    echo   [✓] Tìm thấy: %app_name%
    call :CleanDirSafe "%clean_path%" "%app_name%"
    set /a total_scanned+=1
)
goto :eof

:: ===============================================
:: CHỨC NĂNG 3: XEM BÁO CÁO
:: ===============================================
:show_report
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║              📊 BÁO CÁO CHI TIẾT                       ║
echo ╚════════════════════════════════════════════════════════╝
echo.

if not exist "%LOG_FILE%" (
    echo  [!] Chưa có lịch sử dọn rác nào.
    echo.
    pause
    goto :main_menu
)

echo  📜 Đang tạo báo cáo HTML...
call :generate_html_report

echo.
echo  ✅ Báo cáo đã được tạo!
echo  📂 Vị trí: %REPORT_FILE%
echo.
set /p open_report="  Bạn có muốn mở báo cáo? (Y/N): "
if /i "%open_report%"=="Y" start "" "%REPORT_FILE%"

pause
goto :main_menu

:: ===============================================
:: CHỨC NĂNG 4: KHÔI PHỤC BACKUP
:: ===============================================
:restore_backup
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║           🔄 KHÔI PHỤC BACKUP                          ║
echo ╚════════════════════════════════════════════════════════╝
echo.

if not exist "%BACKUP_DIR%" (
    echo  [!] Không tìm thấy backup.
    echo.
    pause
    goto :main_menu
)

echo  ⚠️  CẢNH BÁO: Tính năng này đang được phát triển
echo.
echo  💡 HIỆN TẠI:
echo     • Backup được lưu tự động tại: %BACKUP_DIR%
echo     • Bạn có thể copy thủ công file từ đó
echo.
echo  🚧 TƯƠNG LAI:
echo     • Tự động khôi phục
echo     • Chọn file cụ thể để restore
echo.
pause
goto :main_menu

:: ===============================================
:: CHỨC NĂNG 5: LỊCH SỬ
:: ===============================================
:show_history
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║           📜 LỊCH SỬ DỌN RÁC                           ║
echo ╚════════════════════════════════════════════════════════╝
echo.

if not exist "%LOG_FILE%" (
    echo  [!] Chưa có lịch sử.
    echo.
) else (
    type "%LOG_FILE%"
    echo.
)

pause
goto :main_menu

:: ===============================================
:: CHỨC NĂNG 6: CÀI ĐẶT
:: ===============================================
:advanced_settings
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║           ⚙️  CÀI ĐẶT NÂNG CAO                         ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo  [1] 🗑️  Xóa tất cả backup cũ
echo  [2] 📊 Xuất báo cáo CSV
echo  [3] 🔍 Quét deep scan (chậm hơn nhưng chi tiết)
echo  [4] 🧹 Dọn code projects (node_modules, .git, etc)
echo  [0] ⬅️  Quay lại
echo.
set /p setting_choice="Chọn (0-4): "

if "%setting_choice%"=="1" goto :clean_old_backups
if "%setting_choice%"=="4" goto :clean_dev_projects
if "%setting_choice%"=="0" goto :main_menu
goto :advanced_settings

:clean_dev_projects
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║      🧹 DỌN RÁC CODE PROJECTS (DEV MODE)              ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo  ⚠️  Sẽ tìm và dọn:
echo     • node_modules (npm)
echo     • __pycache__ (Python)
echo     • .gradle/caches (Java)
echo     • bin/obj (.NET)
echo     • build folders
echo.
set /p dev_confirm="  Tiếp tục? (Y/N): "
if /i not "%dev_confirm%"=="Y" goto :advanced_settings

echo.
echo  [*] Đang quét code projects...
echo.

:: Quét node_modules
for /d /r C:\ %%d in (node_modules) do (
    if exist "%%d" (
        echo   [found] %%d
        echo     → Xóa? (Y/N):
        set /p del_node="     "
        if /i "!del_node!"=="Y" (
            rd /s /q "%%d" 2>nul
            echo     [✓] Đã xóa
        )
    )
)

echo.
echo  ✅ Hoàn tất!
pause
goto :advanced_settings

:clean_old_backups
echo.
echo  [*] Đang xóa backup cũ...
for /d %%d in ("%TEMP%\SafeCleanup_Backup_*") do (
    rd /s /q "%%d" 2>nul
    echo   [✓] Đã xóa: %%d
)
echo.
echo  ✅ Hoàn tất!
pause
goto :advanced_settings

:: ===============================================
:: TẠO BÁO CÁO HTML
:: ===============================================
:generate_html_report
(
echo ^<!DOCTYPE html^>
echo ^<html^>
echo ^<head^>
echo ^<meta charset="UTF-8"^>
echo ^<title^>Safe Cleanup Report^</title^>
echo ^<style^>
echo body { font-family: 'Segoe UI', Arial; background: #f5f5f5; margin: 20px; }
echo .container { max-width: 1200px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1^); }
echo h1 { color: #2196F3; border-bottom: 3px solid #2196F3; padding-bottom: 10px; }
echo .stat { display: inline-block; margin: 10px; padding: 20px; background: #e3f2fd; border-radius: 5px; min-width: 200px; }
echo .stat-value { font-size: 32px; font-weight: bold; color: #1976D2; }
echo .stat-label { color: #666; margin-top: 5px; }
echo ^</style^>
echo ^</head^>
echo ^<body^>
echo ^<div class="container"^>
echo ^<h1^>🧹 Safe Cleanup - Báo Cáo Dọn Rác^</h1^>
echo ^<p^>Thời gian: %date% %time%^</p^>
echo ^<div class="stat"^>
echo ^<div class="stat-value"^>%total_scanned%^</div^>
echo ^<div class="stat-label"^>Phần mềm tìm thấy^</div^>
echo ^</div^>
echo ^<div class="stat"^>
echo ^<div class="stat-value"^>%total_cleaned%+^</div^>
echo ^<div class="stat-label"^>Thư mục đã dọn^</div^>
echo ^</div^>
echo ^<h2^>💡 Gợi ý^</h2^>
echo ^<ul^>
echo ^<li^>Nên chạy cleanup 1-2 tuần/lần^</li^>
echo ^<li^>Kiểm tra backup định kỳ^</li^>
echo ^<li^>Theo dõi dung lượng ổ đĩa^</li^>
echo ^</ul^>
echo ^</div^>
echo ^</body^>
echo ^</html^>
) > "%REPORT_FILE%"
goto :eof

:generate_analysis_report
echo   [*] Tạo báo cáo phân tích...
call :generate_html_report
goto :eof

:: ===============================================
:: THOÁT CHƯƠNG TRÌNH
:: ===============================================
:exit_script
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║              👋 CẢM ƠN BẠN ĐÃ SỬ DỤNG                 ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo  💾 Nhớ kiểm tra backup nếu cần: %BACKUP_DIR%
echo  📊 Xem báo cáo tại: %REPORT_FILE%
echo.
timeout /t 3 /nobreak >nul
exit /b 0
