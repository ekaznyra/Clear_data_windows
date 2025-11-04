@echo off
setlocal enabledelayedexpansion
:: ============================================================================
:: ULTIMATE SYSTEM TOOLS v5.0 - ADVANCED MODULE
:: Cong Cu Nang Cao - Professional Edition
:: ============================================================================
:: Author: Nguyen Ngoc Anh Tu
:: Module: Installation, Utilities, Drivers, ISOs
:: Compatible: Windows 7, 8, 10, 11 (32/64-bit)
:: ============================================================================

title Ultimate System Tools v5.0 - Advanced Module
color 0B

:: Check Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo.
    echo  [!] CAN QUYEN ADMINISTRATOR / NEED ADMIN RIGHTS
    echo  [!] Tu dong xin quyen / Auto-elevating...
    echo.
    timeout /t 2 /nobreak >nul
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~0\"' -Verb RunAs" 2>nul
    exit
)

:MAIN_MENU
cls
color 0B
echo.
echo  ================================================================================
echo                                                                                
echo             ULTIMATE SYSTEM TOOLS v5.0 - ADVANCED MODULE                       
echo              Cong Cu Nang Cao - Cai Dat va Tien Ich                           
echo                                                                                
echo  ================================================================================
echo.
echo  -------------------------------------------------------------------------------
echo   CAI DAT / INSTALLATION [1-5]
echo  -------------------------------------------------------------------------------
echo   [1]  Cai Dat Phan Mem          - Install Software (Chocolatey)
echo   [2]  Cai Dat Office            - Install Office Suite
echo   [3]  Tao WinPE Boot            - Create WinPE Bootable USB
echo   [4]  Store cho Win LTSC        - Microsoft Store for LTSC
echo   [5]  Cai Win bang Win To HDD   - Install Windows via Win To HDD
echo  -------------------------------------------------------------------------------
echo.
echo  -------------------------------------------------------------------------------
echo   TIEN ICH KHAC / OTHER UTILITIES [6-14]
echo  -------------------------------------------------------------------------------
echo   [6]  Xoa File Rac              - Clean Junk Files (Advanced)
echo   [7]  Hien File An              - Show Hidden Files
echo   [8]  Dat/Tat Update            - Enable/Disable Windows Update
echo   [9]  Fix Loi May In            - Fix Printer Issues
echo   [10] Check - Test              - System Test Tools
echo   [11] Windows Defender          - Defender Management
echo   [12] Kho ISO Windows           - Windows ISO Repository
echo   [13] Kho Driver IRST           - Intel RST Drivers
echo   [14] Skus Win/Office           - Product Key Management
echo  -------------------------------------------------------------------------------
echo.
echo  -------------------------------------------------------------------------------
echo   [88] CHAY TAT CA TIEN ICH     [99] TOI UU TOAN BO
echo   [0]  THOAT / EXIT
echo  -------------------------------------------------------------------------------
echo.

set /p choice="  CHON CHUC NANG [0-99]: "

if "%choice%"=="0" goto EXIT
if "%choice%"=="1" goto INSTALL_SOFTWARE
if "%choice%"=="2" goto INSTALL_OFFICE
if "%choice%"=="3" goto CREATE_WINPE
if "%choice%"=="4" goto LTSC_STORE
if "%choice%"=="5" goto WIN_TO_HDD
if "%choice%"=="6" goto CLEAN_JUNK
if "%choice%"=="7" goto SHOW_HIDDEN
if "%choice%"=="8" goto UPDATE_TOGGLE
if "%choice%"=="9" goto FIX_PRINTER
if "%choice%"=="10" goto CHECK_TEST
if "%choice%"=="11" goto DEFENDER_MANAGE
if "%choice%"=="12" goto ISO_REPO
if "%choice%"=="13" goto IRST_DRIVERS
if "%choice%"=="14" goto SKU_MANAGE
if "%choice%"=="88" goto RUN_ALL
if "%choice%"=="99" goto OPTIMIZE_ALL

echo  [!] Lua chon khong hop le! / Invalid choice!
timeout /t 2 /nobreak >nul
goto MAIN_MENU

:: ============================================================================
:: INSTALLATION FUNCTIONS [1-5]
:: ============================================================================

:INSTALL_SOFTWARE
cls
color 0E
echo.
echo  ================================================================================
echo   [1] CAI DAT PHAN MEM - INSTALL SOFTWARE
echo  ================================================================================
echo.
echo  Su dung Chocolatey - Windows Package Manager
echo.
echo  [*] Kiem tra Chocolatey...

where choco >nul 2>&1
if %errorLevel% neq 0 (
    echo  [!] Chocolatey chua cai dat
    echo  [*] Dang cai dat Chocolatey...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
    if %errorLevel% equ 0 (
        echo  [+] Chocolatey da duoc cai dat thanh cong!
    ) else (
        echo  [!] Loi khi cai dat Chocolatey
        pause
        goto MAIN_MENU
    )
) else (
    echo  [+] Chocolatey da duoc cai dat!
)

echo.
echo  -------------------------------------------------------------------------------
echo   CHON PHAN MEM CAN CAI / SELECT SOFTWARE TO INSTALL
echo  -------------------------------------------------------------------------------
echo.
echo   [1]  Google Chrome          [2]  Firefox
echo   [3]  7-Zip                  [4]  WinRAR
echo   [5]  VLC Media Player       [6]  Adobe Reader
echo   [7]  Notepad++              [8]  Visual Studio Code
echo   [9]  Git                    [10] Python
echo   [11] Java JDK               [12] Node.js
echo   [13] CCleaner               [14] TeamViewer
echo   [15] Zoom                   [16] Discord
echo   [17] Telegram               [18] Skype
echo   [19] Cai Tat Ca Tien Ich   [0]  Quay lai / Back
echo.

set /p sw="  Chon phan mem (0-19): "

if "%sw%"=="0" goto MAIN_MENU
if "%sw%"=="1" choco install googlechrome -y
if "%sw%"=="2" choco install firefox -y
if "%sw%"=="3" choco install 7zip -y
if "%sw%"=="4" choco install winrar -y
if "%sw%"=="5" choco install vlc -y
if "%sw%"=="6" choco install adobereader -y
if "%sw%"=="7" choco install notepadplusplus -y
if "%sw%"=="8" choco install vscode -y
if "%sw%"=="9" choco install git -y
if "%sw%"=="10" choco install python -y
if "%sw%"=="11" choco install openjdk -y
if "%sw%"=="12" choco install nodejs -y
if "%sw%"=="13" choco install ccleaner -y
if "%sw%"=="14" choco install teamviewer -y
if "%sw%"=="15" choco install zoom -y
if "%sw%"=="16" choco install discord -y
if "%sw%"=="17" choco install telegram -y
if "%sw%"=="18" choco install skype -y
if "%sw%"=="19" (
    echo  [*] Cai dat tat ca phan mem tien ich...
    choco install googlechrome firefox 7zip vlc notepadplusplus vscode -y
)

echo.
echo  [+] HOAN THANH! / COMPLETED!
echo.
pause
goto MAIN_MENU

:INSTALL_OFFICE
cls
color 0E
echo.
echo  ================================================================================
echo   [2] CAI DAT OFFICE - INSTALL OFFICE SUITE
echo  ================================================================================
echo.
echo  [*] Dang kiem tra Office...
echo.

:: Check if Office is installed
reg query "HKLM\SOFTWARE\Microsoft\Office" >nul 2>&1
if %errorLevel% equ 0 (
    echo  [+] Office da duoc cai dat!
    echo.
    echo  [1] Sua chua Office / Repair Office
    echo  [2] Kich hoat Office / Activate Office
    echo  [3] Xoa Office / Uninstall Office
    echo  [0] Quay lai / Back
    echo.
    set /p off="  Chon (0-3): "
    
    if "!off!"=="1" (
        echo  [*] Sua chua Office...
        start /wait control /name Microsoft.ProgramsAndFeatures
    )
    if "!off!"=="2" goto ACTIVATE_OFFICE
    if "!off!"=="3" (
        echo  [*] Xoa Office...
        echo  [!] Vui long xoa qua Control Panel
        start /wait control /name Microsoft.ProgramsAndFeatures
    )
    if "!off!"=="0" goto MAIN_MENU
) else (
    echo  [!] Office chua duoc cai dat
    echo.
    echo  [1] Tai Office Online (Microsoft 365)
    echo  [2] Tai Office Offline Installer
    echo  [3] Huong dan cai dat thu cong
    echo  [0] Quay lai / Back
    echo.
    set /p off2="  Chon (0-3): "
    
    if "!off2!"=="1" (
        echo  [*] Mo trang tai Office...
        start https://www.office.com/
    )
    if "!off2!"=="2" (
        echo  [*] Mo trang tai Office Tool...
        start https://otp.landian.vip/
    )
    if "!off2!"=="3" (
        echo.
        echo  HUONG DAN CAI DAT OFFICE:
        echo  -------------------------
        echo  1. Tai Office Tool Plus: https://otp.landian.vip/
        echo  2. Chon phien ban Office muon cai
        echo  3. Chon cac ung dung (Word, Excel, PowerPoint...)
        echo  4. Click "Start Install"
        echo.
    )
)

pause
goto MAIN_MENU

:ACTIVATE_OFFICE
echo.
echo  [*] KICH HOAT OFFICE / ACTIVATE OFFICE
echo  =======================================
echo.
echo  [!] LUU Y: Chi dung cho muc dich test!
echo  [!] NOTE: For testing purposes only!
echo.
echo  [1] Tu dong kich hoat (KMS)
echo  [2] Nhap Product Key
echo  [0] Huy / Cancel
echo.
set /p act="  Chon (0-2): "

if "%act%"=="1" (
    echo  [*] Dang kich hoat Office...
    cd /d "%ProgramFiles%\Microsoft Office\Office16" 2>nul || cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16" 2>nul
    if exist ospp.vbs (
        cscript ospp.vbs /sethst:kms.digiboy.ir
        cscript ospp.vbs /act
        echo  [+] Hoan thanh!
    ) else (
        echo  [!] Khong tim thay Office!
    )
)
if "%act%"=="2" (
    set /p key="  Nhap Product Key: "
    cd /d "%ProgramFiles%\Microsoft Office\Office16" 2>nul || cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16" 2>nul
    if exist ospp.vbs (
        cscript ospp.vbs /inpkey:!key!
        cscript ospp.vbs /act
        echo  [+] Hoan thanh!
    ) else (
        echo  [!] Khong tim thay Office!
    )
)

pause
goto MAIN_MENU

:CREATE_WINPE
cls
color 0E
echo.
echo  ================================================================================
echo   [3] TAO WINPE BOOT - CREATE WINPE BOOTABLE USB
echo  ================================================================================
echo.
echo  [*] Yeu cau / Requirements:
echo      - Windows ADK (Assessment and Deployment Kit)
echo      - USB drive (8GB+)
echo.
echo  [1] Tai Windows ADK
echo  [2] Tai WinPE Add-on
echo  [3] Tao WinPE (Yeu cau ADK da cai)
echo  [4] Huong dan chi tiet
echo  [0] Quay lai / Back
echo.
set /p winpe="  Chon (0-4): "

if "%winpe%"=="1" (
    echo  [*] Mo trang tai Windows ADK...
    start https://learn.microsoft.com/en-us/windows-hardware/get-started/adk-install
)
if "%winpe%"=="2" (
    echo  [*] Mo trang tai WinPE Add-on...
    start https://learn.microsoft.com/en-us/windows-hardware/get-started/adk-install
)
if "%winpe%"=="3" (
    echo.
    echo  [*] Kiem tra Windows ADK...
    
    if exist "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools" (
        echo  [+] Windows ADK da duoc cai dat!
        echo.
        echo  [*] Bat dau tao WinPE...
        echo.
        
        call "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\DandISetEnv.bat"
        
        echo  [1] Tao WinPE workspace...
        copype amd64 C:\WinPE_amd64
        
        echo  [2] Mount WinPE image...
        Dism /Mount-Image /ImageFile:"C:\WinPE_amd64\media\sources\boot.wim" /index:1 /MountDir:"C:\WinPE_amd64\mount"
        
        echo  [3] Them drivers va tools...
        echo  [!] Ban co the them drivers/tools vao C:\WinPE_amd64\mount
        pause
        
        echo  [4] Unmount image...
        Dism /Unmount-Image /MountDir:"C:\WinPE_amd64\mount" /commit
        
        echo  [5] Tao ISO...
        MakeWinPEMedia /ISO C:\WinPE_amd64 C:\WinPE_amd64\WinPE_amd64.iso
        
        echo.
        echo  [+] HOAN THANH!
        echo  [+] File ISO: C:\WinPE_amd64\WinPE_amd64.iso
        echo.
    ) else (
        echo  [!] Windows ADK chua duoc cai dat!
        echo  [!] Vui long cai Windows ADK truoc
    )
)
if "%winpe%"=="4" (
    echo.
    echo  HUONG DAN TAO WINPE:
    echo  ====================
    echo  1. Tai va cai Windows ADK
    echo  2. Tai va cai WinPE Add-on
    echo  3. Mo Deployment and Imaging Tools Environment (Admin)
    echo  4. Chay lenh: copype amd64 C:\WinPE_amd64
    echo  5. Tao USB boot: MakeWinPEMedia /UFD C:\WinPE_amd64 E:
    echo     (Thay E: bang drive USB cua ban)
    echo.
)

pause
goto MAIN_MENU

:LTSC_STORE
cls
color 0E
echo.
echo  ================================================================================
echo   [4] STORE CHO WIN LTSC - MICROSOFT STORE FOR LTSC
echo  ================================================================================
echo.
echo  [*] Cai dat Microsoft Store cho Windows 10/11 LTSC
echo.
echo  [!] LUU Y: Chi ho tro Windows 10/11 LTSC
echo.

set /p confirm="  Ban co muon tiep tuc? (Y/N): "
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo  [1] Dang tai Microsoft Store package...
echo.

:: Download and install Microsoft Store
powershell -NoProfile -ExecutionPolicy Bypass -Command "& {Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.WindowsStore_8wekyb3d8bbwe}"

if %errorLevel% equ 0 (
    echo  [+] Microsoft Store da duoc cai dat!
    echo  [+] Vui long khoi dong lai may
) else (
    echo  [!] Loi khi cai dat Store
    echo.
    echo  [*] Thu phuong phap khac...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "& {Get-AppxPackage -allusers Microsoft.WindowsStore | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register `"$($_.InstallLocation)\AppXManifest.xml`"}}"
)

echo.
pause
goto MAIN_MENU

:WIN_TO_HDD
cls
color 0E
echo.
echo  ================================================================================
echo   [5] CAI WIN BANG WIN TO HDD - INSTALL WINDOWS VIA WIN TO HDD
echo  ================================================================================
echo.
echo  [*] WinToHDD - Cai Windows khong can USB/DVD
echo.
echo  [1] Tai WinToHDD Free
echo  [2] Tai WinToHDD Professional
echo  [3] Huong dan su dung
echo  [0] Quay lai / Back
echo.
set /p winhdd="  Chon (0-3): "

if "%winhdd%"=="1" (
    echo  [*] Mo trang tai WinToHDD Free...
    start https://www.easyuefi.com/wintohdd/index.html
)
if "%winhdd%"=="2" (
    echo  [*] Mo trang tai WinToHDD Pro...
    start https://www.easyuefi.com/wintohdd/wintohdd-pro.html
)
if "%winhdd%"=="3" (
    echo.
    echo  HUONG DAN SU DUNG WINTOHDD:
    echo  ============================
    echo  1. Tai va cai dat WinToHDD
    echo  2. Chon "Reinstall Windows"
    echo  3. Chon file ISO Windows
    echo  4. Chon phien ban Windows muon cai
    echo  5. Chon phan vung de cai Windows
    echo  6. Click "Next" de bat dau
    echo.
    echo  [!] LUU Y: Sao luu du lieu truoc khi cai!
    echo.
)

pause
goto MAIN_MENU

:: ============================================================================
:: UTILITIES FUNCTIONS [6-14]
:: ============================================================================

:CLEAN_JUNK
cls
color 0A
echo.
echo  ================================================================================
echo   [6] XOA FILE RAC - CLEAN JUNK FILES (ADVANCED)
echo  ================================================================================
echo.
echo  [*] Don dep nang cao tat ca file rac trong he thong
echo.

set /p confirm="  Tiep tuc? (Y/N): "
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo  [1/10] Dang xoa Temp files...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1

echo  [2/10] Dang xoa Windows Update cache...
net stop wuauserv >nul 2>&1
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1

echo  [3/10] Dang xoa Prefetch files...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo  [4/10] Dang xoa Thumbnail cache...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1

echo  [5/10] Dang xoa Browser cache...
taskkill /f /im chrome.exe >nul 2>&1
taskkill /f /im msedge.exe >nul 2>&1
taskkill /f /im firefox.exe >nul 2>&1
timeout /t 2 /nobreak >nul
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1

echo  [6/10] Dang xoa Windows Error Reports...
del /f /s /q "C:\ProgramData\Microsoft\Windows\WER\*" >nul 2>&1

echo  [7/10] Dang xoa Log files...
del /f /s /q "C:\Windows\Logs\*" >nul 2>&1

echo  [8/10] Dang xoa Recycle Bin...
PowerShell.exe -NoProfile -Command Clear-RecycleBin -Force -ErrorAction SilentlyContinue

echo  [9/10] Dang xoa Memory dumps...
del /f /q "C:\Windows\MEMORY.DMP" >nul 2>&1
del /f /s /q "C:\Windows\Minidump\*" >nul 2>&1

echo  [10/10] Dang chay Disk Cleanup...
cleanmgr /sagerun:1 >nul 2>&1

echo.
echo  [+] HOAN THANH! File rac da duoc xoa sach!
echo.
pause
goto MAIN_MENU

:SHOW_HIDDEN
cls
color 0A
echo.
echo  ================================================================================
echo   [7] HIEN FILE AN - SHOW HIDDEN FILES
echo  ================================================================================
echo.
echo  [1] Hien tat ca file an / Show all hidden files
echo  [2] An file he thong / Hide system files
echo  [3] Hien file va folder an / Show hidden files and folders
echo  [4] Hien file extension / Show file extensions
echo  [0] Quay lai / Back
echo.
set /p hidden="  Chon (0-4): "

if "%hidden%"=="1" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f >nul
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 1 /f >nul
    echo  [+] Hien tat ca file an: BAT
)
if "%hidden%"=="2" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 2 /f >nul
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 0 /f >nul
    echo  [+] An file he thong: BAT
)
if "%hidden%"=="3" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f >nul
    echo  [+] Hien file va folder an: BAT
)
if "%hidden%"=="4" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f >nul
    echo  [+] Hien file extension: BAT
)

if not "%hidden%"=="0" (
    echo  [*] Khoi dong lai Explorer...
    taskkill /f /im explorer.exe >nul
    start explorer.exe
    echo  [+] HOAN THANH!
)

pause
goto MAIN_MENU

:UPDATE_TOGGLE
cls
color 0E
echo.
echo  ================================================================================
echo   [8] DAT/TAT UPDATE - ENABLE/DISABLE WINDOWS UPDATE
echo  ================================================================================
echo.
echo  [1] TAT Windows Update (Disable)
echo  [2] BAT Windows Update (Enable)
echo  [3] Tam dung Update (Pause for 7 days)
echo  [4] Kiem tra trang thai Update
echo  [0] Quay lai / Back
echo.
set /p upd="  Chon (0-4): "

if "%upd%"=="1" (
    echo  [*] Dang TAT Windows Update...
    sc config wuauserv start= disabled >nul
    net stop wuauserv >nul 2>&1
    sc config bits start= disabled >nul
    net stop bits >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f >nul
    echo  [+] Windows Update da duoc TAT!
)
if "%upd%"=="2" (
    echo  [*] Dang BAT Windows Update...
    sc config wuauserv start= auto >nul
    net start wuauserv >nul 2>&1
    sc config bits start= auto >nul
    net start bits >nul 2>&1
    reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /f >nul 2>&1
    echo  [+] Windows Update da duoc BAT!
)
if "%upd%"=="3" (
    echo  [*] Tam dung Update trong 7 ngay...
    reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v PauseUpdatesExpiryTime /t REG_SZ /d "2025-01-11T12:00:00Z" /f >nul
    echo  [+] Update da duoc tam dung!
)
if "%upd%"=="4" (
    echo  [*] Kiem tra trang thai...
    sc query wuauserv | find "STATE"
    echo.
    reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate 2>nul
    if %errorLevel% equ 0 (
        echo  [!] Windows Update: DISABLED
    ) else (
        echo  [+] Windows Update: ENABLED
    )
)

echo.
pause
goto MAIN_MENU

:FIX_PRINTER
cls
color 0A
echo.
echo  ================================================================================
echo   [9] FIX LOI MAY IN - FIX PRINTER ISSUES
echo  ================================================================================
echo.
echo  [1] Khoi dong lai Print Spooler
echo  [2] Xoa hang doi in (Print Queue)
echo  [3] Reset Print Spooler
echo  [4] Cai dat lai driver may in
echo  [5] Chay Printer Troubleshooter
echo  [0] Quay lai / Back
echo.
set /p printer="  Chon (0-5): "

if "%printer%"=="1" (
    echo  [*] Dang khoi dong lai Print Spooler...
    net stop spooler
    net start spooler
    echo  [+] Print Spooler da duoc khoi dong lai!
)
if "%printer%"=="2" (
    echo  [*] Dang xoa hang doi in...
    net stop spooler
    del /f /s /q "%SystemRoot%\System32\spool\PRINTERS\*" >nul 2>&1
    net start spooler
    echo  [+] Hang doi in da duoc xoa!
)
if "%printer%"=="3" (
    echo  [*] Dang reset Print Spooler...
    net stop spooler
    del /f /s /q "%SystemRoot%\System32\spool\PRINTERS\*" >nul 2>&1
    reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Print\Printers" /f >nul 2>&1
    net start spooler
    echo  [+] Print Spooler da duoc reset!
)
if "%printer%"=="4" (
    echo  [*] Mo Device Manager...
    devmgmt.msc
    echo.
    echo  [!] Vui long:
    echo      1. Tim may in trong "Printers"
    echo      2. Right-click → Uninstall device
    echo      3. Restart may tinh
    echo      4. Cai lai driver
)
if "%printer%"=="5" (
    echo  [*] Chay Printer Troubleshooter...
    msdt.exe /id PrinterDiagnostic
)

echo.
pause
goto MAIN_MENU

:CHECK_TEST
cls
color 0B
echo.
echo  ================================================================================
echo   [10] CHECK - TEST - SYSTEM TEST TOOLS
echo  ================================================================================
echo.
echo  [1]  Kiem tra RAM (Windows Memory Diagnostic)
echo  [2]  Kiem tra o dia (CHKDSK)
echo  [3]  Kiem tra file he thong (SFC)
echo  [4]  Kiem tra SMART disk health
echo  [5]  Test GPU (DirectX Diagnostic)
echo  [6]  Test CPU (Performance Monitor)
echo  [7]  Xem thong tin chi tiet (System Info)
echo  [8]  Kiem tra lich su crash
echo  [9]  Test mang (Network Diagnostic)
echo  [10] Chay tat ca test
echo  [0]  Quay lai / Back
echo.
set /p test="  Chon (0-10): "

if "%test%"=="1" (
    echo  [*] Chay Windows Memory Diagnostic...
    mdsched.exe
)
if "%test%"=="2" (
    echo  [*] Chay CHKDSK...
    echo Y | chkdsk C: /f /r /x
    echo  [!] May se tu dong restart de kiem tra
)
if "%test%"=="3" (
    echo  [*] Chay System File Checker...
    sfc /scannow
)
if "%test%"=="4" (
    echo  [*] Kiem tra SMART disk health...
    wmic diskdrive get status
    echo.
    wmic diskdrive get model,serialnumber,size,status
)
if "%test%"=="5" (
    echo  [*] Chay DirectX Diagnostic Tool...
    dxdiag
)
if "%test%"=="6" (
    echo  [*] Chay Performance Monitor...
    perfmon
)
if "%test%"=="7" (
    echo  [*] Xem System Information...
    msinfo32
)
if "%test%"=="8" (
    echo  [*] Kiem tra lich su crash...
    eventvwr.msc
)
if "%test%"=="9" (
    echo  [*] Test mang...
    echo.
    echo  Ping Google:
    ping -n 4 8.8.8.8
    echo.
    echo  Traceroute:
    tracert -d -h 10 8.8.8.8
    echo.
    echo  Network Configuration:
    ipconfig /all
)
if "%test%"=="10" (
    echo  [*] Chay tat ca test...
    echo  [1/5] System File Check...
    sfc /scannow
    echo  [2/5] Disk Check...
    echo Y | chkdsk C: /f
    echo  [3/5] DISM Repair...
    Dism /Online /Cleanup-Image /RestoreHealth
    echo  [4/5] Network Reset...
    ipconfig /flushdns
    netsh winsock reset
    echo  [5/5] Event Log...
    wevtutil el
    echo  [+] HOAN THANH!
)

echo.
pause
goto MAIN_MENU

:DEFENDER_MANAGE
cls
color 0C
echo.
echo  ================================================================================
echo   [11] WINDOWS DEFENDER - DEFENDER MANAGEMENT
echo  ================================================================================
echo.
echo  [1] BAT Windows Defender
echo  [2] TAT Windows Defender (Tam thoi)
echo  [3] Quet nhanh (Quick Scan)
echo  [4] Quet day du (Full Scan)
echo  [5] Update Defender definitions
echo  [6] Xem lich su quet
echo  [7] Quan ly exclusions
echo  [8] Mo Windows Security
echo  [0] Quay lai / Back
echo.
set /p def="  Chon (0-8): "

if "%def%"=="1" (
    echo  [*] Dang BAT Windows Defender...
    powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false"
    sc config WinDefend start= auto
    net start WinDefend
    echo  [+] Windows Defender da duoc BAT!
)
if "%def%"=="2" (
    echo  [*] Dang TAT Windows Defender...
    powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
    echo  [+] Windows Defender da duoc TAT tam thoi!
    echo  [!] Se tu dong BAT lai sau khi restart
)
if "%def%"=="3" (
    echo  [*] Chay Quick Scan...
    powershell -Command "Start-MpScan -ScanType QuickScan"
    echo  [+] Scan hoan thanh!
)
if "%def%"=="4" (
    echo  [*] Chay Full Scan...
    echo  [!] Co the mat vai phut...
    powershell -Command "Start-MpScan -ScanType FullScan"
    echo  [+] Scan hoan thanh!
)
if "%def%"=="5" (
    echo  [*] Cap nhat Defender definitions...
    powershell -Command "Update-MpSignature"
    echo  [+] Cap nhat hoan thanh!
)
if "%def%"=="6" (
    echo  [*] Lich su quet:
    powershell -Command "Get-MpThreatDetection"
)
if "%def%"=="7" (
    echo  [*] Quan ly exclusions...
    powershell -Command "Get-MpPreference | Select-Object -Property ExclusionPath,ExclusionExtension,ExclusionProcess"
)
if "%def%"=="8" (
    echo  [*] Mo Windows Security...
    start windowsdefender:
)

echo.
pause
goto MAIN_MENU

:ISO_REPO
cls
color 0B
echo.
echo  ================================================================================
echo   [12] KHO ISO WINDOWS - WINDOWS ISO REPOSITORY
echo  ================================================================================
echo.
echo  [1] Tai Windows 11 (Official)
echo  [2] Tai Windows 10 (Official)
echo  [3] Tai Windows 8.1
echo  [4] Tai Windows 7
echo  [5] Tai Windows Server
echo  [6] Tai Media Creation Tool
echo  [7] Tai Rufus (Tao USB boot)
echo  [8] Kiem tra toan ven ISO
echo  [0] Quay lai / Back
echo.
set /p iso="  Chon (0-8): "

if "%iso%"=="1" (
    echo  [*] Mo trang tai Windows 11...
    start https://www.microsoft.com/software-download/windows11
)
if "%iso%"=="2" (
    echo  [*] Mo trang tai Windows 10...
    start https://www.microsoft.com/software-download/windows10
)
if "%iso%"=="3" (
    echo  [*] Mo trang tai Windows 8.1...
    start https://www.microsoft.com/software-download/windows8
)
if "%iso%"=="4" (
    echo  [*] Mo trang tai Windows 7...
    start https://www.microsoft.com/software-download/windows7
)
if "%iso%"=="5" (
    echo  [*] Mo trang tai Windows Server...
    start https://www.microsoft.com/evalcenter/evaluate-windows-server
)
if "%iso%"=="6" (
    echo  [*] Tai Media Creation Tool...
    start https://go.microsoft.com/fwlink/?LinkId=691209
)
if "%iso%"=="7" (
    echo  [*] Tai Rufus...
    start https://rufus.ie/
)
if "%iso%"=="8" (
    echo  [*] Kiem tra ISO integrity...
    set /p isopath="  Nhap duong dan ISO: "
    if exist "!isopath!" (
        echo  [*] Tinh toan hash...
        certutil -hashfile "!isopath!" SHA256
    ) else (
        echo  [!] File khong ton tai!
    )
)

echo.
pause
goto MAIN_MENU

:IRST_DRIVERS
cls
color 0B
echo.
echo  ================================================================================
echo   [13] KHO DRIVER IRST - INTEL RST DRIVERS
echo  ================================================================================
echo.
echo  [*] Intel Rapid Storage Technology Drivers
echo.
echo  [1] Kiem tra IRST hien tai
echo  [2] Tai driver IRST moi nhat
echo  [3] Tai driver cho Windows 11
echo  [4] Tai driver cho Windows 10
echo  [5] Tai driver cho Windows 7
echo  [6] Mo Intel Driver Support Assistant
echo  [0] Quay lai / Back
echo.
set /p irst="  Chon (0-6): "

if "%irst%"=="1" (
    echo  [*] Kiem tra IRST...
    reg query "HKLM\SOFTWARE\Intel\IntelRST" 2>nul
    if %errorLevel% equ 0 (
        echo  [+] IRST da duoc cai dat!
        wmic path win32_systemdriver where "name='iaStorA'" get displayname,state,status
    ) else (
        echo  [!] IRST chua duoc cai dat
    )
)
if "%irst%"=="2" (
    echo  [*] Mo trang tai IRST...
    start https://www.intel.com/content/www/us/en/download/19512/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-10th-and-11th-gen-platforms.html
)
if "%irst%"=="3" (
    echo  [*] Tai IRST cho Windows 11...
    start https://www.intel.com/content/www/us/en/download/19512/
)
if "%irst%"=="4" (
    echo  [*] Tai IRST cho Windows 10...
    start https://www.intel.com/content/www/us/en/download/15667/
)
if "%irst%"=="5" (
    echo  [*] Tai IRST cho Windows 7...
    start https://www.intel.com/content/www/us/en/download/29917/
)
if "%irst%"=="6" (
    echo  [*] Tai Intel Driver Support Assistant...
    start https://www.intel.com/content/www/us/en/support/intel-driver-support-assistant.html
)

echo.
pause
goto MAIN_MENU

:SKU_MANAGE
cls
color 0E
echo.
echo  ================================================================================
echo   [14] SKUS WIN/OFFICE - PRODUCT KEY MANAGEMENT
echo  ================================================================================
echo.
echo  [1] Xem Product Key Windows
echo  [2] Xem Product Key Office
echo  [3] Kich hoat Windows
echo  [4] Kich hoat Office
echo  [5] Xem trang thai kich hoat
echo  [6] Thay doi Product Key
echo  [7] Backup Product Keys
echo  [0] Quay lai / Back
echo.
set /p sku="  Chon (0-7): "

if "%sku%"=="1" (
    echo  [*] Product Key Windows:
    wmic path softwarelicensingservice get OA3xOriginalProductKey 2>nul
    echo.
    powershell -Command "(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey"
)
if "%sku%"=="2" (
    echo  [*] Product Key Office:
    cd /d "%ProgramFiles%\Microsoft Office\Office16" 2>nul || cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16" 2>nul
    if exist ospp.vbs (
        cscript ospp.vbs /dstatus
    ) else (
        echo  [!] Office khong duoc tim thay
    )
)
if "%sku%"=="3" (
    echo  [*] KICH HOAT WINDOWS
    echo  =====================
    echo.
    echo  [1] Tu dong kich hoat (KMS)
    echo  [2] Nhap Product Key
    echo  [0] Huy
    echo.
    set /p wact="  Chon (0-2): "
    
    if "!wact!"=="1" (
        echo  [*] Dang kich hoat...
        slmgr /skms kms.digiboy.ir
        slmgr /ato
        echo  [+] Hoan thanh!
    )
    if "!wact!"=="2" (
        set /p wkey="  Nhap Product Key: "
        slmgr /ipk !wkey!
        slmgr /ato
        echo  [+] Hoan thanh!
    )
)
if "%sku%"=="4" goto ACTIVATE_OFFICE
if "%sku%"=="5" (
    echo  [*] TRANG THAI KICH HOAT
    echo  ========================
    echo.
    echo  WINDOWS:
    slmgr /dli
    echo.
    echo  OFFICE:
    cd /d "%ProgramFiles%\Microsoft Office\Office16" 2>nul || cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16" 2>nul
    if exist ospp.vbs cscript ospp.vbs /dstatus
)
if "%sku%"=="6" (
    echo  [*] THAY DOI PRODUCT KEY
    echo  ========================
    echo.
    echo  [1] Thay doi key Windows
    echo  [2] Thay doi key Office
    echo.
    set /p change="  Chon (1-2): "
    
    if "!change!"=="1" (
        set /p newkey="  Nhap key Windows moi: "
        slmgr /ipk !newkey!
        slmgr /ato
    )
    if "!change!"=="2" (
        set /p offkey="  Nhap key Office moi: "
        cd /d "%ProgramFiles%\Microsoft Office\Office16" 2>nul || cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16" 2>nul
        if exist ospp.vbs (
            cscript ospp.vbs /inpkey:!offkey!
            cscript ospp.vbs /act
        )
    )
)
if "%sku%"=="7" (
    echo  [*] BACKUP PRODUCT KEYS
    echo  =======================
    echo.
    set "backup=%USERPROFILE%\Desktop\ProductKeys_Backup_%date:~-4%%date:~3,2%%date:~0,2%.txt"
    echo  Product Keys Backup > "!backup!"
    echo  Created: %date% %time% >> "!backup!"
    echo. >> "!backup!"
    echo  WINDOWS KEY: >> "!backup!"
    wmic path softwarelicensingservice get OA3xOriginalProductKey >> "!backup!" 2>nul
    echo. >> "!backup!"
    echo  WINDOWS STATUS: >> "!backup!"
    slmgr /dli >> "!backup!" 2>nul
    echo.
    echo  [+] Backup saved to: !backup!
)

echo.
pause
goto MAIN_MENU

:: ============================================================================
:: QUICK ACTIONS [88, 99]
:: ============================================================================

:RUN_ALL
cls
color 0A
echo.
echo  ================================================================================
echo   [88] CHAY TAT CA TIEN ICH - RUN ALL UTILITIES
echo  ================================================================================
echo.
set /p confirm="  Chay tat ca cong cu tien ich? (Y/N): "
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo  [*] Bat dau chay tat ca tien ich...
echo.

echo  [1/7] Xoa file rac...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1

echo  [2/7] Hien file an...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f >nul

echo  [3/7] Xoa hang doi in...
net stop spooler >nul 2>&1
del /f /s /q "%SystemRoot%\System32\spool\PRINTERS\*" >nul 2>&1
net start spooler >nul 2>&1

echo  [4/7] Cap nhat Defender...
powershell -Command "Update-MpSignature" >nul 2>&1

echo  [5/7] Kiem tra file he thong...
sfc /scannow

echo  [6/7] Reset network...
ipconfig /flushdns >nul

echo  [7/7] Don dep registry...
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f >nul 2>&1

echo.
echo  [+] HOAN THANH TAT CA!
echo.
pause
goto MAIN_MENU

:OPTIMIZE_ALL
cls
color 0A
echo.
echo  ================================================================================
echo   [99] TOI UU TOAN BO - FULL SYSTEM OPTIMIZATION
echo  ================================================================================
echo.
set /p confirm="  Toi uu toan bo he thong? (Y/N): "
if /i not "%confirm%"=="Y" goto MAIN_MENU

echo.
echo  [*] Bat dau toi uu toan bo...
echo.

echo  [STEP 1/8] CLEANUP
echo  ==================
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
cleanmgr /sagerun:1 >nul 2>&1

echo.
echo  [STEP 2/8] NETWORK
echo  ==================
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global rss=enabled >nul
ipconfig /flushdns >nul

echo.
echo  [STEP 3/8] SERVICES
echo  ===================
sc config "DiagTrack" start= disabled >nul
sc config "dmwappushservice" start= disabled >nul

echo.
echo  [STEP 4/8] REGISTRY
echo  ===================
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v RegistrySizeLimit /t REG_DWORD /d 0x40000000 /f >nul

echo.
echo  [STEP 5/8] PERFORMANCE
echo  ======================
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

echo.
echo  [STEP 6/8] SYSTEM FILES
echo  =======================
sfc /scannow >nul 2>&1

echo.
echo  [STEP 7/8] DEFENDER
echo  ===================
powershell -Command "Update-MpSignature" >nul 2>&1

echo.
echo  [STEP 8/8] FINALIZE
echo  ===================
taskkill /f /im explorer.exe >nul
start explorer.exe

echo.
echo  ================================================================================
echo   [+] TOI UU HOAN THANH! / OPTIMIZATION COMPLETE!
echo  ================================================================================
echo.
echo   Vui long khoi dong lai may tinh de ap dung tat ca thay doi
echo   Please restart computer to apply all changes
echo.
pause
goto MAIN_MENU

:EXIT
cls
color 0B
echo.
echo  ================================================================================
echo.
echo                Thank you for using Ultimate System Tools v5.0!
echo                 Cam on ban da su dung Ultimate System Tools!
echo.
echo                        Created by: Nguyen Ngoc Anh Tu
echo                         Version 5.0 - Advanced Module
echo.
echo  ================================================================================
echo.
timeout /t 3 /nobreak >nul
exit
