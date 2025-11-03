@echo off
:: ============================================
:: Script D?n D?p Nhanh (CMD Only - Kh?ng c?n PowerShell)
:: Ch?y v?i quy?n Administrator
:: ============================================

title Don Dep Nhanh - Administrator

:: Ki?m tra quy?n Admin
net session >nul 2>&1
if %errorLevel% neq 0 (
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
echo ========================================
echo   CONG CU DON DEP RAC TU DONG
echo ========================================
echo.
echo Dang bat dau don dep...
echo.

set "totalSize=0"

:: 1. Windows Temp
echo [1/10] Dang don Windows Temp...
del /f /s /q %SystemRoot%\Temp\*.* >nul 2>&1
rd /s /q %SystemRoot%\Temp >nul 2>&1
md %SystemRoot%\Temp >nul 2>&1
echo       [OK] Windows Temp

:: 2. User Temp
echo [2/10] Dang don User Temp...
del /f /s /q %TEMP%\*.* >nul 2>&1
rd /s /q %TEMP% >nul 2>&1
md %TEMP% >nul 2>&1
echo       [OK] User Temp

:: 3. Prefetch
echo [3/10] Dang don Prefetch...
del /f /s /q %SystemRoot%\Prefetch\*.* >nul 2>&1
echo       [OK] Prefetch

:: 4. Recent Items
echo [4/10] Dang don Recent Items...
del /f /s /q %APPDATA%\Microsoft\Windows\Recent\*.* >nul 2>&1
echo       [OK] Recent Items

:: 5. Windows Update Cache
echo [5/10] Dang don Windows Update Cache...
del /f /s /q %SystemRoot%\SoftwareDistribution\Download\*.* >nul 2>&1
echo       [OK] Windows Update Cache

:: 6. Windows Error Reports
echo [6/10] Dang don Error Reports...
del /f /s /q %ProgramData%\Microsoft\Windows\WER\ReportQueue\*.* >nul 2>&1
echo       [OK] Error Reports

:: 7. Thumbnail Cache
echo [7/10] Dang don Thumbnail Cache...
del /f /s /q %LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db >nul 2>&1
echo       [OK] Thumbnail Cache

:: 8. Chrome Cache
echo [8/10] Dang don Chrome Cache...
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
echo       [OK] Chrome Cache

:: 9. Edge Cache
echo [9/10] Dang don Edge Cache...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
echo       [OK] Edge Cache

:: 10. Recycle Bin
echo [10/10] Dang don Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
echo       [OK] Recycle Bin

echo.
echo ========================================
echo   HOAN THANH!
echo ========================================
echo.
echo Da don dep thanh cong cac thu muc rac!
echo May tinh cua ban da sach hon!
echo.

:: T?y ch?n t?i ?u th?m
echo Ban co muon chay lenh toi uu he thong khong? (Y/N)
set /p optimize="> "

if /i "%optimize%"=="Y" (
    echo.
    echo Dang toi uu he thong...
    echo (Co the mat vai phut...)
    
    :: D?n Windows Component Store
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
    
    echo.
    echo Toi uu hoan tat!
)

echo.
echo Nhan phim bat ky de thoat...
pause >nul
