@echo off
:: ============================================================================
:: Windows System Cleanup Tool - Safe & Powerful
:: Cleans hidden junk, cache, temporary files, and unused data
:: Based on open-source best practices
:: ============================================================================
:: Run as Administrator for best results
:: ============================================================================

title Windows Cleanup Tool - Cleaning System Junk

echo ========================================
echo   Windows System Cleanup Tool
echo   Cleaning hidden junk and cache files
echo ========================================
echo.
echo WARNING: This will delete temporary and cache files
echo Press Ctrl+C to cancel, or
pause

:: Check for administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo [WARNING] Not running as Administrator!
    echo Some cleanup operations may be limited.
    echo Right-click and "Run as Administrator" for full cleanup.
    echo.
    pause
)

echo.
echo [1/12] Cleaning Windows Temp folder...
del /f /s /q "%TEMP%\*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
mkdir "%TEMP%" >nul 2>&1

echo [2/12] Cleaning Windows System Temp folder...
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
rd /s /q "C:\Windows\Temp" >nul 2>&1
mkdir "C:\Windows\Temp" >nul 2>&1

echo [3/12] Cleaning Windows Prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo [4/12] Cleaning Recent Items...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

echo [5/12] Cleaning Internet Explorer Cache...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8 >nul 2>&1
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2 >nul 2>&1

echo [6/12] Cleaning Windows Update Cache...
net stop wuauserv >nul 2>&1
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1

echo [7/12] Cleaning Windows Error Reports...
del /f /s /q "C:\ProgramData\Microsoft\Windows\WER\*" >nul 2>&1

echo [8/12] Cleaning Windows Logs...
del /f /s /q "C:\Windows\Logs\*" >nul 2>&1

echo [9/12] Cleaning Thumbnail Cache...
del /f /s /q /a:h "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
del /f /s /q /a:h "%LOCALAPPDATA%\Microsoft\Windows\Explorer\iconcache_*.db" >nul 2>&1

echo [10/12] Cleaning DNS Cache...
ipconfig /flushdns >nul 2>&1

echo [11/12] Cleaning Memory Dump Files...
del /f /q "C:\Windows\MEMORY.DMP" >nul 2>&1
del /f /s /q "C:\Windows\Minidump\*" >nul 2>&1

echo [12/12] Running Disk Cleanup utility...
cleanmgr /sagerun:1 >nul 2>&1

:: Additional Browser Cache Cleanup
echo.
echo ========================================
echo   Browser Cache Cleanup
echo ========================================

:: Chrome Cache
if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" (
    echo Cleaning Google Chrome cache...
    del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
    del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache\*" >nul 2>&1
)

:: Firefox Cache
if exist "%LOCALAPPDATA%\Mozilla\Firefox\Profiles" (
    echo Cleaning Mozilla Firefox cache...
    for /d %%x in ("%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*") do (
        del /f /s /q "%%x\cache2\*" >nul 2>&1
        del /f /s /q "%%x\startupCache\*" >nul 2>&1
    )
)

:: Edge Cache
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" (
    echo Cleaning Microsoft Edge cache...
    del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
    del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache\*" >nul 2>&1
)

:: Opera Cache
if exist "%APPDATA%\Opera Software\Opera Stable\Cache" (
    echo Cleaning Opera cache...
    del /f /s /q "%APPDATA%\Opera Software\Opera Stable\Cache\*" >nul 2>&1
)

:: Brave Cache
if exist "%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data\Default\Cache" (
    echo Cleaning Brave cache...
    del /f /s /q "%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data\Default\Cache\*" >nul 2>&1
)

:: Application Cache Cleanup
echo.
echo ========================================
echo   Application Cache Cleanup
echo ========================================

:: Discord Cache
if exist "%APPDATA%\discord\Cache" (
    echo Cleaning Discord cache...
    del /f /s /q "%APPDATA%\discord\Cache\*" >nul 2>&1
    del /f /s /q "%APPDATA%\discord\Code Cache\*" >nul 2>&1
)

:: Spotify Cache
if exist "%APPDATA%\Spotify\Data" (
    echo Cleaning Spotify cache...
    del /f /s /q "%APPDATA%\Spotify\Data\*" >nul 2>&1
)

:: Steam Shader Cache
if exist "C:\Program Files (x86)\Steam\steamapps\shadercache" (
    echo Cleaning Steam shader cache...
    del /f /s /q "C:\Program Files (x86)\Steam\steamapps\shadercache\*" >nul 2>&1
)

:: Windows Store Cache
echo Cleaning Windows Store cache...
wsreset.exe >nul 2>&1

:: .NET Temp Files
if exist "%LOCALAPPDATA%\Temp" (
    echo Cleaning .NET temp files...
    del /f /s /q "%LOCALAPPDATA%\Temp\*" >nul 2>&1
)

:: Recycle Bin
echo.
echo ========================================
echo   Emptying Recycle Bin
echo ========================================
echo Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1

:: Final Cleanup
echo.
echo ========================================
echo   Final System Optimization
echo ========================================

echo Running Windows Disk Cleanup...
cleanmgr.exe /autoclean >nul 2>&1

echo.
echo ========================================
echo   Cleanup Complete!
echo ========================================
echo.
echo Summary of cleaned items:
echo - Temporary files
echo - Windows cache and prefetch
echo - Browser caches (Chrome, Firefox, Edge, Opera, Brave)
echo - Application caches (Discord, Spotify, Steam)
echo - Windows Update cache
echo - Thumbnail and icon cache
echo - DNS cache
echo - Error reports and logs
echo - Recycle Bin
echo.
echo RECOMMENDATION: Run Disk Defragmenter next
echo Command: defrag C: /O
echo.
echo For more advanced cleanup, consider these open-source tools:
echo - BleachBit: https://www.bleachbit.org/
echo - CCleaner: https://www.ccleaner.com/
echo - PrivaZer: https://privazer.com/
echo - Wise Disk Cleaner: https://www.wisecleaner.com/
echo.
pause
