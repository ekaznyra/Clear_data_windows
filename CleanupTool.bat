@echo off
chcp 65001 >nul
:: ============================================
:: Script Batch khoi chay cong cu don dep
:: Tu dong yeu cau quyen Administrator
:: ============================================

title Cong Cu Don Dep Rac Tu Dong v2.0

:: Kiem tra quyen Admin
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :runScript
) else (
    echo.
    echo ========================================
    echo   YEU CAU QUYEN ADMINISTRATOR
    echo ========================================
    echo.
    echo Script nay can quyen Administrator.
    echo Dang khoi dong lai voi quyen Admin...
    echo.
    
    :: Tu dong yeu cau quyen Admin va chay lai
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:runScript
:: Chay PowerShell script
cls
echo.
echo ========================================
echo   KHOI DONG CONG CU DON DEP...
echo ========================================
echo.

:: Kiem tra xem file PowerShell co ton tai khong
if not exist "%~dp0CleanupTool.ps1" (
    echo LOI: Khong tim thay file CleanupTool.ps1
    echo Vui long dam bao file CleanupTool.ps1 nam cung thu muc voi file .bat nay
    echo.
    pause
    exit /b
)

:: Chay PowerShell script voi ExecutionPolicy Bypass
powershell -ExecutionPolicy Bypass -NoProfile -File "%~dp0CleanupTool.ps1"

exit
