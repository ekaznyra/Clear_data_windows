@echo off
:: Optimized Windows Cleanup Script
:: No MAS_Scripts dependency - Standalone version
:: Optimized for performance and safety

title Windows System Cleanup Tool
color 0A

:menu
cls
echo ===============================================
echo     WINDOWS SYSTEM CLEANUP TOOL
echo ===============================================
echo.
echo [1] Quick Cleanup (Safe - Recommended)
echo [0] Exit
echo.
echo ===============================================
set /p choice="Select option (0-1): "

if "%choice%"=="1" goto quick_cleanup
if "%choice%"=="0" goto exit
goto menu

:quick_cleanup
cls
echo ===============================================
echo     QUICK CLEANUP IN PROGRESS...
echo ===============================================
echo.

:: Create temp folder for logs
set "LOGFILE=%TEMP%\cleanup_log_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
echo Cleanup started at %date% %time% > "%LOGFILE%"

echo [+] Cleaning Windows Temp files...
del /f /s /q "%TEMP%\*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
mkdir "%TEMP%" >nul 2>&1

echo [+] Cleaning Windows System Temp...
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1

echo [+] Cleaning Prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo [+] Cleaning Recent Items...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

echo [+] Cleaning Recycle Bin...
rd /s /q C:\$Recycle.Bin >nul 2>&1

echo [+] Cleaning Browser Cache (Edge)...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1

echo [+] Cleaning Browser Cache (Chrome)...
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1

echo [+] Cleaning Windows Update Cache...
net stop wuauserv >nul 2>&1
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1

echo [+] Running Disk Cleanup...
cleanmgr /sagerun:1 >nul 2>&1

echo.
echo ===============================================
echo     CLEANUP COMPLETED!
echo ===============================================
echo.
echo Log file saved to: %LOGFILE%
echo.
pause
goto menu

:exit
cls
echo Thank you for using Windows System Cleanup Tool!
timeout /t 2 >nul
exit
