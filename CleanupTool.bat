@echo off
:: ============================================
:: Windows Cleanup Tool Launcher
:: Automatically requests Administrator rights
:: ============================================

title Windows Cleanup Tool v2.0

:: Check for Admin privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :runScript
) else (
    echo.
    echo ========================================
    echo   ADMINISTRATOR RIGHTS REQUIRED
    echo ========================================
    echo.
    echo This script needs Administrator privileges.
    echo Restarting with elevated rights...
    echo.
    
    :: Auto-request Admin rights and restart
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:runScript
:: Run PowerShell script
cls
echo.
echo ========================================
echo   STARTING CLEANUP TOOL...
echo ========================================
echo.

:: Check if PowerShell script exists
if not exist "%~dp0CleanupTool.ps1" (
    echo ERROR: Cannot find CleanupTool.ps1
    echo Please ensure CleanupTool.ps1 is in the same folder as this .bat file
    echo.
    pause
    exit /b
)

:: Run PowerShell script with Bypass policy
powershell -ExecutionPolicy Bypass -NoProfile -File "%~dp0CleanupTool.ps1"

exit
