# ============================================
# Script D?n D?p R?c T? ??ng cho Windows
# Y?u c?u: Ch?y v?i quy?n Administrator
# ============================================

# Ki?m tra quy?n Admin
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "??  C?NH B?O: Script n?y c?n ch?y v?i quy?n Administrator!" -ForegroundColor Red
    Write-Host "H?y click chu?t ph?i v? ch?n 'Run as Administrator'" -ForegroundColor Yellow
    pause
    exit
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   C?NG C? D?N D?P R?C T? ??NG" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# H?m hi?n th? k?ch th??c
function Get-FolderSize {
    param([string]$path)
    if (Test-Path $path) {
        $size = (Get-ChildItem $path -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
        return [math]::Round($size / 1MB, 2)
    }
    return 0
}

# H?m x?a an to?n
function Remove-SafeFolder {
    param(
        [string]$path,
        [string]$description
    )
    
    if (Test-Path $path) {
        $sizeBefore = Get-FolderSize $path
        Write-Host "???  ?ang x?a: $description" -ForegroundColor Yellow
        Write-Host "   ???ng d?n: $path" -ForegroundColor Gray
        Write-Host "   K?ch th??c: $sizeBefore MB" -ForegroundColor Gray
        
        try {
            Remove-Item -Path "$path\*" -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "   ? ?? x?a th?nh c?ng!" -ForegroundColor Green
            return $sizeBefore
        } catch {
            Write-Host "   ??  Kh?ng th? x?a m?t s? file (c? th? ?ang ???c s? d?ng)" -ForegroundColor Yellow
            return 0
        }
    } else {
        Write-Host "??  B? qua: $description (kh?ng t?n t?i)" -ForegroundColor Gray
        return 0
    }
    Write-Host ""
}

$totalCleaned = 0

Write-Host "?? B?T ??U QU? TR?NH D?N D?P..." -ForegroundColor Green
Write-Host ""

# 1. Windows Temp
Write-Host "[1/12] Windows Temp Folder" -ForegroundColor Cyan
$totalCleaned += Remove-SafeFolder -path "$env:SystemRoot\Temp" -description "Windows Temp"

# 2. User Temp
Write-Host "[2/12] User Temp Folder" -ForegroundColor Cyan
$totalCleaned += Remove-SafeFolder -path "$env:TEMP" -description "User Temp"

# 3. Windows Update Cache
Write-Host "[3/12] Windows Update Cache" -ForegroundColor Cyan
$totalCleaned += Remove-SafeFolder -path "$env:SystemRoot\SoftwareDistribution\Download" -description "Windows Update Cache"

# 4. Prefetch
Write-Host "[4/12] Prefetch Files" -ForegroundColor Cyan
$totalCleaned += Remove-SafeFolder -path "$env:SystemRoot\Prefetch" -description "Prefetch"

# 5. Recent Items
Write-Host "[5/12] Recent Items" -ForegroundColor Cyan
$totalCleaned += Remove-SafeFolder -path "$env:APPDATA\Microsoft\Windows\Recent" -description "Recent Items"

# 6. Windows Error Reports
Write-Host "[6/12] Windows Error Reports" -ForegroundColor Cyan
$totalCleaned += Remove-SafeFolder -path "$env:ProgramData\Microsoft\Windows\WER\ReportQueue" -description "Windows Error Reports"

# 7. Thumbnail Cache
Write-Host "[7/12] Thumbnail Cache" -ForegroundColor Cyan
$totalCleaned += Remove-SafeFolder -path "$env:LOCALAPPDATA\Microsoft\Windows\Explorer" -description "Thumbnail Cache"

# 8. Browser Cache - Chrome
Write-Host "[8/12] Google Chrome Cache" -ForegroundColor Cyan
$totalCleaned += Remove-SafeFolder -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache" -description "Chrome Cache"

# 9. Browser Cache - Edge
Write-Host "[9/12] Microsoft Edge Cache" -ForegroundColor Cyan
$totalCleaned += Remove-SafeFolder -path "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache" -description "Edge Cache"

# 10. Browser Cache - Firefox
Write-Host "[10/12] Firefox Cache" -ForegroundColor Cyan
$firefoxProfile = Get-ChildItem "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles" -ErrorAction SilentlyContinue | Select-Object -First 1
if ($firefoxProfile) {
    $totalCleaned += Remove-SafeFolder -path "$($firefoxProfile.FullName)\cache2" -description "Firefox Cache"
} else {
    Write-Host "??  Firefox kh?ng ???c c?i ??t" -ForegroundColor Gray
}

# 11. Recycle Bin
Write-Host "[11/12] Recycle Bin" -ForegroundColor Cyan
try {
    $shell = New-Object -ComObject Shell.Application
    $recycleBin = $shell.Namespace(0xA)
    $size = ($recycleBin.Items() | Measure-Object -Property Size -Sum).Sum / 1MB
    $size = [math]::Round($size, 2)
    
    Write-Host "???  ?ang d?n Recycle Bin..." -ForegroundColor Yellow
    Write-Host "   K?ch th??c: $size MB" -ForegroundColor Gray
    
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    Write-Host "   ? ?? x?a th?nh c?ng!" -ForegroundColor Green
    $totalCleaned += $size
} catch {
    Write-Host "   ??  Kh?ng th? d?n Recycle Bin" -ForegroundColor Yellow
}
Write-Host ""

# 12. Disk Cleanup Tool (t?y ch?n)
Write-Host "[12/12] Windows Disk Cleanup" -ForegroundColor Cyan
Write-Host "?? ?ang ch?y Windows Disk Cleanup..." -ForegroundColor Yellow
try {
    # Ch?y Disk Cleanup v?i tham s? t? ??ng
    Start-Process cleanmgr -ArgumentList "/sagerun:1" -NoNewWindow -Wait -ErrorAction SilentlyContinue
    Write-Host "   ? Ho?n th?nh!" -ForegroundColor Green
} catch {
    Write-Host "   ??  Kh?ng th? ch?y Disk Cleanup" -ForegroundColor Yellow
}
Write-Host ""

# T?ng k?t
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   K?T QU? D?N D?P" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "? T?ng dung l??ng ?? gi?i ph?ng: $([math]::Round($totalCleaned, 2)) MB" -ForegroundColor Green
Write-Host "? T??ng ???ng: $([math]::Round($totalCleaned / 1024, 2)) GB" -ForegroundColor Green
Write-Host ""
Write-Host "? HO?N TH?NH! M?y t?nh c?a b?n ?? s?ch h?n!" -ForegroundColor Green
Write-Host ""

# H?i c? mu?n t?i ?u th?m kh?ng
$optimize = Read-Host "B?n c? mu?n ch?y th?m l?nh t?i ?u h? th?ng? (Y/N)"
if ($optimize -eq "Y" -or $optimize -eq "y") {
    Write-Host ""
    Write-Host "?? ?ang t?i ?u h?a h? th?ng..." -ForegroundColor Yellow
    
    # D?n d?p Windows Component Store
    Write-Host "   - D?n d?p Windows Component Store (c? th? m?t v?i ph?t)..." -ForegroundColor Gray
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
    
    Write-Host "   ? T?i ?u ho?n t?t!" -ForegroundColor Green
}

Write-Host ""
Write-Host "Nh?n ph?m b?t k? ?? tho?t..." -ForegroundColor Gray
pause
