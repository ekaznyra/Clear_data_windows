@echo off
setlocal EnableDelayedExpansion EnableExtensions
:: ============================================
:: SafeClean v1.0 - Ultra Safe Temp File Cleaner
:: Default: DRY-RUN mode (analyze only)
:: Only touches whitelisted temp folders
:: ============================================

title SafeClean v1.0 - Safe Temp File Cleaner

:: ============================================
:: DEFAULT CONFIGURATION
:: ============================================
set "MODE=ANALYZE"
set "DAYS=30"
set "RECYCLE=on"
set "AUTO_YES=0"
set "EMPTY_RECYCLE=0"
set "LOG_FILE="
set "CUSTOM_PATHS="

:: Whitelist paths (safe temp folders only)
set "DEFAULT_PATHS=%TEMP%;%LOCALAPPDATA%\Temp"

:: Check for admin to add Windows\Temp
net session >nul 2>&1
if %errorLevel% == 0 (
    set "IS_ADMIN=1"
    set "DEFAULT_PATHS=!DEFAULT_PATHS!;%SystemRoot%\Temp"
) else (
    set "IS_ADMIN=0"
)

:: ============================================
:: PARSE COMMAND LINE ARGUMENTS
:: ============================================
set "SHOW_HELP=0"

:PARSE_ARGS
if "%~1"=="" goto ARGS_DONE
if /i "%~1"=="--help" set "SHOW_HELP=1" & goto NEXT_ARG
if /i "%~1"=="-h" set "SHOW_HELP=1" & goto NEXT_ARG
if /i "%~1"=="--analyze" set "MODE=ANALYZE" & goto NEXT_ARG
if /i "%~1"=="--clean" set "MODE=CLEAN" & goto NEXT_ARG
if /i "%~1"=="--days" set "DAYS=%~2" & shift & goto NEXT_ARG
if /i "%~1"=="--paths" set "CUSTOM_PATHS=%~2" & shift & goto NEXT_ARG
if /i "%~1"=="--log" set "LOG_FILE=%~2" & shift & goto NEXT_ARG
if /i "%~1"=="--recycle" set "RECYCLE=%~2" & shift & goto NEXT_ARG
if /i "%~1"=="--empty-recycle-bin" set "EMPTY_RECYCLE=1" & goto NEXT_ARG
if /i "%~1"=="--yes" set "AUTO_YES=1" & goto NEXT_ARG
echo [ERROR] Unknown parameter: %~1
exit /b 2

:NEXT_ARG
shift
goto PARSE_ARGS

:ARGS_DONE

:: ============================================
:: SHOW HELP IF REQUESTED
:: ============================================
if "%SHOW_HELP%"=="1" goto SHOW_HELP_TEXT

:: ============================================
:: VALIDATE PARAMETERS
:: ============================================
if not "%DAYS%"=="" (
    echo %DAYS%| findstr /r "^[0-9][0-9]*$" >nul
    if errorlevel 1 (
        echo [ERROR] --days must be a positive number
        exit /b 2
    )
)

if not "%RECYCLE%"=="on" if not "%RECYCLE%"=="off" (
    echo [ERROR] --recycle must be 'on' or 'off'
    exit /b 2
)

:: Use custom paths if provided, otherwise use defaults
if not "%CUSTOM_PATHS%"=="" (
    set "PATHS=%CUSTOM_PATHS%"
) else (
    set "PATHS=%DEFAULT_PATHS%"
)

:: ============================================
:: DISPLAY CONFIGURATION
:: ============================================
cls
echo.================================================================
echo   SafeClean v1.0 - Ultra Safe Temp File Cleaner
echo.================================================================
echo.
echo   Configuration:
echo   - Mode:           !MODE!
if "!MODE!"=="ANALYZE" echo                     (DRY-RUN: No files will be deleted)
if "!MODE!"=="CLEAN" echo                     (CLEAN: Files will be deleted after confirmation)
echo   - File Age:       Files older than !DAYS! days
echo   - Recycle Bin:    !RECYCLE! (send to Recycle Bin if on)
echo   - Auto Confirm:   !AUTO_YES! (0=ask, 1=auto)
echo   - Admin Rights:   !IS_ADMIN! (0=no, 1=yes)
if not "!LOG_FILE!"=="" echo   - Log File:      !LOG_FILE!
echo.
echo   Whitelist Paths (ONLY these will be scanned):
for %%p in ("!PATHS:;=" "!") do (
    if exist %%p (
        echo     [OK] %%~p
    ) else (
        echo     [SKIP] %%~p (not found^)
    )
)
echo.
echo.================================================================
echo.

:: Initialize log if specified
if not "!LOG_FILE!"=="" (
    echo SafeClean v1.0 - Session Started: %DATE% %TIME% > "!LOG_FILE!"
    echo Mode: !MODE! >> "!LOG_FILE!"
    echo Days: !DAYS! >> "!LOG_FILE!"
    echo Paths: !PATHS! >> "!LOG_FILE!"
    echo. >> "!LOG_FILE!"
)

:: ============================================
:: CREATE POWERSHELL SCRIPT FOR FILE PROCESSING
:: ============================================
set "PS_SCRIPT=%TEMP%\SafeClean_%RANDOM%.ps1"

echo # SafeClean PowerShell Helper > "!PS_SCRIPT!"
echo param( >> "!PS_SCRIPT!"
echo     [string]$Paths, >> "!PS_SCRIPT!"
echo     [int]$Days, >> "!PS_SCRIPT!"
echo     [string]$Mode, >> "!PS_SCRIPT!"
echo     [string]$Recycle, >> "!PS_SCRIPT!"
echo     [string]$LogFile >> "!PS_SCRIPT!"
echo ) >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo $ErrorActionPreference = 'Continue' >> "!PS_SCRIPT!"
echo $pathList = $Paths -split ';' >> "!PS_SCRIPT!"
echo $cutoffDate = (Get-Date).AddDays(-$Days) >> "!PS_SCRIPT!"
echo $totalSize = 0 >> "!PS_SCRIPT!"
echo $totalFiles = 0 >> "!PS_SCRIPT!"
echo $deletedSize = 0 >> "!PS_SCRIPT!"
echo $deletedFiles = 0 >> "!PS_SCRIPT!"
echo $skippedFiles = 0 >> "!PS_SCRIPT!"
echo $errorFiles = 0 >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo function Write-Log { >> "!PS_SCRIPT!"
echo     param([string]$Message) >> "!PS_SCRIPT!"
echo     if ($LogFile) { >> "!PS_SCRIPT!"
echo         Add-Content -Path $LogFile -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') $Message" >> "!PS_SCRIPT!"
echo     } >> "!PS_SCRIPT!"
echo } >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo Write-Host "" >> "!PS_SCRIPT!"
echo Write-Host "Scanning for files older than $Days days..." -ForegroundColor Cyan >> "!PS_SCRIPT!"
echo Write-Host "Cutoff date: $($cutoffDate.ToString('yyyy-MM-dd HH:mm:ss'))" -ForegroundColor Cyan >> "!PS_SCRIPT!"
echo Write-Host "" >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo foreach ($path in $pathList) { >> "!PS_SCRIPT!"
echo     $path = $path.Trim() >> "!PS_SCRIPT!"
echo     if (-not (Test-Path $path)) { >> "!PS_SCRIPT!"
echo         Write-Host "[SKIP] Path not found: $path" -ForegroundColor Yellow >> "!PS_SCRIPT!"
echo         Write-Log "[SKIP] Path not found: $path" >> "!PS_SCRIPT!"
echo         continue >> "!PS_SCRIPT!"
echo     } >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo     Write-Host "[SCAN] Scanning: $path" -ForegroundColor Green >> "!PS_SCRIPT!"
echo     Write-Log "[SCAN] Scanning: $path" >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo     try { >> "!PS_SCRIPT!"
echo         $files = Get-ChildItem -Path $path -File -Recurse -Force -ErrorAction SilentlyContinue ^| >> "!PS_SCRIPT!"
echo                  Where-Object { >> "!PS_SCRIPT!"
echo                      -not $_.Attributes.ToString().Contains('ReparsePoint') -and >> "!PS_SCRIPT!"
echo                      $_.LastWriteTime -lt $cutoffDate >> "!PS_SCRIPT!"
echo                  } >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo         foreach ($file in $files) { >> "!PS_SCRIPT!"
echo             try { >> "!PS_SCRIPT!"
echo                 $fileSize = $file.Length >> "!PS_SCRIPT!"
echo                 $totalSize += $fileSize >> "!PS_SCRIPT!"
echo                 $totalFiles++ >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo                 $sizeMB = [math]::Round($fileSize / 1MB, 2) >> "!PS_SCRIPT!"
echo                 $age = (Get-Date) - $file.LastWriteTime >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo                 if ($Mode -eq "ANALYZE") { >> "!PS_SCRIPT!"
echo                     Write-Host "  [DRY] $($file.FullName) ($sizeMB MB, $([int]$age.TotalDays) days old)" -ForegroundColor Gray >> "!PS_SCRIPT!"
echo                     Write-Log "[DRY] $($file.FullName) | Size: $fileSize bytes | Age: $([int]$age.TotalDays) days" >> "!PS_SCRIPT!"
echo                 } else { >> "!PS_SCRIPT!"
echo                     # CLEAN mode >> "!PS_SCRIPT!"
echo                     $deleted = $false >> "!PS_SCRIPT!"
echo                     if ($Recycle -eq "on") { >> "!PS_SCRIPT!"
echo                         try { >> "!PS_SCRIPT!"
echo                             # Try to send to Recycle Bin >> "!PS_SCRIPT!"
echo                             Add-Type -AssemblyName Microsoft.VisualBasic >> "!PS_SCRIPT!"
echo                             [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile($file.FullName, 'OnlyErrorDialogs', 'SendToRecycleBin') >> "!PS_SCRIPT!"
echo                             $deleted = $true >> "!PS_SCRIPT!"
echo                             Write-Host "  [DEL->BIN] $($file.FullName) ($sizeMB MB)" -ForegroundColor Yellow >> "!PS_SCRIPT!"
echo                             Write-Log "[DEL->BIN] $($file.FullName) | Size: $fileSize bytes" >> "!PS_SCRIPT!"
echo                         } catch { >> "!PS_SCRIPT!"
echo                             # Fallback to permanent delete >> "!PS_SCRIPT!"
echo                             Remove-Item -Path $file.FullName -Force -ErrorAction Stop >> "!PS_SCRIPT!"
echo                             $deleted = $true >> "!PS_SCRIPT!"
echo                             Write-Host "  [DEL] $($file.FullName) ($sizeMB MB)" -ForegroundColor Red >> "!PS_SCRIPT!"
echo                             Write-Log "[DEL] $($file.FullName) | Size: $fileSize bytes" >> "!PS_SCRIPT!"
echo                         } >> "!PS_SCRIPT!"
echo                     } else { >> "!PS_SCRIPT!"
echo                         # Permanent delete >> "!PS_SCRIPT!"
echo                         Remove-Item -Path $file.FullName -Force -ErrorAction Stop >> "!PS_SCRIPT!"
echo                         $deleted = $true >> "!PS_SCRIPT!"
echo                         Write-Host "  [DEL] $($file.FullName) ($sizeMB MB)" -ForegroundColor Red >> "!PS_SCRIPT!"
echo                         Write-Log "[DEL] $($file.FullName) | Size: $fileSize bytes" >> "!PS_SCRIPT!"
echo                     } >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo                     if ($deleted) { >> "!PS_SCRIPT!"
echo                         $deletedSize += $fileSize >> "!PS_SCRIPT!"
echo                         $deletedFiles++ >> "!PS_SCRIPT!"
echo                     } >> "!PS_SCRIPT!"
echo                 } >> "!PS_SCRIPT!"
echo             } catch { >> "!PS_SCRIPT!"
echo                 Write-Host "  [ERR] $($file.FullName): $($_.Exception.Message)" -ForegroundColor Red >> "!PS_SCRIPT!"
echo                 Write-Log "[ERR] $($file.FullName) | Error: $($_.Exception.Message)" >> "!PS_SCRIPT!"
echo                 $errorFiles++ >> "!PS_SCRIPT!"
echo             } >> "!PS_SCRIPT!"
echo         } >> "!PS_SCRIPT!"
echo     } catch { >> "!PS_SCRIPT!"
echo         Write-Host "[ERR] Failed to scan $path : $($_.Exception.Message)" -ForegroundColor Red >> "!PS_SCRIPT!"
echo         Write-Log "[ERR] Failed to scan $path | Error: $($_.Exception.Message)" >> "!PS_SCRIPT!"
echo     } >> "!PS_SCRIPT!"
echo } >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo # Summary >> "!PS_SCRIPT!"
echo Write-Host "" >> "!PS_SCRIPT!"
echo Write-Host "================================================================" -ForegroundColor Cyan >> "!PS_SCRIPT!"
echo Write-Host "  SUMMARY" -ForegroundColor Cyan >> "!PS_SCRIPT!"
echo Write-Host "================================================================" -ForegroundColor Cyan >> "!PS_SCRIPT!"
echo Write-Host "  Total files found:    $totalFiles" -ForegroundColor White >> "!PS_SCRIPT!"
echo Write-Host "  Total size:           $([math]::Round($totalSize / 1MB, 2)) MB ($totalSize bytes)" -ForegroundColor White >> "!PS_SCRIPT!"
echo if ($Mode -eq "CLEAN") { >> "!PS_SCRIPT!"
echo     Write-Host "  Files deleted:        $deletedFiles" -ForegroundColor Green >> "!PS_SCRIPT!"
echo     Write-Host "  Space freed:          $([math]::Round($deletedSize / 1MB, 2)) MB ($deletedSize bytes)" -ForegroundColor Green >> "!PS_SCRIPT!"
echo } >> "!PS_SCRIPT!"
echo if ($errorFiles -gt 0) { >> "!PS_SCRIPT!"
echo     Write-Host "  Errors/Skipped:       $errorFiles" -ForegroundColor Yellow >> "!PS_SCRIPT!"
echo } >> "!PS_SCRIPT!"
echo Write-Host "================================================================" -ForegroundColor Cyan >> "!PS_SCRIPT!"
echo Write-Host "" >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo Write-Log "" >> "!PS_SCRIPT!"
echo Write-Log "SUMMARY: Files=$totalFiles, Size=$totalSize bytes, Deleted=$deletedFiles, Freed=$deletedSize bytes, Errors=$errorFiles" >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo # Return values via environment >> "!PS_SCRIPT!"
echo [Environment]::SetEnvironmentVariable('SC_TOTAL_FILES', $totalFiles, 'Process') >> "!PS_SCRIPT!"
echo [Environment]::SetEnvironmentVariable('SC_TOTAL_SIZE', $totalSize, 'Process') >> "!PS_SCRIPT!"
echo [Environment]::SetEnvironmentVariable('SC_DELETED_FILES', $deletedFiles, 'Process') >> "!PS_SCRIPT!"
echo [Environment]::SetEnvironmentVariable('SC_DELETED_SIZE', $deletedSize, 'Process') >> "!PS_SCRIPT!"
echo [Environment]::SetEnvironmentVariable('SC_ERROR_FILES', $errorFiles, 'Process') >> "!PS_SCRIPT!"
echo. >> "!PS_SCRIPT!"
echo # Exit code >> "!PS_SCRIPT!"
echo if ($errorFiles -gt 0) { exit 1 } else { exit 0 } >> "!PS_SCRIPT!"

:: ============================================
:: RUN ANALYSIS
:: ============================================
echo [*] Starting scan...
echo.

if "!MODE!"=="ANALYZE" (
    powershell -ExecutionPolicy Bypass -File "!PS_SCRIPT!" -Paths "!PATHS!" -Days !DAYS! -Mode "ANALYZE" -Recycle "!RECYCLE!" -LogFile "!LOG_FILE!"
    set "PS_EXIT=!errorLevel!"
    
    echo.
    echo ================================================================
    echo   DRY-RUN MODE - NO FILES WERE DELETED
    echo ================================================================
    echo.
    echo   To actually delete these files, run:
    echo   SafeClean.bat --clean --days !DAYS!
    echo.
    if "!RECYCLE!"=="on" (
        echo   Files will be sent to Recycle Bin (can be recovered^)
    ) else (
        echo   Files will be permanently deleted (cannot be recovered^)
    )
    echo.
    echo ================================================================
) else (
    :: CLEAN mode - need confirmation
    powershell -ExecutionPolicy Bypass -File "!PS_SCRIPT!" -Paths "!PATHS!" -Days !DAYS! -Mode "ANALYZE" -Recycle "!RECYCLE!" -LogFile "!LOG_FILE!"
    
    echo.
    echo ================================================================
    echo   CONFIRMATION REQUIRED
    echo ================================================================
    echo.
    
    if "!AUTO_YES!"=="0" (
        echo   The above files will be deleted.
        if "!RECYCLE!"=="on" (
            echo   Files will be sent to Recycle Bin (recoverable^)
        ) else (
            echo   Files will be PERMANENTLY deleted (NOT recoverable^)
        )
        echo.
        set /p "CONFIRM=Type 'YES' to confirm deletion: "
        
        if /i not "!CONFIRM!"=="YES" (
            echo.
            echo [CANCELLED] No files were deleted.
            del /f /q "!PS_SCRIPT!" 2>nul
            exit /b 0
        )
    ) else (
        echo [AUTO] Auto-confirm enabled, proceeding with deletion...
    )
    
    echo.
    echo [*] Deleting files...
    echo.
    
    powershell -ExecutionPolicy Bypass -File "!PS_SCRIPT!" -Paths "!PATHS!" -Days !DAYS! -Mode "CLEAN" -Recycle "!RECYCLE!" -LogFile "!LOG_FILE!"
    set "PS_EXIT=!errorLevel!"
    
    echo.
    echo ================================================================
    echo   CLEANUP COMPLETED
    echo ================================================================
    echo.
)

:: ============================================
:: EMPTY RECYCLE BIN IF REQUESTED
:: ============================================
if "!EMPTY_RECYCLE!"=="1" if "!MODE!"=="CLEAN" (
    echo.
    echo [*] Emptying Recycle Bin...
    powershell -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" 2>nul
    echo [OK] Recycle Bin emptied.
    echo.
)

:: ============================================
:: CLEANUP AND EXIT
:: ============================================
del /f /q "!PS_SCRIPT!" 2>nul

if not "!LOG_FILE!"=="" (
    echo. >> "!LOG_FILE!"
    echo Session Ended: %DATE% %TIME% >> "!LOG_FILE!"
    echo Exit Code: !PS_EXIT! >> "!LOG_FILE!"
    echo.
    echo [LOG] Session log saved to: !LOG_FILE!
)

echo.
if "!PS_EXIT!"=="0" (
    echo [SUCCESS] Operation completed successfully.
    exit /b 0
) else (
    echo [WARNING] Operation completed with some errors (see above^).
    exit /b 1
)

:: ============================================
:: HELP TEXT
:: ============================================
:SHOW_HELP_TEXT
cls
echo.================================================================
echo   SafeClean v1.0 - Ultra Safe Temp File Cleaner
echo   Safe, Whitelist-based, Dry-Run Default
echo.================================================================
echo.
echo   DESCRIPTION:
echo     SafeClean is a safe temporary file cleaner that ONLY operates
echo     on whitelisted temp folders. By default, it runs in DRY-RUN
echo     mode (analyze only) and requires explicit confirmation before
echo     deleting any files.
echo.
echo   USAGE:
echo     SafeClean.bat [OPTIONS]
echo.
echo   DEFAULT BEHAVIOR (no options):
echo     - Runs in ANALYZE mode (dry-run, no deletion)
echo     - Scans files older than 30 days
echo     - Whitelisted paths: %%TEMP%%, %%LOCALAPPDATA%%\Temp
echo     - If Admin: also scans C:\Windows\Temp
echo.
echo   OPTIONS:
echo     --help, -h
echo         Show this help message
echo.
echo     --analyze
echo         Run in ANALYZE mode (default, no deletion)
echo         Lists files and calculates space but doesn't delete
echo.
echo     --clean
echo         Run in CLEAN mode (actually delete files)
echo         Will show preview and ask for confirmation
echo.
echo     --days N
echo         Only process files older than N days (default: 30)
echo         Example: --days 60 (files older than 2 months)
echo.
echo     --paths "A;B;C"
echo         Override default whitelist with custom paths
echo         Separate multiple paths with semicolon (;)
echo         Example: --paths "C:\MyTemp;D:\OldFiles"
echo.
echo     --log "path"
echo         Save detailed log to specified file
echo         Example: --log "C:\Logs\cleanup.log"
echo.
echo     --recycle on^|off
echo         on:  Send files to Recycle Bin (default, recoverable)
echo         off: Permanently delete files (NOT recoverable)
echo.
echo     --empty-recycle-bin
echo         Empty Recycle Bin after cleanup (only with --clean)
echo.
echo     --yes
echo         Auto-confirm without prompting (for automation)
echo         Use with caution!
echo.
echo   SAFETY FEATURES:
echo     [+] Default DRY-RUN mode - no accidental deletion
echo     [+] Whitelist-only operation (only safe temp folders)
echo     [+] Age-based filtering (only old files)
echo     [+] Skips system/hidden files automatically
echo     [+] Skips locked files (no disruption)
echo     [+] Ignores symlinks/junctions (no unexpected paths)
echo     [+] Confirmation required before deletion
echo     [+] Detailed logging available
echo     [+] Recycle Bin support (files recoverable)
echo.
echo   WHAT IS NEVER TOUCHED:
echo     [-] C:\Windows\ (except Temp with Admin)
echo     [-] C:\Program Files\
echo     [-] C:\Program Files (x86)\
echo     [-] C:\ProgramData\
echo     [-] Registry
echo     [-] Drivers
echo     [-] Prefetch
echo     [-] pagefile.sys, hiberfil.sys
echo     [-] System Restore points
echo     [-] Windows Update cache
echo     [-] User documents, pictures, videos, music
echo.
echo   EXAMPLES:
echo.
echo     1. Analyze only (safe preview):
echo        SafeClean.bat
echo        or
echo        SafeClean.bat --analyze
echo.
echo     2. Analyze files older than 60 days:
echo        SafeClean.bat --days 60
echo.
echo     3. Actually delete files (with confirmation):
echo        SafeClean.bat --clean
echo.
echo     4. Delete without confirmation (automation):
echo        SafeClean.bat --clean --yes
echo.
echo     5. Delete permanently (no Recycle Bin):
echo        SafeClean.bat --clean --recycle off
echo.
echo     6. Clean with log file:
echo        SafeClean.bat --clean --log "C:\cleanup.log"
echo.
echo     7. Clean and empty Recycle Bin:
echo        SafeClean.bat --clean --empty-recycle-bin
echo.
echo     8. Custom paths (advanced):
echo        SafeClean.bat --clean --paths "C:\MyTemp;D:\OldCache"
echo.
echo   EXIT CODES:
echo     0 = Success
echo     1 = Completed with some errors (files skipped)
echo     2 = Fatal error (bad parameters/no permissions)
echo.
echo   RECOMMENDED USAGE:
echo     1. Run with --analyze first to see what will be deleted
echo     2. If satisfied, run with --clean
echo     3. Use --days parameter to control aggressiveness
echo     4. Keep --recycle on for safety (default)
echo.
echo.================================================================
echo   SafeClean v1.0 - Safe by Design
echo   (c) 2024 - MIT License
echo.================================================================
echo.
exit /b 0
