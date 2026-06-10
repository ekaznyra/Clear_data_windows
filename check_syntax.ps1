$errs = $null
[System.Management.Automation.Language.Parser]::ParseFile('C:\Users\kaze\Downloads\Clear_data_windows-main\ClearData.ps1', [ref]$null, [ref]$errs)
if ($errs) {
    $errs | ForEach-Object { Write-Host "Line $($_.Extent.StartLineNumber): $($_.Message)" }
} else {
    Write-Host "No syntax errors"
}
