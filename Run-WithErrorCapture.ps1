# ============================================================================
# ERROR CAPTURE WRAPPER - Chay script va bat loi
# Tac gia: Nguyen Ngoc Anh Tu
# ============================================================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host " RUNNING SCRIPT WITH ERROR CAPTURE" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

try {
    # Run the main script
    & "$PSScriptRoot\UltimateSystemTool.ps1"
} catch {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host " LOI / ERROR DETECTED!" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Error Message:" -ForegroundColor Yellow
    Write-Host $_.Exception.Message -ForegroundColor White
    Write-Host ""
    Write-Host "Error Location:" -ForegroundColor Yellow
    Write-Host "Line: $($_.InvocationInfo.ScriptLineNumber)" -ForegroundColor White
    Write-Host "Position: $($_.InvocationInfo.PositionMessage)" -ForegroundColor White
    Write-Host ""
    Write-Host "Full Error:" -ForegroundColor Yellow
    Write-Host $_ -ForegroundColor White
    Write-Host ""
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host " Script finished / Script da ket thuc" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to exit / Nhan Enter de thoat"
