# Test Script - Verify PowerShell can run
# Author: Nguyen Ngoc Anh Tu

Write-Host "========================================" -ForegroundColor Cyan
Write-Host " TESTING POWERSHELL SCRIPT" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Test 1: Basic functions
Write-Host "[1] Testing basic output..." -ForegroundColor Green
Write-Host "    Success!" -ForegroundColor White

# Test 2: Variables
Write-Host "[2] Testing variables..." -ForegroundColor Green
$testVar = "Hello World"
Write-Host "    $testVar" -ForegroundColor White

# Test 3: Array
Write-Host "[3] Testing array..." -ForegroundColor Green
$testArray = @(
    @{Name="Test1"; Value=1},
    @{Name="Test2"; Value=2}
)
Write-Host "    Array count: $($testArray.Count)" -ForegroundColor White

# Test 4: Function
Write-Host "[4] Testing function..." -ForegroundColor Green
function Test-Function {
    Write-Host "    Function works!" -ForegroundColor White
}
Test-Function

# Test 5: Try loading main script functions
Write-Host "[5] Testing main script syntax..." -ForegroundColor Green
try {
    $errors = @()
    $content = Get-Content "UltimateSystemTool.ps1" -Raw
    $null = [System.Management.Automation.PSParser]::Tokenize($content, [ref]$errors)
    if ($errors.Count -eq 0) {
        Write-Host "    Main script syntax: OK!" -ForegroundColor Green
    } else {
        Write-Host "    Main script has errors:" -ForegroundColor Red
        $errors | ForEach-Object { Write-Host "      Line $($_.StartLine): $($_.Message)" -ForegroundColor Red }
    }
} catch {
    Write-Host "    Error checking syntax: $_" -ForegroundColor Red
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host " TEST COMPLETE!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to exit"
