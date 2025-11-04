# ============================================================================
# UNBLOCK AND RUN - Giai phap cho Security Warning
# Tac gia: Nguyen Ngoc Anh Tu
# ============================================================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host " UNBLOCK AND RUN TOOL" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-NOT $isAdmin) {
    Write-Host "[!] Can quyen Administrator / Need Administrator rights" -ForegroundColor Red
    Write-Host "[*] Tu dong xin quyen / Auto-elevating..." -ForegroundColor Yellow
    Start-Sleep -Seconds 1
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

Write-Host "[+] Running as Administrator / Chay voi quyen Admin" -ForegroundColor Green
Write-Host ""

# Get script directory
$scriptPath = Split-Path -Parent $PSCommandPath
$mainScript = Join-Path $scriptPath "UltimateSystemTool.ps1"

Write-Host "[1] Unblocking file / Dang unblock file..." -ForegroundColor Yellow
try {
    Unblock-File -Path $mainScript -ErrorAction Stop
    Write-Host "    [+] SUCCESS / THANH CONG!" -ForegroundColor Green
} catch {
    Write-Host "    [!] WARNING: $_" -ForegroundColor Red
    Write-Host "    [*] Tiep tuc chay / Continuing anyway..." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "[2] Setting Execution Policy / Dang cai dat policy..." -ForegroundColor Yellow
try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force -ErrorAction Stop
    Write-Host "    [+] SUCCESS / THANH CONG!" -ForegroundColor Green
} catch {
    Write-Host "    [!] WARNING: $_" -ForegroundColor Red
}

Write-Host ""
Write-Host "[3] Running main script / Dang chay script chinh..." -ForegroundColor Yellow
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Start-Sleep -Seconds 1

# Run the main script
try {
    & $mainScript
} catch {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host " ERROR / LOI!" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Error: $_" -ForegroundColor White
    Write-Host ""
    Write-Host "Line: $($_.InvocationInfo.ScriptLineNumber)" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Press Enter to exit"
}
