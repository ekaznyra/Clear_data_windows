@echo off
chcp 65001 >nul
title 🧹 Safe Cleanup - Quick Start

:: ===============================================
:: 🧹 SAFE CLEANUP - QUICK START MENU
:: Launcher nhanh cho các chế độ
:: ===============================================

:menu
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          🧹 SAFE CLEANUP - QUICK START                ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo  CHỌN CHẾ ĐỘ CHẠY:
echo.
echo  [1] 🔍 Phân tích NHANH (CMD - không xóa)
echo  [2] 🧹 Dọn rác NHANH (CMD - mặc định)
echo  [3] 🧠 Phân tích AI (Python - cần cài đặt)
echo  [4] 📊 Menu đầy đủ (CMD)
echo  [5] 🛠️  Cài đặt Python dependencies
echo  [6] 📖 Mở hướng dẫn (README)
echo  [0] ❌ Thoát
echo.
echo ════════════════════════════════════════════════════════
set /p mode="Chọn chế độ (0-6): "

if "%mode%"=="1" goto :quick_analyze
if "%mode%"=="2" goto :quick_cleanup
if "%mode%"=="3" goto :python_analyze
if "%mode%"=="4" goto :full_menu
if "%mode%"=="5" goto :install_python
if "%mode%"=="6" goto :open_readme
if "%mode%"=="0" exit /b 0
goto :menu

:quick_analyze
cls
echo.
echo [*] Đang khởi động chế độ PHÂN TÍCH NHANH...
echo.
timeout /t 2 /nobreak >nul
start "" cmd /k "safe_cleanup.cmd"
goto :menu

:quick_cleanup
cls
echo.
echo [*] Đang khởi động chế độ DỌN RÁC NHANH...
echo.
echo ⚠️  LƯU Ý: Sẽ có backup tự động!
timeout /t 2 /nobreak >nul
start "" cmd /k "safe_cleanup.cmd"
goto :menu

:python_analyze
cls
echo.
echo [*] Đang kiểm tra Python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ❌ Python chưa được cài đặt!
    echo.
    echo 💡 Cài đặt Python:
    echo    1. Download từ: https://python.org
    echo    2. Hoặc chọn [5] để cài dependencies
    echo.
    pause
    goto :menu
)

echo ✅ Python đã cài đặt!
echo.
echo [*] Đang kiểm tra dependencies...
python -c "import pandas, rich" >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ⚠️  Thiếu dependencies!
    echo [*] Đang tự động cài đặt...
    pip install pandas rich
)

echo.
echo [*] Khởi động AI Analyzer...
timeout /t 2 /nobreak >nul
python cleanup_analyzer.py
echo.
echo ✅ Hoàn tất! Báo cáo đã được tạo.
pause
goto :menu

:full_menu
start "" cmd /k "safe_cleanup.cmd"
goto :menu

:install_python
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║         🛠️  CÀI ĐẶT PYTHON DEPENDENCIES               ║
echo ╚════════════════════════════════════════════════════════╝
echo.

python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python chưa được cài đặt!
    echo.
    echo 📥 Vui lòng cài đặt Python từ:
    echo    https://www.python.org/downloads/
    echo.
    echo Sau khi cài xong, chạy lại menu này.
    pause
    goto :menu
)

echo ✅ Đã phát hiện Python!
echo.
echo [*] Đang cài đặt dependencies...
echo.
pip install -r requirements.txt

echo.
if %errorlevel% equ 0 (
    echo ✅ Cài đặt thành công!
    echo.
    echo 💡 Bây giờ bạn có thể sử dụng:
    echo    - AI Analysis
    echo    - Advanced Reports
    echo    - 3D Visualization
) else (
    echo ❌ Có lỗi xảy ra!
    echo.
    echo 💡 Thử cài thủ công:
    echo    pip install pandas rich
)
echo.
pause
goto :menu

:open_readme
cls
echo.
echo [*] Đang mở hướng dẫn sử dụng...
if exist "README.md" (
    start "" notepad "README.md"
) else (
    echo ❌ Không tìm thấy README.md
    echo.
    echo 💡 Download từ: https://github.com/your-repo
)
timeout /t 2 /nobreak >nul
goto :menu
