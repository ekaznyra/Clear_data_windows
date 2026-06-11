# Clear Data Windows

Ban toi uu chay truc tiep tren PowerShell, khong GUI de nhe va nhanh hon.

## Chay

Double-click:

```text
Run_ClearData.bat
```

Hoac PowerShell:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
.\ClearData.ps1
```

## Lenh nhanh

```powershell
.\ClearData.ps1 -Mode Scan
.\ClearData.ps1 -Mode Safe
.\ClearData.ps1 -Mode Recommended
.\ClearData.ps1 -Mode Deep
.\ClearData.ps1 -AutoScan
.\ClearData.ps1 -AutoClean
.\ClearData.ps1 -LargeFiles -LargeFileMB 1024
```

## An toan

- Quet truoc khi xoa.
- Nhap `YES` moi xoa, tru khi dung `-Yes`.
- Chi xoa cache/temp/log/dump trong danh sach an toan.
- Khong xoa Desktop, Documents, Downloads, System32, Program Files.
- Khong tu tat ung dung dang chay.
 
## Version 3.10.0
- Added InstallAutoScan UninstallSchedules RunAsAdmin.

