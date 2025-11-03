@echo off
title Windows Cleanup Tool - Simple Test

:: Check if running as admin
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Please run as Administrator!
    echo Right-click this file and select "Run as Administrator"
    pause
    exit
)

:MENU
cls
echo.
echo ===================================
echo  WINDOWS CLEANUP TOOL - TEST
echo ===================================
echo.
echo  [1] Quick Clean
echo  [2] Deep Clean
echo  [3] System Info
echo  [0] Exit
echo.
set /p choice=Select option: 

if "%choice%"=="0" exit
if "%choice%"=="1" goto CLEAN1
if "%choice%"=="2" goto CLEAN2
if "%choice%"=="3" goto INFO
goto MENU

:CLEAN1
cls
echo.
echo Running Quick Clean...
echo.
echo [1/3] Cleaning Temp files...
del /f /s /q "%TEMP%\*" >nul 2>&1
echo [2/3] Cleaning Windows Temp...
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
echo [3/3] Flushing DNS...
ipconfig /flushdns >nul 2>&1
echo.
echo SUCCESS! Quick cleanup complete.
echo.
pause
goto MENU

:CLEAN2
cls
echo.
echo Running Deep Clean...
echo This may take 5-10 minutes.
pause
echo.
echo [1/5] Cleaning temp files...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
echo [2/5] Cleaning prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1
echo [3/5] Cleaning Windows Update cache...
net stop wuauserv >nul 2>&1
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1
echo [4/5] Cleaning logs...
del /f /s /q "C:\Windows\Logs\*" >nul 2>&1
echo [5/5] Running disk cleanup...
cleanmgr /sagerun:1 >nul 2>&1
echo.
echo SUCCESS! Deep cleanup complete.
echo.
pause
goto MENU

:INFO
cls
echo.
echo System Information:
echo.
systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type"
echo.
pause
goto MENU
