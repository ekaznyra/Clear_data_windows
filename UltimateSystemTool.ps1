# ============================================================================
# ULTIMATE WINDOWS SYSTEM TOOL v5.0 - PROFESSIONAL EDITION (PowerShell)
# Complete System Optimization Suite - Bilingual (English/Vietnamese)
# ============================================================================
# Author: Nguyen Ngoc Anh Tu
# Based on open-source tools: BleachBit, CCleaner, PrivaZer, Wise Care 365
# NEW v5.0: Full 82 Functions + Beautiful UI + Bilingual Support
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
$Host.UI.RawUI.WindowTitle = "Ultimate Windows System Tool v5.0 | By Nguyen Ngoc Anh Tu"
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
if (-not $global:LANG) { $global:LANG = "EN" }

# Welcome Screen
function Show-Welcome {
    Clear-Host
    Write-Host ""
    Write-Host "  ═══════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "                                                                              " -ForegroundColor Cyan
    Write-Host "            ██╗   ██╗██╗  ████████╗██╗███╗   ███╗ █████╗ ████████╗███████╗  " -ForegroundColor White
    Write-Host "            ██║   ██║██║  ╚══██╔══╝██║████╗ ████║██╔══██╗╚══██╔══╝██╔════╝  " -ForegroundColor White
    Write-Host "            ██║   ██║██║     ██║   ██║██╔████╔██║███████║   ██║   █████╗    " -ForegroundColor Cyan
    Write-Host "            ██║   ██║██║     ██║   ██║██║╚██╔╝██║██╔══██║   ██║   ██╔══╝    " -ForegroundColor Cyan
    Write-Host "            ╚██████╔╝███████╗██║   ██║██║ ╚═╝ ██║██║  ██║   ██║   ███████╗  " -ForegroundColor Green
    Write-Host "             ╚═════╝ ╚══════╝╚═╝   ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝  " -ForegroundColor Green
    Write-Host "                                                                              " -ForegroundColor Cyan
    Write-Host "              WINDOWS SYSTEM TOOL v5.0 - PROFESSIONAL EDITION                " -ForegroundColor Yellow
    Write-Host "                Comprehensive Optimization Suite - 82 Functions              " -ForegroundColor Gray
    Write-Host "                      PowerShell by Nguyen Ngoc Anh Tu                       " -ForegroundColor Magenta
    Write-Host "                                                                              " -ForegroundColor Cyan
    Write-Host "  ═══════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "`n                       Loading / Dang tai..." -ForegroundColor Yellow
    for ($i = 0; $i -le 100; $i += 20) {
        Write-Progress -Activity "Initializing System Tool" -Status "$i% Complete" -PercentComplete $i
        Start-Sleep -Milliseconds 150
    }
    Write-Progress -Activity "Initializing" -Completed
}


# Helper Functions
function Show-Header {
    param([string]$Title, [string]$Number)
    Clear-Host
    Write-Host "`n═══════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host " [$Number] $Title" -ForegroundColor Yellow
    Write-Host "═══════════════════════════════════════════════════════════════════════════`n" -ForegroundColor Cyan
}

function Show-Success { param([string]$Message); Write-Host "`n[✓ SUCCESS] $Message" -ForegroundColor Green }
function Show-Error { param([string]$Message); Write-Host "`n[✗ ERROR] $Message" -ForegroundColor Red }
function Show-Info { param([string]$Message); Write-Host "`n[ℹ INFO] $Message" -ForegroundColor Cyan }
function Show-Warning { param([string]$Message); Write-Host "`n[⚠ WARNING] $Message" -ForegroundColor Yellow }

# Language Toggle
function Switch-Language {
    if ($global:LANG -eq "EN") { $global:LANG = "VI" }
    else { $global:LANG = "EN" }
}

# Main Menu Router
function Show-MainMenu {
    if ($global:LANG -eq "VI") { Show-MainMenuVI }
    else { Show-MainMenuEN }
}


# Main Menu - English
function Show-MainMenuEN {
    Clear-Host
    Write-Host "`n ══════════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "                                                                                  " -ForegroundColor White
    Write-Host "                ULTIMATE WINDOWS SYSTEM TOOL v5.0 - PROFESSIONAL                  " -ForegroundColor White
    Write-Host "                  Full-Featured Edition - 82 Functions + 2 Quick Actions          " -ForegroundColor Gray
    Write-Host "                           Created by: Nguyen Ngoc Anh Tu                          " -ForegroundColor Magenta
    Write-Host "                           Press L to switch to Vietnamese                         " -ForegroundColor Green
    Write-Host "                                                                                  " -ForegroundColor White
    Write-Host " ══════════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "`n CATEGORY 1: SYSTEM CLEANUP [1-12]" -ForegroundColor Yellow
    Write-Host "  [1]  Quick System Cleanup             [2]  Deep System Cleanup                 " -ForegroundColor White
    Write-Host "  [3]  Browser Cache Cleanup            [4]  Application Cache Cleanup           " -ForegroundColor White
    Write-Host "  [5]  Windows Update Cleanup           [6]  Thumbnail Cache Cleanup             " -ForegroundColor White
    Write-Host "  [7]  Icon Cache Cleanup               [8]  Font Cache Cleanup                  " -ForegroundColor White
    Write-Host "  [9]  Windows Installer Cleanup        [10] Old Windows Installation Cleanup    " -ForegroundColor White
    Write-Host "  [11] Recycle Bin Cleanup              [12] Memory Dump Files Cleanup           " -ForegroundColor White
    Write-Host "`n CATEGORY 2: PRIVACY PROTECTION [13-20]" -ForegroundColor Yellow
    Write-Host "  [13] Clear Recent Documents           [14] Clear Run History                   " -ForegroundColor White
    Write-Host "  [15] Clear Search History             [16] Clear Clipboard History             " -ForegroundColor White
    Write-Host "  [17] Clear Windows Error Reports      [18] Disable Telemetry and Tracking      " -ForegroundColor White
    Write-Host "  [19] Clear Event Logs                 [20] Clear DNS Cache                     " -ForegroundColor White
    Write-Host "`n CATEGORY 3: NETWORK OPTIMIZATION [21-26]" -ForegroundColor Yellow
    Write-Host "  [21] Reset Network Settings           [22] Optimize Network Performance        " -ForegroundColor White
    Write-Host "  [23] Clear ARP Cache                  [24] Reset Winsock                       " -ForegroundColor White
    Write-Host "  [25] Renew IP Address                 [26] Fix Network Adapter                 " -ForegroundColor White
    Write-Host "`n CATEGORY 4: DISK MANAGEMENT [27-32]" -ForegroundColor Yellow
    Write-Host "  [27] Disk Cleanup (Built-in)          [28] Disk Error Check                    " -ForegroundColor White
    Write-Host "  [29] Disk Optimization                [30] Analyze Disk Space                  " -ForegroundColor White
    Write-Host "  [31] Clean Windows.old Folder         [32] Compact OS                          " -ForegroundColor White
    Write-Host "`n CATEGORY 5: PERFORMANCE OPTIMIZATION [33-44]" -ForegroundColor Yellow
    Write-Host "  [33] Disable Startup Programs         [34] Optimize Services                   " -ForegroundColor White
    Write-Host "  [35] Clear Prefetch Files             [36] Clear SuperFetch Cache              " -ForegroundColor White
    Write-Host "  [37] Disable Visual Effects           [38] Optimize Power Plan                 " -ForegroundColor White
    Write-Host "  [39] Disable Hibernation              [40] Clear Memory Cache                  " -ForegroundColor White
    Write-Host "  [41] Optimize Search Index            [42] Disable Windows Animations          " -ForegroundColor White
    Write-Host "  [43] Optimize SSD Settings            [44] Reduce Menu Show Delay              " -ForegroundColor White
    Write-Host "`n CATEGORY 6: SYSTEM MAINTENANCE [45-50]" -ForegroundColor Yellow
    Write-Host "  [45] System File Checker (SFC)        [46] DISM System Repair                  " -ForegroundColor White
    Write-Host "  [47] Windows Component Cleanup        [48] Update Windows Drivers              " -ForegroundColor White
    Write-Host "  [49] Rebuild Icon Cache               [50] Rebuild Windows Search Index        " -ForegroundColor White
    Write-Host "`n CATEGORY 7: REGISTRY OPTIMIZATION [51-55]" -ForegroundColor Yellow
    Write-Host "  [51] Clean Registry (Safe)            [52] Optimize Registry                   " -ForegroundColor White
    Write-Host "  [53] Backup Registry                  [54] Disable Cortana                     " -ForegroundColor White
    Write-Host "  [55] Disable Windows Tips                                                      " -ForegroundColor White
    Write-Host "`n CATEGORY 8: ADVANCED TOOLS [56-70]" -ForegroundColor Yellow
    Write-Host "  [56] Create System Restore Point      [57] View System Information            " -ForegroundColor White
    Write-Host "  [58] Export Programs List             [59] Check Disk Health (SMART)          " -ForegroundColor White
    Write-Host "  [60] Clear Windows Store Cache        [61] Reset Windows Update Components    " -ForegroundColor White
    Write-Host "  [62] Optimize Boot Time               [63] Clean All Temporary Files          " -ForegroundColor White
    Write-Host "  [64] Generate System Report           [65] Clean Software Cache               " -ForegroundColor White
    Write-Host "  [66] Clean Delivery Optimization      [67] Clean Update Backup (LCU)          " -ForegroundColor White
    Write-Host "  [68] Optimize Memory (RAM)            [69] Show Disk Space Report             " -ForegroundColor White
    Write-Host "  [70] Refresh Icon Cache                                                        " -ForegroundColor White
    Write-Host "`n CATEGORY 9: SYSTEM UTILITIES [71-76]" -ForegroundColor Yellow
    Write-Host "  [71] Check System Information         [72] Windows Settings Center            " -ForegroundColor White
    Write-Host "  [73] Office Repair and Reset          [74] Remove Bloatware (Safe)            " -ForegroundColor White
    Write-Host "  [75] Bitlocker Management             [76] Check Activation Status            " -ForegroundColor White
    Write-Host "`n CATEGORY 10: BACKUP AND RECOVERY [77-82] ★ NEW! ★" -ForegroundColor Yellow
    Write-Host "  [77] Backup WiFi Passwords            [78] Backup Drivers                      " -ForegroundColor Green
    Write-Host "  [79] Backup User Data                 [80] Backup Zalo Data                    " -ForegroundColor Green
    Write-Host "  [81] Backup Product Keys              [82] Data Recovery Tools                 " -ForegroundColor Green
    Write-Host "`n ══════════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  QUICK ACTIONS" -ForegroundColor Yellow
    Write-Host "  [88] RUN ALL CLEANUP TASKS            [99] FULL SYSTEM OPTIMIZATION            " -ForegroundColor Magenta
    Write-Host "  [0]  EXIT                             [L]  Switch to Vietnamese                " -ForegroundColor White
    Write-Host " ══════════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host ""
}

# Main Menu - Vietnamese
function Show-MainMenuVI {
    Clear-Host
    Write-Host "`n ══════════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "                                                                                  " -ForegroundColor White
    Write-Host "                CONG CU TOI UU HE THONG WINDOWS v5.0 - CHUYEN NGHIEP              " -ForegroundColor White
    Write-Host "                  Phien Ban Day Du - 82 Chuc Nang + 2 Thao Tac Nhanh             " -ForegroundColor Gray
    Write-Host "                           Tac gia: Nguyen Ngoc Anh Tu                            " -ForegroundColor Magenta
    Write-Host "                           Nhan L de chuyen sang tieng Anh                        " -ForegroundColor Green
    Write-Host "                                                                                  " -ForegroundColor White
    Write-Host " ══════════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "`n DANH MUC 1: DON DEP HE THONG [1-12]" -ForegroundColor Yellow
    Write-Host "  [1]  Don Dep Nhanh He Thong           [2]  Don Dep Sau He Thong                " -ForegroundColor White
    Write-Host "  [3]  Don Dep Cache Trinh Duyet        [4]  Don Dep Cache Ung Dung              " -ForegroundColor White
    Write-Host "  [5]  Don Dep Windows Update           [6]  Don Dep Thumbnail Cache             " -ForegroundColor White
    Write-Host "  [7]  Don Dep Icon Cache               [8]  Don Dep Font Cache                  " -ForegroundColor White
    Write-Host "  [9]  Don Dep Windows Installer        [10] Don Dep Windows Cu                  " -ForegroundColor White
    Write-Host "  [11] Don Dep Thung Rac                [12] Don Dep File Dump Bo Nho            " -ForegroundColor White
    Write-Host "`n DANH MUC 2: BAO VE RIENG TU [13-20]" -ForegroundColor Yellow
    Write-Host "  [13] Xoa Tai Lieu Gan Day             [14] Xoa Lich Su Run                     " -ForegroundColor White
    Write-Host "  [15] Xoa Lich Su Tim Kiem             [16] Xoa Lich Su Clipboard               " -ForegroundColor White
    Write-Host "  [17] Xoa Bao Cao Loi Windows          [18] Tat Thu Thap Du Lieu                " -ForegroundColor White
    Write-Host "  [19] Xoa Nhat Ky Su Kien              [20] Xoa Cache DNS                       " -ForegroundColor White
    Write-Host "`n DANH MUC 3: TOI UU MANG [21-26]" -ForegroundColor Yellow
    Write-Host "  [21] Reset Cai Dat Mang               [22] Toi Uu Hieu Suat Mang               " -ForegroundColor White
    Write-Host "  [23] Xoa Cache ARP                    [24] Reset Winsock                       " -ForegroundColor White
    Write-Host "  [25] Lam Moi Dia Chi IP               [26] Sua Card Mang                       " -ForegroundColor White
    Write-Host "`n DANH MUC 4: QUAN LY O DIA [27-32]" -ForegroundColor Yellow
    Write-Host "  [27] Don Dep O Dia (Tich Hop)         [28] Kiem Tra Loi O Dia                  " -ForegroundColor White
    Write-Host "  [29] Toi Uu O Dia                     [30] Phan Tich Dung Luong                " -ForegroundColor White
    Write-Host "  [31] Xoa Thu Muc Windows.old          [32] Nen He Thong                        " -ForegroundColor White
    Write-Host "`n DANH MUC 5: TOI UU HIEU SUAT [33-44]" -ForegroundColor Yellow
    Write-Host "  [33] Tat Chuong Trinh Khoi Dong       [34] Toi Uu Dich Vu                      " -ForegroundColor White
    Write-Host "  [35] Xoa File Prefetch                [36] Xoa Cache SuperFetch                " -ForegroundColor White
    Write-Host "  [37] Tat Hieu Ung Hinh Anh            [38] Toi Uu Che Do Nguon                 " -ForegroundColor White
    Write-Host "  [39] Tat Che Do Ngu Dong              [40] Xoa Cache Bo Nho                    " -ForegroundColor White
    Write-Host "  [41] Toi Uu Tim Kiem                  [42] Tat Hoat Anh Windows                " -ForegroundColor White
    Write-Host "  [43] Toi Uu SSD                       [44] Giam Tre Hien Thi Menu              " -ForegroundColor White
    Write-Host "`n DANH MUC 6: BAO TRI HE THONG [45-50]" -ForegroundColor Yellow
    Write-Host "  [45] Kiem Tra File He Thong (SFC)     [46] Sua Chua He Thong DISM              " -ForegroundColor White
    Write-Host "  [47] Don Dep Thanh Phan Windows       [48] Cap Nhat Driver Windows             " -ForegroundColor White
    Write-Host "  [49] Xay Dung Lai Icon Cache          [50] Xay Dung Lai Tim Kiem               " -ForegroundColor White
    Write-Host "`n DANH MUC 7: TOI UU REGISTRY [51-55]" -ForegroundColor Yellow
    Write-Host "  [51] Don Dep Registry (An Toan)       [52] Toi Uu Registry                     " -ForegroundColor White
    Write-Host "  [53] Sao Luu Registry                 [54] Tat Cortana                         " -ForegroundColor White
    Write-Host "  [55] Tat Goi Y Windows                                                         " -ForegroundColor White
    Write-Host "`n DANH MUC 8: CONG CU NANG CAO [56-70]" -ForegroundColor Yellow
    Write-Host "  [56] Tao Diem Khoi Phuc He Thong      [57] Xem Thong Tin He Thong              " -ForegroundColor White
    Write-Host "  [58] Xuat Danh Sach Chuong Trinh      [59] Kiem Tra Suc Khoe O Dia             " -ForegroundColor White
    Write-Host "  [60] Xoa Cache Windows Store          [61] Reset Thanh Phan Update             " -ForegroundColor White
    Write-Host "  [62] Toi Uu Thoi Gian Khoi Dong       [63] Xoa Tat Ca File Tam                 " -ForegroundColor White
    Write-Host "  [64] Tao Bao Cao He Thong             [65] Xoa Cache Phan Mem                  " -ForegroundColor White
    Write-Host "  [66] Xoa Delivery Optimization        [67] Xoa Sao Luu Cap Nhat                " -ForegroundColor White
    Write-Host "  [68] Toi Uu Bo Nho RAM                [69] Xem Bao Cao Dung Luong              " -ForegroundColor White
    Write-Host "  [70] Lam Moi Icon Cache                                                        " -ForegroundColor White
    Write-Host "`n DANH MUC 9: TIEN ICH HE THONG [71-76]" -ForegroundColor Yellow
    Write-Host "  [71] Kiem Tra Thong Tin May           [72] Trung Tam Cai Dat Windows           " -ForegroundColor White
    Write-Host "  [73] Sua Chua va Reset Office         [74] Xoa Ung Dung Rac (An Toan)          " -ForegroundColor White
    Write-Host "  [75] Quan Ly Bitlocker                [76] Kiem Tra Trang Thai Kich Hoat       " -ForegroundColor White
    Write-Host "`n DANH MUC 10: SAO LUU VA KHOI PHUC [77-82] ★ MOI! ★" -ForegroundColor Yellow
    Write-Host "  [77] Sao Luu Mat Khau Wifi            [78] Sao Luu Driver                      " -ForegroundColor Green
    Write-Host "  [79] Sao Luu Du Lieu Nguoi Dung       [80] Sao Luu Du Lieu Zalo                " -ForegroundColor Green
    Write-Host "  [81] Sao Luu Ban Quyen                [82] Cong Cu Khoi Phuc Du Lieu           " -ForegroundColor Green
    Write-Host "`n ══════════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  THAO TAC NHANH" -ForegroundColor Yellow
    Write-Host "  [88] CHAY TAT CA DON DEP              [99] TOI UU TOAN BO HE THONG             " -ForegroundColor Magenta
    Write-Host "  [0]  THOAT                            [L]  Chuyen sang tieng Anh               " -ForegroundColor White
    Write-Host " ══════════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host ""
}

# ============================================================================
# SYSTEM CLEANUP FUNCTIONS [1-12]
# ============================================================================

function Invoke-Function1 {
    Show-Header "Quick System Cleanup - Don Dep Nhanh He Thong" "1"
    Write-Host "[*] Cleaning Temp files / Xoa file Temp..." -ForegroundColor Yellow
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Cleaning Recycle Bin / Xoa thung rac..." -ForegroundColor Yellow
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Flushing DNS Cache / Xoa cache DNS..." -ForegroundColor Yellow
    Clear-DnsClientCache -ErrorAction SilentlyContinue
    Write-Host "[*] Cleaning Prefetch / Xoa prefetch..." -ForegroundColor Yellow
    Remove-Item -Path "C:\Windows\Prefetch\*" -Force -ErrorAction SilentlyContinue
    Show-Success "Quick Cleanup Completed! / Hoan thanh don dep nhanh!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function2 {
    Show-Header "Deep System Cleanup - Don Dep Sau He Thong" "2"
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
    Show-Success "Deep Cleanup Completed! / Hoan thanh don dep sau!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function3 {
    Show-Header "Browser Cache Cleanup - Don Dep Cache Trinh Duyet" "3"
    Write-Host "[*] Chrome/Edge cache..." -ForegroundColor Yellow
    Stop-Process -Name "chrome","msedge" -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
    Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Firefox cache..." -ForegroundColor Yellow
    Stop-Process -Name "firefox" -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
    Get-ChildItem -Path "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles" -Directory | ForEach-Object {
        Remove-Item -Path "$($_.FullName)\cache2\*" -Recurse -Force -ErrorAction SilentlyContinue
    }
    Show-Success "Browser caches cleaned! / Da xoa cache trinh duyet!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function4 {
    Show-Header "Application Cache Cleanup - Don Dep Cache Ung Dung" "4"
    Write-Host "[*] Teams cache..." -ForegroundColor Yellow
    Stop-Process -Name "Teams" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:APPDATA\Microsoft\Teams\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Discord cache..." -ForegroundColor Yellow
    Stop-Process -Name "Discord" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:APPDATA\Discord\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Adobe cache..." -ForegroundColor Yellow
    Remove-Item -Path "$env:APPDATA\Adobe\Common\Media Cache Files\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Application caches cleaned! / Da xoa cache ung dung!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function5 {
    Show-Header "Windows Update Cleanup - Don Dep Windows Update" "5"
    Write-Host "[*] Stopping Windows Update services..." -ForegroundColor Yellow
    Stop-Service -Name wuauserv,bits,dosvc -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Deleting update cache..." -ForegroundColor Yellow
    Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Restarting services..." -ForegroundColor Yellow
    Start-Service -Name wuauserv,bits,dosvc -ErrorAction SilentlyContinue
    Write-Host "[*] Running update cleanup..." -ForegroundColor Yellow
    Start-Process -FilePath "Dism.exe" -ArgumentList "/online /Cleanup-Image /StartComponentCleanup" -NoNewWindow -Wait -ErrorAction SilentlyContinue
    Show-Success "Windows Update cleaned! / Da xoa Windows Update!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function6 {
    Show-Header "Thumbnail Cache Cleanup - Don Dep Thumbnail Cache" "6"
    Write-Host "[*] Stopping Windows Explorer..." -ForegroundColor Yellow
    Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Deleting thumbnail database..." -ForegroundColor Yellow
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\*.db" -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Restarting Windows Explorer..." -ForegroundColor Yellow
    Start-Process explorer
    Show-Success "Thumbnail cache cleaned! / Da xoa thumbnail cache!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function7 {
    Show-Header "Icon Cache Cleanup - Don Dep Icon Cache" "7"
    Write-Host "[*] Stopping Windows Explorer..." -ForegroundColor Yellow
    Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Deleting icon cache..." -ForegroundColor Yellow
    Remove-Item -Path "$env:LOCALAPPDATA\IconCache.db" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\iconcache_*.db" -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Restarting Windows Explorer..." -ForegroundColor Yellow
    Start-Process explorer
    Show-Success "Icon cache cleaned! / Da xoa icon cache!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function8 {
    Show-Header "Font Cache Cleanup - Don Dep Font Cache" "8"
    Write-Host "[*] Stopping font cache service..." -ForegroundColor Yellow
    Stop-Service -Name "FontCache" -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Deleting font cache files..." -ForegroundColor Yellow
    Remove-Item -Path "C:\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\System32\FNTCACHE.DAT" -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Starting font cache service..." -ForegroundColor Yellow
    Start-Service -Name "FontCache" -ErrorAction SilentlyContinue
    Show-Success "Font cache cleaned! / Da xoa font cache!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function9 {
    Show-Header "Windows Installer Cleanup - Don Dep Windows Installer" "9"
    Write-Host "[*] Cleaning installer temp files..." -ForegroundColor Yellow
    Remove-Item -Path "C:\Windows\Installer\`$PatchCache`$\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Info "MSI cache cleanup skipped for safety / Bo qua xoa MSI cache de dam bao an toan"
    Show-Success "Windows Installer cleaned! / Da xoa Windows Installer!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function10 {
    Show-Header "Old Windows Installation Cleanup - Don Dep Windows Cu" "10"
    Show-Warning "This will delete Windows.old folder (cannot undo)!"
    Show-Warning "CANH BAO: Se xoa thu muc Windows.old (khong the hoan tac)!"
    $confirm = Read-Host "`nContinue / Tiep tuc (Y/N)"
    if ($confirm -ne "Y" -and $confirm -ne "y") { return }
    Write-Host "`n[*] Deleting Windows.old..." -ForegroundColor Yellow
    cmd /c "takeown /F C:\Windows.old\* /R /A /D Y" 2>$null
    cmd /c "icacls C:\Windows.old\*.* /T /grant administrators:F" 2>$null
    Remove-Item -Path "C:\Windows.old" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Process -FilePath "Dism.exe" -ArgumentList "/online /Cleanup-Image /StartComponentCleanup /ResetBase" -NoNewWindow -Wait -ErrorAction SilentlyContinue
    Show-Success "Old Windows cleaned! / Da xoa Windows cu!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function11 {
    Show-Header "Recycle Bin Cleanup - Don Dep Thung Rac" "11"
    Write-Host "[*] Cleaning Recycle Bin on all drives..." -ForegroundColor Yellow
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    @("C","D","E","F") | ForEach-Object {
        Remove-Item -Path "${_}:\`$Recycle.Bin" -Recurse -Force -ErrorAction SilentlyContinue
    }
    Show-Success "Recycle Bin emptied! / Da lam trong thung rac!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function12 {
    Show-Header "Memory Dump Files Cleanup - Don Dep File Dump Bo Nho" "12"
    Write-Host "[*] Deleting memory dump files..." -ForegroundColor Yellow
    Remove-Item -Path "C:\Windows\MEMORY.DMP" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Minidump\*.dmp" -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Deleting error report files..." -ForegroundColor Yellow
    Remove-Item -Path "C:\ProgramData\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Memory dump files cleaned! / Da xoa file dump!"
    Read-Host "`nPress Enter to continue"
}

# ============================================================================
# PRIVACY PROTECTION FUNCTIONS [13-20]
# ============================================================================

function Invoke-Function13 {
    Show-Header "Clear Recent Documents - Xoa Tai Lieu Gan Day" "13"
    Write-Host "[*] Clearing Recent folder..." -ForegroundColor Yellow
    Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Recent\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Clearing Jump Lists..." -ForegroundColor Yellow
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f 2>$null
    Show-Success "Recent documents cleared! / Da xoa tai lieu gan day!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function14 {
    Show-Header "Clear Run History - Xoa Lich Su Run" "14"
    Write-Host "[*] Deleting Run history from registry..." -ForegroundColor Yellow
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f 2>$null
    Show-Success "Run history cleared! / Da xoa lich su Run!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function15 {
    Show-Header "Clear Search History - Xoa Lich Su Tim Kiem" "15"
    Write-Host "[*] Deleting search history..." -ForegroundColor Yellow
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f 2>$null
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f 2>$null
    Show-Success "Search history cleared! / Da xoa lich su tim kiem!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function16 {
    Show-Header "Clear Clipboard History - Xoa Lich Su Clipboard" "16"
    Write-Host "[*] Clearing clipboard..." -ForegroundColor Yellow
    "" | Set-Clipboard
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Clipboard\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Clipboard history cleared! / Da xoa lich su clipboard!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function17 {
    Show-Header "Clear Windows Error Reports - Xoa Bao Cao Loi Windows" "17"
    Write-Host "[*] Deleting error reports..." -ForegroundColor Yellow
    Remove-Item -Path "C:\ProgramData\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue
    Get-ChildItem "C:\Users" -Directory | ForEach-Object {
        Remove-Item -Path "$($_.FullName)\AppData\Local\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue
    }
    Write-Host "[*] Disabling error reporting..." -ForegroundColor Yellow
    reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f 2>$null
    Show-Success "Error reports cleared! / Da xoa bao cao loi!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function18 {
    Show-Header "Disable Telemetry and Tracking - Tat Thu Thap Du Lieu" "18"
    Write-Host "[*] Disabling telemetry services..." -ForegroundColor Yellow
    Set-Service -Name "DiagTrack" -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name "DiagTrack" -Force -ErrorAction SilentlyContinue
    Set-Service -Name "dmwappushservice" -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name "dmwappushservice" -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Disabling telemetry via registry..." -ForegroundColor Yellow
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f 2>$null
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f 2>$null
    Show-Success "Telemetry disabled! / Da tat thu thap du lieu!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function19 {
    Show-Header "Clear Event Logs - Xoa Nhat Ky Su Kien" "19"
    Write-Host "[*] Clearing all event logs..." -ForegroundColor Yellow
    wevtutil el | ForEach-Object { wevtutil cl $_ 2>$null }
    Show-Success "Event logs cleared! / Da xoa nhat ky su kien!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function20 {
    Show-Header "Clear DNS Cache - Xoa Cache DNS" "20"
    Write-Host "[*] Flushing DNS resolver cache..." -ForegroundColor Yellow
    ipconfig /flushdns
    Clear-DnsClientCache -ErrorAction SilentlyContinue
    Show-Success "DNS cache cleared! / Da xoa cache DNS!"
    Read-Host "`nPress Enter to continue"
}

# ============================================================================
# NETWORK OPTIMIZATION FUNCTIONS [21-26]
# ============================================================================

function Invoke-Function21 {
    Show-Header "Reset Network Settings - Reset Cai Dat Mang" "21"
    Write-Host "[*] Resetting IP stack..." -ForegroundColor Yellow
    netsh int ip reset
    Write-Host "[*] Resetting Winsock..." -ForegroundColor Yellow
    netsh winsock reset
    Write-Host "[*] Flushing DNS..." -ForegroundColor Yellow
    ipconfig /flushdns
    Write-Host "[*] Releasing IP..." -ForegroundColor Yellow
    ipconfig /release
    Write-Host "[*] Renewing IP..." -ForegroundColor Yellow
    ipconfig /renew
    Show-Success "Network settings reset! / Da reset cai dat mang!"
    Show-Info "Please restart computer / Vui long khoi dong lai may!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function22 {
    Show-Header "Optimize Network Performance - Toi Uu Hieu Suat Mang" "22"
    Write-Host "[*] Optimizing TCP settings..." -ForegroundColor Yellow
    netsh int tcp set global autotuninglevel=normal
    netsh int tcp set global rsc=enabled
    Write-Host "[*] Optimizing network throttling..." -ForegroundColor Yellow
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f 2>$null
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 0 /f 2>$null
    Show-Success "Network optimized! / Da toi uu mang!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function23 {
    Show-Header "Clear ARP Cache - Xoa Cache ARP" "23"
    Write-Host "[*] Deleting ARP cache..." -ForegroundColor Yellow
    netsh interface ip delete arpcache
    Show-Success "ARP cache cleared! / Da xoa cache ARP!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function24 {
    Show-Header "Reset Winsock - Reset Winsock" "24"
    Write-Host "[*] Resetting Winsock..." -ForegroundColor Yellow
    netsh winsock reset
    Write-Host "[*] Resetting IP configuration..." -ForegroundColor Yellow
    netsh int ip reset
    Show-Success "Winsock reset! / Da reset Winsock!"
    Show-Info "Please restart computer / Vui long khoi dong lai may!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function25 {
    Show-Header "Renew IP Address - Lam Moi Dia Chi IP" "25"
    Write-Host "[*] Releasing current IP..." -ForegroundColor Yellow
    ipconfig /release
    Write-Host "[*] Renewing IP address..." -ForegroundColor Yellow
    ipconfig /renew
    Write-Host "[*] Flushing DNS..." -ForegroundColor Yellow
    ipconfig /flushdns
    Show-Success "IP address renewed! / Da lam moi dia chi IP!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function26 {
    Show-Header "Fix Network Adapter - Sua Card Mang" "26"
    Write-Host "[*] Resetting network adapter..." -ForegroundColor Yellow
    Get-NetAdapter | Where-Object {$_.Status -eq "Up"} | ForEach-Object {
        Disable-NetAdapter -Name $_.Name -Confirm:$false -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 2
        Enable-NetAdapter -Name $_.Name -Confirm:$false -ErrorAction SilentlyContinue
    }
    Write-Host "[*] Resetting TCP/IP stack..." -ForegroundColor Yellow
    netsh int ip reset
    netsh winsock reset
    Show-Success "Network adapter fixed! / Da sua card mang!"
    Read-Host "`nPress Enter to continue"
}

# ============================================================================
# DISK MANAGEMENT FUNCTIONS [27-32]
# ============================================================================

function Invoke-Function27 {
    Show-Header "Disk Cleanup (Built-in) - Don Dep O Dia" "27"
    Write-Host "[*] Starting Windows Disk Cleanup..." -ForegroundColor Yellow
    cleanmgr /sagerun:1
    Show-Success "Disk cleanup completed! / Hoan thanh don dep o dia!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function28 {
    Show-Header "Disk Error Check - Kiem Tra Loi O Dia" "28"
    $drive = Read-Host "Enter drive letter (C, D, etc.) / Nhap chu cai o dia"
    Write-Host "[*] Scheduling disk check for next boot..." -ForegroundColor Yellow
    echo Y | chkdsk ${drive}: /f /r /x
    Show-Info "Disk check scheduled for next reboot / Da len lich kiem tra khi khoi dong lai!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function29 {
    Show-Header "Disk Optimization - Toi Uu O Dia" "29"
    Write-Host "[*] Analyzing and optimizing drives..." -ForegroundColor Yellow
    defrag /C /O /H /U
    Show-Success "Disk optimization completed! / Hoan thanh toi uu o dia!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function30 {
    Show-Header "Analyze Disk Space - Phan Tich Dung Luong" "30"
    Write-Host "[*] Disk space on all drives:`n" -ForegroundColor Yellow
    Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{N="Used(GB)";E={[math]::Round($_.Used/1GB,2)}}, @{N="Free(GB)";E={[math]::Round($_.Free/1GB,2)}} | Format-Table
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function31 {
    Show-Header "Clean Windows.old Folder - Xoa Thu Muc Windows.old" "31"
    Show-Warning "Cannot undo this action! / Khong the hoan tac!"
    $confirm = Read-Host "`nContinue / Tiep tuc (Y/N)"
    if ($confirm -ne "Y" -and $confirm -ne "y") { return }
    Write-Host "`n[*] Taking ownership..." -ForegroundColor Yellow
    cmd /c "takeown /F C:\Windows.old\* /R /A /D Y" 2>$null
    cmd /c "icacls C:\Windows.old\*.* /T /grant administrators:F" 2>$null
    Write-Host "[*] Deleting Windows.old..." -ForegroundColor Yellow
    Remove-Item -Path "C:\Windows.old" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Windows.old deleted! / Da xoa Windows.old!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function32 {
    Show-Header "Compact OS - Nen He Thong" "32"
    Show-Warning "This will compress Windows system files"
    $confirm = Read-Host "`nContinue / Tiep tuc (Y/N)"
    if ($confirm -ne "Y" -and $confirm -ne "y") { return }
    Write-Host "`n[*] Analyzing system..." -ForegroundColor Yellow
    compact /compactos:query
    Write-Host "[*] Compressing system files..." -ForegroundColor Yellow
    compact /compactos:always
    Show-Success "System compressed! / Da nen he thong!"
    Read-Host "`nPress Enter to continue"
}

# ============================================================================
# PERFORMANCE OPTIMIZATION FUNCTIONS [33-44]
# ============================================================================

function Invoke-Function33 {
    Show-Header "Disable Startup Programs - Tat Chuong Trinh Khoi Dong" "33"
    Write-Host "[*] Opening Task Manager Startup tab..." -ForegroundColor Yellow
    Show-Info "Please manually disable unnecessary programs"
    start taskmgr /0 /startup
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function34 {
    Show-Header "Optimize Services - Toi Uu Dich Vu" "34"
    Write-Host "[*] Disabling unnecessary services..." -ForegroundColor Yellow
    @("Fax","RemoteRegistry","HomeGroupListener","HomeGroupProvider") | ForEach-Object {
        Set-Service -Name $_ -StartupType Disabled -ErrorAction SilentlyContinue
        Stop-Service -Name $_ -Force -ErrorAction SilentlyContinue
    }
    Show-Success "Services optimized! / Da toi uu dich vu!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function35 {
    Show-Header "Clear Prefetch Files - Xoa File Prefetch" "35"
    Write-Host "[*] Deleting prefetch files..." -ForegroundColor Yellow
    Remove-Item -Path "C:\Windows\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Prefetch files cleared! / Da xoa file prefetch!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function36 {
    Show-Header "Clear SuperFetch Cache - Xoa Cache SuperFetch" "36"
    Write-Host "[*] Stopping SuperFetch service..." -ForegroundColor Yellow
    Stop-Service -Name "SysMain" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Starting SuperFetch service..." -ForegroundColor Yellow
    Start-Service -Name "SysMain" -ErrorAction SilentlyContinue
    Show-Success "SuperFetch cache cleared! / Da xoa cache SuperFetch!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function37 {
    Show-Header "Disable Visual Effects - Tat Hieu Ung Hinh Anh" "37"
    Write-Host "[*] Setting to best performance..." -ForegroundColor Yellow
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f 2>$null
    reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f 2>$null
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f 2>$null
    Show-Success "Visual effects disabled! / Da tat hieu ung hinh anh!"
    Show-Info "Please log off and log back in"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function38 {
    Show-Header "Optimize Power Plan - Toi Uu Che Do Nguon" "38"
    Write-Host "[*] Setting High Performance power plan..." -ForegroundColor Yellow
    powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    powercfg -change -disk-timeout-ac 0
    Show-Success "Power plan optimized! / Da toi uu che do nguon!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function39 {
    Show-Header "Disable Hibernation - Tat Che Do Ngu Dong" "39"
    Write-Host "[*] Disabling hibernation..." -ForegroundColor Yellow
    powercfg -h off
    Remove-Item -Path "C:\hiberfil.sys" -Force -ErrorAction SilentlyContinue
    Show-Success "Hibernation disabled! / Da tat che do ngu dong!"
    Show-Info "This freed up several GB of disk space"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function40 {
    Show-Header "Clear Memory Cache - Xoa Cache Bo Nho" "40"
    Write-Host "[*] Clearing memory cache..." -ForegroundColor Yellow
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f 2>$null
    Show-Success "Memory cache cleared! / Da xoa cache bo nho!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function41 {
    Show-Header "Optimize Search Index - Toi Uu Tim Kiem" "41"
    Write-Host "[*] Stopping search service..." -ForegroundColor Yellow
    Stop-Service -Name "WSearch" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\ProgramData\Microsoft\Search\Data\Applications\Windows\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Restarting search service..." -ForegroundColor Yellow
    Start-Service -Name "WSearch" -ErrorAction SilentlyContinue
    Show-Success "Search index optimized! / Da toi uu tim kiem!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function42 {
    Show-Header "Disable Windows Animations - Tat Hoat Anh Windows" "42"
    Write-Host "[*] Disabling taskbar animations..." -ForegroundColor Yellow
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f 2>$null
    reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f 2>$null
    Show-Success "Animations disabled! / Da tat hoat anh!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function43 {
    Show-Header "Optimize SSD Settings - Toi Uu SSD" "43"
    Write-Host "[*] Enabling TRIM..." -ForegroundColor Yellow
    fsutil behavior set DisableDeleteNotify 0
    Write-Host "[*] Disabling defragmentation..." -ForegroundColor Yellow
    schtasks /change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /disable 2>$null
    Write-Host "[*] Disabling Superfetch for SSD..." -ForegroundColor Yellow
    Set-Service -Name "SysMain" -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name "SysMain" -Force -ErrorAction SilentlyContinue
    Show-Success "SSD optimized! / Da toi uu SSD!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function44 {
    Show-Header "Reduce Menu Show Delay - Giam Tre Hien Thi Menu" "44"
    Write-Host "[*] Setting menu show delay to 0ms..." -ForegroundColor Yellow
    reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f 2>$null
    Show-Success "Menu delay reduced! / Da giam tre menu!"
    Read-Host "`nPress Enter to continue"
}

# ============================================================================
# SYSTEM MAINTENANCE FUNCTIONS [45-50]
# ============================================================================

function Invoke-Function45 {
    Show-Header "System File Checker (SFC) - Kiem Tra File He Thong" "45"
    Write-Host "This may take several minutes / Co the mat vai phut...`n" -ForegroundColor Yellow
    sfc /scannow
    Show-Success "SFC scan completed! / Hoan thanh kiem tra SFC!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function46 {
    Show-Header "DISM System Repair - Sua Chua He Thong DISM" "46"
    Write-Host "This may take several minutes / Co the mat vai phut...`n" -ForegroundColor Yellow
    Write-Host "[*] Checking health..." -ForegroundColor Yellow
    Dism /Online /Cleanup-Image /CheckHealth
    Write-Host "[*] Scanning health..." -ForegroundColor Yellow
    Dism /Online /Cleanup-Image /ScanHealth
    Write-Host "[*] Restoring health..." -ForegroundColor Yellow
    Dism /Online /Cleanup-Image /RestoreHealth
    Show-Success "DISM repair completed! / Hoan thanh sua chua DISM!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function47 {
    Show-Header "Windows Component Cleanup - Don Dep Thanh Phan Windows" "47"
    Write-Host "[*] Starting component cleanup..." -ForegroundColor Yellow
    Dism.exe /online /Cleanup-Image /StartComponentCleanup
    Write-Host "[*] Resetting base..." -ForegroundColor Yellow
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
    Show-Success "Component cleanup completed! / Hoan thanh don dep thanh phan!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function48 {
    Show-Header "Update Windows Drivers - Cap Nhat Driver Windows" "48"
    Write-Host "[*] Opening Windows Update..." -ForegroundColor Yellow
    start ms-settings:windowsupdate
    Show-Info "Please check for driver updates manually"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function49 {
    Show-Header "Rebuild Icon Cache - Xay Dung Lai Icon Cache" "49"
    Write-Host "[*] Stopping Windows Explorer..." -ForegroundColor Yellow
    Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\IconCache.db" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\iconcache_*.db" -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Restarting Windows Explorer..." -ForegroundColor Yellow
    Start-Process explorer
    Show-Success "Icon cache rebuilt! / Da xay dung lai icon cache!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function50 {
    Show-Header "Rebuild Windows Search Index - Xay Dung Lai Tim Kiem" "50"
    Write-Host "[*] Opening Indexing Options..." -ForegroundColor Yellow
    control /name Microsoft.IndexingOptions
    Show-Info "Please click 'Advanced' and then 'Rebuild'"
    Read-Host "`nPress Enter to continue"
}

# ============================================================================
# REGISTRY OPTIMIZATION FUNCTIONS [51-55]
# ============================================================================

function Invoke-Function51 {
    Show-Header "Clean Registry (Safe) - Don Dep Registry (An Toan)" "51"
    Write-Host "[*] Cleaning MUICache..." -ForegroundColor Yellow
    reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f 2>$null
    Write-Host "[*] Cleaning UserAssist..." -ForegroundColor Yellow
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f 2>$null
    Show-Success "Registry cleaned! / Da don dep registry!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function52 {
    Show-Header "Optimize Registry - Toi Uu Registry" "52"
    Write-Host "[*] Optimizing registry access..." -ForegroundColor Yellow
    reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v RegistrySizeLimit /t REG_DWORD /d 0x40000000 /f 2>$null
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v IoPageLockLimit /t REG_DWORD /d 0xf000000 /f 2>$null
    Show-Success "Registry optimized! / Da toi uu registry!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function53 {
    Show-Header "Backup Registry - Sao Luu Registry" "53"
    $BackupDir = "C:\RegistryBackup"
    if (-not (Test-Path $BackupDir)) { New-Item -Path $BackupDir -ItemType Directory -Force | Out-Null }
    Write-Host "[*] Exporting registry..." -ForegroundColor Yellow
    $date = Get-Date -Format "yyyyMMdd"
    reg export HKLM "$BackupDir\HKLM_$date.reg" /y 2>$null
    reg export HKCU "$BackupDir\HKCU_$date.reg" /y 2>$null
    Show-Success "Registry backed up to C:\RegistryBackup\"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function54 {
    Show-Header "Disable Cortana - Tat Cortana" "54"
    Write-Host "[*] Disabling Cortana via registry..." -ForegroundColor Yellow
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f 2>$null
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f 2>$null
    Show-Success "Cortana disabled! / Da tat Cortana!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function55 {
    Show-Header "Disable Windows Tips - Tat Goi Y Windows" "55"
    Write-Host "[*] Disabling tips..." -ForegroundColor Yellow
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f 2>$null
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SoftLandingEnabled /t REG_DWORD /d 0 /f 2>$null
    Show-Success "Windows tips disabled! / Da tat goi y Windows!"
    Read-Host "`nPress Enter to continue"
}

# ============================================================================
# ADVANCED TOOLS FUNCTIONS [56-70]
# ============================================================================

function Invoke-Function56 {
    Show-Header "Create System Restore Point - Tao Diem Khoi Phuc" "56"
    Write-Host "[*] Creating restore point..." -ForegroundColor Yellow
    Checkpoint-Computer -Description "Ultimate System Tool Backup" -RestorePointType "MODIFY_SETTINGS"
    Show-Success "Restore point created! / Da tao diem khoi phuc!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function57 {
    Show-Header "View System Information - Xem Thong Tin He Thong" "57"
    Write-Host "[*] Gathering system information...`n" -ForegroundColor Yellow
    systeminfo
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function58 {
    Show-Header "Export Programs List - Xuat Danh Sach Chuong Trinh" "58"
    Write-Host "[*] Creating list..." -ForegroundColor Yellow
    Get-WmiObject -Class Win32_Product | Select-Object Name, Version | Export-Csv "$env:USERPROFILE\Desktop\InstalledPrograms.csv" -NoTypeInformation
    Show-Success "List saved to Desktop\InstalledPrograms.csv"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function59 {
    Show-Header "Check Disk Health (SMART) - Kiem Tra Suc Khoe O Dia" "59"
    Write-Host "[*] Checking SMART status...`n" -ForegroundColor Yellow
    Get-WmiObject -Class Win32_DiskDrive | Select-Object Model, Size, Status | Format-Table
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function60 {
    Show-Header "Clear Windows Store Cache - Xoa Cache Windows Store" "60"
    Write-Host "[*] Clearing Windows Store cache..." -ForegroundColor Yellow
    wsreset.exe
    Show-Success "Windows Store cache cleared! / Da xoa cache Windows Store!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function61 {
    Show-Header "Reset Windows Update Components - Reset Thanh Phan Update" "61"
    Write-Host "[*] Stopping update services..." -ForegroundColor Yellow
    Stop-Service -Name wuauserv,cryptSvc,bits,msiserver -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Renaming folders..." -ForegroundColor Yellow
    Rename-Item -Path "C:\Windows\SoftwareDistribution" -NewName "SoftwareDistribution.old" -Force -ErrorAction SilentlyContinue
    Rename-Item -Path "C:\Windows\System32\catroot2" -NewName "catroot2.old" -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Starting update services..." -ForegroundColor Yellow
    Start-Service -Name wuauserv,cryptSvc,bits,msiserver -ErrorAction SilentlyContinue
    Show-Success "Windows Update reset! / Da reset Windows Update!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function62 {
    Show-Header "Optimize Boot Time - Toi Uu Thoi Gian Khoi Dong" "62"
    Write-Host "[*] Enabling fast startup..." -ForegroundColor Yellow
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 1 /f 2>$null
    Write-Host "[*] Reducing boot timeout..." -ForegroundColor Yellow
    bcdedit /timeout 3 2>$null
    Show-Success "Boot time optimized! / Da toi uu thoi gian khoi dong!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function63 {
    Show-Header "Clean All Temporary Files - Xoa Tat Ca File Tam" "63"
    Write-Host "[*] User temp..." -ForegroundColor Yellow
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Windows temp..." -ForegroundColor Yellow
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Prefetch..." -ForegroundColor Yellow
    Remove-Item -Path "C:\Windows\Prefetch\*" -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Recent items..." -ForegroundColor Yellow
    Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Recent\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "All temporary files cleaned! / Da xoa tat ca file tam!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function64 {
    Show-Header "Generate System Report - Tao Bao Cao He Thong" "64"
    Write-Host "[*] Creating report (this may take several minutes)..." -ForegroundColor Yellow
    perfmon /report
    Show-Success "Report generated! / Da tao bao cao!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function65 {
    Show-Header "Clean Software Cache - Xoa Cache Phan Mem" "65"
    Write-Host "[*] Adobe cache..." -ForegroundColor Yellow
    Remove-Item -Path "$env:APPDATA\Adobe\Common\Media Cache Files\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Office file cache..." -ForegroundColor Yellow
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Office\16.0\OfficeFileCache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Software cache cleaned! / Da xoa cache phan mem!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function66 {
    Show-Header "Clean Delivery Optimization - Xoa Delivery Optimization" "66"
    Write-Host "[*] Stopping Delivery Optimization service..." -ForegroundColor Yellow
    Stop-Service -Name "DoSvc" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Service -Name "DoSvc" -ErrorAction SilentlyContinue
    Show-Success "Delivery Optimization cache cleaned!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function67 {
    Show-Header "Clean Update Backup (LCU) - Xoa Sao Luu Cap Nhat" "67"
    Show-Warning "You will NOT be able to uninstall updates after this!"
    $confirm = Read-Host "`nContinue / Tiep tuc (Y/N)"
    if ($confirm -ne "Y" -and $confirm -ne "y") { return }
    $pathLCU = "C:\Windows\servicing\LCU"
    if (Test-Path $pathLCU) {
        Write-Host "`n[*] Cleaning LCU backup folder..." -ForegroundColor Yellow
        cmd /c "takeown /f `"$pathLCU`" /r /d y" 2>$null
        cmd /c "icacls `"$pathLCU`" /grant administrators:F /t /c" 2>$null
        Remove-Item -Path $pathLCU -Recurse -Force -ErrorAction SilentlyContinue
        New-Item -Path $pathLCU -ItemType Directory -Force | Out-Null
        Show-Success "LCU backup cleaned! This can free up 5-10 GB!"
    } else {
        Show-Info "LCU backup folder not found"
    }
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function68 {
    Show-Header "Optimize Memory (RAM) - Toi Uu Bo Nho RAM" "68"
    Write-Host "[*] Clearing standby memory list..." -ForegroundColor Yellow
    Get-Process | ForEach-Object { try { $_.MinWorkingSet = 100KB } catch {} }
    Write-Host "[*] Flushing file system cache..." -ForegroundColor Yellow
    ipconfig /flushdns 2>$null
    ipconfig /registerdns 2>$null
    Show-Success "Memory optimized! / Da toi uu bo nho!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function69 {
    Show-Header "Show Disk Space Report - Xem Bao Cao Dung Luong" "69"
    Write-Host "[*] All drives:`n" -ForegroundColor Yellow
    Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{N="Used(GB)";E={[math]::Round($_.Used/1GB,2)}}, @{N="Free(GB)";E={[math]::Round($_.Free/1GB,2)}}, @{N="Total(GB)";E={[math]::Round(($_.Used+$_.Free)/1GB,2)}} | Format-Table
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function70 {
    Show-Header "Refresh Icon Cache - Lam Moi Icon Cache" "70"
    Write-Host "[*] Refreshing system icon cache..." -ForegroundColor Yellow
    ie4uinit.exe -show 2>$null
    Show-Success "Icon cache refreshed! / Da lam moi icon cache!"
    Read-Host "`nPress Enter to continue"
}

# ============================================================================
# SYSTEM UTILITIES FUNCTIONS [71-76]
# ============================================================================

function Invoke-Function71 {
    Show-Header "Check System Information - Kiem Tra Thong Tin May" "71"
    Write-Host "[HARDWARE INFORMATION]`n" -ForegroundColor Yellow
    Write-Host "[*] Computer System:" -ForegroundColor Cyan
    Get-WmiObject -Class Win32_ComputerSystem | Select-Object Manufacturer, Model, TotalPhysicalMemory | Format-List
    Write-Host "[*] CPU Information:" -ForegroundColor Cyan
    Get-WmiObject -Class Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors | Format-List
    Write-Host "[*] Operating System:" -ForegroundColor Cyan
    Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version, OSArchitecture | Format-List
    Write-Host "`n[*] Opening detailed system info..." -ForegroundColor Yellow
    msinfo32
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function72 {
    Show-Header "Windows Settings Center - Trung Tam Cai Dat Windows" "72"
    Write-Host " [1] System Settings          [2] Privacy Settings" -ForegroundColor White
    Write-Host " [3] Update and Security      [4] Personalization" -ForegroundColor White
    Write-Host " [5] Apps and Features        [6] Network and Internet" -ForegroundColor White
    Write-Host " [7] Gaming Settings          [8] Power Options" -ForegroundColor White
    Write-Host " [9] All Settings             [0] Back`n" -ForegroundColor White
    $choice = Read-Host "Select settings / Chon cai dat (0-9)"
    switch ($choice) {
        "1" { start ms-settings:display }
        "2" { start ms-settings:privacy }
        "3" { start ms-settings:windowsupdate }
        "4" { start ms-settings:personalization }
        "5" { start ms-settings:appsfeatures }
        "6" { start ms-settings:network }
        "7" { start ms-settings:gaming }
        "8" { start powercfg.cpl }
        "9" { start ms-settings: }
    }
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function73 {
    Show-Header "Office Repair and Reset - Sua Chua va Reset Office" "73"
    Write-Host " [1] Quick Office Repair" -ForegroundColor White
    Write-Host " [2] Reset Office Settings" -ForegroundColor White
    Write-Host " [3] Clear Office Cache" -ForegroundColor White
    Write-Host " [0] Back`n" -ForegroundColor White
    $choice = Read-Host "Select option / Chon tuy chon (0-3)"
    if ($choice -eq "2") {
        Remove-Item -Path "$env:APPDATA\Microsoft\Office\*" -Force -ErrorAction SilentlyContinue
        Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Office\*" -Force -ErrorAction SilentlyContinue
        Show-Success "Office settings reset!"
    } elseif ($choice -eq "3") {
        Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Office\16.0\OfficeFileCache\*" -Recurse -Force -ErrorAction SilentlyContinue
        Show-Success "Office cache cleared!"
    }
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function74 {
    Show-Header "Remove Bloatware (Safe) - Xoa Ung Dung Rac" "74"
    Show-Warning "This will remove pre-installed Windows apps!"
    $confirm = Read-Host "`nContinue / Tiep tuc (Y/N)"
    if ($confirm -ne "Y" -and $confirm -ne "y") { return }
    Write-Host "`n[*] Removing safe bloatware apps...`n" -ForegroundColor Yellow
    @("*3dbuilder*","*paint3d*","*MixedReality*","*getstarted*","*solitaire*","*mobileplans*","*feedback*","*xboxapp*") | ForEach-Object {
        Write-Host "Removing $_..." -ForegroundColor Cyan
        Get-AppxPackage $_ | Remove-AppxPackage -ErrorAction SilentlyContinue
    }
    Show-Success "Bloatware removed! / Da xoa ung dung rac!"
    Show-Info "You can reinstall from Microsoft Store if needed"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function75 {
    Show-Header "Bitlocker Management - Quan Ly Bitlocker" "75"
    Write-Host "[*] Bitlocker status on all drives:`n" -ForegroundColor Yellow
    manage-bde -status
    Write-Host "`n [1] Disable Bitlocker on C:" -ForegroundColor White
    Write-Host " [2] Enable Bitlocker on C:" -ForegroundColor White
    Write-Host " [3] View Recovery Key" -ForegroundColor White
    Write-Host " [0] Back`n" -ForegroundColor White
    $choice = Read-Host "Select option / Chon tuy chon (0-3)"
    if ($choice -eq "1") {
        manage-bde -off C:
    } elseif ($choice -eq "2") {
        control /name Microsoft.BitLockerDriveEncryption
    } elseif ($choice -eq "3") {
        manage-bde -protectors C: -get
    }
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function76 {
    Show-Header "Check Activation Status - Kiem Tra Trang Thai Kich Hoat" "76"
    Write-Host "[WINDOWS ACTIVATION]`n" -ForegroundColor Yellow
    Write-Host "[*] Windows License Status:" -ForegroundColor Cyan
    cscript //nologo C:\Windows\System32\slmgr.vbs /dli
    Write-Host "`n[*] Windows Activation Expiration:" -ForegroundColor Cyan
    cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
    Write-Host "`n[*] Windows Product Key:" -ForegroundColor Cyan
    Get-WmiObject -Query "select * from SoftwareLicensingService" | Select-Object -ExpandProperty OA3xOriginalProductKey
    Write-Host "`n[OFFICE ACTIVATION]`n" -ForegroundColor Yellow
    $officePaths = @("$env:ProgramFiles\Microsoft Office\Office16\ospp.vbs", "${env:ProgramFiles(x86)}\Microsoft Office\Office16\ospp.vbs")
    $officeFound = $false
    foreach ($path in $officePaths) {
        if (Test-Path $path) {
            cscript //nologo "$path" /dstatus
            $officeFound = $true
            break
        }
    }
    if (-not $officeFound) { Show-Info "Office not detected / Khong phat hien Office" }
    Read-Host "`nPress Enter to continue"
}

# ============================================================================
# BACKUP AND RECOVERY FUNCTIONS [77-82]
# ============================================================================

function Invoke-Function77 {
    Show-Header "Backup WiFi Passwords - Sao Luu Mat Khau Wifi" "77"
    $BackupDir = "$env:USERPROFILE\Documents\WiFi_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    New-Item -Path $BackupDir -ItemType Directory -Force | Out-Null
    Write-Host "[*] Exporting WiFi profiles...`n" -ForegroundColor Yellow
    $profiles = (netsh wlan show profiles) | Select-String "All User Profile\s+:\s+(.+)" | ForEach-Object { $_.Matches.Groups[1].Value.Trim() }
    $report = @("WiFi Backup Report","==================","Created: $(Get-Date)","")
    foreach ($profile in $profiles) {
        Write-Host "  Exporting: $profile" -ForegroundColor Cyan
        $profileInfo = netsh wlan show profile name="$profile" key=clear
        $profileInfo | Out-File -FilePath "$BackupDir\WiFi_$profile.txt" -Encoding UTF8
        $password = ($profileInfo | Select-String "Key Content\s+:\s+(.+)").Matches.Groups[1].Value
        $report += "Network: $profile","Password: $password",""
    }
    $report | Out-File -FilePath "$BackupDir\WiFi_Passwords.txt" -Encoding UTF8
    Show-Success "WiFi passwords backed up!"
    Show-Info "Location: $BackupDir"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function78 {
    Show-Header "Backup Drivers - Sao Luu Driver" "78"
    $DriverBackup = "$env:USERPROFILE\Documents\Driver_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    New-Item -Path $DriverBackup -ItemType Directory -Force | Out-Null
    Write-Host "[*] Exporting third-party drivers (this may take several minutes)...`n" -ForegroundColor Yellow
    Start-Process -FilePath "Dism.exe" -ArgumentList "/online /export-driver /destination:`"$DriverBackup`"" -NoNewWindow -Wait
    Write-Host "`n[*] Creating driver list..." -ForegroundColor Yellow
    Get-WmiObject Win32_PnPSignedDriver | Select-Object DeviceName, DriverVersion, Manufacturer, DriverDate | Export-Csv "$DriverBackup\Driver_List.csv" -NoTypeInformation
    Show-Success "Drivers backed up!"
    Show-Info "Location: $DriverBackup"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function79 {
    Show-Header "Backup User Data - Sao Luu Du Lieu Nguoi Dung" "79"
    $DataBackup = "$env:USERPROFILE\Documents\UserData_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    New-Item -Path $DataBackup -ItemType Directory -Force | Out-Null
    Write-Host " [1] Quick Backup (Desktop, Documents, Pictures)" -ForegroundColor White
    Write-Host " [2] Full Backup (Include Downloads, Videos, Music)" -ForegroundColor White
    Write-Host " [0] Back`n" -ForegroundColor White
    $choice = Read-Host "Select backup type / Chon loai sao luu (0-2)"
    if ($choice -eq "1") {
        Write-Host "`n[*] Backing up Desktop..." -ForegroundColor Yellow
        Copy-Item -Path "$env:USERPROFILE\Desktop\*" -Destination "$DataBackup\Desktop" -Recurse -Force -ErrorAction SilentlyContinue -Exclude "*UserData_Backup*"
        Write-Host "[*] Backing up Documents..." -ForegroundColor Yellow
        Copy-Item -Path "$env:USERPROFILE\Documents\*" -Destination "$DataBackup\Documents" -Recurse -Force -ErrorAction SilentlyContinue -Exclude "*UserData_Backup*"
        Write-Host "[*] Backing up Pictures..." -ForegroundColor Yellow
        Copy-Item -Path "$env:USERPROFILE\Pictures\*" -Destination "$DataBackup\Pictures" -Recurse -Force -ErrorAction SilentlyContinue
        Show-Success "User data backed up!"
    } elseif ($choice -eq "2") {
        Write-Host "`n[*] Full backup in progress (this may take a long time)...`n" -ForegroundColor Yellow
        @("Desktop","Documents","Pictures","Downloads","Videos","Music") | ForEach-Object {
            Write-Host "[*] Backing up $_..." -ForegroundColor Cyan
            Copy-Item -Path "$env:USERPROFILE\$_\*" -Destination "$DataBackup\$_" -Recurse -Force -ErrorAction SilentlyContinue -Exclude "*UserData_Backup*"
        }
        Show-Success "User data backed up!"
    }
    if ($choice -ne "0") { Show-Info "Location: $DataBackup" }
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function80 {
    Show-Header "Backup Zalo Data - Sao Luu Du Lieu Zalo" "80"
    $ZaloPC = "$env:APPDATA\ZaloPC"
    $ZaloData = "$env:USERPROFILE\Documents\ZaloData"
    $ZaloCache = "$env:LOCALAPPDATA\ZaloPC"
    $ZaloBackup = "$env:USERPROFILE\Documents\Zalo_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    if (-not ((Test-Path $ZaloPC) -or (Test-Path $ZaloData) -or (Test-Path $ZaloCache))) {
        Show-Error "Zalo not found / Khong tim thay Zalo!"
        Read-Host "`nPress Enter to continue"
        return
    }
    Show-Warning "Please close Zalo before backing up!"
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
    Show-Success "Zalo data backed up!"
    Show-Info "Location: $ZaloBackup"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function81 {
    Show-Header "Backup Product Keys - Sao Luu Ban Quyen" "81"
    $KeyBackup = "$env:USERPROFILE\Documents\ProductKeys_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    New-Item -Path $KeyBackup -ItemType Directory -Force | Out-Null
    Write-Host "[WINDOWS PRODUCT KEY]`n" -ForegroundColor Yellow
    Write-Host "[*] Windows OEM Key:" -ForegroundColor Cyan
    $OEMKey = (Get-WmiObject -Query 'select * from SoftwareLicensingService').OA3xOriginalProductKey
    if ($OEMKey) {
        Write-Host "  $OEMKey" -ForegroundColor White
        "Windows OEM Key: $OEMKey" | Out-File "$KeyBackup\Windows_Key.txt"
    } else {
        Write-Host "  Not found / Khong tim thay" -ForegroundColor Gray
    }
    Write-Host "`n[*] Windows License Status:" -ForegroundColor Cyan
    $licenseStatus = cscript //nologo C:\Windows\System32\slmgr.vbs /dli
    $licenseStatus | Out-File "$KeyBackup\Windows_License.txt"
    Write-Host "`n[OFFICE PRODUCT KEY]`n" -ForegroundColor Yellow
    $officePaths = @("$env:ProgramFiles\Microsoft Office\Office16\ospp.vbs", "${env:ProgramFiles(x86)}\Microsoft Office\Office16\ospp.vbs")
    $officeFound = $false
    foreach ($path in $officePaths) {
        if (Test-Path $path) {
            $officeStatus = cscript //nologo "$path" /dstatus
            $officeStatus | Out-File "$KeyBackup\Office_License.txt"
            $officeFound = $true
            break
        }
    }
    if (-not $officeFound) { Show-Info "Office not detected / Khong phat hien Office" }
    Show-Success "Product keys backed up!"
    Show-Info "Location: $KeyBackup"
    Show-Warning "Keep backup files secure! / Giu file sao luu an toan!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function82 {
    Show-Header "Data Recovery Tools - Cong Cu Khoi Phuc Du Lieu" "82"
    Write-Host " [1] Enable File History" -ForegroundColor White
    Write-Host " [2] Restore Previous Versions" -ForegroundColor White
    Write-Host " [3] Shadow Copy Recovery" -ForegroundColor White
    Write-Host " [4] Recycle Bin Recovery" -ForegroundColor White
    Write-Host " [5] System Restore" -ForegroundColor White
    Write-Host " [0] Back`n" -ForegroundColor White
    $choice = Read-Host "Select option / Chon tuy chon (0-5)"
    switch ($choice) {
        "1" { control /name Microsoft.FileHistory }
        "2" { explorer /select,"$env:USERPROFILE\Documents" }
        "3" { vssadmin list shadows }
        "4" { explorer shell:RecycleBinFolder }
        "5" { rstrui.exe }
    }
    Read-Host "`nPress Enter to continue"
}

# ============================================================================
# QUICK ACTIONS [88, 99]
# ============================================================================

function Invoke-Function88 {
    Show-Header "RUN ALL CLEANUP TASKS - CHAY TAT CA DON DEP" "88"
    Show-Warning "This will run all cleanup tasks!"
    $confirm = Read-Host "`nContinue / Tiep tuc (Y/N)"
    if ($confirm -ne "Y" -and $confirm -ne "y") { return }
    Write-Host "`n[*] Running comprehensive cleanup...`n" -ForegroundColor Yellow
    $tasks = @(
        @{Name="Temp files";Action={Remove-Item -Path "$env:TEMP\*","C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue}},
        @{Name="Recycle Bin";Action={Clear-RecycleBin -Force -ErrorAction SilentlyContinue}},
        @{Name="Browser cache";Action={Stop-Process -Name chrome,msedge,firefox -Force -ErrorAction SilentlyContinue; Start-Sleep 2; Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*","$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue}},
        @{Name="Windows Update cache";Action={Stop-Service wuauserv -Force -ErrorAction SilentlyContinue; Remove-Item "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue; Start-Service wuauserv -ErrorAction SilentlyContinue}},
        @{Name="Thumbnail cache";Action={Stop-Process explorer -Force -ErrorAction SilentlyContinue; Remove-Item "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db" -Force -ErrorAction SilentlyContinue; Start-Process explorer}},
        @{Name="Icon cache";Action={Remove-Item "$env:LOCALAPPDATA\IconCache.db" -Force -ErrorAction SilentlyContinue}},
        @{Name="DNS cache";Action={Clear-DnsClientCache -ErrorAction SilentlyContinue}},
        @{Name="Prefetch";Action={Remove-Item "C:\Windows\Prefetch\*" -Force -ErrorAction SilentlyContinue}}
    )
    for ($i = 0; $i -lt $tasks.Count; $i++) {
        Write-Host "[$($i+1)/$($tasks.Count)] $($tasks[$i].Name)..." -ForegroundColor Cyan
        & $tasks[$i].Action
    }
    Show-Success "All cleanup tasks completed! / Hoan thanh tat ca don dep!"
    Read-Host "`nPress Enter to continue"
}

function Invoke-Function99 {
    Show-Header "FULL SYSTEM OPTIMIZATION - TOI UU TOAN BO HE THONG" "99"
    Show-Warning "This will perform full system optimization!"
    Write-Host "This process may take 15-30 minutes / Qua trinh co the mat 15-30 phut" -ForegroundColor Yellow
    $confirm = Read-Host "`nContinue / Tiep tuc (Y/N)"
    if ($confirm -ne "Y" -and $confirm -ne "y") { return }
    Write-Host "`n[*] Creating restore point..." -ForegroundColor Yellow
    Checkpoint-Computer -Description "Before Full Optimization" -RestorePointType "MODIFY_SETTINGS" -ErrorAction SilentlyContinue
    Write-Host "`n[STEP 1/5] CLEANUP`n" -ForegroundColor Green
    Write-Host "[1.1] Temp files..." -ForegroundColor Cyan
    Remove-Item -Path "$env:TEMP\*","C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[1.2] Browser cache..." -ForegroundColor Cyan
    Stop-Process -Name chrome,msedge,firefox -Force -ErrorAction SilentlyContinue
    Start-Sleep 2
    Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*","$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[1.3] Windows Update cache..." -ForegroundColor Cyan
    Stop-Service wuauserv -Force -ErrorAction SilentlyContinue
    Remove-Item "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Service wuauserv -ErrorAction SilentlyContinue
    Write-Host "`n[STEP 2/5] NETWORK OPTIMIZATION`n" -ForegroundColor Green
    Write-Host "[2.1] Optimizing TCP settings..." -ForegroundColor Cyan
    netsh int tcp set global autotuninglevel=normal 2>$null
    netsh int tcp set global rsc=enabled 2>$null
    Write-Host "`n[STEP 3/5] PERFORMANCE OPTIMIZATION`n" -ForegroundColor Green
    Write-Host "[3.1] Disabling visual effects..." -ForegroundColor Cyan
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f 2>$null
    Write-Host "[3.2] Setting High Performance power plan..." -ForegroundColor Cyan
    powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 2>$null
    Write-Host "`n[STEP 4/5] SYSTEM MAINTENANCE`n" -ForegroundColor Green
    Write-Host "[4.1] Running System File Checker (this may take 5-10 minutes)..." -ForegroundColor Cyan
    sfc /scannow 2>$null
    Write-Host "[4.2] Running DISM repair (this may take 5-10 minutes)..." -ForegroundColor Cyan
    Dism /Online /Cleanup-Image /RestoreHealth 2>$null
    Write-Host "`n[STEP 5/5] REGISTRY OPTIMIZATION`n" -ForegroundColor Green
    Write-Host "[5.1] Cleaning registry..." -ForegroundColor Cyan
    reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f 2>$null
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f 2>$null
    Write-Host "`n═══════════════════════════════════════════════════════════════" -ForegroundColor Green
    Show-Success "FULL SYSTEM OPTIMIZATION COMPLETED!"
    Write-Host "═══════════════════════════════════════════════════════════════`n" -ForegroundColor Green
    Show-Info "Please restart your computer for all changes to take effect"
    Show-Info "Vui long khoi dong lai may tinh de ap dung tat ca thay doi"
    Read-Host "`nPress Enter to continue"
}

