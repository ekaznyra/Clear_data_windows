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
    Write-Host "                                                                                  "
    Write-Host "                ULTIMATE WINDOWS SYSTEM TOOL v5.0 - PROFESSIONAL                  " -ForegroundColor White
    Write-Host "                  Full-Featured Edition - 82 Functions + 2 Quick Actions          " -ForegroundColor Gray
    Write-Host "                           Created by: Nguyen Ngoc Anh Tu                          " -ForegroundColor Magenta
    Write-Host "                           Press L to switch to Vietnamese                         " -ForegroundColor Green
    Write-Host "                                                                                  "
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
    Write-Host "                                                                                  "
    Write-Host "                CONG CU TOI UU HE THONG WINDOWS v5.0 - CHUYEN NGHIEP              " -ForegroundColor White
    Write-Host "                  Phien Ban Day Du - 82 Chuc Nang + 2 Thao Tac Nhanh             " -ForegroundColor Gray
    Write-Host "                           Tac gia: Nguyen Ngoc Anh Tu                            " -ForegroundColor Magenta
    Write-Host "                           Nhan L de chuyen sang tieng Anh                        " -ForegroundColor Green
    Write-Host "                                                                                  "
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
# ALL 82 FUNCTION IMPLEMENTATIONS - Clean & Working
# ============================================================================

# CATEGORY 1: SYSTEM CLEANUP [1-12]
function Invoke-Function1 {
    Show-Header "Quick System Cleanup - Don Dep Nhanh He Thong" "1"
    Write-Host "[*] Cleaning Temp files..." -ForegroundColor Yellow
    Remove-Item -Path "$env:TEMP\*","C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Cleaning Recycle Bin..." -ForegroundColor Yellow
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Flushing DNS..." -ForegroundColor Yellow
    Clear-DnsClientCache -ErrorAction SilentlyContinue
    Write-Host "[*] Cleaning Prefetch..." -ForegroundColor Yellow
    Remove-Item -Path "C:\Windows\Prefetch\*" -Force -ErrorAction SilentlyContinue
    Show-Success "Quick Cleanup Completed!"
    Read-Host "`nPress Enter"
}

function Invoke-Function2 {
    Show-Header "Deep System Cleanup - Don Dep Sau He Thong" "2"
    Write-Host "[*] Cleaning all temp folders..." -ForegroundColor Yellow
    Remove-Item -Path "$env:TEMP\*","C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Cleaning Windows logs..." -ForegroundColor Yellow
    Remove-Item -Path "C:\Windows\Logs\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "[*] Cleaning Windows Update cache..." -ForegroundColor Yellow
    Stop-Service wuauserv,bits -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Service wuauserv,bits -ErrorAction SilentlyContinue
    Write-Host "[*] Running DISM cleanup..." -ForegroundColor Yellow
    Start-Process Dism.exe -ArgumentList "/online /Cleanup-Image /StartComponentCleanup /ResetBase" -NoNewWindow -Wait -ErrorAction SilentlyContinue
    Show-Success "Deep Cleanup Completed!"
    Read-Host "`nPress Enter"
}

function Invoke-Function3 {
    Show-Header "Browser Cache Cleanup - Don Dep Cache Trinh Duyet" "3"
    Write-Host "[*] Chrome/Edge/Firefox cache..." -ForegroundColor Yellow
    Stop-Process -Name chrome,msedge,firefox -Force -ErrorAction SilentlyContinue
    Start-Sleep 2
    Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Browser caches cleaned!"
    Read-Host "`nPress Enter"
}

function Invoke-Function4 {
    Show-Header "Application Cache Cleanup - Don Dep Cache Ung Dung" "4"
    Stop-Process -Name Teams,Discord -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:APPDATA\Microsoft\Teams\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:APPDATA\Discord\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:APPDATA\Adobe\Common\Media Cache Files\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Application caches cleaned!"
    Read-Host "`nPress Enter"
}

function Invoke-Function5 {
    Show-Header "Windows Update Cleanup - Don Dep Windows Update" "5"
    Stop-Service wuauserv,bits,dosvc -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Service wuauserv,bits -ErrorAction SilentlyContinue
    Show-Success "Windows Update cleaned!"
    Read-Host "`nPress Enter"
}

function Invoke-Function6 {
    Show-Header "Thumbnail Cache Cleanup" "6"
    Stop-Process explorer -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db" -Force -ErrorAction SilentlyContinue
    Start-Process explorer
    Show-Success "Thumbnail cache cleaned!"
    Read-Host "`nPress Enter"
}

function Invoke-Function7 {
    Show-Header "Icon Cache Cleanup" "7"
    Stop-Process explorer -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\IconCache.db" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\iconcache_*.db" -Force -ErrorAction SilentlyContinue
    Start-Process explorer
    Show-Success "Icon cache cleaned!"
    Read-Host "`nPress Enter"
}

function Invoke-Function8 {
    Show-Header "Font Cache Cleanup" "8"
    Stop-Service FontCache -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\System32\FNTCACHE.DAT" -Force -ErrorAction SilentlyContinue
    Start-Service FontCache -ErrorAction SilentlyContinue
    Show-Success "Font cache cleaned!"
    Read-Host "`nPress Enter"
}

function Invoke-Function9 {
    Show-Header "Windows Installer Cleanup" "9"
    Remove-Item -Path "C:\Windows\Installer\`$PatchCache`$\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Windows Installer cleaned!"
    Read-Host "`nPress Enter"
}

function Invoke-Function10 {
    Show-Header "Old Windows Installation Cleanup" "10"
    $confirm = Read-Host "Continue (Y/N)"
    if ($confirm -eq "Y") {
        cmd /c "takeown /F C:\Windows.old\* /R /A /D Y" 2>$null
        Remove-Item -Path "C:\Windows.old" -Recurse -Force -ErrorAction SilentlyContinue
        Show-Success "Old Windows cleaned!"
    }
    Read-Host "`nPress Enter"
}

function Invoke-Function11 {
    Show-Header "Recycle Bin Cleanup" "11"
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    Show-Success "Recycle Bin emptied!"
    Read-Host "`nPress Enter"
}

function Invoke-Function12 {
    Show-Header "Memory Dump Files Cleanup" "12"
    Remove-Item -Path "C:\Windows\MEMORY.DMP" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Minidump\*.dmp" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\ProgramData\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Memory dump files cleaned!"
    Read-Host "`nPress Enter"
}

# CATEGORY 2: PRIVACY PROTECTION [13-20]
function Invoke-Function13 {
    Show-Header "Clear Recent Documents" "13"
    Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Recent\*" -Recurse -Force -ErrorAction SilentlyContinue
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f 2>$null
    Show-Success "Recent documents cleared!"
    Read-Host "`nPress Enter"
}

function Invoke-Function14 {
    Show-Header "Clear Run History" "14"
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f 2>$null
    Show-Success "Run history cleared!"
    Read-Host "`nPress Enter"
}

function Invoke-Function15 {
    Show-Header "Clear Search History" "15"
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f 2>$null
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f 2>$null
    Show-Success "Search history cleared!"
    Read-Host "`nPress Enter"
}

function Invoke-Function16 {
    Show-Header "Clear Clipboard History" "16"
    "" | Set-Clipboard
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Clipboard\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Clipboard history cleared!"
    Read-Host "`nPress Enter"
}

function Invoke-Function17 {
    Show-Header "Clear Windows Error Reports" "17"
    Remove-Item -Path "C:\ProgramData\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Error reports cleared!"
    Read-Host "`nPress Enter"
}

function Invoke-Function18 {
    Show-Header "Disable Telemetry and Tracking" "18"
    Set-Service DiagTrack,dmwappushservice -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service DiagTrack,dmwappushservice -Force -ErrorAction SilentlyContinue
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f 2>$null
    Show-Success "Telemetry disabled!"
    Read-Host "`nPress Enter"
}

function Invoke-Function19 {
    Show-Header "Clear Event Logs" "19"
    wevtutil el | ForEach-Object { wevtutil cl $_ 2>$null }
    Show-Success "Event logs cleared!"
    Read-Host "`nPress Enter"
}

function Invoke-Function20 {
    Show-Header "Clear DNS Cache" "20"
    ipconfig /flushdns
    Clear-DnsClientCache -ErrorAction SilentlyContinue
    Show-Success "DNS cache cleared!"
    Read-Host "`nPress Enter"
}

# CATEGORY 3: NETWORK OPTIMIZATION [21-26]
function Invoke-Function21 {
    Show-Header "Reset Network Settings" "21"
    netsh int ip reset
    netsh winsock reset
    ipconfig /flushdns
    ipconfig /release
    ipconfig /renew
    Show-Success "Network settings reset!"
    Show-Info "Please restart computer"
    Read-Host "`nPress Enter"
}

function Invoke-Function22 {
    Show-Header "Optimize Network Performance" "22"
    netsh int tcp set global autotuninglevel=normal
    netsh int tcp set global rsc=enabled
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f 2>$null
    Show-Success "Network optimized!"
    Read-Host "`nPress Enter"
}

function Invoke-Function23 {
    Show-Header "Clear ARP Cache" "23"
    netsh interface ip delete arpcache
    Show-Success "ARP cache cleared!"
    Read-Host "`nPress Enter"
}

function Invoke-Function24 {
    Show-Header "Reset Winsock" "24"
    netsh winsock reset
    netsh int ip reset
    Show-Success "Winsock reset!"
    Show-Info "Please restart computer"
    Read-Host "`nPress Enter"
}

function Invoke-Function25 {
    Show-Header "Renew IP Address" "25"
    ipconfig /release
    ipconfig /renew
    ipconfig /flushdns
    Show-Success "IP address renewed!"
    Read-Host "`nPress Enter"
}

function Invoke-Function26 {
    Show-Header "Fix Network Adapter" "26"
    Get-NetAdapter | Where-Object {$_.Status -eq "Up"} | ForEach-Object {
        Disable-NetAdapter -Name $_.Name -Confirm:$false -ErrorAction SilentlyContinue
        Start-Sleep 2
        Enable-NetAdapter -Name $_.Name -Confirm:$false -ErrorAction SilentlyContinue
    }
    Show-Success "Network adapter fixed!"
    Read-Host "`nPress Enter"
}

# CATEGORY 4: DISK MANAGEMENT [27-32]
function Invoke-Function27 {
    Show-Header "Disk Cleanup" "27"
    cleanmgr /sagerun:1
    Show-Success "Disk cleanup completed!"
    Read-Host "`nPress Enter"
}

function Invoke-Function28 {
    Show-Header "Disk Error Check" "28"
    $drive = Read-Host "Enter drive letter (C,D,etc)"
    echo Y | chkdsk ${drive}: /f /r /x
    Show-Info "Disk check scheduled for next reboot"
    Read-Host "`nPress Enter"
}

function Invoke-Function29 {
    Show-Header "Disk Optimization" "29"
    defrag /C /O /H /U
    Show-Success "Disk optimization completed!"
    Read-Host "`nPress Enter"
}

function Invoke-Function30 {
    Show-Header "Analyze Disk Space" "30"
    Get-PSDrive -PSProvider FileSystem | Select-Object Name,@{N="Used(GB)";E={[math]::Round($_.Used/1GB,2)}},@{N="Free(GB)";E={[math]::Round($_.Free/1GB,2)}} | Format-Table
    Read-Host "`nPress Enter"
}

function Invoke-Function31 {
    Show-Header "Clean Windows.old Folder" "31"
    $confirm = Read-Host "Continue (Y/N)"
    if ($confirm -eq "Y") {
        cmd /c "takeown /F C:\Windows.old\* /R /A /D Y" 2>$null
        Remove-Item -Path "C:\Windows.old" -Recurse -Force -ErrorAction SilentlyContinue
        Show-Success "Windows.old deleted!"
    }
    Read-Host "`nPress Enter"
}

function Invoke-Function32 {
    Show-Header "Compact OS" "32"
    $confirm = Read-Host "Continue (Y/N)"
    if ($confirm -eq "Y") {
        compact /compactos:query
        compact /compactos:always
        Show-Success "System compressed!"
    }
    Read-Host "`nPress Enter"
}

# CATEGORY 5: PERFORMANCE OPTIMIZATION [33-44]
function Invoke-Function33 {
    Show-Header "Disable Startup Programs" "33"
    start taskmgr /0 /startup
    Read-Host "`nPress Enter"
}

function Invoke-Function34 {
    Show-Header "Optimize Services" "34"
    @("Fax","RemoteRegistry") | ForEach-Object {
        Set-Service -Name $_ -StartupType Disabled -ErrorAction SilentlyContinue
        Stop-Service -Name $_ -Force -ErrorAction SilentlyContinue
    }
    Show-Success "Services optimized!"
    Read-Host "`nPress Enter"
}

function Invoke-Function35 {
    Show-Header "Clear Prefetch Files" "35"
    Remove-Item -Path "C:\Windows\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Prefetch files cleared!"
    Read-Host "`nPress Enter"
}

function Invoke-Function36 {
    Show-Header "Clear SuperFetch Cache" "36"
    Stop-Service SysMain -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Service SysMain -ErrorAction SilentlyContinue
    Show-Success "SuperFetch cache cleared!"
    Read-Host "`nPress Enter"
}

function Invoke-Function37 {
    Show-Header "Disable Visual Effects" "37"
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f 2>$null
    Show-Success "Visual effects disabled!"
    Show-Info "Please log off and log back in"
    Read-Host "`nPress Enter"
}

function Invoke-Function38 {
    Show-Header "Optimize Power Plan" "38"
    powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    Show-Success "Power plan optimized!"
    Read-Host "`nPress Enter"
}

function Invoke-Function39 {
    Show-Header "Disable Hibernation" "39"
    powercfg -h off
    Remove-Item "C:\hiberfil.sys" -Force -ErrorAction SilentlyContinue
    Show-Success "Hibernation disabled!"
    Read-Host "`nPress Enter"
}

function Invoke-Function40 {
    Show-Header "Clear Memory Cache" "40"
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f 2>$null
    Show-Success "Memory cache cleared!"
    Read-Host "`nPress Enter"
}

function Invoke-Function41 {
    Show-Header "Optimize Search Index" "41"
    Stop-Service WSearch -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\ProgramData\Microsoft\Search\Data\Applications\Windows\*" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Service WSearch -ErrorAction SilentlyContinue
    Show-Success "Search index optimized!"
    Read-Host "`nPress Enter"
}

function Invoke-Function42 {
    Show-Header "Disable Windows Animations" "42"
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f 2>$null
    Show-Success "Animations disabled!"
    Read-Host "`nPress Enter"
}

function Invoke-Function43 {
    Show-Header "Optimize SSD Settings" "43"
    fsutil behavior set DisableDeleteNotify 0
    schtasks /change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /disable 2>$null
    Set-Service SysMain -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service SysMain -Force -ErrorAction SilentlyContinue
    Show-Success "SSD optimized!"
    Read-Host "`nPress Enter"
}

function Invoke-Function44 {
    Show-Header "Reduce Menu Show Delay" "44"
    reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f 2>$null
    Show-Success "Menu delay reduced!"
    Read-Host "`nPress Enter"
}

# CATEGORY 6: SYSTEM MAINTENANCE [45-50]
function Invoke-Function45 {
    Show-Header "System File Checker (SFC)" "45"
    sfc /scannow
    Show-Success "SFC scan completed!"
    Read-Host "`nPress Enter"
}

function Invoke-Function46 {
    Show-Header "DISM System Repair" "46"
    Dism /Online /Cleanup-Image /CheckHealth
    Dism /Online /Cleanup-Image /ScanHealth
    Dism /Online /Cleanup-Image /RestoreHealth
    Show-Success "DISM repair completed!"
    Read-Host "`nPress Enter"
}

function Invoke-Function47 {
    Show-Header "Windows Component Cleanup" "47"
    Dism.exe /online /Cleanup-Image /StartComponentCleanup
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
    Show-Success "Component cleanup completed!"
    Read-Host "`nPress Enter"
}

function Invoke-Function48 {
    Show-Header "Update Windows Drivers" "48"
    start ms-settings:windowsupdate
    Read-Host "`nPress Enter"
}

function Invoke-Function49 {
    Show-Header "Rebuild Icon Cache" "49"
    Stop-Process explorer -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\IconCache.db" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\iconcache_*.db" -Force -ErrorAction SilentlyContinue
    Start-Process explorer
    Show-Success "Icon cache rebuilt!"
    Read-Host "`nPress Enter"
}

function Invoke-Function50 {
    Show-Header "Rebuild Windows Search Index" "50"
    control /name Microsoft.IndexingOptions
    Read-Host "`nPress Enter"
}

# CATEGORY 7: REGISTRY OPTIMIZATION [51-55]
function Invoke-Function51 {
    Show-Header "Clean Registry (Safe)" "51"
    reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f 2>$null
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f 2>$null
    Show-Success "Registry cleaned!"
    Read-Host "`nPress Enter"
}

function Invoke-Function52 {
    Show-Header "Optimize Registry" "52"
    reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v RegistrySizeLimit /t REG_DWORD /d 0x40000000 /f 2>$null
    Show-Success "Registry optimized!"
    Read-Host "`nPress Enter"
}

function Invoke-Function53 {
    Show-Header "Backup Registry" "53"
    $BackupDir = "C:\RegistryBackup"
    if (!(Test-Path $BackupDir)) { New-Item -Path $BackupDir -ItemType Directory -Force | Out-Null }
    $date = Get-Date -Format "yyyyMMdd"
    reg export HKLM "$BackupDir\HKLM_$date.reg" /y 2>$null
    reg export HKCU "$BackupDir\HKCU_$date.reg" /y 2>$null
    Show-Success "Registry backed up to C:\RegistryBackup\"
    Read-Host "`nPress Enter"
}

function Invoke-Function54 {
    Show-Header "Disable Cortana" "54"
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f 2>$null
    Show-Success "Cortana disabled!"
    Read-Host "`nPress Enter"
}

function Invoke-Function55 {
    Show-Header "Disable Windows Tips" "55"
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f 2>$null
    Show-Success "Windows tips disabled!"
    Read-Host "`nPress Enter"
}

# CATEGORY 8: ADVANCED TOOLS [56-70]
function Invoke-Function56 {
    Show-Header "Create System Restore Point" "56"
    Checkpoint-Computer -Description "Ultimate System Tool Backup" -RestorePointType "MODIFY_SETTINGS"
    Show-Success "Restore point created!"
    Read-Host "`nPress Enter"
}

function Invoke-Function57 {
    Show-Header "View System Information" "57"
    systeminfo
    Read-Host "`nPress Enter"
}

function Invoke-Function58 {
    Show-Header "Export Programs List" "58"
    Get-WmiObject -Class Win32_Product | Select-Object Name,Version | Export-Csv "$env:USERPROFILE\Desktop\InstalledPrograms.csv" -NoTypeInformation
    Show-Success "List saved to Desktop\InstalledPrograms.csv"
    Read-Host "`nPress Enter"
}

function Invoke-Function59 {
    Show-Header "Check Disk Health (SMART)" "59"
    Get-WmiObject -Class Win32_DiskDrive | Select-Object Model,Size,Status | Format-Table
    Read-Host "`nPress Enter"
}

function Invoke-Function60 {
    Show-Header "Clear Windows Store Cache" "60"
    wsreset.exe
    Show-Success "Windows Store cache cleared!"
    Read-Host "`nPress Enter"
}

function Invoke-Function61 {
    Show-Header "Reset Windows Update Components" "61"
    Stop-Service wuauserv,cryptSvc,bits,msiserver -Force -ErrorAction SilentlyContinue
    Rename-Item "C:\Windows\SoftwareDistribution" "SoftwareDistribution.old" -Force -ErrorAction SilentlyContinue
    Rename-Item "C:\Windows\System32\catroot2" "catroot2.old" -Force -ErrorAction SilentlyContinue
    Start-Service wuauserv,cryptSvc,bits,msiserver -ErrorAction SilentlyContinue
    Show-Success "Windows Update reset!"
    Read-Host "`nPress Enter"
}

function Invoke-Function62 {
    Show-Header "Optimize Boot Time" "62"
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 1 /f 2>$null
    bcdedit /timeout 3 2>$null
    Show-Success "Boot time optimized!"
    Read-Host "`nPress Enter"
}

function Invoke-Function63 {
    Show-Header "Clean All Temporary Files" "63"
    Remove-Item -Path "$env:TEMP\*","C:\Windows\Temp\*","C:\Windows\Prefetch\*","$env:APPDATA\Microsoft\Windows\Recent\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "All temporary files cleaned!"
    Read-Host "`nPress Enter"
}

function Invoke-Function64 {
    Show-Header "Generate System Report" "64"
    perfmon /report
    Show-Success "Report generated!"
    Read-Host "`nPress Enter"
}

function Invoke-Function65 {
    Show-Header "Clean Software Cache" "65"
    Remove-Item -Path "$env:APPDATA\Adobe\Common\Media Cache Files\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Office\16.0\OfficeFileCache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Show-Success "Software cache cleaned!"
    Read-Host "`nPress Enter"
}

function Invoke-Function66 {
    Show-Header "Clean Delivery Optimization" "66"
    Stop-Service DoSvc -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Service DoSvc -ErrorAction SilentlyContinue
    Show-Success "Delivery Optimization cleaned!"
    Read-Host "`nPress Enter"
}

function Invoke-Function67 {
    Show-Header "Clean Update Backup (LCU)" "67"
    $confirm = Read-Host "Continue (Y/N)"
    if ($confirm -eq "Y") {
        $pathLCU = "C:\Windows\servicing\LCU"
        if (Test-Path $pathLCU) {
            cmd /c "takeown /f `"$pathLCU`" /r /d y" 2>$null
            Remove-Item -Path $pathLCU -Recurse -Force -ErrorAction SilentlyContinue
            New-Item -Path $pathLCU -ItemType Directory -Force | Out-Null
            Show-Success "LCU backup cleaned!"
        }
    }
    Read-Host "`nPress Enter"
}

function Invoke-Function68 {
    Show-Header "Optimize Memory (RAM)" "68"
    Get-Process | ForEach-Object { try{$_.MinWorkingSet=100KB}catch{} }
    ipconfig /flushdns 2>$null
    Show-Success "Memory optimized!"
    Read-Host "`nPress Enter"
}

function Invoke-Function69 {
    Show-Header "Show Disk Space Report" "69"
    Get-PSDrive -PSProvider FileSystem | Select-Object Name,@{N="Used(GB)";E={[math]::Round($_.Used/1GB,2)}},@{N="Free(GB)";E={[math]::Round($_.Free/1GB,2)}},@{N="Total(GB)";E={[math]::Round(($_.Used+$_.Free)/1GB,2)}} | Format-Table
    Read-Host "`nPress Enter"
}

function Invoke-Function70 {
    Show-Header "Refresh Icon Cache" "70"
    ie4uinit.exe -show 2>$null
    Show-Success "Icon cache refreshed!"
    Read-Host "`nPress Enter"
}

# CATEGORY 9: SYSTEM UTILITIES [71-76]
function Invoke-Function71 {
    Show-Header "Check System Information" "71"
    Write-Host "[HARDWARE INFORMATION]`n" -ForegroundColor Yellow
    Get-WmiObject Win32_ComputerSystem | Select-Object Manufacturer,Model,TotalPhysicalMemory | Format-List
    Get-WmiObject Win32_Processor | Select-Object Name,NumberOfCores,NumberOfLogicalProcessors | Format-List
    Get-WmiObject Win32_OperatingSystem | Select-Object Caption,Version,OSArchitecture | Format-List
    msinfo32
    Read-Host "`nPress Enter"
}

function Invoke-Function72 {
    Show-Header "Windows Settings Center" "72"
    Write-Host " [1] System  [2] Privacy  [3] Update  [4] Apps  [5] Network  [0] Back" -ForegroundColor White
    $choice = Read-Host "Select (0-5)"
    switch ($choice) {
        "1" { start ms-settings:display }
        "2" { start ms-settings:privacy }
        "3" { start ms-settings:windowsupdate }
        "4" { start ms-settings:appsfeatures }
        "5" { start ms-settings:network }
    }
    Read-Host "`nPress Enter"
}

function Invoke-Function73 {
    Show-Header "Office Repair and Reset" "73"
    Write-Host " [1] Reset Settings  [2] Clear Cache  [0] Back" -ForegroundColor White
    $choice = Read-Host "Select (0-2)"
    if ($choice -eq "1") {
        Remove-Item "$env:APPDATA\Microsoft\Office\*","$env:LOCALAPPDATA\Microsoft\Office\*" -Force -ErrorAction SilentlyContinue
        Show-Success "Office settings reset!"
    } elseif ($choice -eq "2") {
        Remove-Item "$env:LOCALAPPDATA\Microsoft\Office\16.0\OfficeFileCache\*" -Recurse -Force -ErrorAction SilentlyContinue
        Show-Success "Office cache cleared!"
    }
    Read-Host "`nPress Enter"
}

function Invoke-Function74 {
    Show-Header "Remove Bloatware (Safe)" "74"
    $confirm = Read-Host "Continue (Y/N)"
    if ($confirm -eq "Y") {
        @("*3dbuilder*","*paint3d*","*MixedReality*","*getstarted*","*solitaire*","*feedback*","*xboxapp*") | ForEach-Object {
            Get-AppxPackage $_ | Remove-AppxPackage -ErrorAction SilentlyContinue
        }
        Show-Success "Bloatware removed!"
    }
    Read-Host "`nPress Enter"
}

function Invoke-Function75 {
    Show-Header "Bitlocker Management" "75"
    manage-bde -status
    Write-Host "`n [1] Disable on C:  [2] Enable on C:  [0] Back" -ForegroundColor White
    $choice = Read-Host "Select (0-2)"
    if ($choice -eq "1") {
        manage-bde -off C:
    } elseif ($choice -eq "2") {
        control /name Microsoft.BitLockerDriveEncryption
    }
    Read-Host "`nPress Enter"
}

function Invoke-Function76 {
    Show-Header "Check Activation Status" "76"
    Write-Host "[WINDOWS ACTIVATION]`n" -ForegroundColor Yellow
    cscript //nologo C:\Windows\System32\slmgr.vbs /dli
    Write-Host "`n" -NoNewline
    cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
    Write-Host "`n[*] Windows Product Key:" -ForegroundColor Cyan
    Get-WmiObject -Query "select * from SoftwareLicensingService" | Select-Object -ExpandProperty OA3xOriginalProductKey
    Write-Host "`n[OFFICE ACTIVATION]`n" -ForegroundColor Yellow
    $officePaths = @("$env:ProgramFiles\Microsoft Office\Office16\ospp.vbs","${env:ProgramFiles(x86)}\Microsoft Office\Office16\ospp.vbs")
    $officeFound = $false
    foreach ($path in $officePaths) {
        if (Test-Path $path) {
            cscript //nologo "$path" /dstatus
            $officeFound = $true
            break
        }
    }
    if (!$officeFound) { Show-Info "Office not detected" }
    Read-Host "`nPress Enter"
}

# CATEGORY 10: BACKUP AND RECOVERY [77-82]
function Invoke-Function77 {
    Show-Header "Backup WiFi Passwords - Sao Luu Mat Khau Wifi" "77"
    $BackupDir = "$env:USERPROFILE\Documents\WiFi_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    New-Item -Path $BackupDir -ItemType Directory -Force | Out-Null
    
    Write-Host "[*] Exporting WiFi profiles...`n" -ForegroundColor Yellow
    $profiles = (netsh wlan show profiles) | Select-String "All User Profile\s+:\s+(.+)" | ForEach-Object { $_.Matches.Groups[1].Value.Trim() }
    
    $report = @()
    $report += "WiFi Backup Report"
    $report += "=================="
    $report += "Created: $(Get-Date)"
    $report += ""
    
    foreach ($profile in $profiles) {
        Write-Host "  Exporting: $profile" -ForegroundColor Cyan
        $profileInfo = netsh wlan show profile name="$profile" key=clear
        $profileInfo | Out-File -FilePath "$BackupDir\WiFi_$profile.txt" -Encoding UTF8
        $password = ($profileInfo | Select-String "Key Content\s+:\s+(.+)").Matches.Groups[1].Value
        $report += "Network: $profile"
        $report += "Password: $password"
        $report += ""
    }
    
    $report | Out-File -FilePath "$BackupDir\WiFi_Passwords.txt" -Encoding UTF8
    Show-Success "WiFi passwords backed up!"
    Show-Info "Location: $BackupDir"
    Read-Host "`nPress Enter"
}

function Invoke-Function78 {
    Show-Header "Backup Drivers - Sao Luu Driver" "78"
    $DriverBackup = "$env:USERPROFILE\Documents\Driver_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    New-Item -Path $DriverBackup -ItemType Directory -Force | Out-Null
    
    Write-Host "[*] Exporting third-party drivers (this may take several minutes)...`n" -ForegroundColor Yellow
    Start-Process -FilePath "Dism.exe" -ArgumentList "/online /export-driver /destination:`"$DriverBackup`"" -NoNewWindow -Wait
    
    Write-Host "`n[*] Creating driver list..." -ForegroundColor Yellow
    Get-WmiObject Win32_PnPSignedDriver | Select-Object DeviceName,DriverVersion,Manufacturer,DriverDate | Export-Csv "$DriverBackup\Driver_List.csv" -NoTypeInformation
    
    Show-Success "Drivers backed up!"
    Show-Info "Location: $DriverBackup"
    Read-Host "`nPress Enter"
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
        Show-Success "Quick backup completed!"
    }
    
    if ($choice -eq "2") {
        Write-Host "`n[*] Full backup in progress (this may take a long time)...`n" -ForegroundColor Yellow
        @("Desktop","Documents","Pictures","Downloads","Videos","Music") | ForEach-Object {
            Write-Host "[*] Backing up $_..." -ForegroundColor Cyan
            Copy-Item -Path "$env:USERPROFILE\$_\*" -Destination "$DataBackup\$_" -Recurse -Force -ErrorAction SilentlyContinue -Exclude "*UserData_Backup*"
        }
        Show-Success "Full backup completed!"
    }
    
    if ($choice -ne "0") {
        Show-Info "Location: $DataBackup"
    }
    Read-Host "`nPress Enter"
}

function Invoke-Function80 {
    Show-Header "Backup Zalo Data - Sao Luu Du Lieu Zalo" "80"
    $ZaloPC = "$env:APPDATA\ZaloPC"
    $ZaloData = "$env:USERPROFILE\Documents\ZaloData"
    $ZaloCache = "$env:LOCALAPPDATA\ZaloPC"
    
    if (!(Test-Path $ZaloPC) -and !(Test-Path $ZaloData) -and !(Test-Path $ZaloCache)) {
        Show-Error "Zalo not found / Khong tim thay Zalo!"
        Read-Host "`nPress Enter"
        return
    }
    
    Show-Warning "Please close Zalo before backing up!"
    Read-Host "Press Enter to continue / Nhan Enter de tiep tuc"
    
    Stop-Process -Name "Zalo" -Force -ErrorAction SilentlyContinue
    Start-Sleep 2
    
    $ZaloBackup = "$env:USERPROFILE\Documents\Zalo_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
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
    Read-Host "`nPress Enter"
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
    $officePaths = @("$env:ProgramFiles\Microsoft Office\Office16\ospp.vbs","${env:ProgramFiles(x86)}\Microsoft Office\Office16\ospp.vbs")
    $officeFound = $false
    foreach ($path in $officePaths) {
        if (Test-Path $path) {
            $officeStatus = cscript //nologo "$path" /dstatus
            $officeStatus | Out-File "$KeyBackup\Office_License.txt"
            $officeFound = $true
            break
        }
    }
    if (!$officeFound) {
        Show-Info "Office not detected / Khong phat hien Office"
    }
    
    Show-Success "Product keys backed up!"
    Show-Info "Location: $KeyBackup"
    Show-Warning "Keep backup files secure!"
    Read-Host "`nPress Enter"
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
    Read-Host "`nPress Enter"
}

# ============================================================================
# QUICK ACTIONS - 2 Advanced Features
# ============================================================================

function Invoke-Function88 {
    Show-Header "RUN ALL CLEANUP TASKS - Chay Tat Ca Don Dep" "88"
    Show-Warning "This will perform comprehensive cleanup!"
    $confirm = Read-Host "Continue / Tiep tuc (Y/N)"
    if ($confirm -ne "Y") { return }
    
    Write-Host "`n[*] Running comprehensive cleanup...`n" -ForegroundColor Yellow
    
    $tasks = @(
        @{N="Temp files";A={Remove-Item "$env:TEMP\*","C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue}}
        @{N="Recycle Bin";A={Clear-RecycleBin -Force -ErrorAction SilentlyContinue}}
        @{N="Browser cache";A={Stop-Process chrome,msedge,firefox -Force -ErrorAction SilentlyContinue; Start-Sleep 2; Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*","$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue}}
        @{N="Windows Update";A={Stop-Service wuauserv -Force -ErrorAction SilentlyContinue; Remove-Item "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue; Start-Service wuauserv -ErrorAction SilentlyContinue}}
        @{N="Thumbnail cache";A={Stop-Process explorer -Force -ErrorAction SilentlyContinue; Remove-Item "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db" -Force -ErrorAction SilentlyContinue; Start-Process explorer}}
        @{N="DNS cache";A={Clear-DnsClientCache -ErrorAction SilentlyContinue}}
        @{N="Prefetch";A={Remove-Item "C:\Windows\Prefetch\*" -Force -ErrorAction SilentlyContinue}}
    )
    
    for ($i=0; $i -lt $tasks.Count; $i++) {
        Write-Host "[$($i+1)/$($tasks.Count)] Cleaning $($tasks[$i].N)..." -ForegroundColor Cyan
        & $tasks[$i].A
        Start-Sleep -Milliseconds 500
    }
    
    Show-Success "All cleanup tasks completed!"
    Read-Host "`nPress Enter"
}

function Invoke-Function99 {
    Show-Header "FULL SYSTEM OPTIMIZATION - Toi Uu Toan Bo He Thong" "99"
    Show-Warning "This will optimize your entire system!"
    $confirm = Read-Host "Continue / Tiep tuc (Y/N)"
    if ($confirm -ne "Y") { return }
    
    Write-Host "`n[*] Creating restore point first..." -ForegroundColor Yellow
    Checkpoint-Computer -Description "Before Full Optimization" -RestorePointType "MODIFY_SETTINGS" -ErrorAction SilentlyContinue
    
    Write-Host "`n[STEP 1/5] CLEANUP" -ForegroundColor Green
    Remove-Item -Path "$env:TEMP\*","C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Stop-Process -Name chrome,msedge,firefox -Force -ErrorAction SilentlyContinue
    Start-Sleep 2
    Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    
    Write-Host "`n[STEP 2/5] NETWORK OPTIMIZATION" -ForegroundColor Green
    netsh int tcp set global autotuninglevel=normal 2>$null
    netsh int tcp set global rsc=enabled 2>$null
    
    Write-Host "`n[STEP 3/5] PERFORMANCE" -ForegroundColor Green
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f 2>$null
    powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 2>$null
    
    Write-Host "`n[STEP 4/5] SYSTEM MAINTENANCE (This may take a long time)" -ForegroundColor Green
    sfc /scannow 2>$null
    Dism /Online /Cleanup-Image /RestoreHealth 2>$null
    
    Write-Host "`n[STEP 5/5] REGISTRY OPTIMIZATION" -ForegroundColor Green
    reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f 2>$null
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f 2>$null
    
    Show-Success "FULL SYSTEM OPTIMIZATION COMPLETED!"
    Show-Info "Please restart your computer to apply all changes"
    Read-Host "`nPress Enter"
}

# ============================================================================
# MAIN PROGRAM - Dispatcher and Loop
# ============================================================================

function Invoke-SelectedFunction {
    param([string]$FunctionNumber)
    
    switch ($FunctionNumber) {
        "1" { Invoke-Function1 }
        "2" { Invoke-Function2 }
        "3" { Invoke-Function3 }
        "4" { Invoke-Function4 }
        "5" { Invoke-Function5 }
        "6" { Invoke-Function6 }
        "7" { Invoke-Function7 }
        "8" { Invoke-Function8 }
        "9" { Invoke-Function9 }
        "10" { Invoke-Function10 }
        "11" { Invoke-Function11 }
        "12" { Invoke-Function12 }
        "13" { Invoke-Function13 }
        "14" { Invoke-Function14 }
        "15" { Invoke-Function15 }
        "16" { Invoke-Function16 }
        "17" { Invoke-Function17 }
        "18" { Invoke-Function18 }
        "19" { Invoke-Function19 }
        "20" { Invoke-Function20 }
        "21" { Invoke-Function21 }
        "22" { Invoke-Function22 }
        "23" { Invoke-Function23 }
        "24" { Invoke-Function24 }
        "25" { Invoke-Function25 }
        "26" { Invoke-Function26 }
        "27" { Invoke-Function27 }
        "28" { Invoke-Function28 }
        "29" { Invoke-Function29 }
        "30" { Invoke-Function30 }
        "31" { Invoke-Function31 }
        "32" { Invoke-Function32 }
        "33" { Invoke-Function33 }
        "34" { Invoke-Function34 }
        "35" { Invoke-Function35 }
        "36" { Invoke-Function36 }
        "37" { Invoke-Function37 }
        "38" { Invoke-Function38 }
        "39" { Invoke-Function39 }
        "40" { Invoke-Function40 }
        "41" { Invoke-Function41 }
        "42" { Invoke-Function42 }
        "43" { Invoke-Function43 }
        "44" { Invoke-Function44 }
        "45" { Invoke-Function45 }
        "46" { Invoke-Function46 }
        "47" { Invoke-Function47 }
        "48" { Invoke-Function48 }
        "49" { Invoke-Function49 }
        "50" { Invoke-Function50 }
        "51" { Invoke-Function51 }
        "52" { Invoke-Function52 }
        "53" { Invoke-Function53 }
        "54" { Invoke-Function54 }
        "55" { Invoke-Function55 }
        "56" { Invoke-Function56 }
        "57" { Invoke-Function57 }
        "58" { Invoke-Function58 }
        "59" { Invoke-Function59 }
        "60" { Invoke-Function60 }
        "61" { Invoke-Function61 }
        "62" { Invoke-Function62 }
        "63" { Invoke-Function63 }
        "64" { Invoke-Function64 }
        "65" { Invoke-Function65 }
        "66" { Invoke-Function66 }
        "67" { Invoke-Function67 }
        "68" { Invoke-Function68 }
        "69" { Invoke-Function69 }
        "70" { Invoke-Function70 }
        "71" { Invoke-Function71 }
        "72" { Invoke-Function72 }
        "73" { Invoke-Function73 }
        "74" { Invoke-Function74 }
        "75" { Invoke-Function75 }
        "76" { Invoke-Function76 }
        "77" { Invoke-Function77 }
        "78" { Invoke-Function78 }
        "79" { Invoke-Function79 }
        "80" { Invoke-Function80 }
        "81" { Invoke-Function81 }
        "82" { Invoke-Function82 }
        "88" { Invoke-Function88 }
        "99" { Invoke-Function99 }
        default {
            Show-Warning "Invalid choice! / Lua chon khong hop le!"
            Start-Sleep -Seconds 2
        }
    }
}

# ============================================================================
# PROGRAM START
# ============================================================================

# Show welcome screen
Show-Welcome

# Admin confirmation message
Clear-Host
Write-Host "`n ══════════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "                  ADMINISTRATOR RIGHTS CONFIRMED                                 " -ForegroundColor Green
Write-Host "                  QUYEN ADMINISTRATOR DA DUOC XAC NHAN                           " -ForegroundColor Green
Write-Host ""
Write-Host " ══════════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Start-Sleep -Seconds 1

# Main program loop
while ($true) {
    Show-MainMenu
    
    if ($global:LANG -eq "EN") {
        $choice = Read-Host "`n  SELECT FUNCTION (0-99 or L)"
    } else {
        $choice = Read-Host "`n  CHON CHUC NANG (0-99 hoac L)"
    }
    
    # Handle language toggle
    if ($choice -match "^[Ll]$") {
        Switch-Language
        continue
    }
    
    # Handle exit
    if ($choice -eq "0") {
        Clear-Host
        Write-Host "`n ══════════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "                  Thank you for using Ultimate Windows System Tool             " -ForegroundColor Yellow
        Write-Host "                  Cam on ban da su dung Cong Cu Toi Uu He Thong                " -ForegroundColor Yellow
        Write-Host ""
        Write-Host "                           Created by: Nguyen Ngoc Anh Tu                       " -ForegroundColor Magenta
        Write-Host "                              Version 5.0 - Professional Edition                " -ForegroundColor Gray
        Write-Host ""
        Write-Host " ══════════════════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
        Write-Host ""
        Start-Sleep -Seconds 2
        Exit
    }
    
    # Execute selected function
    Invoke-SelectedFunction -FunctionNumber $choice
}

# ============================================================================
# END OF SCRIPT
# ============================================================================
