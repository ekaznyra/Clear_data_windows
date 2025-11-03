@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: ===============================================
:: 🧹 SAFE CLEANUP TOOL - Xóa rác an toàn
:: ===============================================

:: Kiểm tra quyền Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Cần quyền Administrator để chạy script này.
    echo [*] Đang yêu cầu quyền Admin...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║  🧹 SAFE CLEANUP TOOL - Xóa rác an toàn               ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo [*] Bắt đầu dọn rác hệ thống...
echo.

:: ===============================================
:: Hàm CleanDir - Xóa nội dung bên trong thư mục
:: ===============================================
goto :main

:CleanDir
set "dir_path=%~1"
if not exist "%dir_path%" goto :eof
echo [clean] %dir_path%
del /f /s /q "%dir_path%\*" >nul 2>&1
for /d %%i in ("%dir_path%\*") do (
    rd /s /q "%%i" >nul 2>&1
)
goto :eof

:: ===============================================
:: MAIN - Dọn rác các thư mục
:: ===============================================
:main

echo [1/4] Dọn rác hệ thống và người dùng...
echo.

:: Temp folders
call :CleanDir "%TEMP%"
call :CleanDir "C:\Windows\Temp"
call :CleanDir "C:\Windows\Prefetch"

:: Crash dumps
call :CleanDir "%LocalAppData%\CrashDumps"

:: Recent files
call :CleanDir "%AppData%\Microsoft\Windows\Recent"

:: Internet cache
call :CleanDir "%LocalAppData%\Microsoft\Windows\INetCache"
call :CleanDir "%LocalAppData%\Microsoft\Windows\WebCache"

:: Thumbnail cache
del /f /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1

echo.
echo [2/4] Dọn thùng rác (Recycle Bin)...
echo.

:: Recycle Bin trên tất cả ổ đĩa
for %%d in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%d:\$Recycle.Bin (
        call :CleanDir "%%d:\$Recycle.Bin"
    )
)

echo.
echo [3/4] Dọn cache ứng dụng phổ biến...
echo.

:: Chrome
call :CleanDir "%LocalAppData%\Google\Chrome\User Data\Default\Cache"

:: Edge
call :CleanDir "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache"

:: Firefox
for /d %%p in ("%AppData%\Mozilla\Firefox\Profiles\*") do (
    call :CleanDir "%%p\cache2"
)

:: Discord
call :CleanDir "%AppData%\discord\Cache"

:: Microsoft Teams
call :CleanDir "%AppData%\Microsoft\Teams\Cache"

:: Steam
call :CleanDir "C:\Program Files (x86)\Steam\appcache"

echo.
echo [4/4] Dọn báo lỗi Windows (WER)...
echo.

:: Windows Error Reporting
call :CleanDir "%ProgramData%\Microsoft\Windows\WER\ReportArchive"
call :CleanDir "%ProgramData%\Microsoft\Windows\WER\ReportQueue"

echo.
echo ════════════════════════════════════════════════════════
echo ✅ Hoàn tất dọn rác an toàn.
echo ════════════════════════════════════════════════════════
echo.

pause
