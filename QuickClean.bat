@echo off
chcp 65001 >nul
:: ============================================
:: Script Don Dep Nhanh (CMD Only - Khong can PowerShell)
:: Chay voi quyen Administrator
:: Phien ban 2.0
:: ============================================

title Don Dep Nhanh v2.0 - Administrator

:: Kiem tra quyen Admin
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo ========================================
    echo   YEU CAU QUYEN ADMINISTRATOR
    echo ========================================
    echo.
    echo Vui long chay file nay voi quyen Administrator!
    echo Click chuot phai va chon "Run as administrator"
    echo.
    pause
    exit /b
)

color 0A
cls
echo.
echo ==================================================
echo           CONG CU DON DEP NHANH v2.0
echo ==================================================
echo.
echo Dang bat dau don dep...
echo.

set "totalSize=0"
set "startTime=%time%"

:: 1. Windows Temp
echo [1/15] Dang don Windows Temp...
del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
rd /s /q "%SystemRoot%\Temp" >nul 2>&1
md "%SystemRoot%\Temp" >nul 2>&1
echo         [OK] Windows Temp

:: 2. User Temp
echo [2/15] Dang don User Temp...
del /f /s /q "%TEMP%\*.*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
md "%TEMP%" >nul 2>&1
echo         [OK] User Temp

:: 3. Prefetch
echo [3/15] Dang don Prefetch...
del /f /s /q "%SystemRoot%\Prefetch\*.*" >nul 2>&1
echo         [OK] Prefetch

:: 4. Recent Items
echo [4/15] Dang don Recent Items...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*.*" >nul 2>&1
echo         [OK] Recent Items

:: 5. Windows Update Cache
echo [5/15] Dang don Windows Update Cache...
del /f /s /q "%SystemRoot%\SoftwareDistribution\Download\*.*" >nul 2>&1
echo         [OK] Windows Update Cache

:: 6. Windows Error Reports
echo [6/15] Dang don Error Reports...
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\ReportQueue\*.*" >nul 2>&1
echo         [OK] Error Reports

:: 7. Thumbnail Cache
echo [7/15] Dang don Thumbnail Cache...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
echo         [OK] Thumbnail Cache

:: 8. Chrome Cache
echo [8/15] Dang don Chrome Cache...
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache\*.*" >nul 2>&1
echo         [OK] Chrome Cache

:: 9. Edge Cache
echo [9/15] Dang don Edge Cache...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache\*.*" >nul 2>&1
echo         [OK] Edge Cache

:: 10. Firefox Cache
echo [10/15] Dang don Firefox Cache...
for /d %%G in ("%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*") do (
    del /f /s /q "%%G\cache2\*.*" >nul 2>&1
)
echo         [OK] Firefox Cache

:: 11. Windows Logs
echo [11/15] Dang don Windows Logs...
del /f /s /q "%SystemRoot%\Logs\*.*" >nul 2>&1
del /f /s /q "%SystemRoot%\System32\LogFiles\*.*" >nul 2>&1
echo         [OK] Windows Logs

:: 12. Crash Dumps
echo [12/15] Dang don Crash Dumps...
del /f /s /q "%LOCALAPPDATA%\CrashDumps\*.*" >nul 2>&1
echo         [OK] Crash Dumps

:: 13. Teams Cache (neu co)
echo [13/15] Dang don Microsoft Teams Cache...
del /f /s /q "%APPDATA%\Microsoft\Teams\Cache\*.*" >nul 2>&1
del /f /s /q "%APPDATA%\Microsoft\Teams\tmp\*.*" >nul 2>&1
echo         [OK] Teams Cache

:: 14. Discord Cache (neu co)
echo [14/15] Dang don Discord Cache...
del /f /s /q "%APPDATA%\Discord\Cache\*.*" >nul 2>&1
del /f /s /q "%APPDATA%\Discord\Code Cache\*.*" >nul 2>&1
echo         [OK] Discord Cache

:: 15. Recycle Bin
echo [15/15] Dang don Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
echo         [OK] Recycle Bin

echo.
echo ==================================================
echo           HOAN THANH DON DEP!
echo ==================================================
echo.
echo Da don dep thanh cong tat ca cac thu muc rac!
echo May tinh cua ban da sach hon!
echo.

:: Tuy chon toi uu them
echo Ban co muon chay lenh toi uu he thong khong? (Y/N)
set /p optimize=^> 

if /i "%optimize%"=="Y" (
    echo.
    echo Dang toi uu he thong...
    echo (Co the mat vai phut...)
    echo.
    
    :: Don Windows Component Store
    echo [1/2] Don dep Windows Component Store...
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1
    echo         [OK] Component Store
    
    :: System File Check (optional)
    echo [2/2] Kiem tra he thong file...
    sfc /scannow >nul 2>&1
    echo         [OK] System File Check
    
    echo.
    echo Toi uu hoan tat!
)

echo.
echo ==================================================
echo.
echo Thoi gian thuc hien: %startTime% - %time%
echo.
echo Nhan phim bat ky de thoat...
pause >nul
