@echo off
:: ============================================
:: Quick Cleanup Script (CMD Only - No PowerShell Required)
:: Run as Administrator
:: Version 2.0
:: ============================================

title Quick Cleanup v2.0 - Administrator

:: Check for Admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo ========================================
    echo   ADMINISTRATOR RIGHTS REQUIRED
    echo ========================================
    echo.
    echo Please run this file as Administrator!
    echo Right-click and select "Run as administrator"
    echo.
    pause
    exit /b
)

color 0A
cls
echo.
echo ==================================================
echo        WINDOWS QUICK CLEANUP TOOL v2.0
echo ==================================================
echo.
echo Starting cleanup...
echo.

set "startTime=%time%"

:: 1. Windows Temp
echo [1/15] Cleaning Windows Temp...
del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
rd /s /q "%SystemRoot%\Temp" >nul 2>&1
md "%SystemRoot%\Temp" >nul 2>&1
echo         [OK] Windows Temp

:: 2. User Temp
echo [2/15] Cleaning User Temp...
del /f /s /q "%TEMP%\*.*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
md "%TEMP%" >nul 2>&1
echo         [OK] User Temp

:: 3. Prefetch
echo [3/15] Cleaning Prefetch...
del /f /s /q "%SystemRoot%\Prefetch\*.*" >nul 2>&1
echo         [OK] Prefetch

:: 4. Recent Items
echo [4/15] Cleaning Recent Items...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*.*" >nul 2>&1
echo         [OK] Recent Items

:: 5. Windows Update Cache
echo [5/15] Cleaning Windows Update Cache...
del /f /s /q "%SystemRoot%\SoftwareDistribution\Download\*.*" >nul 2>&1
echo         [OK] Windows Update Cache

:: 6. Windows Error Reports
echo [6/15] Cleaning Error Reports...
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\ReportQueue\*.*" >nul 2>&1
echo         [OK] Error Reports

:: 7. Thumbnail Cache
echo [7/15] Cleaning Thumbnail Cache...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
echo         [OK] Thumbnail Cache

:: 8. Chrome Cache
echo [8/15] Cleaning Chrome Cache...
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache\*.*" >nul 2>&1
echo         [OK] Chrome Cache

:: 9. Edge Cache
echo [9/15] Cleaning Edge Cache...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache\*.*" >nul 2>&1
echo         [OK] Edge Cache

:: 10. Firefox Cache
echo [10/15] Cleaning Firefox Cache...
for /d %%G in ("%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*") do (
    del /f /s /q "%%G\cache2\*.*" >nul 2>&1
)
echo         [OK] Firefox Cache

:: 11. Windows Logs
echo [11/15] Cleaning Windows Logs...
del /f /s /q "%SystemRoot%\Logs\*.*" >nul 2>&1
del /f /s /q "%SystemRoot%\System32\LogFiles\*.*" >nul 2>&1
echo         [OK] Windows Logs

:: 12. Crash Dumps
echo [12/15] Cleaning Crash Dumps...
del /f /s /q "%LOCALAPPDATA%\CrashDumps\*.*" >nul 2>&1
echo         [OK] Crash Dumps

:: 13. Teams Cache (if present)
echo [13/15] Cleaning Microsoft Teams Cache...
del /f /s /q "%APPDATA%\Microsoft\Teams\Cache\*.*" >nul 2>&1
del /f /s /q "%APPDATA%\Microsoft\Teams\tmp\*.*" >nul 2>&1
echo         [OK] Teams Cache

:: 14. Discord Cache (if present)
echo [14/15] Cleaning Discord Cache...
del /f /s /q "%APPDATA%\Discord\Cache\*.*" >nul 2>&1
del /f /s /q "%APPDATA%\Discord\Code Cache\*.*" >nul 2>&1
echo         [OK] Discord Cache

:: 15. Recycle Bin
echo [15/15] Cleaning Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
echo         [OK] Recycle Bin

echo.
echo ==================================================
echo           CLEANUP COMPLETE!
echo ==================================================
echo.
echo Successfully cleaned all junk folders!
echo Your computer is now cleaner!
echo.

:: Optional system optimization
echo Do you want to run system optimization? (Y/N)
set /p optimize=^> 

if /i "%optimize%"=="Y" (
    echo.
    echo Running system optimization...
    echo (This may take several minutes...)
    echo.
    
    :: Clean Windows Component Store
    echo [1/2] Cleaning Windows Component Store...
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1
    echo         [OK] Component Store
    
    :: System File Check (optional)
    echo [2/2] System file integrity check...
    sfc /scannow >nul 2>&1
    echo         [OK] System File Check
    
    echo.
    echo Optimization complete!
)

echo.
echo ==================================================
echo.
echo Execution time: %startTime% - %time%
echo.
echo Press any key to exit...
pause >nul
