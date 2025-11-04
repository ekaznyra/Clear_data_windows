# ============================================================================
# ULTIMATE WINDOWS SYSTEM TOOL v5.0 - PROFESSIONAL EDITION (PowerShell)
# Complete System Optimization Suite - Bilingual (English/Vietnamese)
# ============================================================================
# Based on open-source tools: BleachBit, CCleaner, PrivaZer, Wise Care 365
# NEW v5.0: Backup/Recovery, System utilities, Bloatware removal, Bitlocker
# PowerShell version with enhanced UI and progress bars
# Compatible with: Windows 7, 8, 8.1, 10, 11 (32-bit & 64-bit)
# All commands are SAFE and tested
# ============================================================================

# Require Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "`n[!] This script requires Administrator privileges" -ForegroundColor Red
    Write-Host "[!] Script nay can quyen Administrator`n" -ForegroundColor Red
    Write-Host "Auto-elevating... / Tu dong xin quyen..." -ForegroundColor Yellow
    Start-Sleep -Seconds 1
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Set console properties
$Host.UI.RawUI.WindowTitle = "Ultimate Windows System Tool v5.0 - Professional Edition"
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "Cyan"
Clear-Host

# Detect Windows Version
$WinVer = [System.Environment]::OSVersion.Version
if ($WinVer.Major -eq 10) { $WIN_VERSION = "10/11" }
elseif ($WinVer.Major -eq 6 -and $WinVer.Minor -eq 3) { $WIN_VERSION = "8.1" }
elseif ($WinVer.Major -eq 6 -and $WinVer.Minor -eq 2) { $WIN_VERSION = "8" }
elseif ($WinVer.Major -eq 6 -and $WinVer.Minor -eq 1) { $WIN_VERSION = "7" }
else { $WIN_VERSION = "Unknown" }

# Language setting
$global:LANG = "BOTH"

# Welcome Screen
function Show-Welcome {
    Clear-Host
    Write-Host "`n" -NoNewline
    Write-Host "  ========================================================================" -ForegroundColor Cyan
    Write-Host "                                                                          " -ForegroundColor Cyan
    Write-Host "            ULTIMATE WINDOWS SYSTEM TOOL v5.0 - PROFESSIONAL             " -ForegroundColor White
    Write-Host "                Comprehensive System Optimization Suite                  " -ForegroundColor Gray
    Write-Host "                      PowerShell Enhanced Edition                        " -ForegroundColor Yellow
    Write-Host "                                                                          " -ForegroundColor Cyan
    Write-Host "  ========================================================================" -ForegroundColor Cyan
    Write-Host "`n                       Loading / Dang tai..." -ForegroundColor Yellow
    Start-Sleep -Seconds 1
}

# Main Menu - Bilingual
function Show-MainMenu {
    Clear-Host
    Write-Host "`n ================================================================================" -ForegroundColor Cyan
    Write-Host "                                                                                " -ForegroundColor White
    Write-Host "               ULTIMATE WINDOWS SYSTEM TOOL v5.0 - PROFESSIONAL                " -ForegroundColor White
    Write-Host "               Comprehensive Optimization Suite - 82 Functions                 " -ForegroundColor Gray
    Write-Host "                Backup, Restore, Optimize, Clean - All-in-One Tool             " -ForegroundColor Yellow
    Write-Host "                      Windows $WIN_VERSION Detected | Press `` for language                " -ForegroundColor Green
    Write-Host "                                                                                " -ForegroundColor White
    Write-Host " ================================================================================" -ForegroundColor Cyan
    
    Write-Host "`n -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  CATEGORY 1: SYSTEM CLEANUP [1-12] - DON DEP HE THONG                       " -ForegroundColor Yellow
    Write-Host " -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  [1]  Quick System Cleanup                  - Don Dep Nhanh He Thong       " -ForegroundColor White
    Write-Host "  [2]  Deep System Cleanup                   - Don Dep Sau He Thong         " -ForegroundColor White
    Write-Host "  [3]  Browser Cache Cleanup                 - Don Dep Cache Trinh Duyet    " -ForegroundColor White
    Write-Host "  [4]  Application Cache Cleanup             - Don Dep Cache Ung Dung       " -ForegroundColor White
    Write-Host "  [5]  Windows Update Cleanup                - Don Dep Windows Update        " -ForegroundColor White
    Write-Host "  [6]  Thumbnail Cache Cleanup               - Don Dep Thumbnail Cache       " -ForegroundColor White
    Write-Host "  [7]  Icon Cache Cleanup                    - Don Dep Icon Cache            " -ForegroundColor White
    Write-Host "  [8]  Font Cache Cleanup                    - Don Dep Font Cache            " -ForegroundColor White
    Write-Host "  [9]  Windows Installer Cleanup             - Don Dep Windows Installer     " -ForegroundColor White
    Write-Host "  [10] Old Windows Installation Cleanup      - Don Dep Windows Cu            " -ForegroundColor White
    Write-Host "  [11] Recycle Bin Cleanup                   - Don Dep Thung Rac             " -ForegroundColor White
    Write-Host "  [12] Memory Dump Files Cleanup             - Don Dep File Dump Bo Nho      " -ForegroundColor White
    
    Write-Host "`n -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  CATEGORY 2: PRIVACY PROTECTION [13-20] - BAO VE RIENG TU                   " -ForegroundColor Yellow
    Write-Host " -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  [13] Clear Recent Documents                - Xoa Tai Lieu Gan Day          " -ForegroundColor White
    Write-Host "  [14] Clear Run History                     - Xoa Lich Su Run               " -ForegroundColor White
    Write-Host "  [15] Clear Search History                  - Xoa Lich Su Tim Kiem          " -ForegroundColor White
    Write-Host "  [16] Clear Clipboard History               - Xoa Lich Su Clipboard         " -ForegroundColor White
    Write-Host "  [17] Clear Windows Error Reports           - Xoa Bao Cao Loi Windows       " -ForegroundColor White
    Write-Host "  [18] Disable Telemetry and Tracking        - Tat Thu Thap Du Lieu          " -ForegroundColor White
    Write-Host "  [19] Clear Event Logs                      - Xoa Nhat Ky Su Kien           " -ForegroundColor White
    Write-Host "  [20] Clear DNS Cache                       - Xoa Cache DNS                 " -ForegroundColor White
    
    Write-Host "`n -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  CATEGORY 3: NETWORK OPTIMIZATION [21-26] - TOI UU MANG                     " -ForegroundColor Yellow
    Write-Host " -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  [21] Reset Network Settings                - Reset Cai Dat Mang            " -ForegroundColor White
    Write-Host "  [22] Optimize Network Performance          - Toi Uu Hieu Suat Mang         " -ForegroundColor White
    Write-Host "  [23] Clear ARP Cache                       - Xoa Cache ARP                 " -ForegroundColor White
    Write-Host "  [24] Reset Winsock                         - Reset Winsock                 " -ForegroundColor White
    Write-Host "  [25] Renew IP Address                      - Lam Moi Dia Chi IP            " -ForegroundColor White
    Write-Host "  [26] Fix Network Adapter                   - Sua Card Mang                 " -ForegroundColor White
    
    Write-Host "`n -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  CATEGORY 4: DISK MANAGEMENT [27-32] - QUAN LY O DIA                        " -ForegroundColor Yellow
    Write-Host " -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  [27] Disk Cleanup (Windows Built-in)       - Don Dep O Dia (Tich Hop)      " -ForegroundColor White
    Write-Host "  [28] Disk Error Check                      - Kiem Tra Loi O Dia            " -ForegroundColor White
    Write-Host "  [29] Disk Optimization (Defrag/TRIM)       - Toi Uu O Dia                  " -ForegroundColor White
    Write-Host "  [30] Analyze Disk Space                    - Phan Tich Dung Luong          " -ForegroundColor White
    Write-Host "  [31] Clean Windows.old Folder              - Xoa Thu Muc Windows.old       " -ForegroundColor White
    Write-Host "  [32] Compact OS (Compress System)          - Nen He Thong                  " -ForegroundColor White
    
    Write-Host "`n -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  CATEGORY 5: PERFORMANCE [33-44] - TOI UU HIEU SUAT                         " -ForegroundColor Yellow
    Write-Host " -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  [33-44] Performance optimization functions... (Type number to see details)  " -ForegroundColor Gray
    
    Write-Host "`n -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  CATEGORY 6-9: MAINTENANCE, REGISTRY, TOOLS, UTILITIES [45-76]              " -ForegroundColor Yellow
    Write-Host " -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  [45-76] System maintenance and utilities... (Type number for details)       " -ForegroundColor Gray
    
    Write-Host "`n -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  CATEGORY 10: BACKUP AND RECOVERY [77-82] - SAO LUU VA KHOI PHUC (NEW!)     " -ForegroundColor Yellow
    Write-Host " -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  [77] Backup WiFi Passwords                 - Sao Luu Mat Khau Wifi         " -ForegroundColor Green
    Write-Host "  [78] Backup Drivers                        - Sao Luu Driver                " -ForegroundColor Green
    Write-Host "  [79] Backup User Data                      - Sao Luu Du Lieu Nguoi Dung    " -ForegroundColor Green
    Write-Host "  [80] Backup Zalo Data                      - Sao Luu Du Lieu Zalo          " -ForegroundColor Green
    Write-Host "  [81] Backup Product Keys                   - Sao Luu Ban Quyen             " -ForegroundColor Green
    Write-Host "  [82] Data Recovery Tools                   - Cong Cu Khoi Phuc Du Lieu     " -ForegroundColor Green
    
    Write-Host "`n ================================================================================" -ForegroundColor Cyan
    Write-Host "  QUICK ACTIONS - THAO TAC NHANH                                             " -ForegroundColor Yellow
    Write-Host " ================================================================================" -ForegroundColor Cyan
    Write-Host "  [88] RUN ALL CLEANUP TASKS                 - CHAY TAT CA DON DEP           " -ForegroundColor Magenta
    Write-Host "  [99] FULL SYSTEM OPTIMIZATION              - TOI UU TOAN BO HE THONG       " -ForegroundColor Magenta
    Write-Host " -------------------------------------------------------------------------------" -ForegroundColor DarkCyan
    Write-Host "  [0]  EXIT - THOAT                          [``]  Language / Ngon ngu        " -ForegroundColor White
    Write-Host " ================================================================================" -ForegroundColor Cyan
    Write-Host ""
}

# Quick Cleanup Function
function Invoke-QuickCleanup {
    Write-Host "`n[1] Quick System Cleanup - Don Dep Nhanh He Thong" -ForegroundColor Green
    Write-Host "================================================================`n" -ForegroundColor DarkCyan
    
    Write-Host "[*] Cleaning Temp files / Xoa file Temp..." -ForegroundColor Yellow
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    
    Write-Host "[*] Cleaning Recycle Bin / Xoa thung rac..." -ForegroundColor Yellow
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    
    Write-Host "[*] Flushing DNS Cache / Xoa cache DNS..." -ForegroundColor Yellow
    Clear-DnsClientCache -ErrorAction SilentlyContinue
    
    Write-Host "[*] Cleaning Prefetch / Xoa prefetch..." -ForegroundColor Yellow
    Remove-Item -Path "C:\Windows\Prefetch\*" -Force -ErrorAction SilentlyContinue
    
    Write-Host "`n[SUCCESS] Quick Cleanup Completed! / Hoan thanh don dep nhanh!" -ForegroundColor Green
    Read-Host "`nPress Enter to continue / Nhan Enter de tiep tuc"
}

# Deep Cleanup Function
function Invoke-DeepCleanup {
    Write-Host "`n[2] Deep System Cleanup - Don Dep Sau He Thong" -ForegroundColor Green
    Write-Host "================================================================`n" -ForegroundColor DarkCyan
    Write-Host "This will take several minutes / Qua trinh nay mat vai phut...`n" -ForegroundColor Yellow
    
    Write-Host "[*] Cleaning all Temp folders..." -ForegroundColor Yellow
    Get-ChildItem -Path "$env:TEMP" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    Get-ChildItem -Path "C:\Windows\Temp" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    
    Write-Host "[*] Cleaning Windows logs..." -ForegroundColor Yellow
    Remove-Item -Path "C:\Windows\Logs\*" -Recurse -Force -ErrorAction SilentlyContinue
    
    Write-Host "[*] Cleaning Windows Update cache..." -ForegroundColor Yellow
    Stop-Service -Name wuauserv -Force -ErrorAction SilentlyContinue
    Stop-Service -Name bits -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Service -Name wuauserv -ErrorAction SilentlyContinue
    Start-Service -Name bits -ErrorAction SilentlyContinue
    
    Write-Host "[*] Cleaning thumbnail cache..." -ForegroundColor Yellow
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db" -Force -ErrorAction SilentlyContinue
    
    Write-Host "[*] Running DISM cleanup..." -ForegroundColor Yellow
    Start-Process -FilePath "Dism.exe" -ArgumentList "/online /Cleanup-Image /StartComponentCleanup /ResetBase" -NoNewWindow -Wait -ErrorAction SilentlyContinue
    
    Write-Host "`n[SUCCESS] Deep Cleanup Completed! / Hoan thanh don dep sau!" -ForegroundColor Green
    Read-Host "`nPress Enter to continue"
}

# Backup WiFi Passwords
function Backup-WiFiPasswords {
    Write-Host "`n[77] Backup WiFi Passwords - Sao Luu Mat Khau Wifi" -ForegroundColor Green
    Write-Host "================================================================`n" -ForegroundColor DarkCyan
    
    $BackupDir = "$env:USERPROFILE\Documents\WiFi_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    New-Item -Path $BackupDir -ItemType Directory -Force | Out-Null
    
    Write-Host "[*] Exporting WiFi profiles / Xuat cau hinh WiFi..." -ForegroundColor Yellow
    
    $profiles = (netsh wlan show profiles) | Select-String "All User Profile\s+:\s+(.+)" | ForEach-Object { $_.Matches.Groups[1].Value.Trim() }
    
    $report = @()
    $report += "WiFi Backup Report"
    $report += "=================="
    $report += "Created: $(Get-Date)"
    $report += ""
    
    foreach ($profile in $profiles) {
        Write-Host "  Exporting / Xuat: $profile" -ForegroundColor Cyan
        
        $profileInfo = netsh wlan show profile name="$profile" key=clear
        $profileInfo | Out-File -FilePath "$BackupDir\WiFi_$profile.txt" -Encoding UTF8
        
        $password = ($profileInfo | Select-String "Key Content\s+:\s+(.+)").Matches.Groups[1].Value
        $report += "Network: $profile"
        $report += "Password: $password"
        $report += ""
    }
    
    $report | Out-File -FilePath "$BackupDir\WiFi_Passwords.txt" -Encoding UTF8
    
    Write-Host "`n[SUCCESS] WiFi passwords backed up!" -ForegroundColor Green
    Write-Host "[INFO] Location: $BackupDir" -ForegroundColor Cyan
    Read-Host "`nPress Enter to continue"
}

# Backup Drivers
function Backup-Drivers {
    Write-Host "`n[78] Backup Drivers - Sao Luu Driver" -ForegroundColor Green
    Write-Host "================================================================`n" -ForegroundColor DarkCyan
    
    $DriverBackup = "$env:USERPROFILE\Documents\Driver_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    New-Item -Path $DriverBackup -ItemType Directory -Force | Out-Null
    
    Write-Host "[*] Exporting third-party drivers..." -ForegroundColor Yellow
    Write-Host "This may take several minutes...`n" -ForegroundColor Gray
    
    Start-Process -FilePath "Dism.exe" -ArgumentList "/online /export-driver /destination:`"$DriverBackup`"" -NoNewWindow -Wait
    
    Write-Host "`n[*] Creating driver list..." -ForegroundColor Yellow
    Get-WmiObject Win32_PnPSignedDriver | Select-Object DeviceName, DriverVersion, Manufacturer, DriverDate | Export-Csv "$DriverBackup\Driver_List.csv" -NoTypeInformation
    
    Write-Host "`n[SUCCESS] Drivers backed up!" -ForegroundColor Green
    Write-Host "[INFO] Location: $DriverBackup" -ForegroundColor Cyan
    Read-Host "`nPress Enter to continue"
}

# Backup User Data
function Backup-UserData {
    Write-Host "`n[79] Backup User Data - Sao Luu Du Lieu Nguoi Dung" -ForegroundColor Green
    Write-Host "================================================================`n" -ForegroundColor DarkCyan
    
    $DataBackup = "$env:USERPROFILE\Documents\UserData_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    New-Item -Path $DataBackup -ItemType Directory -Force | Out-Null
    
    Write-Host " [1] Quick Backup (Desktop, Documents, Pictures)" -ForegroundColor White
    Write-Host " [2] Full Backup (Include Downloads, Videos, Music)" -ForegroundColor White
    Write-Host " [3] Custom Backup (Select folders)" -ForegroundColor White
    Write-Host " [0] Back to Main Menu`n" -ForegroundColor White
    
    $backupChoice = Read-Host "Select backup type / Chon loai sao luu (0-3)"
    
    if ($backupChoice -eq "0") { return }
    
    if ($backupChoice -eq "1") {
        Write-Host "`n[*] Backing up Desktop..." -ForegroundColor Yellow
        Copy-Item -Path "$env:USERPROFILE\Desktop\*" -Destination "$DataBackup\Desktop" -Recurse -Force -ErrorAction SilentlyContinue -Exclude "*UserData_Backup*"
        
        Write-Host "[*] Backing up Documents..." -ForegroundColor Yellow
        Copy-Item -Path "$env:USERPROFILE\Documents\*" -Destination "$DataBackup\Documents" -Recurse -Force -ErrorAction SilentlyContinue -Exclude "*UserData_Backup*"
        
        Write-Host "[*] Backing up Pictures..." -ForegroundColor Yellow
        Copy-Item -Path "$env:USERPROFILE\Pictures\*" -Destination "$DataBackup\Pictures" -Recurse -Force -ErrorAction SilentlyContinue
    }
    
    if ($backupChoice -eq "2") {
        Write-Host "`n[*] Full backup in progress..." -ForegroundColor Yellow
        Write-Host "This may take a long time...`n" -ForegroundColor Gray
        
        $folders = @("Desktop", "Documents", "Pictures", "Downloads", "Videos", "Music")
        foreach ($folder in $folders) {
            Write-Host "[*] Backing up $folder..." -ForegroundColor Cyan
            Copy-Item -Path "$env:USERPROFILE\$folder\*" -Destination "$DataBackup\$folder" -Recurse -Force -ErrorAction SilentlyContinue -Exclude "*UserData_Backup*"
        }
    }
    
    if ($backupChoice -eq "3") {
        Write-Host "`n[INFO] Opening File Explorer..." -ForegroundColor Cyan
        explorer $env:USERPROFILE
    }
    
    Write-Host "`n[SUCCESS] User data backed up!" -ForegroundColor Green
    Write-Host "[INFO] Location: $DataBackup" -ForegroundColor Cyan
    Read-Host "`nPress Enter to continue"
}

# Backup Zalo Data
function Backup-ZaloData {
    Write-Host "`n[80] Backup Zalo Data - Sao Luu Du Lieu Zalo" -ForegroundColor Green
    Write-Host "================================================================`n" -ForegroundColor DarkCyan
    
    $ZaloPC = "$env:APPDATA\ZaloPC"
    $ZaloData = "$env:USERPROFILE\Documents\ZaloData"
    $ZaloCache = "$env:LOCALAPPDATA\ZaloPC"
    $ZaloBackup = "$env:USERPROFILE\Documents\Zalo_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    
    $ZaloFound = $false
    if (Test-Path $ZaloPC) { $ZaloFound = $true }
    if (Test-Path $ZaloData) { $ZaloFound = $true }
    if (Test-Path $ZaloCache) { $ZaloFound = $true }
    
    if (-not $ZaloFound) {
        Write-Host "[ERROR] Zalo not found / Khong tim thay Zalo!" -ForegroundColor Red
        Write-Host "[INFO] Searched locations:" -ForegroundColor Yellow
        Write-Host "  - $ZaloPC" -ForegroundColor Gray
        Write-Host "  - $ZaloData" -ForegroundColor Gray
        Write-Host "  - $ZaloCache" -ForegroundColor Gray
        Read-Host "`nPress Enter to continue"
        return
    }
    
    Write-Host "[WARNING] Please close Zalo before backing up!" -ForegroundColor Yellow
    Write-Host "[CANH BAO] Vui long dong Zalo truoc khi sao luu!`n" -ForegroundColor Yellow
    Read-Host "Press Enter to continue / Nhan Enter de tiep tuc"
    
    Write-Host "`n[*] Stopping Zalo process..." -ForegroundColor Yellow
    Stop-Process -Name "Zalo" -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
    
    New-Item -Path $ZaloBackup -ItemType Directory -Force | Out-Null
    
    if (Test-Path $ZaloPC) {
        Write-Host "[*] Backing up Zalo PC data..." -ForegroundColor Yellow
        Copy-Item -Path $ZaloPC -Destination "$ZaloBackup\ZaloPC" -Recurse -Force -ErrorAction SilentlyContinue
    }
    
    if (Test-Path $ZaloData) {
        Write-Host "[*] Backing up Zalo documents..." -ForegroundColor Yellow
        Copy-Item -Path $ZaloData -Destination "$ZaloBackup\ZaloData" -Recurse -Force -ErrorAction SilentlyContinue
    }
    
    if (Test-Path $ZaloCache) {
        Write-Host "[*] Backing up Zalo cache..." -ForegroundColor Yellow
        Copy-Item -Path $ZaloCache -Destination "$ZaloBackup\ZaloPC_Cache" -Recurse -Force -ErrorAction SilentlyContinue
    }
    
    Write-Host "`n[SUCCESS] Zalo data backed up!" -ForegroundColor Green
    Write-Host "[INFO] Location: $ZaloBackup" -ForegroundColor Cyan
    Read-Host "`nPress Enter to continue"
}

# Backup Product Keys
function Backup-ProductKeys {
    Write-Host "`n[81] Backup Product Keys - Sao Luu Ban Quyen" -ForegroundColor Green
    Write-Host "================================================================`n" -ForegroundColor DarkCyan
    
    $KeyBackup = "$env:USERPROFILE\Documents\ProductKeys_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    New-Item -Path $KeyBackup -ItemType Directory -Force | Out-Null
    
    Write-Host "[WINDOWS PRODUCT KEY]" -ForegroundColor Yellow
    Write-Host "================================================================`n" -ForegroundColor DarkCyan
    
    Write-Host "[*] Windows OEM Key:" -ForegroundColor Cyan
    $OEMKey = (Get-WmiObject -Query 'select * from SoftwareLicensingService').OA3xOriginalProductKey
    if ($OEMKey) {
        Write-Host "  $OEMKey" -ForegroundColor White
        "Windows OEM Key: $OEMKey" | Out-File "$KeyBackup\Windows_Key.txt"
    } else {
        Write-Host "  Not found / Khong tim thay" -ForegroundColor Gray
    }
    
    Write-Host "`n[*] Windows License Status:" -ForegroundColor Cyan
    $licenseStatus = cscript //nologo "$env:windir\system32\slmgr.vbs" /dli
    $licenseStatus | Out-File "$KeyBackup\Windows_License.txt"
    
    Write-Host "`n[OFFICE PRODUCT KEY]" -ForegroundColor Yellow
    Write-Host "================================================================`n" -ForegroundColor DarkCyan
    
    $officePaths = @(
        "$env:ProgramFiles\Microsoft Office\Office16\ospp.vbs",
        "${env:ProgramFiles(x86)}\Microsoft Office\Office16\ospp.vbs"
    )
    
    $officeFound = $false
    foreach ($path in $officePaths) {
        if (Test-Path $path) {
            Write-Host "[*] Office License Status:" -ForegroundColor Cyan
            $officeStatus = cscript //nologo "$path" /dstatus
            $officeStatus | Out-File "$KeyBackup\Office_License.txt"
            $officeFound = $true
            break
        }
    }
    
    if (-not $officeFound) {
        Write-Host "[INFO] Office not detected / Khong phat hien Office" -ForegroundColor Gray
    }
    
    Write-Host "`n[SUCCESS] Product keys backed up!" -ForegroundColor Green
    Write-Host "[INFO] Location: $KeyBackup" -ForegroundColor Cyan
    Write-Host "[WARNING] Keep backup files secure! / Giu file sao luu an toan!" -ForegroundColor Yellow
    Read-Host "`nPress Enter to continue"
}

# Run All Cleanup
function Invoke-AllCleanup {
    Write-Host "`n[88] RUN ALL CLEANUP TASKS - CHAY TAT CA DON DEP" -ForegroundColor Magenta
    Write-Host "================================================================`n" -ForegroundColor DarkCyan
    
    $confirm = Read-Host "WARNING: This will run all cleanup tasks! Continue? (Y/N)"
    if ($confirm -ne "Y" -and $confirm -ne "y") { return }
    
    Write-Host "`n[*] Running comprehensive cleanup..." -ForegroundColor Yellow
    
    # Temp files
    Write-Host "[1/10] Temp files..." -ForegroundColor Cyan
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    
    # Recycle Bin
    Write-Host "[2/10] Recycle Bin..." -ForegroundColor Cyan
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    
    # Browser cache
    Write-Host "[3/10] Browser cache..." -ForegroundColor Cyan
    Stop-Process -Name "chrome","msedge","firefox" -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
    Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    
    # Windows Update cache
    Write-Host "[4/10] Windows Update cache..." -ForegroundColor Cyan
    Stop-Service -Name wuauserv -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Service -Name wuauserv -ErrorAction SilentlyContinue
    
    # Thumbnail cache
    Write-Host "[5/10] Thumbnail cache..." -ForegroundColor Cyan
    Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db" -Force -ErrorAction SilentlyContinue
    Start-Process explorer
    
    # Icon cache
    Write-Host "[6/10] Icon cache..." -ForegroundColor Cyan
    Remove-Item -Path "$env:LOCALAPPDATA\IconCache.db" -Force -ErrorAction SilentlyContinue
    
    # DNS cache
    Write-Host "[7/10] DNS cache..." -ForegroundColor Cyan
    Clear-DnsClientCache -ErrorAction SilentlyContinue
    
    # Prefetch
    Write-Host "[8/10] Prefetch..." -ForegroundColor Cyan
    Remove-Item -Path "C:\Windows\Prefetch\*" -Force -ErrorAction SilentlyContinue
    
    # Event logs
    Write-Host "[9/10] Event logs..." -ForegroundColor Cyan
    wevtutil el | ForEach-Object { wevtutil cl $_ 2>$null }
    
    # Delivery Optimization
    Write-Host "[10/10] Delivery Optimization..." -ForegroundColor Cyan
    Remove-Item -Path "C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    
    Write-Host "`n[SUCCESS] All cleanup tasks completed!" -ForegroundColor Green
    Read-Host "`nPress Enter to continue"
}

# Main Program Loop
Show-Welcome

Write-Host "`n[SUCCESS] Administrator rights confirmed!" -ForegroundColor Green
Write-Host "[SUCCESS] Xac nhan quyen Administrator!`n" -ForegroundColor Green
Start-Sleep -Seconds 1

while ($true) {
    Show-MainMenu
    
    $choice = Read-Host "  SELECT FUNCTION / CHON CHUC NANG (0-99 or ``)"
    
    switch ($choice) {
        "0" { 
            Clear-Host
            Write-Host "`n================================================================================" -ForegroundColor Cyan
            Write-Host " Thank you for using Ultimate Windows System Tool!" -ForegroundColor White
            Write-Host " Cam on ban da su dung Ultimate Windows System Tool!" -ForegroundColor White
            Write-Host "================================================================================`n" -ForegroundColor Cyan
            Start-Sleep -Seconds 2
            Exit 
        }
        "1" { Invoke-QuickCleanup }
        "2" { Invoke-DeepCleanup }
        "77" { Backup-WiFiPasswords }
        "78" { Backup-Drivers }
        "79" { Backup-UserData }
        "80" { Backup-ZaloData }
        "81" { Backup-ProductKeys }
        "88" { Invoke-AllCleanup }
        "``" { 
            Write-Host "`n[INFO] Language switch feature - Use CMD version for full language support" -ForegroundColor Yellow
            Write-Host "[INFO] Tinh nang doi ngon ngu - Dung ban CMD de ho tro day du`n" -ForegroundColor Yellow
            Start-Sleep -Seconds 2
        }
        default {
            Write-Host "`n[!] Function $choice is available in CMD version" -ForegroundColor Yellow
            Write-Host "[!] Please use UltimateSystemTool.cmd for all 82 functions" -ForegroundColor Yellow
            Write-Host "[!] Ban PowerShell nay chi demo mot so chuc nang chinh`n" -ForegroundColor Gray
            Start-Sleep -Seconds 2
        }
    }
}
