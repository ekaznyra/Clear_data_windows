# ============================================
# WINDOWS TOOLKIT - All-in-One System Tool
# Version: 3.0 - Professional Edition
# Features: Cleanup | Activation | Uninstaller
# Author: Professional Tools
# ============================================

# UTF-8 Encoding
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

# Configuration
$LogFile = "$PSScriptRoot\ToolkitLog.txt"
$BackupEnabled = $false

# ============================================
# CHECK ADMINISTRATOR PRIVILEGES
# ============================================
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "`n ERROR: Administrator privileges required!" -ForegroundColor Red
    Write-Host " Please right-click and select 'Run as Administrator'`n" -ForegroundColor Yellow
    Write-Host " Press any key to exit..." -ForegroundColor Gray
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
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

# Clear screen and show main header
function Show-MainHeader {
    Clear-Host
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "                                                                   " -ForegroundColor Cyan
    Write-Host "              ??     ?? ?? ???    ?? ??????   ??????  ??     ??   " -ForegroundColor Cyan
    Write-Host "              ??     ?? ?? ????   ?? ??   ?? ??    ?? ??     ??   " -ForegroundColor Cyan
    Write-Host "              ??  ?  ?? ?? ?? ??  ?? ??   ?? ??    ?? ??  ?  ??   " -ForegroundColor Cyan
    Write-Host "              ?? ??? ?? ?? ??  ?? ?? ??   ?? ??    ?? ?? ??? ??   " -ForegroundColor Cyan
    Write-Host "               ??? ???  ?? ??   ???? ??????   ??????   ??? ???    " -ForegroundColor Cyan
    Write-Host "                                                                   " -ForegroundColor Cyan
    Write-Host "                     PROFESSIONAL SYSTEM TOOLKIT v3.0             " -ForegroundColor Yellow
    Write-Host "                                                                   " -ForegroundColor Cyan
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
}

# Main menu
function Show-MainMenu {
    Write-Host "  SELECT TOOL:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  ???????????????????????????????????????????????????????????????" -ForegroundColor DarkCyan
    Write-Host "  ?                                                             ?" -ForegroundColor DarkCyan
    Write-Host "  ?  [1] ?? CLEANUP TOOL       - Remove junk & optimize        ?" -ForegroundColor Green
    Write-Host "  ?                                                             ?" -ForegroundColor DarkCyan
    Write-Host "  ?  [2] ?? WINDOWS ACTIVATION - Activate Windows & Office     ?" -ForegroundColor Cyan
    Write-Host "  ?                                                             ?" -ForegroundColor DarkCyan
    Write-Host "  ?  [3] ?? SOFTWARE MANAGER   - Uninstall applications        ?" -ForegroundColor Magenta
    Write-Host "  ?                                                             ?" -ForegroundColor DarkCyan
    Write-Host "  ?  [4] ?? VIEW LOGS          - Check operation history       ?" -ForegroundColor White
    Write-Host "  ?                                                             ?" -ForegroundColor DarkCyan
    Write-Host "  ?  [5] ??  ABOUT & INFO       - System information            ?" -ForegroundColor Gray
    Write-Host "  ?                                                             ?" -ForegroundColor DarkCyan
    Write-Host "  ?  [0] ? EXIT                - Close toolkit                 ?" -ForegroundColor Red
    Write-Host "  ?                                                             ?" -ForegroundColor DarkCyan
    Write-Host "  ???????????????????????????????????????????????????????????????" -ForegroundColor DarkCyan
    Write-Host ""
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

# ============================================
# MODULE 1: CLEANUP TOOL
# ============================================

function Show-CleanupMenu {
    Clear-Host
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ?? CLEANUP TOOL - JUNK FILE REMOVER" -ForegroundColor Cyan
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  SELECT CLEANUP MODE:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  [1] ?? Quick Cleanup       - Basic & safe (200-500 MB)" -ForegroundColor Green
    Write-Host "  [2] ?? Standard Cleanup    - Recommended (500MB-3GB)" -ForegroundColor Cyan
    Write-Host "  [3] ?? Deep Cleanup        - Comprehensive (2-10GB+)" -ForegroundColor Magenta
    Write-Host "  [4] ???  Preview Mode        - See before delete" -ForegroundColor White
    Write-Host "  [5] ?? Schedule Cleanup    - Automated task" -ForegroundColor Yellow
    Write-Host "  [0] ??  Back to Main Menu" -ForegroundColor Red
    Write-Host ""
}

function Remove-SafeFolder {
    param(
        [string]$path,
        [string]$description,
        [bool]$dryRun = $false
    )
    
    if (Test-Path $path) {
        $sizeBefore = Get-FolderSize $path
        
        if ($sizeBefore -eq 0) {
            Write-Host "  ??  SKIP: $description - Empty" -ForegroundColor DarkGray
            Write-Log "SKIP: $description - Empty folder"
            return 0
        }
        
        Write-Host "  ???  CLEANING: $description" -ForegroundColor Yellow
        Write-Host "      ?? Path: $path" -ForegroundColor DarkGray
        Write-Host "      ?? Size: $(Format-Size $sizeBefore)" -ForegroundColor DarkGray
        
        if ($dryRun) {
            Write-Host "      ???  [PREVIEW] Would delete $(Format-Size $sizeBefore)" -ForegroundColor Cyan
            Write-Log "PREVIEW: $description - $(Format-Size $sizeBefore)"
            return $sizeBefore
        }
        
        try {
            Remove-Item -Path "$path\*" -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "      ? SUCCESS - Freed $(Format-Size $sizeBefore)" -ForegroundColor Green
            Write-Log "SUCCESS: $description - Deleted $(Format-Size $sizeBefore)"
            return $sizeBefore
        } catch {
            Write-Host "      ??  WARNING - Some files in use" -ForegroundColor Yellow
            Write-Log "WARNING: $description - Error: $($_.Exception.Message)"
            return 0
        }
    } else {
        Write-Host "  ??  SKIP: $description - Not found" -ForegroundColor DarkGray
        Write-Log "SKIP: $description - Path does not exist"
        return 0
    }
    Write-Host ""
}

function Start-Cleanup {
    param(
        [int]$level = 2,
        [bool]$dryRun = $false
    )
    
    $totalCleaned = 0
    $mode = if ($dryRun) { "PREVIEW" } else { "EXECUTE" }
    
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ?? STARTING CLEANUP - Mode: $mode - Level: $level" -ForegroundColor Green
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    Write-Log "==================== CLEANUP START (Level $level - $mode) ===================="
    
    # LEVEL 1: Basic
    if ($level -ge 1) {
        Write-Host "?? PART 1: Basic Cleanup (Safe)" -ForegroundColor Cyan
        Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor DarkCyan
        
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\Temp" "Windows Temp" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:TEMP" "User Temp" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Microsoft\Windows\Recent" "Recent Items" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\Microsoft\Windows\Explorer" "Thumbnail Cache" $dryRun
    }
    
    # LEVEL 2: Standard
    if ($level -ge 2) {
        Write-Host ""
        Write-Host "?? PART 2: Standard Cleanup" -ForegroundColor Cyan
        Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor DarkCyan
        
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\Prefetch" "Prefetch Files" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\SoftwareDistribution\Download" "Windows Update Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:ProgramData\Microsoft\Windows\WER\ReportQueue" "Error Reports" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\CrashDumps" "Crash Dumps" $dryRun
        
        # Browsers
        Write-Host ""
        Write-Host "?? Browser Cleanup:" -ForegroundColor Yellow
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache" "Chrome Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Code Cache" "Chrome Code Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache" "Edge Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Code Cache" "Edge Code Cache" $dryRun
        
        $firefoxProfiles = Get-ChildItem "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles" -ErrorAction SilentlyContinue
        foreach ($profile in $firefoxProfiles) {
            $totalCleaned += Remove-SafeFolder "$($profile.FullName)\cache2" "Firefox Cache" $dryRun
        }
    }
    
    # LEVEL 3: Deep
    if ($level -ge 3) {
        Write-Host ""
        Write-Host "?? PART 3: Deep Cleanup (Comprehensive)" -ForegroundColor Magenta
        Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor DarkMagenta
        
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\Logs" "Windows Logs" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\System32\LogFiles" "System32 Logs" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\SoftwareDistribution\DeliveryOptimization" "Delivery Optimization" $dryRun
        
        # Apps
        Write-Host ""
        Write-Host "?? Application Cache:" -ForegroundColor Yellow
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Microsoft\Teams\Cache" "Teams Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Microsoft\Teams\tmp" "Teams Temp" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Code\Cache" "VS Code Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Code\CachedData" "VS Code Data" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Discord\Cache" "Discord Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Discord\Code Cache" "Discord Code Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Spotify\Data" "Spotify Cache" $dryRun
    }
    
    # Recycle Bin
    Write-Host ""
    Write-Host "???  Recycle Bin:" -ForegroundColor Yellow
    if (-not $dryRun) {
        try {
            $shell = New-Object -ComObject Shell.Application
            $recycleBin = $shell.Namespace(0xA)
            $items = $recycleBin.Items()
            $size = ($items | Measure-Object -Property Size -Sum -ErrorAction SilentlyContinue).Sum / 1MB
            $size = [math]::Round($size, 2)
            
            if ($size -gt 0) {
                Write-Host "  ?? Size: $(Format-Size $size)" -ForegroundColor DarkGray
                Clear-RecycleBin -Force -ErrorAction SilentlyContinue
                Write-Host "  ? SUCCESS - Deleted $(Format-Size $size)" -ForegroundColor Green
                Write-Log "SUCCESS: Recycle Bin - $(Format-Size $size)"
                $totalCleaned += $size
            } else {
                Write-Host "  ??  SKIP - Empty" -ForegroundColor DarkGray
            }
        } catch {
            Write-Host "  ??  WARNING - Cannot empty" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  ???  [PREVIEW] Would be emptied" -ForegroundColor Cyan
    }
    
    # Summary
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Green
    Write-Host "  ? CLEANUP COMPLETE!" -ForegroundColor Green
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Green
    Write-Host ""
    Write-Host "  ?? Total Space Freed: $(Format-Size $totalCleaned)" -ForegroundColor Green
    if ($totalCleaned -ge 1024) {
        Write-Host "  ?? Equivalent: $([math]::Round($totalCleaned / 1024, 2)) GB" -ForegroundColor Green
    }
    Write-Log "RESULT: Total freed: $(Format-Size $totalCleaned)"
    Write-Log "==================== CLEANUP END ===================="
    
    if ($dryRun) {
        Write-Host ""
        Write-Host "  ???  This was PREVIEW mode - Nothing deleted" -ForegroundColor Cyan
    }
    Write-Host ""
}

function Create-CleanupSchedule {
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Yellow
    Write-Host "  ?? CREATE AUTOMATED CLEANUP SCHEDULE" -ForegroundColor Yellow
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Select frequency:" -ForegroundColor Cyan
    Write-Host "  [1] Daily (2:00 AM)" -ForegroundColor White
    Write-Host "  [2] Weekly (Sunday 2:00 AM)" -ForegroundColor White
    Write-Host "  [3] Monthly (Recommended)" -ForegroundColor Green
    Write-Host ""
    
    $freq = Read-Host "  Choice (1-3)"
    
    $trigger = switch ($freq) {
        "1" { New-ScheduledTaskTrigger -Daily -At "02:00AM" }
        "2" { New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At "02:00AM" }
        "3" { New-ScheduledTaskTrigger -Weekly -WeeksInterval 4 -DaysOfWeek Sunday -At "02:00AM" }
        default { 
            Write-Host "`n  ? Invalid choice!" -ForegroundColor Red
            return
        }
    }
    
    try {
        $action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-ExecutionPolicy Bypass -File `"$PSCommandPath`""
        $principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
        $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable
        
        Register-ScheduledTask -TaskName "Windows Toolkit - Auto Cleanup" -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Force | Out-Null
        
        Write-Host ""
        Write-Host "  ? SUCCESS - Scheduled task created!" -ForegroundColor Green
        Write-Host "  ?? Task will run automatically" -ForegroundColor Cyan
        Write-Log "SCHEDULED: Auto cleanup task created"
    } catch {
        Write-Host ""
        Write-Host "  ? ERROR - Failed to create task!" -ForegroundColor Red
        Write-Log "ERROR: Cannot create scheduled task"
    }
}

# ============================================
# MODULE 2: WINDOWS ACTIVATION
# ============================================

function Show-ActivationMenu {
    Clear-Host
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ?? WINDOWS ACTIVATION TOOL" -ForegroundColor Cyan
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    
    # Check current activation status
    Write-Host "  ?? CURRENT ACTIVATION STATUS:" -ForegroundColor Yellow
    Write-Host ""
    
    try {
        $licenseStatus = (Get-CimInstance -ClassName SoftwareLicensingProduct | Where-Object { $_.PartialProductKey -and $_.Name -like "Windows*" }).LicenseStatus
        $productName = (Get-CimInstance -ClassName Win32_OperatingSystem).Caption
        
        Write-Host "  OS: $productName" -ForegroundColor Cyan
        
        switch ($licenseStatus) {
            0 { Write-Host "  Status: ? Unlicensed" -ForegroundColor Red }
            1 { Write-Host "  Status: ? Licensed (Activated)" -ForegroundColor Green }
            2 { Write-Host "  Status: ??  OOB Grace" -ForegroundColor Yellow }
            3 { Write-Host "  Status: ??  OOT Grace" -ForegroundColor Yellow }
            4 { Write-Host "  Status: ??  Non-Genuine Grace" -ForegroundColor Yellow }
            5 { Write-Host "  Status: ??  Notification" -ForegroundColor Yellow }
            6 { Write-Host "  Status: ??  Extended Grace" -ForegroundColor Yellow }
            default { Write-Host "  Status: ? Unknown" -ForegroundColor Gray }
        }
    } catch {
        Write-Host "  ??  Cannot check activation status" -ForegroundColor Yellow
    }
    
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor DarkCyan
    Write-Host ""
    Write-Host "  SELECT ACTIVATION METHOD:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  [1] ?? Activate Windows (KMS Method)" -ForegroundColor Green
    Write-Host "  [2] ?? Enter Product Key Manually" -ForegroundColor Cyan
    Write-Host "  [3] ?? Check Activation Status" -ForegroundColor White
    Write-Host "  [4] ?? Rearm Windows (Reset Trial)" -ForegroundColor Magenta
    Write-Host "  [5] ??  View License Information" -ForegroundColor Gray
    Write-Host "  [0] ??  Back to Main Menu" -ForegroundColor Red
    Write-Host ""
    Write-Host "  ??  DISCLAIMER: Use only on your own devices" -ForegroundColor Yellow
    Write-Host ""
}

function Activate-Windows {
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ?? ACTIVATING WINDOWS..." -ForegroundColor Cyan
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    
    Write-Host "  ??  This will use KMS activation method" -ForegroundColor Yellow
    Write-Host "  ??  Valid for 180 days (auto-renews)" -ForegroundColor Yellow
    Write-Host ""
    $confirm = Read-Host "  Continue? (Y/N)"
    
    if ($confirm -ne "Y" -and $confirm -ne "y") {
        Write-Host "`n  ? Cancelled!" -ForegroundColor Red
        return
    }
    
    Write-Host ""
    Write-Host "  ?? Step 1: Setting KMS server..." -ForegroundColor Cyan
    
    try {
        # Set KMS server
        $result = slmgr /skms kms8.msguides.com
        Start-Sleep -Seconds 2
        Write-Host "  ? KMS server configured" -ForegroundColor Green
        
        Write-Host ""
        Write-Host "  ?? Step 2: Activating Windows..." -ForegroundColor Cyan
        
        # Activate
        $result = slmgr /ato
        Start-Sleep -Seconds 3
        
        Write-Host ""
        Write-Host "  ? Activation command executed!" -ForegroundColor Green
        Write-Host "  ?? Checking status..." -ForegroundColor Cyan
        Start-Sleep -Seconds 2
        
        # Check status
        $licenseStatus = (Get-CimInstance -ClassName SoftwareLicensingProduct | Where-Object { $_.PartialProductKey -and $_.Name -like "Windows*" }).LicenseStatus
        
        Write-Host ""
        if ($licenseStatus -eq 1) {
            Write-Host "  ? SUCCESS - Windows is now activated!" -ForegroundColor Green
            Write-Log "SUCCESS: Windows activated via KMS"
        } else {
            Write-Host "  ??  Activation may need time to complete" -ForegroundColor Yellow
            Write-Host "  ?? Try checking status again in a few minutes" -ForegroundColor Cyan
        }
        
    } catch {
        Write-Host ""
        Write-Host "  ? ERROR during activation!" -ForegroundColor Red
        Write-Host "  $($_.Exception.Message)" -ForegroundColor Red
        Write-Log "ERROR: Activation failed - $($_.Exception.Message)"
    }
    
    Write-Host ""
}

function Enter-ProductKey {
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ?? ENTER PRODUCT KEY" -ForegroundColor Cyan
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    
    $key = Read-Host "  Enter your 25-character product key (XXXXX-XXXXX-XXXXX-XXXXX-XXXXX)"
    
    if ($key.Length -ne 29) {
        Write-Host "`n  ? Invalid key format!" -ForegroundColor Red
        return
    }
    
    Write-Host ""
    Write-Host "  ?? Installing product key..." -ForegroundColor Cyan
    
    try {
        $result = slmgr /ipk $key
        Start-Sleep -Seconds 2
        Write-Host "  ? Product key installed" -ForegroundColor Green
        
        Write-Host ""
        Write-Host "  ?? Activating Windows..." -ForegroundColor Cyan
        $result = slmgr /ato
        Start-Sleep -Seconds 3
        
        Write-Host "  ? Activation command executed!" -ForegroundColor Green
        Write-Log "SUCCESS: Product key entered and activated"
    } catch {
        Write-Host ""
        Write-Host "  ? ERROR: $($_.Exception.Message)" -ForegroundColor Red
        Write-Log "ERROR: Product key activation failed"
    }
    
    Write-Host ""
}

function Check-ActivationStatus {
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ?? DETAILED ACTIVATION STATUS" -ForegroundColor Cyan
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    
    try {
        $license = Get-CimInstance -ClassName SoftwareLicensingProduct | Where-Object { $_.PartialProductKey -and $_.Name -like "Windows*" }
        $os = Get-CimInstance -ClassName Win32_OperatingSystem
        
        Write-Host "  Operating System:" -ForegroundColor Yellow
        Write-Host "  ?? $($os.Caption)" -ForegroundColor White
        Write-Host "  ?? Version: $($os.Version)" -ForegroundColor White
        Write-Host "  ?? Build: $($os.BuildNumber)" -ForegroundColor White
        Write-Host ""
        
        Write-Host "  License Information:" -ForegroundColor Yellow
        Write-Host "  ?? Product Name: $($license.Name)" -ForegroundColor White
        Write-Host "  ?? Description: $($license.Description)" -ForegroundColor White
        
        if ($license.PartialProductKey) {
            Write-Host "  ?? Partial Key: *****-*****-*****-*****-$($license.PartialProductKey)" -ForegroundColor White
        }
        
        Write-Host ""
        Write-Host "  Activation Status:" -ForegroundColor Yellow
        
        switch ($license.LicenseStatus) {
            0 { Write-Host "  ?? ? Unlicensed" -ForegroundColor Red }
            1 { Write-Host "  ?? ? Licensed (Fully Activated)" -ForegroundColor Green }
            2 { Write-Host "  ?? ??  OOB Grace Period" -ForegroundColor Yellow }
            3 { Write-Host "  ?? ??  OOT Grace Period" -ForegroundColor Yellow }
            4 { Write-Host "  ?? ??  Non-Genuine Grace Period" -ForegroundColor Yellow }
            5 { Write-Host "  ?? ??  Notification Period" -ForegroundColor Yellow }
            6 { Write-Host "  ?? ??  Extended Grace Period" -ForegroundColor Yellow }
            default { Write-Host "  ?? ? Unknown Status" -ForegroundColor Gray }
        }
        
        if ($license.GracePeriodRemaining) {
            $daysRemaining = [math]::Round($license.GracePeriodRemaining / 1440)
            Write-Host "  ?? Grace Period: $daysRemaining days remaining" -ForegroundColor Cyan
        }
        
    } catch {
        Write-Host "  ? Error retrieving license information" -ForegroundColor Red
    }
    
    Write-Host ""
}

function Rearm-Windows {
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Yellow
    Write-Host "  ?? REARM WINDOWS (RESET TRIAL PERIOD)" -ForegroundColor Yellow
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  ??  This will reset the Windows trial period" -ForegroundColor Yellow
    Write-Host "  ??  Limited number of rearms available" -ForegroundColor Yellow
    Write-Host "  ??  System will restart after rearm" -ForegroundColor Red
    Write-Host ""
    
    $confirm = Read-Host "  Continue? (Y/N)"
    
    if ($confirm -ne "Y" -and $confirm -ne "y") {
        Write-Host "`n  ? Cancelled!" -ForegroundColor Red
        return
    }
    
    Write-Host ""
    Write-Host "  ?? Rearming Windows..." -ForegroundColor Cyan
    
    try {
        slmgr /rearm
        Write-Host ""
        Write-Host "  ? Rearm successful!" -ForegroundColor Green
        Write-Host "  ?? Please restart your computer" -ForegroundColor Yellow
        Write-Log "SUCCESS: Windows rearmed"
    } catch {
        Write-Host ""
        Write-Host "  ? ERROR: $($_.Exception.Message)" -ForegroundColor Red
        Write-Log "ERROR: Rearm failed"
    }
    
    Write-Host ""
}

# ============================================
# MODULE 3: SOFTWARE UNINSTALLER
# ============================================

function Show-SoftwareManager {
    Clear-Host
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ?? SOFTWARE MANAGER - UNINSTALL APPLICATIONS" -ForegroundColor Cyan
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  ?? Loading installed software..." -ForegroundColor Yellow
    Write-Host ""
    
    # Get installed software
    $software = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
                Where-Object { $_.DisplayName } |
                Select-Object DisplayName, DisplayVersion, Publisher, UninstallString |
                Sort-Object DisplayName
    
    # Also get 32-bit software on 64-bit systems
    if ([Environment]::Is64BitOperatingSystem) {
        $software32 = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
                      Where-Object { $_.DisplayName } |
                      Select-Object DisplayName, DisplayVersion, Publisher, UninstallString |
                      Sort-Object DisplayName
        $software = $software + $software32
    }
    
    # Remove duplicates
    $software = $software | Sort-Object DisplayName -Unique
    
    Write-Host "  ?? Found $($software.Count) installed applications" -ForegroundColor Green
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor DarkCyan
    Write-Host ""
    Write-Host "  SELECT ACTION:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  [1] ?? List All Installed Software" -ForegroundColor Green
    Write-Host "  [2] ?? Search Software by Name" -ForegroundColor Cyan
    Write-Host "  [3] ???  Uninstall Software" -ForegroundColor Red
    Write-Host "  [4] ?? Export Software List to File" -ForegroundColor Magenta
    Write-Host "  [0] ??  Back to Main Menu" -ForegroundColor Red
    Write-Host ""
}

function List-InstalledSoftware {
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ?? INSTALLED SOFTWARE LIST" -ForegroundColor Cyan
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    
    $software = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
                Where-Object { $_.DisplayName } |
                Select-Object DisplayName, DisplayVersion, Publisher
    
    if ([Environment]::Is64BitOperatingSystem) {
        $software32 = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
                      Where-Object { $_.DisplayName } |
                      Select-Object DisplayName, DisplayVersion, Publisher
        $software = $software + $software32
    }
    
    $software = $software | Sort-Object DisplayName -Unique
    
    $counter = 1
    foreach ($app in $software) {
        Write-Host "  $counter. " -NoNewline -ForegroundColor Yellow
        Write-Host "$($app.DisplayName)" -ForegroundColor White
        if ($app.DisplayVersion) {
            Write-Host "     ?? Version: $($app.DisplayVersion)" -ForegroundColor DarkGray
        }
        if ($app.Publisher) {
            Write-Host "     ?? Publisher: $($app.Publisher)" -ForegroundColor DarkGray
        }
        Write-Host ""
        $counter++
        
        # Pause every 20 items
        if ($counter % 20 -eq 0) {
            Write-Host "  Press Enter to continue..." -ForegroundColor Yellow
            Read-Host
        }
    }
    
    Write-Host "  Total: $($software.Count) applications" -ForegroundColor Green
    Write-Host ""
}

function Search-Software {
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ?? SEARCH SOFTWARE" -ForegroundColor Cyan
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    
    $searchTerm = Read-Host "  Enter software name (partial match works)"
    
    if ([string]::IsNullOrWhiteSpace($searchTerm)) {
        Write-Host "`n  ? Invalid search term!" -ForegroundColor Red
        return
    }
    
    Write-Host ""
    Write-Host "  ?? Searching for '$searchTerm'..." -ForegroundColor Yellow
    Write-Host ""
    
    $software = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
                Where-Object { $_.DisplayName -like "*$searchTerm*" } |
                Select-Object DisplayName, DisplayVersion, Publisher, UninstallString
    
    if ([Environment]::Is64BitOperatingSystem) {
        $software32 = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
                      Where-Object { $_.DisplayName -like "*$searchTerm*" } |
                      Select-Object DisplayName, DisplayVersion, Publisher, UninstallString
        $software = $software + $software32
    }
    
    $software = $software | Sort-Object DisplayName -Unique
    
    if ($software.Count -eq 0) {
        Write-Host "  ? No software found matching '$searchTerm'" -ForegroundColor Red
    } else {
        Write-Host "  ? Found $($software.Count) matching application(s):" -ForegroundColor Green
        Write-Host ""
        
        $counter = 1
        foreach ($app in $software) {
            Write-Host "  $counter. " -NoNewline -ForegroundColor Yellow
            Write-Host "$($app.DisplayName)" -ForegroundColor White
            if ($app.DisplayVersion) {
                Write-Host "     ?? Version: $($app.DisplayVersion)" -ForegroundColor DarkGray
            }
            if ($app.Publisher) {
                Write-Host "     ?? Publisher: $($app.Publisher)" -ForegroundColor DarkGray
            }
            Write-Host ""
            $counter++
        }
    }
    
    Write-Host ""
}

function Uninstall-Software {
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Red
    Write-Host "  ???  UNINSTALL SOFTWARE" -ForegroundColor Red
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Red
    Write-Host ""
    
    $searchTerm = Read-Host "  Enter software name to uninstall"
    
    if ([string]::IsNullOrWhiteSpace($searchTerm)) {
        Write-Host "`n  ? Invalid input!" -ForegroundColor Red
        return
    }
    
    Write-Host ""
    Write-Host "  ?? Searching for '$searchTerm'..." -ForegroundColor Yellow
    Write-Host ""
    
    $software = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
                Where-Object { $_.DisplayName -like "*$searchTerm*" } |
                Select-Object DisplayName, DisplayVersion, Publisher, UninstallString
    
    if ([Environment]::Is64BitOperatingSystem) {
        $software32 = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
                      Where-Object { $_.DisplayName -like "*$searchTerm*" } |
                      Select-Object DisplayName, DisplayVersion, Publisher, UninstallString
        $software = $software + $software32
    }
    
    $software = $software | Sort-Object DisplayName -Unique
    
    if ($software.Count -eq 0) {
        Write-Host "  ? No software found!" -ForegroundColor Red
        return
    }
    
    if ($software.Count -gt 1) {
        Write-Host "  ??  Multiple applications found:" -ForegroundColor Yellow
        Write-Host ""
        
        $counter = 1
        foreach ($app in $software) {
            Write-Host "  $counter. $($app.DisplayName)" -ForegroundColor White
            $counter++
        }
        
        Write-Host ""
        $selection = Read-Host "  Select number to uninstall (1-$($software.Count))"
        
        try {
            $selectedApp = $software[$selection - 1]
        } catch {
            Write-Host "`n  ? Invalid selection!" -ForegroundColor Red
            return
        }
    } else {
        $selectedApp = $software[0]
    }
    
    Write-Host ""
    Write-Host "  ?? Selected: $($selectedApp.DisplayName)" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  ??  WARNING: This will uninstall the software!" -ForegroundColor Red
    $confirm = Read-Host "  Continue? (Y/N)"
    
    if ($confirm -ne "Y" -and $confirm -ne "y") {
        Write-Host "`n  ? Cancelled!" -ForegroundColor Red
        return
    }
    
    if ($selectedApp.UninstallString) {
        Write-Host ""
        Write-Host "  ?? Uninstalling..." -ForegroundColor Yellow
        
        try {
            $uninstallCmd = $selectedApp.UninstallString
            
            # Handle different uninstall string formats
            if ($uninstallCmd -like "MsiExec.exe*") {
                $uninstallCmd = $uninstallCmd -replace "/I", "/X"
                $uninstallCmd = "$uninstallCmd /quiet /norestart"
                Start-Process "cmd.exe" -ArgumentList "/c $uninstallCmd" -Wait -NoNewWindow
            } else {
                Start-Process $uninstallCmd -Wait
            }
            
            Write-Host ""
            Write-Host "  ? Uninstall command executed!" -ForegroundColor Green
            Write-Host "  ?? Check if software was removed successfully" -ForegroundColor Cyan
            Write-Log "UNINSTALL: $($selectedApp.DisplayName)"
        } catch {
            Write-Host ""
            Write-Host "  ? ERROR: $($_.Exception.Message)" -ForegroundColor Red
            Write-Log "ERROR: Uninstall failed - $($selectedApp.DisplayName)"
        }
    } else {
        Write-Host ""
        Write-Host "  ? No uninstall command available!" -ForegroundColor Red
    }
    
    Write-Host ""
}

function Export-SoftwareList {
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ?? EXPORT SOFTWARE LIST" -ForegroundColor Cyan
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    
    $exportPath = "$PSScriptRoot\InstalledSoftware_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
    
    Write-Host "  ?? Exporting software list..." -ForegroundColor Yellow
    
    try {
        $software = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
                    Where-Object { $_.DisplayName } |
                    Select-Object DisplayName, DisplayVersion, Publisher
        
        if ([Environment]::Is64BitOperatingSystem) {
            $software32 = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
                          Where-Object { $_.DisplayName } |
                          Select-Object DisplayName, DisplayVersion, Publisher
            $software = $software + $software32
        }
        
        $software = $software | Sort-Object DisplayName -Unique
        
        "=" * 70 | Out-File -FilePath $exportPath -Encoding UTF8
        "INSTALLED SOFTWARE LIST - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" | Out-File -FilePath $exportPath -Append -Encoding UTF8
        "=" * 70 | Out-File -FilePath $exportPath -Append -Encoding UTF8
        "" | Out-File -FilePath $exportPath -Append -Encoding UTF8
        
        foreach ($app in $software) {
            "Software: $($app.DisplayName)" | Out-File -FilePath $exportPath -Append -Encoding UTF8
            if ($app.DisplayVersion) {
                "Version: $($app.DisplayVersion)" | Out-File -FilePath $exportPath -Append -Encoding UTF8
            }
            if ($app.Publisher) {
                "Publisher: $($app.Publisher)" | Out-File -FilePath $exportPath -Append -Encoding UTF8
            }
            "" | Out-File -FilePath $exportPath -Append -Encoding UTF8
        }
        
        "=" * 70 | Out-File -FilePath $exportPath -Append -Encoding UTF8
        "Total: $($software.Count) applications" | Out-File -FilePath $exportPath -Append -Encoding UTF8
        
        Write-Host ""
        Write-Host "  ? SUCCESS - List exported!" -ForegroundColor Green
        Write-Host "  ?? File: $exportPath" -ForegroundColor Cyan
        Write-Host "  ?? Total: $($software.Count) applications" -ForegroundColor Cyan
        Write-Log "EXPORT: Software list exported"
    } catch {
        Write-Host ""
        Write-Host "  ? ERROR: $($_.Exception.Message)" -ForegroundColor Red
        Write-Log "ERROR: Export failed"
    }
    
    Write-Host ""
}

# ============================================
# MODULE 4: VIEW LOGS
# ============================================

function Show-Logs {
    Clear-Host
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ?? OPERATION LOGS" -ForegroundColor Cyan
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    
    if (Test-Path $LogFile) {
        $logs = Get-Content $LogFile -Tail 100
        
        Write-Host "  Last 100 log entries:" -ForegroundColor Yellow
        Write-Host ""
        
        foreach ($log in $logs) {
            if ($log -match "SUCCESS") {
                Write-Host "  $log" -ForegroundColor Green
            } elseif ($log -match "WARNING") {
                Write-Host "  $log" -ForegroundColor Yellow
            } elseif ($log -match "ERROR") {
                Write-Host "  $log" -ForegroundColor Red
            } elseif ($log -match "====") {
                Write-Host "  $log" -ForegroundColor Cyan
            } else {
                Write-Host "  $log" -ForegroundColor White
            }
        }
    } else {
        Write-Host "  ??  No logs found yet" -ForegroundColor Yellow
        Write-Host "  ?? Logs will be created after first operation" -ForegroundColor Cyan
    }
    
    Write-Host ""
    Write-Host "  ?? Log file: $LogFile" -ForegroundColor DarkGray
    Write-Host ""
}

# ============================================
# MODULE 5: ABOUT & SYSTEM INFO
# ============================================

function Show-About {
    Clear-Host
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ??  ABOUT & SYSTEM INFORMATION" -ForegroundColor Cyan
    Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    
    Write-Host "  ?? TOOLKIT INFORMATION:" -ForegroundColor Yellow
    Write-Host "  ?? Name: Windows Professional Toolkit" -ForegroundColor White
    Write-Host "  ?? Version: 3.0" -ForegroundColor White
    Write-Host "  ?? Features: 3 Main Tools" -ForegroundColor White
    Write-Host "  ?? Platform: PowerShell" -ForegroundColor White
    Write-Host ""
    
    Write-Host "  ?? SYSTEM INFORMATION:" -ForegroundColor Yellow
    try {
        $os = Get-CimInstance -ClassName Win32_OperatingSystem
        $cs = Get-CimInstance -ClassName Win32_ComputerSystem
        $bios = Get-CimInstance -ClassName Win32_BIOS
        
        Write-Host "  ?? Computer: $($cs.Name)" -ForegroundColor White
        Write-Host "  ?? OS: $($os.Caption)" -ForegroundColor White
        Write-Host "  ?? Version: $($os.Version)" -ForegroundColor White
        Write-Host "  ?? Build: $($os.BuildNumber)" -ForegroundColor White
        Write-Host "  ?? Architecture: $($os.OSArchitecture)" -ForegroundColor White
        Write-Host "  ?? Manufacturer: $($cs.Manufacturer)" -ForegroundColor White
        Write-Host "  ?? Model: $($cs.Model)" -ForegroundColor White
        
        $totalRAM = [math]::Round($cs.TotalPhysicalMemory / 1GB, 2)
        Write-Host "  ?? Total RAM: $totalRAM GB" -ForegroundColor White
        
        $freeSpace = [math]::Round((Get-PSDrive C).Free / 1GB, 2)
        $totalSpace = [math]::Round(((Get-PSDrive C).Free + (Get-PSDrive C).Used) / 1GB, 2)
        Write-Host "  ?? C: Drive: $freeSpace GB free of $totalSpace GB" -ForegroundColor White
        
    } catch {
        Write-Host "  ?? ??  Could not retrieve system information" -ForegroundColor Yellow
    }
    
    Write-Host ""
    Write-Host "  ?? FEATURES:" -ForegroundColor Yellow
    Write-Host "  ?? 1. Cleanup Tool (3 modes + Preview)" -ForegroundColor White
    Write-Host "  ?? 2. Windows Activation (KMS + Manual)" -ForegroundColor White
    Write-Host "  ?? 3. Software Manager (Uninstall Apps)" -ForegroundColor White
    Write-Host "  ?? 4. Detailed Logging System" -ForegroundColor White
    Write-Host "  ?? 5. Scheduled Tasks Support" -ForegroundColor White
    Write-Host ""
    
    Write-Host "  ??  DISCLAIMER:" -ForegroundColor Yellow
    Write-Host "  ?? Use at your own responsibility" -ForegroundColor White
    Write-Host "  ?? No warranty provided" -ForegroundColor White
    Write-Host "  ?? For personal use only" -ForegroundColor White
    Write-Host ""
    
    Write-Host "  ?? LICENSE: Free & Open Source" -ForegroundColor Green
    Write-Host ""
}

# ============================================
# MAIN PROGRAM LOOP
# ============================================

Write-Log "==================== TOOLKIT STARTED ===================="

do {
    Show-MainHeader
    Show-MainMenu
    
    $choice = Read-Host "  Enter choice"
    
    switch ($choice) {
        "1" {
            # Cleanup Tool
            do {
                Show-CleanupMenu
                $cleanupChoice = Read-Host "  Enter choice"
                
                switch ($cleanupChoice) {
                    "1" { Start-Cleanup -level 1 -dryRun $false; Read-Host "`n  Press Enter to continue" }
                    "2" { Start-Cleanup -level 2 -dryRun $false; Read-Host "`n  Press Enter to continue" }
                    "3" { 
                        Write-Host ""
                        Write-Host "  ??  Deep cleanup will delete more data!" -ForegroundColor Yellow
                        $confirm = Read-Host "  Continue? (Y/N)"
                        if ($confirm -eq "Y" -or $confirm -eq "y") {
                            Start-Cleanup -level 3 -dryRun $false
                        }
                        Read-Host "`n  Press Enter to continue"
                    }
                    "4" { Start-Cleanup -level 2 -dryRun $true; Read-Host "`n  Press Enter to continue" }
                    "5" { Create-CleanupSchedule; Read-Host "`n  Press Enter to continue" }
                    "0" { break }
                    default { 
                        Write-Host "`n  ? Invalid choice!" -ForegroundColor Red
                        Start-Sleep -Seconds 2
                    }
                }
            } while ($cleanupChoice -ne "0")
        }
        "2" {
            # Windows Activation
            do {
                Show-ActivationMenu
                $activationChoice = Read-Host "  Enter choice"
                
                switch ($activationChoice) {
                    "1" { Activate-Windows; Read-Host "`n  Press Enter to continue" }
                    "2" { Enter-ProductKey; Read-Host "`n  Press Enter to continue" }
                    "3" { Check-ActivationStatus; Read-Host "`n  Press Enter to continue" }
                    "4" { Rearm-Windows; Read-Host "`n  Press Enter to continue" }
                    "5" { Check-ActivationStatus; Read-Host "`n  Press Enter to continue" }
                    "0" { break }
                    default { 
                        Write-Host "`n  ? Invalid choice!" -ForegroundColor Red
                        Start-Sleep -Seconds 2
                    }
                }
            } while ($activationChoice -ne "0")
        }
        "3" {
            # Software Manager
            do {
                Show-SoftwareManager
                $softwareChoice = Read-Host "  Enter choice"
                
                switch ($softwareChoice) {
                    "1" { List-InstalledSoftware; Read-Host "`n  Press Enter to continue" }
                    "2" { Search-Software; Read-Host "`n  Press Enter to continue" }
                    "3" { Uninstall-Software; Read-Host "`n  Press Enter to continue" }
                    "4" { Export-SoftwareList; Read-Host "`n  Press Enter to continue" }
                    "0" { break }
                    default { 
                        Write-Host "`n  ? Invalid choice!" -ForegroundColor Red
                        Start-Sleep -Seconds 2
                    }
                }
            } while ($softwareChoice -ne "0")
        }
        "4" {
            # View Logs
            Show-Logs
            Read-Host "  Press Enter to continue"
        }
        "5" {
            # About & Info
            Show-About
            Read-Host "  Press Enter to continue"
        }
        "0" {
            Clear-Host
            Write-Host ""
            Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "            Thank you for using Windows Toolkit!" -ForegroundColor Green
            Write-Host "            Goodbye! ??" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "???????????????????????????????????????????????????????????????????" -ForegroundColor Cyan
            Write-Host ""
            Write-Log "==================== TOOLKIT CLOSED ===================="
            Start-Sleep -Seconds 2
            exit
        }
        default {
            Write-Host "`n  ? Invalid choice! Please try again." -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }
} while ($true)
