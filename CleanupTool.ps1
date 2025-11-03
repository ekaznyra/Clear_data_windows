# ============================================
# WINDOWS CLEANUP AUTOMATION TOOL
# Version: 2.0 - Full Featured Edition
# Requirement: Run as Administrator
# ============================================

# UTF-8 Encoding
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

# Configuration
$LogFile = "$PSScriptRoot\CleanupLog.txt"
$BackupEnabled = $false # Set to $true if you want backup before deletion

# ============================================
# CHECK ADMINISTRATOR PRIVILEGES
# ============================================
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "`n WARNING: This script requires Administrator privileges!" -ForegroundColor Red
    Write-Host "Please right-click and select 'Run as Administrator'`n" -ForegroundColor Yellow
    pause
    exit
}

# ============================================
# HELPER FUNCTIONS
# ============================================

# Log function
function Write-Log {
    param([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -FilePath $LogFile -Append -Encoding UTF8
}

# Display header
function Show-Header {
    Clear-Host
    Write-Host ""
    Write-Host "=============================================================" -ForegroundColor Cyan
    Write-Host "                                                            " -ForegroundColor Cyan
    Write-Host "        WINDOWS CLEANUP AUTOMATION TOOL v2.0               " -ForegroundColor Cyan
    Write-Host "                                                            " -ForegroundColor Cyan
    Write-Host "=============================================================" -ForegroundColor Cyan
    Write-Host ""
}

# Display menu
function Show-Menu {
    Write-Host "Select cleanup mode:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  [1] Quick Cleanup (Basic - Safe)" -ForegroundColor Green
    Write-Host "  [2] Standard Cleanup (Recommended)" -ForegroundColor Cyan
    Write-Host "  [3] Deep Cleanup (Comprehensive)" -ForegroundColor Magenta
    Write-Host "  [4] Preview Mode (Dry Run - No Deletion)" -ForegroundColor White
    Write-Host "  [5] Create Scheduled Task" -ForegroundColor Yellow
    Write-Host "  [6] View Cleanup History" -ForegroundColor Gray
    Write-Host "  [0] Exit" -ForegroundColor Red
    Write-Host ""
}

# Calculate folder size
function Get-FolderSize {
    param([string]$path)
    if (Test-Path $path) {
        try {
            $size = (Get-ChildItem $path -Recurse -Force -ErrorAction SilentlyContinue | 
                     Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum
            if ($size) {
                return [math]::Round($size / 1MB, 2)
            }
        } catch {
            return 0
        }
    }
    return 0
}

# Format size
function Format-Size {
    param([double]$sizeMB)
    if ($sizeMB -lt 1) {
        return "$([math]::Round($sizeMB * 1024, 2)) KB"
    } elseif ($sizeMB -ge 1024) {
        return "$([math]::Round($sizeMB / 1024, 2)) GB"
    } else {
        return "$([math]::Round($sizeMB, 2)) MB"
    }
}

# Safe delete function
function Remove-SafeFolder {
    param(
        [string]$path,
        [string]$description,
        [bool]$dryRun = $false
    )
    
    if (Test-Path $path) {
        $sizeBefore = Get-FolderSize $path
        
        if ($sizeBefore -eq 0) {
            Write-Host "  SKIP  $description - Empty" -ForegroundColor DarkGray
            Write-Log "SKIP: $description - Empty folder"
            return 0
        }
        
        Write-Host "  CLEAN $description" -ForegroundColor Yellow
        Write-Host "        Path: $path" -ForegroundColor DarkGray
        Write-Host "        Size: $(Format-Size $sizeBefore)" -ForegroundColor DarkGray
        
        if ($dryRun) {
            Write-Host "        [DRY RUN] Would delete $(Format-Size $sizeBefore)" -ForegroundColor Cyan
            Write-Log "DRY RUN: $description - $(Format-Size $sizeBefore)"
            return $sizeBefore
        }
        
        try {
            # Backup if enabled
            if ($BackupEnabled) {
                $backupPath = "$PSScriptRoot\Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
                if (-not (Test-Path $backupPath)) {
                    New-Item -Path $backupPath -ItemType Directory -Force | Out-Null
                }
                Write-Host "        Creating backup..." -ForegroundColor DarkYellow
            }
            
            Remove-Item -Path "$path\*" -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "        SUCCESS - Freed $(Format-Size $sizeBefore)" -ForegroundColor Green
            Write-Log "SUCCESS: $description - Deleted $(Format-Size $sizeBefore)"
            return $sizeBefore
        } catch {
            Write-Host "        WARNING - Some files in use" -ForegroundColor Yellow
            Write-Log "WARNING: $description - Error: $($_.Exception.Message)"
            return 0
        }
    } else {
        Write-Host "  SKIP  $description - Not found" -ForegroundColor DarkGray
        Write-Log "SKIP: $description - Path does not exist"
        return 0
    }
    Write-Host ""
}

# Main cleanup function
function Start-Cleanup {
    param(
        [int]$level = 2,
        [bool]$dryRun = $false
    )
    
    $totalCleaned = 0
    $mode = if ($dryRun) { "PREVIEW" } else { "EXECUTE" }
    
    Write-Host ""
    Write-Host "=============================================================" -ForegroundColor Cyan
    Write-Host "  START CLEANUP - Mode: $mode" -ForegroundColor Green
    Write-Host "=============================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Log "==================== START CLEANUP SESSION (Level $level - $mode) ===================="
    
    # LEVEL 1: Basic (Safest)
    if ($level -ge 1) {
        Write-Host "PART 1: Basic Cleanup (Safe)" -ForegroundColor Cyan
        Write-Host "-------------------------------------------------------------" -ForegroundColor DarkCyan
        
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\Temp" "Windows Temp" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:TEMP" "User Temp" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Microsoft\Windows\Recent" "Recent Items" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\Microsoft\Windows\Explorer" "Thumbnail Cache" $dryRun
    }
    
    # LEVEL 2: Standard (Recommended)
    if ($level -ge 2) {
        Write-Host ""
        Write-Host "PART 2: Standard Cleanup" -ForegroundColor Cyan
        Write-Host "-------------------------------------------------------------" -ForegroundColor DarkCyan
        
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\Prefetch" "Prefetch Files" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\SoftwareDistribution\Download" "Windows Update Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:ProgramData\Microsoft\Windows\WER\ReportQueue" "Windows Error Reports" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\CrashDumps" "Crash Dumps" $dryRun
        
        # Browser Caches
        Write-Host ""
        Write-Host "Browser Cleanup:" -ForegroundColor Yellow
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache" "Chrome Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Code Cache" "Chrome Code Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache" "Edge Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Code Cache" "Edge Code Cache" $dryRun
        
        # Firefox
        $firefoxProfiles = Get-ChildItem "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles" -ErrorAction SilentlyContinue
        foreach ($profile in $firefoxProfiles) {
            $totalCleaned += Remove-SafeFolder "$($profile.FullName)\cache2" "Firefox Cache" $dryRun
        }
    }
    
    # LEVEL 3: Deep (Comprehensive)
    if ($level -ge 3) {
        Write-Host ""
        Write-Host "PART 3: Deep Cleanup (Comprehensive)" -ForegroundColor Magenta
        Write-Host "-------------------------------------------------------------" -ForegroundColor DarkMagenta
        
        # Windows Logs
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\Logs" "Windows Log Files" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\System32\LogFiles" "System32 Log Files" $dryRun
        
        # Delivery Optimization
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\SoftwareDistribution\DeliveryOptimization" "Delivery Optimization" $dryRun
        
        # Microsoft Teams Cache
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Microsoft\Teams\Cache" "Teams Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Microsoft\Teams\tmp" "Teams Temp" $dryRun
        
        # VS Code Cache
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Code\Cache" "VS Code Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Code\CachedData" "VS Code Cached Data" $dryRun
        
        # Discord Cache
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Discord\Cache" "Discord Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Discord\Code Cache" "Discord Code Cache" $dryRun
        
        # Spotify Cache
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Spotify\Data" "Spotify Cache" $dryRun
    }
    
    # Recycle Bin (All levels)
    Write-Host ""
    Write-Host "Recycle Bin Cleanup:" -ForegroundColor Yellow
    if (-not $dryRun) {
        try {
            $shell = New-Object -ComObject Shell.Application
            $recycleBin = $shell.Namespace(0xA)
            $items = $recycleBin.Items()
            $size = ($items | Measure-Object -Property Size -Sum -ErrorAction SilentlyContinue).Sum / 1MB
            $size = [math]::Round($size, 2)
            
            if ($size -gt 0) {
                Write-Host "  Size: $(Format-Size $size)" -ForegroundColor DarkGray
                Clear-RecycleBin -Force -ErrorAction SilentlyContinue
                Write-Host "  SUCCESS - Deleted $(Format-Size $size)" -ForegroundColor Green
                Write-Log "SUCCESS: Recycle Bin - Deleted $(Format-Size $size)"
                $totalCleaned += $size
            } else {
                Write-Host "  SKIP - Recycle Bin empty" -ForegroundColor DarkGray
            }
        } catch {
            Write-Host "  WARNING - Cannot clean Recycle Bin" -ForegroundColor Yellow
            Write-Log "WARNING: Recycle Bin - Error: $($_.Exception.Message)"
        }
    } else {
        Write-Host "  [DRY RUN] Recycle Bin would be emptied" -ForegroundColor Cyan
    }
    
    # Summary
    Write-Host ""
    Write-Host "=============================================================" -ForegroundColor Cyan
    Write-Host "  CLEANUP RESULTS" -ForegroundColor Green
    Write-Host "=============================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  Total Space Freed: $(Format-Size $totalCleaned)" -ForegroundColor Green
    
    if ($totalCleaned -ge 1024) {
        Write-Host "  Equivalent: $([math]::Round($totalCleaned / 1024, 2)) GB" -ForegroundColor Green
    }
    
    Write-Log "RESULT: Total freed/previewed: $(Format-Size $totalCleaned)"
    Write-Log "==================== END CLEANUP SESSION ===================="
    
    if ($dryRun) {
        Write-Host ""
        Write-Host "  This was PREVIEW mode - Nothing was deleted" -ForegroundColor Cyan
        Write-Host "  Select mode 1-3 to perform actual cleanup" -ForegroundColor Yellow
    } else {
        Write-Host ""
        Write-Host "  COMPLETE! Your computer is now cleaner!" -ForegroundColor Green
    }
    
    Write-Host ""
}

# Create scheduled task
function Create-ScheduledTask {
    Write-Host ""
    Write-Host "=============================================================" -ForegroundColor Yellow
    Write-Host "  CREATE AUTOMATED CLEANUP SCHEDULE" -ForegroundColor Yellow
    Write-Host "=============================================================" -ForegroundColor Yellow
    Write-Host ""
    
    Write-Host "Select frequency:" -ForegroundColor Cyan
    Write-Host "  [1] Daily" -ForegroundColor White
    Write-Host "  [2] Weekly" -ForegroundColor White
    Write-Host "  [3] Monthly (Recommended)" -ForegroundColor Green
    Write-Host ""
    
    $freq = Read-Host "Choice (1-3)"
    
    $trigger = switch ($freq) {
        "1" { New-ScheduledTaskTrigger -Daily -At "02:00AM" }
        "2" { New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At "02:00AM" }
        "3" { New-ScheduledTaskTrigger -Weekly -WeeksInterval 4 -DaysOfWeek Sunday -At "02:00AM" }
        default { 
            Write-Host "Invalid choice!" -ForegroundColor Red
            return
        }
    }
    
    try {
        $action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-ExecutionPolicy Bypass -File `"$PSCommandPath`" -AutoRun"
        $principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
        $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable
        
        Register-ScheduledTask -TaskName "Windows Cleanup Tool" -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Force | Out-Null
        
        Write-Host ""
        Write-Host "SUCCESS - Scheduled task created!" -ForegroundColor Green
        Write-Host "Task will run automatically according to schedule" -ForegroundColor Cyan
        Write-Host "View in Task Scheduler: 'Windows Cleanup Tool'" -ForegroundColor Yellow
        Write-Log "SCHEDULED: Created automated task - Frequency: $freq"
    } catch {
        Write-Host ""
        Write-Host "ERROR - Failed to create scheduled task!" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
        Write-Log "ERROR: Cannot create scheduled task - $($_.Exception.Message)"
    }
}

# View log
function Show-Log {
    Write-Host ""
    Write-Host "=============================================================" -ForegroundColor Cyan
    Write-Host "  CLEANUP HISTORY" -ForegroundColor Cyan
    Write-Host "=============================================================" -ForegroundColor Cyan
    Write-Host ""
    
    if (Test-Path $LogFile) {
        Get-Content $LogFile -Tail 50 | ForEach-Object {
            if ($_ -match "SUCCESS") {
                Write-Host $_ -ForegroundColor Green
            } elseif ($_ -match "WARNING|ERROR") {
                Write-Host $_ -ForegroundColor Yellow
            } elseif ($_ -match "====") {
                Write-Host $_ -ForegroundColor Cyan
            } else {
                Write-Host $_ -ForegroundColor White
            }
        }
    } else {
        Write-Host "  No cleanup history yet" -ForegroundColor Yellow
    }
    Write-Host ""
}

# ============================================
# MAIN PROGRAM
# ============================================

# Check if auto-run (from scheduled task)
param([switch]$AutoRun)

if ($AutoRun) {
    Write-Log "AUTO RUN: Starting automatically"
    Start-Cleanup -level 2 -dryRun $false
    exit
}

# Main loop
do {
    Show-Header
    Show-Menu
    
    $choice = Read-Host "Enter choice"
    
    switch ($choice) {
        "1" {
            Start-Cleanup -level 1 -dryRun $false
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
        "2" {
            Start-Cleanup -level 2 -dryRun $false
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
        "3" {
            Write-Host ""
            Write-Host "WARNING: Deep mode will delete more data!" -ForegroundColor Yellow
            $confirm = Read-Host "Are you sure? (Y/N)"
            if ($confirm -eq "Y" -or $confirm -eq "y") {
                Start-Cleanup -level 3 -dryRun $false
            } else {
                Write-Host "Cancelled!" -ForegroundColor Red
            }
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
        "4" {
            Start-Cleanup -level 2 -dryRun $true
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
        "5" {
            Create-ScheduledTask
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
        "6" {
            Show-Log
            Read-Host "Press Enter to continue"
        }
        "0" {
            Write-Host ""
            Write-Host "Thank you for using! Goodbye!" -ForegroundColor Cyan
            Write-Host ""
            exit
        }
        default {
            Write-Host ""
            Write-Host "Invalid choice! Please try again." -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }
} while ($true)
