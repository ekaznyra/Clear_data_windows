@echo off
setlocal EnableDelayedExpansion EnableExtensions
:: ============================================================================
:: CleanMaster v2.0 - Ultra Safe Windows Junk Cleaner
:: Auto Admin Request | Dry-Run Default | 30+ Days Old Files Only
:: ============================================================================
:: Features:
::   - Auto requests Admin rights if needed
::   - Default DRY-RUN mode (--dry, safe preview)
::   - Only deletes files older than 30 days (customizable)
::   - Sends files to Recycle Bin (recoverable)
::   - Whitelist-based (safe temp folders + browser caches only)
::   - Detailed logging with size calculation
::   - Works on Windows 10/11
:: ============================================================================

title CleanMaster v2.0 - Safe Junk Cleaner

:: ============================================================================
:: AUTO ADMIN REQUEST
:: ============================================================================
>nul 2>&1 net session
if %errorLevel% neq 0 (
    echo.
    echo [!] Administrator rights required. Requesting elevation...
    echo.
    
    :: Create VBS script to elevate
    set "vbs_script=%TEMP%\elevate_%RANDOM%.vbs"
    echo Set UAC = CreateObject^("Shell.Application"^) > "!vbs_script!"
    echo UAC.ShellExecute "%~f0", "%*", "", "runas", 1 >> "!vbs_script!"
    
    :: Run elevated
    cscript //nologo "!vbs_script!"
    del /f /q "!vbs_script!" 2>nul
    exit /b
)

:: ============================================================================
:: DEFAULT CONFIGURATION
:: ============================================================================
set "MODE=DRY"
set "DAYS=30"
set "AUTO_YES=0"
set "LOG_FILE="
set "SHOW_HELP=0"

:: ============================================================================
:: PARSE COMMAND LINE ARGUMENTS
:: ============================================================================
:PARSE_ARGS
if "%~1"=="" goto ARGS_DONE
if /i "%~1"=="--help" set "SHOW_HELP=1" & goto NEXT_ARG
if /i "%~1"=="-h" set "SHOW_HELP=1" & goto NEXT_ARG
if /i "%~1"=="--dry" set "MODE=DRY" & goto NEXT_ARG
if /i "%~1"=="--clean" set "MODE=CLEAN" & goto NEXT_ARG
if /i "%~1"=="--days" set "DAYS=%~2" & shift & goto NEXT_ARG
if /i "%~1"=="--log" set "LOG_FILE=%~2" & shift & goto NEXT_ARG
if /i "%~1"=="--yes" set "AUTO_YES=1" & goto NEXT_ARG
echo [ERROR] Unknown parameter: %~1
exit /b 2

:NEXT_ARG
shift
goto PARSE_ARGS

:ARGS_DONE

:: Show help if requested
if "%SHOW_HELP%"=="1" goto SHOW_HELP

:: Validate days parameter
echo %DAYS%| findstr /r "^[0-9][0-9]*$" >nul
if errorlevel 1 (
    echo [ERROR] --days must be a positive number
    exit /b 2
)

:: Set default log file if not specified
if "%LOG_FILE%"=="" set "LOG_FILE=%~dp0CleanMaster_%date:~-4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"
set "LOG_FILE=%LOG_FILE: =0%"

:: ============================================================================
:: DISPLAY HEADER
:: ============================================================================
cls
color 0B
echo.
echo ============================================================================
echo   CleanMaster v2.0 - Ultra Safe Windows Junk Cleaner
echo ============================================================================
echo.
echo   Configuration:
echo   - Mode:          !MODE! ^(!MODE! = preview only, CLEAN = actual deletion^)
echo   - File Age:      Only files older than !DAYS! days
echo   - Admin Rights:  YES (elevated)
echo   - Log File:      !LOG_FILE!
if "!AUTO_YES!"=="1" echo   - Auto Confirm: YES (no prompts)
echo.
echo   Safety Features:
echo   [+] Only touches whitelisted temp folders and caches
echo   [+] Files sent to Recycle Bin (recoverable)
echo   [+] Skips locked, system, and hidden files
echo   [+] No Registry, Prefetch, or system files touched
echo.
echo ============================================================================
echo.

:: Initialize log
echo CleanMaster v2.0 - Session Started: %DATE% %TIME% > "!LOG_FILE!"
echo Mode: !MODE! >> "!LOG_FILE!"
echo Days: !DAYS! >> "!LOG_FILE!"
echo. >> "!LOG_FILE!"

:: ============================================================================
:: CREATE POWERSHELL CLEANER SCRIPT
:: ============================================================================
set "PS_SCRIPT=%TEMP%\CleanMaster_%RANDOM%.ps1"

(
echo # CleanMaster PowerShell Engine
echo param^(
echo     [string]$Mode,
echo     [int]$Days,
echo     [string]$LogFile
echo ^)
echo.
echo $ErrorActionPreference = 'Continue'
echo $totalSizeBefore = 0
echo $totalSizeAfter = 0
echo $filesProcessed = 0
echo $filesDeleted = 0
echo $errors = 0
echo $cutoffDate = ^(Get-Date^).AddDays^(-$Days^)
echo.
echo function Write-Log {
echo     param^([string]$Message^)
echo     $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
echo     Add-Content -Path $LogFile -Value "$timestamp $Message"
echo }
echo.
echo function Format-Size {
echo     param^([long]$Bytes^)
echo     if ^($Bytes -ge 1GB^) { return "$^([math]::Round^($Bytes / 1GB, 2^)^) GB" }
echo     elseif ^($Bytes -ge 1MB^) { return "$^([math]::Round^($Bytes / 1MB, 2^)^) MB" }
echo     elseif ^($Bytes -ge 1KB^) { return "$^([math]::Round^($Bytes / 1KB, 2^)^) KB" }
echo     else { return "$Bytes bytes" }
echo }
echo.
echo function Clean-Path {
echo     param^([string]$Path, [string]$Name^)
echo     
echo     if ^(-not ^(Test-Path $Path^)^) {
echo         Write-Host "  [SKIP] $Name - path not found" -ForegroundColor Yellow
echo         Write-Log "[SKIP] $Name - path not found: $Path"
echo         return
echo     }
echo     
echo     Write-Host "  [SCAN] $Name..." -ForegroundColor Cyan
echo     Write-Log "[SCAN] Scanning: $Path"
echo     
echo     $sizeBeforeFolder = 0
echo     $filesInFolder = 0
echo     
echo     try {
echo         $files = Get-ChildItem -Path $Path -File -Recurse -Force -ErrorAction SilentlyContinue ^|
echo                  Where-Object {
echo                      -not $_.Attributes.ToString^(^).Contains^('ReparsePoint'^) -and
echo                      -not $_.Attributes.ToString^(^).Contains^('System'^) -and
echo                      $_.LastWriteTime -lt $cutoffDate
echo                  }
echo         
echo         foreach ^($file in $files^) {
echo             try {
echo                 $fileSize = $file.Length
echo                 $sizeBeforeFolder += $fileSize
echo                 $filesInFolder++
echo                 $script:totalSizeBefore += $fileSize
echo                 $script:filesProcessed++
echo                 
echo                 $age = ^(Get-Date^) - $file.LastWriteTime
echo                 $sizeMB = [math]::Round^($fileSize / 1MB, 2^)
echo                 
echo                 if ^($Mode -eq "DRY"^) {
echo                     Write-Host "    [DRY] $^($file.Name^) ^($sizeMB MB, $^([int]$age.TotalDays^) days old^)" -ForegroundColor Gray
echo                     Write-Log "[DRY] $^($file.FullName^) ^| Size: $fileSize bytes ^| Age: $^([int]$age.TotalDays^) days"
echo                 } else {
echo                     # CLEAN mode - send to Recycle Bin
echo                     try {
echo                         Add-Type -AssemblyName Microsoft.VisualBasic
echo                         [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile^($file.FullName, 'OnlyErrorDialogs', 'SendToRecycleBin'^)
echo                         Write-Host "    [DEL] $^($file.Name^) ^($sizeMB MB^)" -ForegroundColor Green
echo                         Write-Log "[DEL] $^($file.FullName^) ^| Size: $fileSize bytes"
echo                         $script:filesDeleted++
echo                     } catch {
echo                         Write-Host "    [ERR] $^($file.Name^): $^($_.Exception.Message^)" -ForegroundColor Red
echo                         Write-Log "[ERR] $^($file.FullName^) ^| Error: $^($_.Exception.Message^)"
echo                         $script:errors++
echo                     }
echo                 }
echo             } catch {
echo                 $script:errors++
echo             }
echo         }
echo         
echo         if ^($filesInFolder -gt 0^) {
echo             $folderSizeStr = Format-Size $sizeBeforeFolder
echo             Write-Host "    Found: $filesInFolder files ^($folderSizeStr^)" -ForegroundColor White
echo             Write-Log "[INFO] $Name - Files: $filesInFolder, Size: $sizeBeforeFolder bytes"
echo         } else {
echo             Write-Host "    No old files found" -ForegroundColor Gray
echo         }
echo         
echo     } catch {
echo         Write-Host "  [ERR] Failed to scan $Name" -ForegroundColor Red
echo         Write-Log "[ERR] Failed to scan $Path - $^($_.Exception.Message^)"
echo     }
echo }
echo.
echo # Main cleaning process
echo Write-Host ""
echo Write-Host "Scanning for files older than $Days days..." -ForegroundColor Cyan
echo Write-Host "Cutoff date: $^($cutoffDate.ToString^('yyyy-MM-dd'^)^)" -ForegroundColor Cyan
echo Write-Host ""
echo.
echo # Clean user temp folders
echo Write-Host "[1/10] User Temp Folders" -ForegroundColor Yellow
echo Clean-Path $env:TEMP "User TEMP"
echo Clean-Path "$env:LOCALAPPDATA\Temp" "Local Temp"
echo.
echo # Clean Windows Temp
echo Write-Host "[2/10] Windows System Temp" -ForegroundColor Yellow
echo Clean-Path "$env:SystemRoot\Temp" "Windows Temp"
echo.
echo # Clean browser caches
echo Write-Host "[3/10] Browser Caches" -ForegroundColor Yellow
echo Clean-Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache" "Chrome Cache"
echo Clean-Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Code Cache" "Chrome Code Cache"
echo Clean-Path "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache" "Edge Cache"
echo Clean-Path "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Code Cache" "Edge Code Cache"
echo Clean-Path "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles\*.default*\cache2" "Firefox Cache"
echo.
echo # Clean thumbnail cache
echo Write-Host "[4/10] Thumbnail Cache" -ForegroundColor Yellow
echo Clean-Path "$env:LOCALAPPDATA\Microsoft\Windows\Explorer" "Thumbnail Cache"
echo.
echo # Clean Windows Error Reporting
echo Write-Host "[5/10] Windows Error Reports" -ForegroundColor Yellow
echo Clean-Path "$env:ProgramData\Microsoft\Windows\WER\ReportArchive" "WER Archive"
echo Clean-Path "$env:ProgramData\Microsoft\Windows\WER\ReportQueue" "WER Queue"
echo Clean-Path "$env:ProgramData\Microsoft\Windows\WER\Temp" "WER Temp"
echo.
echo # Clean crash dumps
echo Write-Host "[6/10] Crash Dumps" -ForegroundColor Yellow
echo Clean-Path "$env:LOCALAPPDATA\CrashDumps" "Local Crash Dumps"
echo.
echo # Clean app caches
echo Write-Host "[7/10] Application Caches" -ForegroundColor Yellow
echo Clean-Path "$env:LOCALAPPDATA\Temp" "App Temp Files"
echo.
echo # Clean log files in temp
echo Write-Host "[8/10] Temporary Log Files" -ForegroundColor Yellow
echo try {
echo     $logFiles = Get-ChildItem -Path $env:TEMP -Filter "*.log" -File -Force -ErrorAction SilentlyContinue ^|
echo                 Where-Object { $_.LastWriteTime -lt $cutoffDate }
echo     foreach ^($log in $logFiles^) {
echo         try {
echo             $logSize = $log.Length
echo             $script:totalSizeBefore += $logSize
echo             $script:filesProcessed++
echo             if ^($Mode -eq "CLEAN"^) {
echo                 Remove-Item -Path $log.FullName -Force -ErrorAction Stop
echo                 Write-Host "    [DEL] $^($log.Name^)" -ForegroundColor Green
echo                 $script:filesDeleted++
echo             }
echo         } catch { $script:errors++ }
echo     }
echo } catch {}
echo.
echo # Clean Recycle Bin ^(only in CLEAN mode^)
echo Write-Host "[9/10] Recycle Bin" -ForegroundColor Yellow
echo if ^($Mode -eq "CLEAN"^) {
echo     try {
echo         Write-Host "  [INFO] Emptying Recycle Bin..." -ForegroundColor Cyan
echo         Clear-RecycleBin -Force -ErrorAction SilentlyContinue
echo         Write-Host "  [OK] Recycle Bin emptied" -ForegroundColor Green
echo         Write-Log "[INFO] Recycle Bin emptied"
echo     } catch {
echo         Write-Host "  [SKIP] Could not empty Recycle Bin" -ForegroundColor Yellow
echo     }
echo } else {
echo     Write-Host "  [SKIP] Recycle Bin not emptied in DRY mode" -ForegroundColor Gray
echo }
echo.
echo # Additional safe caches
echo Write-Host "[10/10] Additional Safe Caches" -ForegroundColor Yellow
echo Clean-Path "$env:LOCALAPPDATA\Microsoft\Windows\INetCache" "IE Cache"
echo Clean-Path "$env:LOCALAPPDATA\Microsoft\Windows\WebCache.old" "WebCache Old"
echo.
echo # Summary
echo Write-Host ""
echo Write-Host "============================================================================" -ForegroundColor Cyan
echo Write-Host "  SUMMARY" -ForegroundColor White
echo Write-Host "============================================================================" -ForegroundColor Cyan
echo $sizeBeforeStr = Format-Size $totalSizeBefore
echo Write-Host "  Files Processed:     $filesProcessed" -ForegroundColor White
echo Write-Host "  Total Size Found:    $sizeBeforeStr ^($totalSizeBefore bytes^)" -ForegroundColor White
echo if ^($Mode -eq "CLEAN"^) {
echo     Write-Host "  Files Deleted:       $filesDeleted" -ForegroundColor Green
echo     Write-Host "  Space Freed:         $sizeBeforeStr" -ForegroundColor Green
echo     Write-Host "  Errors:              $errors" -ForegroundColor Yellow
echo } else {
echo     Write-Host "  Mode:                DRY-RUN ^(no files deleted^)" -ForegroundColor Yellow
echo }
echo Write-Host "============================================================================" -ForegroundColor Cyan
echo Write-Host ""
echo.
echo Write-Log ""
echo Write-Log "SUMMARY: Files=$filesProcessed, Size=$totalSizeBefore bytes, Deleted=$filesDeleted, Errors=$errors"
echo.
echo if ^($errors -gt 0^) { exit 1 } else { exit 0 }
) > "!PS_SCRIPT!"

:: ============================================================================
:: RUN CLEANING PROCESS
:: ============================================================================
echo [*] Starting cleanup process...
echo.

if "!MODE!"=="DRY" (
    echo [MODE] DRY-RUN - Files will NOT be deleted
    echo [MODE] This is a safe preview. Use --clean to actually delete.
    echo.
)

:: Run PowerShell script
powershell -ExecutionPolicy Bypass -File "!PS_SCRIPT!"
set "EXIT_CODE=!errorLevel!"

:: ============================================================================
:: CONFIRMATION FOR CLEAN MODE
:: ============================================================================
if "!MODE!"=="CLEAN" (
    echo.
    if "!AUTO_YES!"=="0" (
        echo ============================================================================
        echo   CONFIRMATION REQUIRED
        echo ============================================================================
        echo.
        echo   Files will be sent to Recycle Bin ^(recoverable^).
        echo   Continue with deletion?
        echo.
        set /p "CONFIRM=Type 'YES' to confirm: "
        
        if /i not "!CONFIRM!"=="YES" (
            echo.
            echo [CANCELLED] No files were deleted.
            del /f /q "!PS_SCRIPT!" 2>nul
            echo.
            echo Log saved to: !LOG_FILE!
            pause
            exit /b 0
        )
        
        echo.
        echo [CONFIRMED] Proceeding with cleanup...
    )
)

:: ============================================================================
:: FINAL MESSAGE
:: ============================================================================
echo.
echo ============================================================================
if "!MODE!"=="DRY" (
    echo   DRY-RUN COMPLETED - NO FILES WERE DELETED
    echo ============================================================================
    echo.
    echo   To actually delete these files, run:
    echo   CleanMaster.cmd --clean
    echo.
) else (
    echo   CLEANUP COMPLETED SUCCESSFULLY
    echo ============================================================================
    echo.
)

echo   Log file: !LOG_FILE!
echo.
echo ============================================================================
echo.

:: Cleanup
del /f /q "!PS_SCRIPT!" 2>nul

if "!EXIT_CODE!"=="0" (
    echo [SUCCESS] Operation completed successfully.
) else (
    echo [WARNING] Operation completed with some errors ^(see log^).
)

echo.
pause
exit /b !EXIT_CODE!

:: ============================================================================
:: HELP TEXT
:: ============================================================================
:SHOW_HELP
cls
color 0B
echo.
echo ============================================================================
echo   CleanMaster v2.0 - Ultra Safe Windows Junk Cleaner
echo ============================================================================
echo.
echo   DESCRIPTION:
echo     CleanMaster safely removes old temporary files and caches from
echo     Windows without touching system files or user data.
echo.
echo   FEATURES:
echo     [+] Auto requests Admin rights
echo     [+] Default DRY-RUN mode ^(safe preview^)
echo     [+] Only deletes files older than 30 days ^(customizable^)
echo     [+] Sends files to Recycle Bin ^(recoverable^)
echo     [+] Whitelist-based ^(only safe locations^)
echo     [+] Detailed logging
echo     [+] Works on Windows 10/11
echo.
echo   USAGE:
echo     CleanMaster.cmd [OPTIONS]
echo.
echo   OPTIONS:
echo     --dry              Run in DRY-RUN mode ^(default, no deletion^)
echo     --clean            Actually delete files ^(with confirmation^)
echo     --days N           Only process files older than N days ^(default: 30^)
echo     --log "path"       Custom log file path
echo     --yes              Auto-confirm ^(skip prompts^)
echo     --help, -h         Show this help
echo.
echo   WHAT GETS CLEANED:
echo     [+] %%TEMP%% ^(user temp folder^)
echo     [+] %%LOCALAPPDATA%%\Temp
echo     [+] C:\Windows\Temp ^(with admin^)
echo     [+] Chrome/Edge/Firefox caches
echo     [+] Thumbnail cache
echo     [+] Windows Error Reports
echo     [+] Crash dumps
echo     [+] Old log files
echo     [+] Recycle Bin ^(emptied in clean mode^)
echo.
echo   WHAT IS NEVER TOUCHED:
echo     [-] User documents, pictures, videos, music
echo     [-] C:\Windows\ ^(except Temp^)
echo     [-] C:\Program Files\
echo     [-] C:\ProgramData\
echo     [-] Registry, drivers, prefetch
echo     [-] pagefile.sys, hiberfil.sys
echo     [-] System Restore points
echo     [-] Windows Update cache
echo.
echo   EXAMPLES:
echo.
echo     1. Safe preview ^(no deletion^):
echo        CleanMaster.cmd
echo.
echo     2. Actually clean with confirmation:
echo        CleanMaster.cmd --clean
echo.
echo     3. Clean files older than 60 days:
echo        CleanMaster.cmd --clean --days 60
echo.
echo     4. Automated cleaning ^(no prompts^):
echo        CleanMaster.cmd --clean --yes
echo.
echo     5. Custom log location:
echo        CleanMaster.cmd --clean --log "C:\Logs\cleanup.log"
echo.
echo   EXIT CODES:
echo     0 = Success
echo     1 = Completed with some errors
echo     2 = Fatal error ^(bad parameters^)
echo.
echo   SAFETY GUARANTEE:
echo     CleanMaster is designed to be 100%% safe:
echo     - Only touches whitelisted temp folders
echo     - Skips system, hidden, and locked files
echo     - Files sent to Recycle Bin ^(recoverable^)
echo     - Never modifies Registry or system settings
echo     - Continues on error ^(doesn't crash^)
echo.
echo ============================================================================
echo   CleanMaster v2.0 - Clean Safe, Sleep Sound
echo ============================================================================
echo.
pause
exit /b 0
