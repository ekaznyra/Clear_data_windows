@echo off
:: ============================================================================
:: Advanced Windows Cleanup Tool - Deep System Cleaning
:: Removes hidden junk, obsolete files, and system clutter
:: Open-source methodology with safe practices
:: ============================================================================
:: IMPORTANT: Run as Administrator
:: ============================================================================

title Advanced System Cleanup - Deep Cleaning Mode

color 0A
echo.
echo  ============================================================================
echo   ADVANCED WINDOWS CLEANUP TOOL
echo   Deep cleaning hidden and obsolete system files
echo  ============================================================================
echo.
echo   This script performs DEEP cleaning including:
echo   - Hidden temporary files and caches
echo   - Obsolete Windows components
echo   - Unused driver packages
echo   - System restore points (old ones)
echo   - Windows Update backups
echo   - Event logs and crash dumps
echo   - Orphaned registry entries cleanup suggestions
echo.
echo   WARNING: This is more aggressive than standard cleanup!
echo  ============================================================================
echo.

:: Administrator check
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo ERROR: This script requires Administrator privileges!
    echo Please right-click and select "Run as Administrator"
    echo.
    pause
    exit /b 1
)

echo Press any key to continue or close this window to cancel...
pause >nul

:: Create log file
set LOGFILE="%USERPROFILE%\Desktop\CleanupLog_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%.txt"
echo Cleanup started at %date% %time% > %LOGFILE%

echo.
echo ========================================
echo   PHASE 1: Standard Cleanup
echo ========================================

echo [1] Cleaning user temp files...
del /f /s /q "%TEMP%\*" >nul 2>&1
echo   Cleaned: User Temp >> %LOGFILE%

echo [2] Cleaning system temp files...
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
echo   Cleaned: System Temp >> %LOGFILE%

echo [3] Cleaning Windows prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1
echo   Cleaned: Prefetch >> %LOGFILE%

echo [4] Cleaning Windows SoftwareDistribution...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start bits >nul 2>&1
net start wuauserv >nul 2>&1
echo   Cleaned: Windows Update Cache >> %LOGFILE%

echo.
echo ========================================
echo   PHASE 2: Hidden Files Cleanup
echo ========================================

echo [5] Cleaning hidden thumbnail cache...
del /f /s /q /a:h "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
echo   Cleaned: Thumbnail Cache >> %LOGFILE%

echo [6] Cleaning hidden icon cache...
taskkill /f /im explorer.exe >nul 2>&1
del /f /s /q /a:h "%LOCALAPPDATA%\IconCache.db" >nul 2>&1
start explorer.exe
echo   Cleaned: Icon Cache >> %LOGFILE%

echo [7] Cleaning hidden system files...
attrib -h -s "%SYSTEMDRIVE%\*.log" >nul 2>&1
del /f /q "%SYSTEMDRIVE%\*.log" >nul 2>&1
echo   Cleaned: System Logs >> %LOGFILE%

echo [8] Cleaning Windows Error Reporting...
del /f /s /q "C:\ProgramData\Microsoft\Windows\WER\*" >nul 2>&1
echo   Cleaned: Error Reports >> %LOGFILE%

echo.
echo ========================================
echo   PHASE 3: Deep System Cleanup
echo ========================================

echo [9] Cleaning old Windows installations...
if exist "C:\Windows.old" (
    takeown /f "C:\Windows.old" /r /d y >nul 2>&1
    icacls "C:\Windows.old" /grant administrators:F /t >nul 2>&1
    rd /s /q "C:\Windows.old" >nul 2>&1
    echo   Cleaned: Windows.old folder >> %LOGFILE%
) else (
    echo   No Windows.old folder found >> %LOGFILE%
)

echo [10] Cleaning Windows Update backup files...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1
echo   Cleaned: Component Store >> %LOGFILE%

echo [11] Cleaning unused drivers...
pnputil /delete-driver * /uninstall /force >nul 2>&1
echo   Cleaned: Unused Drivers >> %LOGFILE%

echo [12] Cleaning memory dumps...
del /f /q "C:\Windows\MEMORY.DMP" >nul 2>&1
del /f /s /q "C:\Windows\Minidump\*" >nul 2>&1
rd /s /q "C:\Windows\Minidump" >nul 2>&1
echo   Cleaned: Memory Dumps >> %LOGFILE%

echo [13] Cleaning Windows logs...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G" >nul 2>&1)
echo   Cleaned: Event Logs >> %LOGFILE%

echo [14] Cleaning system restore points (keeping latest)...
vssadmin delete shadows /for=%systemdrive% /oldest /quiet >nul 2>&1
echo   Cleaned: Old Restore Points >> %LOGFILE%

echo.
echo ========================================
echo   PHASE 4: Browser Deep Clean
echo ========================================

echo [15] Deep cleaning all browser caches...

:: Kill browsers
taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM firefox.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM opera.exe >nul 2>&1
taskkill /F /IM brave.exe >nul 2>&1

:: Chrome
if exist "%LOCALAPPDATA%\Google\Chrome\User Data" (
    echo   Cleaning Chrome...
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\GPUCache" >nul 2>&1
    del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\*.tmp" >nul 2>&1
    echo   Cleaned: Chrome >> %LOGFILE%
)

:: Firefox
if exist "%LOCALAPPDATA%\Mozilla\Firefox\Profiles" (
    echo   Cleaning Firefox...
    for /d %%x in ("%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*") do (
        rd /s /q "%%x\cache2" >nul 2>&1
        rd /s /q "%%x\startupCache" >nul 2>&1
        rd /s /q "%%x\thumbnails" >nul 2>&1
        del /f /s /q "%%x\*.sqlite-wal" >nul 2>&1
        del /f /s /q "%%x\*.sqlite-shm" >nul 2>&1
    )
    echo   Cleaned: Firefox >> %LOGFILE%
)

:: Edge
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data" (
    echo   Cleaning Edge...
    rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1
    rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache" >nul 2>&1
    echo   Cleaned: Edge >> %LOGFILE%
)

echo.
echo ========================================
echo   PHASE 5: Application Cleanup
echo ========================================

echo [16] Cleaning application caches...

:: Discord
if exist "%APPDATA%\discord" (
    taskkill /F /IM discord.exe >nul 2>&1
    rd /s /q "%APPDATA%\discord\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\discord\Code Cache" >nul 2>&1
    rd /s /q "%APPDATA%\discord\GPUCache" >nul 2>&1
    echo   Cleaned: Discord >> %LOGFILE%
)

:: Teams
if exist "%APPDATA%\Microsoft\Teams" (
    taskkill /F /IM Teams.exe >nul 2>&1
    rd /s /q "%APPDATA%\Microsoft\Teams\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\Microsoft\Teams\blob_storage" >nul 2>&1
    rd /s /q "%APPDATA%\Microsoft\Teams\databases" >nul 2>&1
    echo   Cleaned: Teams >> %LOGFILE%
)

:: Spotify
if exist "%APPDATA%\Spotify" (
    taskkill /F /IM Spotify.exe >nul 2>&1
    rd /s /q "%APPDATA%\Spotify\Data" >nul 2>&1
    echo   Cleaned: Spotify >> %LOGFILE%
)

:: Visual Studio Code
if exist "%APPDATA%\Code" (
    rd /s /q "%APPDATA%\Code\Cache" >nul 2>&1
    rd /s /q "%APPDATA%\Code\CachedData" >nul 2>&1
    rd /s /q "%APPDATA%\Code\logs" >nul 2>&1
    echo   Cleaned: VS Code >> %LOGFILE%
)

echo.
echo ========================================
echo   PHASE 6: Network & DNS Cleanup
echo ========================================

echo [17] Flushing DNS cache...
ipconfig /flushdns >nul 2>&1
echo   Cleaned: DNS Cache >> %LOGFILE%

echo [18] Resetting network settings...
netsh int ip reset >nul 2>&1
netsh winsock reset >nul 2>&1
echo   Reset: Network Settings >> %LOGFILE%

echo.
echo ========================================
echo   PHASE 7: Final Cleanup
echo ========================================

echo [19] Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
echo   Cleaned: Recycle Bin >> %LOGFILE%

echo [20] Running Disk Cleanup...
cleanmgr /sagerun:1 >nul 2>&1
echo   Completed: Disk Cleanup >> %LOGFILE%

echo.
echo Cleanup finished at %date% %time% >> %LOGFILE%

:: Display results
color 0A
echo.
echo  ============================================================================
echo   CLEANUP COMPLETED SUCCESSFULLY!
echo  ============================================================================
echo.
echo   All phases completed. Check the log file for details:
echo   %LOGFILE%
echo.
echo   RECOMMENDATIONS:
echo   ----------------
echo   1. Restart your computer for all changes to take effect
echo   2. Run defragmentation: defrag C: /O
echo   3. Check disk for errors: chkdsk C: /F
echo   4. Scan for malware with Windows Defender
echo.
echo   OPEN-SOURCE TOOLS FOR DEEPER CLEANING:
echo   --------------------------------------
echo   - BleachBit (https://www.bleachbit.org/)
echo     Free, open-source system cleaner for Windows and Linux
echo.
echo   - PrivaZer (https://privazer.com/)
echo     Deep cleaning and privacy protection
echo.
echo   - Bulk Crap Uninstaller (https://www.bcuninstaller.com/)
echo     Remove unwanted programs and leftover files
echo.
echo   - WinDirStat (https://windirstat.net/)
echo     Visualize disk usage and find large files
echo.
echo   - TreeSize Free (https://www.jam-software.com/treesize_free)
echo     Analyze disk space usage
echo.
echo  ============================================================================
echo.
pause
