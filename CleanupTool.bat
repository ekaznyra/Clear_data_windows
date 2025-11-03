@echo off
:: ============================================
:: Script Batch kh?i ch?y c?ng c? d?n d?p
:: T? ??ng y?u c?u quy?n Administrator
:: ============================================

title Cong Cu Don Dep Rac Tu Dong

:: Ki?m tra quy?n Admin
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :runScript
) else (
    echo ========================================
    echo   YEU CAU QUYEN ADMINISTRATOR
    echo ========================================
    echo.
    echo Script nay can quyen Administrator.
    echo Dang khoi dong lai voi quyen Admin...
    echo.
    
    :: T? ??ng y?u c?u quy?n Admin v? ch?y l?i
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:runScript
:: Ch?y PowerShell script
echo ========================================
echo   DANG KHOI DONG CONG CU DON DEP...
echo ========================================
echo.

:: Ki?m tra xem file PowerShell c? t?n t?i kh?ng
if not exist "%~dp0CleanupTool.ps1" (
    echo LOI: Khong tim thay file CleanupTool.ps1
    echo Vui long dam bao file CleanupTool.ps1 nam cung thu muc voi file .bat nay
    pause
    exit /b
)

:: Ch?y PowerShell script v?i ExecutionPolicy Bypass
powershell -ExecutionPolicy Bypass -File "%~dp0CleanupTool.ps1"

exit
