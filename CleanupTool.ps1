# ============================================
# C?NG C? D?N D?P R?C T? ??NG CHO WINDOWS
# Phi?n b?n: 2.0 - N?ng c?p ??y ?? t?nh n?ng
# Y?u c?u: Ch?y v?i quy?n Administrator
# ============================================

# UTF-8 Encoding
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

# C?u h?nh
$LogFile = "$PSScriptRoot\CleanupLog.txt"
$BackupEnabled = $false # ??i th?nh $true n?u mu?n backup tr??c khi x?a

# ============================================
# KI?M TRA QUY?N ADMINISTRATOR
# ============================================
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "`n??  C?NH B?O: Script n?y c?n ch?y v?i quy?n Administrator!" -ForegroundColor Red
    Write-Host "H?y click chu?t ph?i v? ch?n 'Run as Administrator'`n" -ForegroundColor Yellow
    pause
    exit
}

# ============================================
# FUNCTIONS - H?M H? TR?
# ============================================

# H?m ghi log
function Write-Log {
    param([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -FilePath $LogFile -Append -Encoding UTF8
}

# H?m hi?n th? header ??p
function Show-Header {
    Clear-Host
    Write-Host ""
    Write-Host "??????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "?                                                            ?" -ForegroundColor Cyan
    Write-Host "?        C?NG C? D?N D?P R?C T? ??NG CHO WINDOWS            ?" -ForegroundColor Cyan
    Write-Host "?                    Phi?n b?n 2.0                          ?" -ForegroundColor Cyan
    Write-Host "?                                                            ?" -ForegroundColor Cyan
    Write-Host "??????????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
}

# H?m hi?n th? menu
function Show-Menu {
    Write-Host "Ch?n ch? ?? th?c hi?n:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  [1] D?n d?p NHANH (C? b?n - An to?n)" -ForegroundColor Green
    Write-Host "  [2] D?n d?p TH?NG TH??NG (Khuy?n ngh?)" -ForegroundColor Cyan
    Write-Host "  [3] D?n d?p S?U (To?n di?n)" -ForegroundColor Magenta
    Write-Host "  [4] Xem tr??c (Preview - Kh?ng x?a g?)" -ForegroundColor White
    Write-Host "  [5] T?o l?ch t? ??ng (Schedule Task)" -ForegroundColor Yellow
    Write-Host "  [6] Xem log l?ch s?" -ForegroundColor Gray
    Write-Host "  [0] Tho?t" -ForegroundColor Red
    Write-Host ""
}

# H?m t?nh k?ch th??c folder
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

# H?m format k?ch th??c
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

# H?m x?a an to?n v?i progress
function Remove-SafeFolder {
    param(
        [string]$path,
        [string]$description,
        [bool]$dryRun = $false
    )
    
    if (Test-Path $path) {
        $sizeBefore = Get-FolderSize $path
        
        if ($sizeBefore -eq 0) {
            Write-Host "  ??  $description - Tr?ng" -ForegroundColor DarkGray
            Write-Log "SKIP: $description - Folder r?ng"
            return 0
        }
        
        Write-Host "  ???  $description" -ForegroundColor Yellow
        Write-Host "      ?? $path" -ForegroundColor DarkGray
        Write-Host "      ?? K?ch th??c: $(Format-Size $sizeBefore)" -ForegroundColor DarkGray
        
        if ($dryRun) {
            Write-Host "      ???  [DRY RUN] S? x?a $(Format-Size $sizeBefore)" -ForegroundColor Cyan
            Write-Log "DRY RUN: $description - $(Format-Size $sizeBefore)"
            return $sizeBefore
        }
        
        try {
            # Backup n?u ???c b?t
            if ($BackupEnabled) {
                $backupPath = "$PSScriptRoot\Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
                if (-not (Test-Path $backupPath)) {
                    New-Item -Path $backupPath -ItemType Directory -Force | Out-Null
                }
                Write-Host "      ?? ?ang backup..." -ForegroundColor DarkYellow
            }
            
            Remove-Item -Path "$path\*" -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "      ? ?? gi?i ph?ng $(Format-Size $sizeBefore)" -ForegroundColor Green
            Write-Log "SUCCESS: $description - ?? x?a $(Format-Size $sizeBefore)"
            return $sizeBefore
        } catch {
            Write-Host "      ??  M?t s? file kh?ng th? x?a (?ang ???c s? d?ng)" -ForegroundColor Yellow
            Write-Log "WARNING: $description - L?i: $($_.Exception.Message)"
            return 0
        }
    } else {
        Write-Host "  ??  $description - Kh?ng t?n t?i" -ForegroundColor DarkGray
        Write-Log "SKIP: $description - ???ng d?n kh?ng t?n t?i"
        return 0
    }
    Write-Host ""
}

# H?m d?n d?p theo level
function Start-Cleanup {
    param(
        [int]$level = 2,
        [bool]$dryRun = $false
    )
    
    $totalCleaned = 0
    $mode = if ($dryRun) { "XEM TR??C" } else { "TH?C THI" }
    
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ?? B?T ??U D?N D?P - Ch? ??: $mode" -ForegroundColor Green
    Write-Host "???????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    Write-Log "==================== B?T ??U PHI?N D?N D?P (Level $level - $mode) ===================="
    
    # LEVEL 1: C? b?n (An to?n nh?t)
    if ($level -ge 1) {
        Write-Host "?? PH?N 1: D?n d?p c? b?n (An to?n)" -ForegroundColor Cyan
        Write-Host "?????????????????????????????????????????????????????????" -ForegroundColor DarkCyan
        
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\Temp" "Windows Temp" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:TEMP" "User Temp" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:APPDATA\Microsoft\Windows\Recent" "Recent Items" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\Microsoft\Windows\Explorer" "Thumbnail Cache" $dryRun
    }
    
    # LEVEL 2: Th?ng th??ng (Khuy?n ngh?)
    if ($level -ge 2) {
        Write-Host ""
        Write-Host "?? PH?N 2: D?n d?p th?ng th??ng" -ForegroundColor Cyan
        Write-Host "?????????????????????????????????????????????????????????" -ForegroundColor DarkCyan
        
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\Prefetch" "Prefetch Files" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\SoftwareDistribution\Download" "Windows Update Cache" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:ProgramData\Microsoft\Windows\WER\ReportQueue" "Windows Error Reports" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:LOCALAPPDATA\CrashDumps" "Crash Dumps" $dryRun
        
        # Browser Caches
        Write-Host ""
        Write-Host "?? D?n d?p tr?nh duy?t:" -ForegroundColor Yellow
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
    
    # LEVEL 3: D?n s?u (To?n di?n)
    if ($level -ge 3) {
        Write-Host ""
        Write-Host "?? PH?N 3: D?n d?p s?u (To?n di?n)" -ForegroundColor Magenta
        Write-Host "?????????????????????????????????????????????????????????" -ForegroundColor DarkMagenta
        
        # Windows Logs
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\Logs" "Windows Log Files" $dryRun
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\System32\LogFiles" "System32 Log Files" $dryRun
        
        # Delivery Optimization
        $totalCleaned += Remove-SafeFolder "$env:SystemRoot\SoftwareDistribution\DeliveryOptimization" "Delivery Optimization" $dryRun
        
        # Windows Installer Cache (c?n th?n)
        # $totalCleaned += Remove-SafeFolder "$env:SystemRoot\Installer\$PatchCache$" "Windows Installer Cache" $dryRun
        
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
    
    # Recycle Bin (T?t c? c?c level)
    Write-Host ""
    Write-Host "???  D?n d?p Recycle Bin:" -ForegroundColor Yellow
    if (-not $dryRun) {
        try {
            $shell = New-Object -ComObject Shell.Application
            $recycleBin = $shell.Namespace(0xA)
            $items = $recycleBin.Items()
            $size = ($items | Measure-Object -Property Size -Sum -ErrorAction SilentlyContinue).Sum / 1MB
            $size = [math]::Round($size, 2)
            
            if ($size -gt 0) {
                Write-Host "  ?? K?ch th??c: $(Format-Size $size)" -ForegroundColor DarkGray
                Clear-RecycleBin -Force -ErrorAction SilentlyContinue
                Write-Host "  ? ?? x?a $(Format-Size $size)" -ForegroundColor Green
                Write-Log "SUCCESS: Recycle Bin - ?? x?a $(Format-Size $size)"
                $totalCleaned += $size
            } else {
                Write-Host "  ??  Recycle Bin - Tr?ng" -ForegroundColor DarkGray
            }
        } catch {
            Write-Host "  ??  Kh?ng th? d?n Recycle Bin" -ForegroundColor Yellow
            Write-Log "WARNING: Recycle Bin - L?i: $($_.Exception.Message)"
        }
    } else {
        Write-Host "  ???  [DRY RUN] Recycle Bin s? ???c d?n s?ch" -ForegroundColor Cyan
    }
    
    # T?ng k?t
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ? K?T QU? D?N D?P" -ForegroundColor Green
    Write-Host "???????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  ?? T?ng dung l??ng: $(Format-Size $totalCleaned)" -ForegroundColor Green
    
    if ($totalCleaned -ge 1024) {
        Write-Host "  ?? T??ng ???ng: $([math]::Round($totalCleaned / 1024, 2)) GB" -ForegroundColor Green
    }
    
    Write-Log "K?T QU?: T?ng ?? x?a/xem tr??c: $(Format-Size $totalCleaned)"
    Write-Log "==================== K?T TH?C PHI?N D?N D?P ===================="
    
    if ($dryRun) {
        Write-Host ""
        Write-Host "  ???  ??y l? ch? ?? XEM TR??C - Kh?ng c? g? b? x?a" -ForegroundColor Cyan
        Write-Host "  ?? Ch?n ch? ?? 1-3 ?? th?c hi?n x?a th?t" -ForegroundColor Yellow
    } else {
        Write-Host ""
        Write-Host "  ? HO?N TH?NH! M?y t?nh c?a b?n ?? s?ch h?n!" -ForegroundColor Green
    }
    
    Write-Host ""
}

# H?m t?o scheduled task
function Create-ScheduledTask {
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????" -ForegroundColor Yellow
    Write-Host "  ?? T?O L?CH T? ??NG D?N D?P" -ForegroundColor Yellow
    Write-Host "???????????????????????????????????????????????????????????" -ForegroundColor Yellow
    Write-Host ""
    
    Write-Host "Ch?n t?n su?t:" -ForegroundColor Cyan
    Write-Host "  [1] H?ng ng?y" -ForegroundColor White
    Write-Host "  [2] H?ng tu?n" -ForegroundColor White
    Write-Host "  [3] H?ng th?ng (Khuy?n ngh?)" -ForegroundColor Green
    Write-Host ""
    
    $freq = Read-Host "L?a ch?n (1-3)"
    
    $trigger = switch ($freq) {
        "1" { New-ScheduledTaskTrigger -Daily -At "02:00AM" }
        "2" { New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At "02:00AM" }
        "3" { New-ScheduledTaskTrigger -Weekly -WeeksInterval 4 -DaysOfWeek Sunday -At "02:00AM" }
        default { 
            Write-Host "L?a ch?n kh?ng h?p l?!" -ForegroundColor Red
            return
        }
    }
    
    try {
        $action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-ExecutionPolicy Bypass -File `"$PSCommandPath`" -AutoRun"
        $principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
        $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable
        
        Register-ScheduledTask -TaskName "Windows Cleanup Tool" -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Force | Out-Null
        
        Write-Host ""
        Write-Host "? ?? t?o l?ch t? ??ng th?nh c?ng!" -ForegroundColor Green
        Write-Host "?? Task s? ch?y t? ??ng theo l?ch ?? ch?n" -ForegroundColor Cyan
        Write-Host "?? Xem trong Task Scheduler: 'Windows Cleanup Tool'" -ForegroundColor Yellow
        Write-Log "SCHEDULED: ?? t?o task t? ??ng - T?n su?t: $freq"
    } catch {
        Write-Host ""
        Write-Host "? L?i khi t?o scheduled task!" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
        Write-Log "ERROR: Kh?ng th? t?o scheduled task - $($_.Exception.Message)"
    }
}

# H?m xem log
function Show-Log {
    Write-Host ""
    Write-Host "???????????????????????????????????????????????????????????" -ForegroundColor Cyan
    Write-Host "  ?? L?CH S? D?N D?P" -ForegroundColor Cyan
    Write-Host "???????????????????????????????????????????????????????????" -ForegroundColor Cyan
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
        Write-Host "  ??  Ch?a c? l?ch s? d?n d?p" -ForegroundColor Yellow
    }
    Write-Host ""
}

# ============================================
# MAIN PROGRAM
# ============================================

# Ki?m tra n?u ch?y t? ??ng (t? scheduled task)
param([switch]$AutoRun)

if ($AutoRun) {
    Write-Log "AUTO RUN: B?t ??u t? ??ng"
    Start-Cleanup -level 2 -dryRun $false
    exit
}

# Main loop
do {
    Show-Header
    Show-Menu
    
    $choice = Read-Host "Nh?p l?a ch?n"
    
    switch ($choice) {
        "1" {
            Start-Cleanup -level 1 -dryRun $false
            Write-Host ""
            Read-Host "Nh?n Enter ?? ti?p t?c"
        }
        "2" {
            Start-Cleanup -level 2 -dryRun $false
            Write-Host ""
            Read-Host "Nh?n Enter ?? ti?p t?c"
        }
        "3" {
            Write-Host ""
            Write-Host "??  C?NH B?O: Ch? ?? d?n s?u s? x?a nhi?u d? li?u h?n!" -ForegroundColor Yellow
            $confirm = Read-Host "B?n c? ch?c ch?n? (Y/N)"
            if ($confirm -eq "Y" -or $confirm -eq "y") {
                Start-Cleanup -level 3 -dryRun $false
            } else {
                Write-Host "?? h?y!" -ForegroundColor Red
            }
            Write-Host ""
            Read-Host "Nh?n Enter ?? ti?p t?c"
        }
        "4" {
            Start-Cleanup -level 2 -dryRun $true
            Write-Host ""
            Read-Host "Nh?n Enter ?? ti?p t?c"
        }
        "5" {
            Create-ScheduledTask
            Write-Host ""
            Read-Host "Nh?n Enter ?? ti?p t?c"
        }
        "6" {
            Show-Log
            Read-Host "Nh?n Enter ?? ti?p t?c"
        }
        "0" {
            Write-Host ""
            Write-Host "?? C?m ?n b?n ?? s? d?ng! T?m bi?t!" -ForegroundColor Cyan
            Write-Host ""
            exit
        }
        default {
            Write-Host ""
            Write-Host "? L?a ch?n kh?ng h?p l?! Vui l?ng ch?n l?i." -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }
} while ($true)
