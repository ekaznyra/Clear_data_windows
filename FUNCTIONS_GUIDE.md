# ULTIMATE WINDOWS SYSTEM TOOL v5.0 - FUNCTIONS GUIDE
# HUONG DAN DAY DU 82 CHUC NANG - SONG NGU ANH/VIET

================================================================================

## QUICK START / BAT DAU NHANH

### How to Use / Cach Su Dung:
1. Right-click UltimateSystemTool.cmd -> Run as Administrator
   Chuot phai UltimateSystemTool.cmd -> Run as Administrator

2. Press ` (backtick key) to switch language EN <-> VI
   Nhan phim ` (backtick) de chuyen ngon ngu EN <-> VI

3. Choose function number (1-82, 88, or 99)
   Chon so chuc nang (1-82, 88, hoac 99)

4. Follow on-screen instructions
   Lam theo huong dan tren man hinh

================================================================================

## CATEGORY 1: SYSTEM CLEANUP [1-12]
## DANH MUC 1: DON DEP HE THONG [1-12]

--------------------------------------------------------------------------------
[1] Quick System Cleanup / Don Dep Nhanh He Thong
--------------------------------------------------------------------------------
ENGLISH:
- Cleans temporary files from %TEMP% and C:\Windows\Temp
- Empties Recycle Bin
- Flushes DNS cache
- Deletes prefetch files
- Safe and fast cleanup for daily use

VIETNAMESE:
- Xoa cac file tam thoi tu %TEMP% va C:\Windows\Temp
- Lam trong thung rac
- Xoa cache DNS
- Xoa file prefetch
- Don dep an toan va nhanh cho viec hang ngay

TIME: 10-30 seconds / 10-30 giay
SPACE FREED: 100 MB - 1 GB / Giai phong 100 MB - 1 GB

--------------------------------------------------------------------------------
[2] Deep System Cleanup / Don Dep Sau He Thong
--------------------------------------------------------------------------------
ENGLISH:
- Comprehensive cleanup of all temporary folders
- Cleans Windows logs (CBS, DISM, etc.)
- Stops Windows Update services temporarily
- Clears update download cache
- Cleans thumbnail cache
- Runs DISM component cleanup with /ResetBase

VIETNAMESE:
- Don dep toan dien tat ca thu muc tam
- Xoa nhat ky Windows (CBS, DISM, v.v.)
- Tam dung dich vu Windows Update
- Xoa cache tai xuong cap nhat
- Xoa cache thumbnail
- Chay DISM component cleanup voi /ResetBase

TIME: 2-5 minutes / 2-5 phut
SPACE FREED: 1-5 GB / Giai phong 1-5 GB

--------------------------------------------------------------------------------
[3] Browser Cache Cleanup / Don Dep Cache Trinh Duyet
--------------------------------------------------------------------------------
ENGLISH:
- Cleans Chrome cache (Cache and GPUCache)
- Cleans Edge cache (Cache and GPUCache)
- Cleans Firefox cache (cache2 folder)
- Cleans Internet Explorer cache
- Automatically detects and cleans other Chromium-based browsers

VIETNAMESE:
- Xoa cache Chrome (Cache va GPUCache)
- Xoa cache Edge (Cache va GPUCache)
- Xoa cache Firefox (thu muc cache2)
- Xoa cache Internet Explorer
- Tu dong phat hien va xoa cac trinh duyet dua tren Chromium

NOTE: Close browsers before running / Dong trinh duyet truoc khi chay
SPACE FREED: 200 MB - 2 GB / Giai phong 200 MB - 2 GB

--------------------------------------------------------------------------------
[4] Application Cache Cleanup / Don Dep Cache Ung Dung
--------------------------------------------------------------------------------
ENGLISH:
- Cleans common software cache:
  * WPS Office cache
  * QQ and WeChat cache
  * Thunder download cache
  * Adobe cache (Media Cache Files)
  * Microsoft Office cache (OfficeFileCache)
  * Steam logs
  * Java deployment cache
  * Visual Studio component cache

VIETNAMESE:
- Xoa cache cac phan mem pho bien:
  * Cache WPS Office
  * Cache QQ va WeChat
  * Cache Thunder download
  * Cache Adobe (Media Cache Files)
  * Cache Microsoft Office (OfficeFileCache)
  * Nhat ky Steam
  * Cache Java deployment
  * Cache Visual Studio component

SPACE FREED: 100 MB - 3 GB / Giai phong 100 MB - 3 GB

--------------------------------------------------------------------------------
[5] Windows Update Cleanup / Don Dep Windows Update
--------------------------------------------------------------------------------
ENGLISH:
- Stops update-related services (wuauserv, bits, cryptSvc, msiserver)
- Clears SoftwareDistribution\Download folder
- Cleans Delivery Optimization cache
- Deletes WindowsUpdate.log
- Runs DISM cleanup with /StartComponentCleanup /ResetBase
- Restores services to original state

VIETNAMESE:
- Dung cac dich vu lien quan cap nhat (wuauserv, bits, cryptSvc, msiserver)
- Xoa thu muc SoftwareDistribution\Download
- Xoa cache Delivery Optimization
- Xoa WindowsUpdate.log
- Chay DISM cleanup voi /StartComponentCleanup /ResetBase
- Khoi phuc cac dich vu ve trang thai ban dau

WARNING: Takes ownership and deletes LCU backup (can't uninstall updates after)
CANH BAO: Xoa backup LCU (khong the go cap nhat sau khi xoa)
SPACE FREED: 2-10 GB / Giai phong 2-10 GB

--------------------------------------------------------------------------------
[6] Thumbnail Cache Cleanup / Don Dep Thumbnail Cache
--------------------------------------------------------------------------------
ENGLISH:
- Stops Explorer process
- Deletes thumbcache_*.db files
- Restarts Explorer automatically

VIETNAMESE:
- Dung tien trinh Explorer
- Xoa cac file thumbcache_*.db
- Khoi dong lai Explorer tu dong

SPACE FREED: 50-500 MB / Giai phong 50-500 MB

--------------------------------------------------------------------------------
[7] Icon Cache Cleanup / Don Dep Icon Cache
--------------------------------------------------------------------------------
ENGLISH:
- Stops Explorer process
- Deletes IconCache.db
- Deletes iconcache_*.db files
- Restarts Explorer
- Rebuilds icon cache automatically

VIETNAMESE:
- Dung tien trinh Explorer
- Xoa IconCache.db
- Xoa cac file iconcache_*.db
- Khoi dong lai Explorer
- Xay dung lai icon cache tu dong

USEFUL FOR: Fixing corrupted or missing icons
HUU ICH CHO: Sua icon bi hong hoac mat

--------------------------------------------------------------------------------
[8] Font Cache Cleanup / Don Dep Font Cache
--------------------------------------------------------------------------------
ENGLISH:
- Clears font cache in ServiceProfiles\LocalService
- Deletes FNTCACHE.DAT
- Fixes font display issues

VIETNAMESE:
- Xoa font cache trong ServiceProfiles\LocalService
- Xoa FNTCACHE.DAT
- Sua loi hien thi font

USEFUL FOR: Font rendering problems / HUU ICH CHO: Van de hien thi font

--------------------------------------------------------------------------------
[9] Windows Installer Cleanup / Don Dep Windows Installer
--------------------------------------------------------------------------------
ENGLISH:
- Cleans Windows Installer cache ($PatchCache$ folder)
- Removes outdated installation files
- Keeps latest installers intact

VIETNAMESE:
- Xoa Windows Installer cache (thu muc $PatchCache$)
- Xoa cac file cai dat cu
- Giu nguyen cac installer moi nhat

SPACE FREED: 500 MB - 3 GB / Giai phong 500 MB - 3 GB

--------------------------------------------------------------------------------
[10] Old Windows Installation Cleanup / Don Dep Windows Cu
--------------------------------------------------------------------------------
ENGLISH:
- Deletes C:\Windows.old folder (previous Windows installation)
- Takes ownership of folder first
- Grants full administrator permissions
- Permanently removes old system files

VIETNAMESE:
- Xoa thu muc C:\Windows.old (ban Windows cu)
- Lay quyen so huu thu muc truoc
- Cap quyen administrator day du
- Xoa vinh vien cac file he thong cu

WARNING: Cannot downgrade Windows after deletion!
CANH BAO: Khong the ha cap Windows sau khi xoa!
REQUIRES: Double confirmation / YEU CAU: Xac nhan 2 lan
SPACE FREED: 10-30 GB / Giai phong 10-30 GB

--------------------------------------------------------------------------------
[11] Recycle Bin Cleanup / Don Dep Thung Rac
--------------------------------------------------------------------------------
ENGLISH:
- Empties Recycle Bin using PowerShell Clear-RecycleBin
- Permanently deletes all files in Recycle Bin
- Fast and silent operation

VIETNAMESE:
- Lam trong thung rac bang PowerShell Clear-RecycleBin
- Xoa vinh vien tat ca file trong thung rac
- Thao tac nhanh va im lang

SPACE FREED: Varies / Tuy thuoc dung luong thung rac

--------------------------------------------------------------------------------
[12] Memory Dump Files Cleanup / Don Dep File Dump Bo Nho
--------------------------------------------------------------------------------
ENGLISH:
- Deletes MEMORY.DMP in Windows directory
- Cleans Minidump folder (*.dmp files)
- Removes crash dump files
- Keeps only essential system files

VIETNAMESE:
- Xoa MEMORY.DMP trong thu muc Windows
- Xoa thu muc Minidump (cac file *.dmp)
- Xoa cac file crash dump
- Chi giu cac file he thong can thiet

SPACE FREED: 100 MB - 5 GB / Giai phong 100 MB - 5 GB

================================================================================

## CATEGORY 2: PRIVACY PROTECTION [13-20]
## DANH MUC 2: BAO VE RIENG TU [13-20]

--------------------------------------------------------------------------------
[13] Clear Recent Documents / Xoa Tai Lieu Gan Day
--------------------------------------------------------------------------------
ENGLISH:
- Deletes recent documents shortcuts (*.lnk files)
- Clears Recent folder in AppData
- Preserves Quick Access pinned items

VIETNAMESE:
- Xoa cac shortcut tai lieu gan day (file *.lnk)
- Xoa thu muc Recent trong AppData
- Bao ve cac muc ghim trong Quick Access

--------------------------------------------------------------------------------
[14] Clear Run History / Xoa Lich Su Run
--------------------------------------------------------------------------------
ENGLISH:
- Clears Run dialog history from registry
- Removes HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU

VIETNAMESE:
- Xoa lich su hop thoai Run tu registry
- Xoa HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU

--------------------------------------------------------------------------------
[15] Clear Search History / Xoa Lich Su Tim Kiem
--------------------------------------------------------------------------------
ENGLISH:
- Clears Windows Search history
- Deletes ConnectedSearch\History folder
- Removes search suggestions

VIETNAMESE:
- Xoa lich su Windows Search
- Xoa thu muc ConnectedSearch\History
- Xoa cac goi y tim kiem

--------------------------------------------------------------------------------
[16] Clear Clipboard History / Xoa Lich Su Clipboard
--------------------------------------------------------------------------------
ENGLISH:
- Clears clipboard data
- Removes clipboard history (Windows 10/11)
- Uses PowerShell Clear-Clipboard

VIETNAMESE:
- Xoa du lieu clipboard
- Xoa lich su clipboard (Windows 10/11)
- Su dung PowerShell Clear-Clipboard

--------------------------------------------------------------------------------
[17] Clear Windows Error Reports / Xoa Bao Cao Loi Windows
--------------------------------------------------------------------------------
ENGLISH:
- Deletes Windows Error Reporting files
- Cleans WER folder in ProgramData
- Removes user error reports

VIETNAMESE:
- Xoa cac file Windows Error Reporting
- Xoa thu muc WER trong ProgramData
- Xoa bao cao loi nguoi dung

SPACE FREED: 100 MB - 2 GB / Giai phong 100 MB - 2 GB

--------------------------------------------------------------------------------
[18] Disable Telemetry and Tracking / Tat Thu Thap Du Lieu
--------------------------------------------------------------------------------
ENGLISH:
- Disables Windows telemetry services
- Stops DiagTrack service
- Modifies registry to disable data collection
- Disables customer experience improvement program

VIETNAMESE:
- Vo hieu hoa dich vu thu thap du lieu Windows
- Dung dich vu DiagTrack
- Sua registry de vo hieu hoa thu thap du lieu
- Tat chuong trinh cai thien trai nghiem khach hang

NOTE: Privacy-focused feature / Tinh nang tap trung vao rieng tu

--------------------------------------------------------------------------------
[19] Clear Event Logs / Xoa Nhat Ky Su Kien
--------------------------------------------------------------------------------
ENGLISH:
- Clears Application, System, Security, Setup event logs
- Uses wevtutil to clear all event logs
- Helps system performance

VIETNAMESE:
- Xoa nhat ky su kien Application, System, Security, Setup
- Su dung wevtutil de xoa tat ca nhat ky su kien
- Giup tang hieu suat he thong

WARNING: Removes troubleshooting information
CANH BAO: Xoa thong tin kho de khai

--------------------------------------------------------------------------------
[20] Clear DNS Cache / Xoa Cache DNS
--------------------------------------------------------------------------------
ENGLISH:
- Flushes DNS resolver cache
- Uses ipconfig /flushdns
- Registers DNS with ipconfig /registerdns
- Fixes DNS-related network issues

VIETNAMESE:
- Xoa cache DNS resolver
- Su dung ipconfig /flushdns
- Dang ky DNS voi ipconfig /registerdns
- Sua cac van de mang lien quan DNS

USEFUL FOR: Network connectivity problems
HUU ICH CHO: Van de ket noi mang

================================================================================

## CATEGORY 3: NETWORK OPTIMIZATION [21-26]
## DANH MUC 3: TOI UU MANG [21-26]

--------------------------------------------------------------------------------
[21] Reset Network Settings / Reset Cai Dat Mang
--------------------------------------------------------------------------------
ENGLISH:
- Resets TCP/IP stack: netsh int ip reset
- Resets Winsock catalog: netsh winsock reset
- Flushes DNS cache
- Renews IP address
- Requires restart to complete

VIETNAMESE:
- Reset TCP/IP stack: netsh int ip reset
- Reset Winsock catalog: netsh winsock reset
- Xoa cache DNS
- Lam moi dia chi IP
- Yeu cau khoi dong lai de hoan thanh

USEFUL FOR: Major network problems / HUU ICH CHO: Van de mang nghiem trong

--------------------------------------------------------------------------------
[22] Optimize Network Performance / Toi Uu Hieu Suat Mang
--------------------------------------------------------------------------------
ENGLISH:
- Disables network throttling
- Optimizes TCP settings in registry
- Disables auto-tuning for better speed
- Modifies registry for faster network

VIETNAMESE:
- Vo hieu hoa network throttling
- Toi uu cai dat TCP trong registry
- Vo hieu hoa auto-tuning de tang toc do
- Sua registry cho mang nhanh hon

BENEFIT: 10-30% network speed improvement
LOI ICH: Tang 10-30% toc do mang

--------------------------------------------------------------------------------
[23] Clear ARP Cache / Xoa Cache ARP
--------------------------------------------------------------------------------
ENGLISH:
- Clears ARP (Address Resolution Protocol) cache
- Uses arp -d * command
- Refreshes network adapter connections

VIETNAMESE:
- Xoa cache ARP (Address Resolution Protocol)
- Su dung lenh arp -d *
- Lam moi ket noi card mang

--------------------------------------------------------------------------------
[24] Reset Winsock / Reset Winsock
--------------------------------------------------------------------------------
ENGLISH:
- Resets Winsock catalog to default
- Fixes corrupted network stack
- Uses netsh winsock reset
- Requires restart

VIETNAMESE:
- Reset Winsock catalog ve mac dinh
- Sua mang bi hong
- Su dung netsh winsock reset
- Yeu cau khoi dong lai

--------------------------------------------------------------------------------
[25] Renew IP Address / Lam Moi Dia Chi IP
--------------------------------------------------------------------------------
ENGLISH:
- Releases current IP: ipconfig /release
- Renews IP address: ipconfig /renew
- Flushes DNS cache
- Fixes DHCP issues

VIETNAMESE:
- Giai phong IP hien tai: ipconfig /release
- Lam moi dia chi IP: ipconfig /renew
- Xoa cache DNS
- Sua van de DHCP

--------------------------------------------------------------------------------
[26] Fix Network Adapter / Sua Card Mang
--------------------------------------------------------------------------------
ENGLISH:
- Disables and re-enables network adapters
- Resets network adapter settings
- Uses PowerShell to restart adapters
- Fixes adapter detection issues

VIETNAMESE:
- Vo hieu hoa va kich hoat lai card mang
- Reset cai dat card mang
- Su dung PowerShell de khoi dong lai adapter
- Sua van de phat hien adapter

================================================================================

## CATEGORY 4: DISK MANAGEMENT [27-32]
## DANH MUC 4: QUAN LY O DIA [27-32]

--------------------------------------------------------------------------------
[27] Disk Cleanup (Windows Built-in) / Don Dep O Dia (Tich Hop)
--------------------------------------------------------------------------------
ENGLISH:
- Launches Windows Disk Cleanup utility (cleanmgr)
- Interactive GUI for selecting what to clean
- Safe and comprehensive cleanup
- Official Microsoft tool

VIETNAMESE:
- Khoi dong cong cu Disk Cleanup cua Windows (cleanmgr)
- Giao dien GUI de chon noi dung can xoa
- Don dep an toan va toan dien
- Cong cu chinh thuc cua Microsoft

SPACE FREED: 1-10 GB / Giai phong 1-10 GB

--------------------------------------------------------------------------------
[28] Disk Error Check / Kiem Tra Loi O Dia
--------------------------------------------------------------------------------
ENGLISH:
- Runs CHKDSK to check disk errors
- Schedules check on next reboot if disk is in use
- Scans for bad sectors
- Fixes file system errors

VIETNAMESE:
- Chay CHKDSK de kiem tra loi o dia
- Hen lich kiem tra khi khoi dong lai neu o dia dang su dung
- Quet tim bad sector
- Sua loi file system

TIME: 10-60 minutes (on restart) / 10-60 phut (khi khoi dong lai)

--------------------------------------------------------------------------------
[29] Disk Optimization (Defrag/TRIM) / Toi Uu O Dia
--------------------------------------------------------------------------------
ENGLISH:
- For HDD: Runs defragmentation
- For SSD: Runs TRIM command
- Uses defrag /O for full optimization
- Improves disk performance

VIETNAMESE:
- Cho HDD: Chay defragmentation
- Cho SSD: Chay lenh TRIM
- Su dung defrag /O de toi uu hoa day du
- Cai thien hieu suat o dia

TIME: 30 minutes - 2 hours / 30 phut - 2 gio

--------------------------------------------------------------------------------
[30] Analyze Disk Space / Phan Tich Dung Luong
--------------------------------------------------------------------------------
ENGLISH:
- Shows free space on all drives
- Displays total size and used space
- Uses PowerShell to analyze drives
- Helps identify space hogs

VIETNAMESE:
- Hien thi dung luong trong tren tat ca o dia
- Hien thi kich thuoc tong va dung luong da dung
- Su dung PowerShell de phan tich o dia
- Giup xac dinh cac file chiiem dung luong

--------------------------------------------------------------------------------
[31] Clean Windows.old Folder / Xoa Thu Muc Windows.old
--------------------------------------------------------------------------------
ENGLISH:
- Same as function [10]
- Deletes previous Windows installation
- Frees 10-30 GB of space
- Requires double confirmation

VIETNAMESE:
- Giong chuc nang [10]
- Xoa ban cai dat Windows cu
- Giai phong 10-30 GB dung luong
- Yeu cau xac nhan 2 lan

--------------------------------------------------------------------------------
[32] Compact OS (Compress System) / Nen He Thong
--------------------------------------------------------------------------------
ENGLISH:
- Compresses Windows system files using compact /compactOS
- Reduces Windows footprint by 2-4 GB
- Safe compression, doesn't affect performance
- Useful for low storage devices

VIETNAMESE:
- Nen cac file he thong Windows bang compact /compactOS
- Giam dung luong Windows 2-4 GB
- Nen an toan, khong anh huong hieu suat
- Huu ich cho thiet bi it dung luong

SPACE FREED: 2-4 GB / Giai phong 2-4 GB

================================================================================

## CATEGORY 5: PERFORMANCE OPTIMIZATION [33-44]
## DANH MUC 5: TOI UU HIEU SUAT [33-44]

--------------------------------------------------------------------------------
[33] Disable Startup Programs / Tat Chuong Trinh Khoi Dong
--------------------------------------------------------------------------------
ENGLISH:
- Opens Task Manager Startup tab
- Allows manual disabling of startup programs
- Improves boot time
- User-controlled selection

VIETNAMESE:
- Mo tab Startup cua Task Manager
- Cho phep vo hieu hoa thu cong cac chuong trinh khoi dong
- Cai thien thoi gian khoi dong
- Nguoi dung tu chon

BENEFIT: 20-50% faster boot / LOI ICH: Khoi dong nhanh hon 20-50%

--------------------------------------------------------------------------------
[34] Optimize Services / Toi Uu Dich Vu
--------------------------------------------------------------------------------
ENGLISH:
- Disables unnecessary Windows services
- Sets Superfetch, Windows Search, etc. to Manual
- Reduces background CPU usage
- Safe service optimization

VIETNAMESE:
- Vo hieu hoa cac dich vu Windows khong can thiet
- Dat Superfetch, Windows Search, v.v. thanh Manual
- Giam su dung CPU nen
- Toi uu hoa dich vu an toan

WARNING: Some features may be disabled
CANH BAO: Mot so tinh nang co the bi vo hieu hoa

--------------------------------------------------------------------------------
[35] Clear Prefetch Files / Xoa File Prefetch
--------------------------------------------------------------------------------
ENGLISH:
- Deletes all files in C:\Windows\Prefetch
- Windows rebuilds this automatically
- Can speed up boot time
- Safe to delete

VIETNAMESE:
- Xoa tat ca file trong C:\Windows\Prefetch
- Windows tu dong xay dung lai
- Co the tang toc thoi gian khoi dong
- An toan de xoa

--------------------------------------------------------------------------------
[36] Clear SuperFetch Cache / Xoa Cache SuperFetch
--------------------------------------------------------------------------------
ENGLISH:
- Stops Superfetch service
- Clears Superfetch database
- Useful for SSD users
- Reduces background disk activity

VIETNAMESE:
- Dung dich vu Superfetch
- Xoa co so du lieu Superfetch
- Huu ich cho nguoi dung SSD
- Giam hoat dong o dia nen

--------------------------------------------------------------------------------
[37] Disable Visual Effects / Tat Hieu Ung Hinh Anh
--------------------------------------------------------------------------------
ENGLISH:
- Sets visual effects to "Best Performance"
- Disables animations, shadows, transparency
- Significantly boosts performance on old PCs
- Can make Windows look basic

VIETNAMESE:
- Dat hieu ung hinh anh thanh "Best Performance"
- Vo hieu hoa hoat anh, bong, trong suot
- Tang dang ke hieu suat tren PC cu
- Co the lam Windows trong don gian

BENEFIT: 15-30% performance boost on old PCs
LOI ICH: Tang 15-30% hieu suat tren PC cu

--------------------------------------------------------------------------------
[38] Optimize Power Plan (High Performance) / Toi Uu Che Do Nguon
--------------------------------------------------------------------------------
ENGLISH:
- Sets power plan to High Performance
- Disables CPU throttling
- Maximum performance at cost of battery life
- Uses powercfg -setactive

VIETNAMESE:
- Dat che do nguon thanh High Performance
- Vo hieu hoa CPU throttling
- Hieu suat toi da nhung ton pin
- Su dung powercfg -setactive

NOTE: Not recommended for laptops on battery
LUU Y: Khong nen dung cho laptop dang dung pin

--------------------------------------------------------------------------------
[39] Disable Hibernation / Tat Che Do Ngu Dong
--------------------------------------------------------------------------------
ENGLISH:
- Disables hibernation using powercfg /h off
- Deletes hiberfil.sys (same size as RAM)
- Frees up significant disk space
- Sleep mode still works

VIETNAMESE:
- Vo hieu hoa che do ngu dong bang powercfg /h off
- Xoa hiberfil.sys (bang kich thuoc RAM)
- Giai phong dung luong dang ke
- Che do Sleep van hoat dong

SPACE FREED: 4-32 GB (depends on RAM) / Giai phong 4-32 GB (tuy RAM)

--------------------------------------------------------------------------------
[40] Clear Memory Cache / Xoa Cache Bo Nho
--------------------------------------------------------------------------------
ENGLISH:
- Optimizes working set of all processes
- Uses PowerShell to minimize process memory
- Frees up RAM
- Temporary improvement

VIETNAMESE:
- Toi uu working set cua tat ca tien trinh
- Su dung PowerShell de giam bo nho tien trinh
- Giai phong RAM
- Cai thien tam thoi

--------------------------------------------------------------------------------
[41] Optimize Search Index / Toi Uu Tim Kiem
--------------------------------------------------------------------------------
ENGLISH:
- Rebuilds Windows Search index
- Fixes slow search problems
- Can take 30-60 minutes
- Improves search accuracy

VIETNAMESE:
- Xay dung lai chi muc Windows Search
- Sua van de tim kiem cham
- Co the mat 30-60 phut
- Cai thien do chinh xac tim kiem

--------------------------------------------------------------------------------
[42] Disable Windows Animations / Tat Hoat Anh Windows
--------------------------------------------------------------------------------
ENGLISH:
- Disables menu animations via registry
- Faster window opening/closing
- More responsive UI
- Makes Windows feel snappier

VIETNAMESE:
- Vo hieu hoa hoat anh menu qua registry
- Mo/dong cua so nhanh hon
- Giao dien phan hoi nhanh hon
- Lam Windows cam giac nhanh hon

--------------------------------------------------------------------------------
[43] Optimize SSD Settings / Toi Uu SSD
--------------------------------------------------------------------------------
ENGLISH:
- Disables defragmentation for SSDs
- Enables TRIM command
- Disables Superfetch for SSDs
- Optimizes for SSD lifespan

VIETNAMESE:
- Vo hieu hoa defragmentation cho SSD
- Kich hoat lenh TRIM
- Vo hieu hoa Superfetch cho SSD
- Toi uu hoa tuoi tho SSD

IMPORTANT: Only run if you have SSD!
QUAN TRONG: Chi chay neu ban co SSD!

--------------------------------------------------------------------------------
[44] Reduce Menu Show Delay / Giam Tre Hien Thi Menu
--------------------------------------------------------------------------------
ENGLISH:
- Reduces menu show delay in registry
- Menus appear instantly
- Sets MenuShowDelay to 0
- Makes UI more responsive

VIETNAMESE:
- Giam tre hien thi menu trong registry
- Menu hien thi ngay lap tuc
- Dat MenuShowDelay thanh 0
- Lam giao dien phan hoi nhanh hon

================================================================================

## CATEGORY 6: SYSTEM MAINTENANCE [45-50]
## DANH MUC 6: BAO TRI HE THONG [45-50]

--------------------------------------------------------------------------------
[45] System File Checker (SFC) / Kiem Tra File He Thong
--------------------------------------------------------------------------------
ENGLISH:
- Runs sfc /scannow to check system file integrity
- Repairs corrupted system files automatically
- Takes 15-30 minutes
- Requires Administrator rights

VIETNAMESE:
- Chay sfc /scannow de kiem tra toan ven file he thong
- Sua chua tu dong cac file he thong bi hong
- Mat 15-30 phut
- Yeu cau quyen Administrator

USEFUL FOR: System stability issues / HUU ICH CHO: Van de on dinh he thong

--------------------------------------------------------------------------------
[46] DISM System Repair / Sua Chua He Thong DISM
--------------------------------------------------------------------------------
ENGLISH:
- Runs DISM /Online /Cleanup-Image /RestoreHealth
- Repairs Windows component store
- More comprehensive than SFC
- Takes 20-40 minutes

VIETNAMESE:
- Chay DISM /Online /Cleanup-Image /RestoreHealth
- Sua chua component store cua Windows
- Toan dien hon SFC
- Mat 20-40 phut

RUN THIS BEFORE SFC for best results
CHAY CAI NAY TRUOC SFC de ket qua tot nhat

--------------------------------------------------------------------------------
[47] Windows Component Cleanup / Don Dep Thanh Phan Windows
--------------------------------------------------------------------------------
ENGLISH:
- Runs DISM component cleanup
- Removes old component versions
- Reduces WinSxS folder size
- Safe and recommended

VIETNAMESE:
- Chay DISM component cleanup
- Xoa cac phien ban component cu
- Giam kich thuoc thu muc WinSxS
- An toan va nen dung

SPACE FREED: 1-5 GB / Giai phong 1-5 GB

--------------------------------------------------------------------------------
[48] Update Windows Drivers / Cap Nhat Driver Windows
--------------------------------------------------------------------------------
ENGLISH:
- Opens Device Manager for manual driver updates
- Allows checking for driver updates
- User-controlled process
- Safe driver management

VIETNAMESE:
- Mo Device Manager de cap nhat driver thu cong
- Cho phep kiem tra cap nhat driver
- Tien trinh nguoi dung kiem soat
- Quan ly driver an toan

--------------------------------------------------------------------------------
[49] Rebuild Icon Cache / Xay Dung Lai Icon Cache
--------------------------------------------------------------------------------
ENGLISH:
- Same as function [7]
- Fixes corrupted icons
- Stops Explorer and rebuilds cache
- Automatic restart

VIETNAMESE:
- Giong chuc nang [7]
- Sua icon bi hong
- Dung Explorer va xay dung lai cache
- Tu dong khoi dong lai

--------------------------------------------------------------------------------
[50] Rebuild Windows Search Index / Xay Dung Lai Tim Kiem
--------------------------------------------------------------------------------
ENGLISH:
- Same as function [41]
- Opens Indexing Options
- Allows manual index rebuild
- Improves search speed and accuracy

VIETNAMESE:
- Giong chuc nang [41]
- Mo Indexing Options
- Cho phep xay dung lai chi muc thu cong
- Cai thien toc do va do chinh xac tim kiem

================================================================================

## CATEGORY 7: REGISTRY OPTIMIZATION [51-55]
## DANH MUC 7: TOI UU REGISTRY [51-55]

--------------------------------------------------------------------------------
[51] Clean Registry (Safe) / Don Dep Registry (An Toan)
--------------------------------------------------------------------------------
ENGLISH:
- Cleans MUI cache registry keys
- Removes obsolete entries
- Safe registry cleanup
- Backs up before cleaning

VIETNAMESE:
- Xoa cac khoa registry MUI cache
- Xoa cac muc da loi thoi
- Don dep registry an toan
- Sao luu truoc khi xoa

WARNING: Always creates backup / CANH BAO: Luon tao ban sao luu

--------------------------------------------------------------------------------
[52] Optimize Registry / Toi Uu Registry
--------------------------------------------------------------------------------
ENGLISH:
- Compacts registry hives
- Removes registry fragmentation
- Requires reboot to complete
- Improves registry access speed

VIETNAMESE:
- Nen cac registry hive
- Xoa phan manh registry
- Yeu cau khoi dong lai de hoan thanh
- Cai thien toc do truy cap registry

--------------------------------------------------------------------------------
[53] Backup Registry / Sao Luu Registry
--------------------------------------------------------------------------------
ENGLISH:
- Exports entire registry to backup file
- Saves to Documents folder with timestamp
- Can restore if problems occur
- Recommended before major changes

VIETNAMESE:
- Xuat toan bo registry ra file sao luu
- Luu vao thu muc Documents voi thoi gian
- Co the khoi phuc neu co van de
- Nen dung truoc khi thay doi lon

LOCATION: Documents\Registry_Backup_[DATE].reg

--------------------------------------------------------------------------------
[54] Disable Cortana / Tat Cortana
--------------------------------------------------------------------------------
ENGLISH:
- Disables Cortana via registry
- Reduces CPU and RAM usage
- Cortana search bar remains but doesn't run
- Windows 10/11 only

VIETNAMESE:
- Vo hieu hoa Cortana qua registry
- Giam su dung CPU va RAM
- Thanh tim kiem Cortana van hien nhung khong chay
- Chi Windows 10/11

BENEFIT: 100-300 MB RAM freed / LOI ICH: Giai phong 100-300 MB RAM

--------------------------------------------------------------------------------
[55] Disable Windows Tips / Tat Goi Y Windows
--------------------------------------------------------------------------------
ENGLISH:
- Disables Windows tips and suggestions
- Stops notification popups
- Cleaner user experience
- Registry modification

VIETNAMESE:
- Vo hieu hoa goi y va de xuat cua Windows
- Dung thong bao popup
- Trai nghiem nguoi dung sach hon
- Sua doi registry

================================================================================

## CATEGORY 8: ADVANCED TOOLS [56-70]
## DANH MUC 8: CONG CU NANG CAO [56-70]

--------------------------------------------------------------------------------
[56] Create System Restore Point / Tao Diem Khoi Phuc He Thong
--------------------------------------------------------------------------------
ENGLISH:
- Creates manual restore point using PowerShell
- Allows system rollback if problems occur
- Recommended before major changes
- Takes 1-5 minutes

VIETNAMESE:
- Tao diem khoi phuc thu cong bang PowerShell
- Cho phep khoi phuc he thong neu co van de
- Nen dung truoc khi thay doi lon
- Mat 1-5 phut

IMPORTANT: Enable System Protection first
QUAN TRONG: Kich hoat System Protection truoc

--------------------------------------------------------------------------------
[57] View System Information / Xem Thong Tin He Thong
--------------------------------------------------------------------------------
ENGLISH:
- Opens msinfo32 (System Information)
- Shows detailed hardware and software info
- Useful for troubleshooting
- Generates system report

VIETNAMESE:
- Mo msinfo32 (System Information)
- Hien thi chi tiet phan cung va phan mem
- Huu ich cho khai
- Tao bao cao he thong

--------------------------------------------------------------------------------
[58] Export Programs List / Xuat Danh Sach Chuong Trinh
--------------------------------------------------------------------------------
ENGLISH:
- Exports list of installed programs to text file
- Uses WMIC to get program info
- Saves to Documents folder
- Useful for backup/reinstall planning

VIETNAMESE:
- Xuat danh sach cac chuong trinh da cai dat ra file text
- Su dung WMIC de lay thong tin chuong trinh
- Luu vao thu muc Documents
- Huu ich cho ke hoach sao luu/cai dat lai

LOCATION: Documents\InstalledPrograms_[DATE].txt

--------------------------------------------------------------------------------
[59] Check Disk Health (SMART) / Kiem Tra Suc Khoe O Dia
--------------------------------------------------------------------------------
ENGLISH:
- Displays SMART disk information using WMIC
- Shows disk status and health
- Predicts disk failure
- Helps prevent data loss

VIETNAMESE:
- Hien thi thong tin SMART cua o dia bang WMIC
- Hien thi trang thai va suc khoe o dia
- Du doan loi o dia
- Giup ngan ngua mat du lieu

CRITICAL: Check regularly! / QUAN TRONG: Kiem tra thuong xuyen!

--------------------------------------------------------------------------------
[60] Clear Windows Store Cache / Xoa Cache Windows Store
--------------------------------------------------------------------------------
ENGLISH:
- Runs wsreset.exe to clear Store cache
- Fixes Store app problems
- Resets Store without losing apps
- Takes 1-2 minutes

VIETNAMESE:
- Chay wsreset.exe de xoa cache Store
- Sua van de ung dung Store
- Reset Store ma khong mat ung dung
- Mat 1-2 phut

USEFUL FOR: Store loading errors / HUU ICH CHO: Loi tai Store

--------------------------------------------------------------------------------
[61] Reset Windows Update Components / Reset Thanh Phan Update
--------------------------------------------------------------------------------
ENGLISH:
- Comprehensive Windows Update repair
- Stops services, renames folders, restarts services
- Fixes stubborn update errors
- Last resort for update problems

VIETNAMESE:
- Sua chua toan dien Windows Update
- Dung dich vu, doi ten thu muc, khoi dong lai dich vu
- Sua loi cap nhat cung dau
- Giai phap cuoi cung cho van de cap nhat

TIME: 5-10 minutes / Mat 5-10 phut

--------------------------------------------------------------------------------
[62] Optimize Boot Time / Toi Uu Thoi Gian Khoi Dong
--------------------------------------------------------------------------------
ENGLISH:
- Analyzes boot time using powercfg /bootrace
- Shows slowest boot components
- Helps identify boot bottlenecks
- Information only (no changes)

VIETNAMESE:
- Phan tich thoi gian khoi dong bang powercfg /bootrace
- Hien thi cac thanh phan khoi dong cham nhat
- Giup xac dinh diem nghen khi khoi dong
- Chi thong tin (khong thay doi)

--------------------------------------------------------------------------------
[63] Clean All Temporary Files / Xoa Tat Ca File Tam
--------------------------------------------------------------------------------
ENGLISH:
- Comprehensive temp file cleanup
- Cleans %TEMP%, Windows\Temp, user temps
- Deletes *.tmp, *.bak, *.old files
- Safe and thorough

VIETNAMESE:
- Don dep toan dien file tam
- Xoa %TEMP%, Windows\Temp, temp nguoi dung
- Xoa cac file *.tmp, *.bak, *.old
- An toan va ky luong

SPACE FREED: 500 MB - 5 GB / Giai phong 500 MB - 5 GB

--------------------------------------------------------------------------------
[64] Generate System Report / Tao Bao Cao He Thong
--------------------------------------------------------------------------------
ENGLISH:
- Runs perfmon /report for detailed system analysis
- Takes 60 seconds to gather data
- Shows performance issues
- Comprehensive diagnostics

VIETNAMESE:
- Chay perfmon /report de phan tich chi tiet he thong
- Mat 60 giay de thu thap du lieu
- Hien thi van de hieu suat
- Chan doan toan dien

TIME: 60 seconds / Mat 60 giay

--------------------------------------------------------------------------------
[65] Clean Software Cache / Xoa Cache Phan Mem
--------------------------------------------------------------------------------
ENGLISH:
- Same as function [4]
- Cleans common application caches
- Covers WPS, Adobe, Office, Steam, etc.
- Safe cleanup

VIETNAMESE:
- Giong chuc nang [4]
- Xoa cache cac ung dung pho bien
- Bao gom WPS, Adobe, Office, Steam, v.v.
- Don dep an toan

--------------------------------------------------------------------------------
[66] Clean Delivery Optimization / Xoa Delivery Optimization
--------------------------------------------------------------------------------
ENGLISH:
- Clears Windows Delivery Optimization cache
- Removes peer-to-peer update files
- Safe to delete
- Frees up space

VIETNAMESE:
- Xoa cache Windows Delivery Optimization
- Xoa cac file cap nhat peer-to-peer
- An toan de xoa
- Giai phong dung luong

SPACE FREED: 500 MB - 5 GB / Giai phong 500 MB - 5 GB

--------------------------------------------------------------------------------
[67] Clean Update Backup (LCU) / Xoa Sao Luu Cap Nhat
--------------------------------------------------------------------------------
ENGLISH:
- Deletes LCU (Latest Cumulative Update) backup
- Takes ownership of protected folders
- Cannot uninstall updates after deletion
- Frees significant space

VIETNAMESE:
- Xoa sao luu LCU (Latest Cumulative Update)
- Lay quyen so huu cac thu muc duoc bao ve
- Khong the go cap nhat sau khi xoa
- Giai phong dung luong dang ke

WARNING: Cannot roll back updates! / CANH BAO: Khong the hoan tac cap nhat!
SPACE FREED: 2-8 GB / Giai phong 2-8 GB

--------------------------------------------------------------------------------
[68] Optimize Memory (RAM) / Toi Uu Bo Nho RAM
--------------------------------------------------------------------------------
ENGLISH:
- Same as function [40]
- Minimizes working set of all processes
- Temporary RAM boost
- Use when RAM is low

VIETNAMESE:
- Giong chuc nang [40]
- Giam working set cua tat ca tien trinh
- Tang RAM tam thoi
- Dung khi RAM thap

EFFECT: Frees 100-500 MB RAM / HIEU QUA: Giai phong 100-500 MB RAM

--------------------------------------------------------------------------------
[69] Show Disk Space Report / Xem Bao Cao Dung Luong
--------------------------------------------------------------------------------
ENGLISH:
- Analyzes all drives and shows free space
- Before/after cleanup comparison
- Displays size in GB
- Helpful for tracking cleanup progress

VIETNAMESE:
- Phan tich tat ca o dia va hien thi dung luong trong
- So sanh truoc/sau khi don dep
- Hien thi kich thuoc theo GB
- Huu ich de theo doi tien do don dep

--------------------------------------------------------------------------------
[70] Refresh Icon Cache / Lam Moi Icon Cache
--------------------------------------------------------------------------------
ENGLISH:
- Same as functions [7] and [49]
- Quick icon cache refresh
- Fixes icon display problems
- Automatic Explorer restart

VIETNAMESE:
- Giong cac chuc nang [7] va [49]
- Lam moi nhanh icon cache
- Sua van de hien thi icon
- Tu dong khoi dong lai Explorer

================================================================================

## CATEGORY 9: SYSTEM UTILITIES [71-76]
## DANH MUC 9: TIEN ICH HE THONG [71-76]

--------------------------------------------------------------------------------
[71] Check System Information / Kiem Tra Thong Tin May
--------------------------------------------------------------------------------
ENGLISH:
- Displays comprehensive system information:
  * Computer name and manufacturer
  * Processor (CPU) model and speed
  * Installed RAM (memory)
  * Operating System version
  * System architecture (32-bit or 64-bit)
  * Boot device and BIOS version
- Uses WMIC and PowerShell for data collection
- Helpful for hardware inventory

VIETNAMESE:
- Hien thi thong tin he thong toan dien:
  * Ten may va nha san xuat
  * Model va toc do CPU
  * RAM (bo nho) da cai dat
  * Phien ban he dieu hanh
  * Kien truc he thong (32-bit hoac 64-bit)
  * Thiet bi khoi dong va phien ban BIOS
- Su dung WMIC va PowerShell de thu thap du lieu
- Huu ich cho kiem ke phan cung

--------------------------------------------------------------------------------
[72] Windows Settings Center / Trung Tam Cai Dat Windows
--------------------------------------------------------------------------------
ENGLISH:
- Windows 10/11: Opens Settings app (ms-settings:)
- Windows 7/8: Opens Control Panel
- Quick access to:
  * System settings
  * Network settings
  * Personalization
  * Update & Security
  * Apps & Features
- Auto-detects Windows version

VIETNAMESE:
- Windows 10/11: Mo ung dung Settings (ms-settings:)
- Windows 7/8: Mo Control Panel
- Truy cap nhanh toi:
  * Cai dat he thong
  * Cai dat mang
  * Ca nhan hoa
  * Cap nhat va Bao mat
  * Ung dung va Tinh nang
- Tu dong phat hien phien ban Windows

--------------------------------------------------------------------------------
[73] Office Repair and Reset / Sua Chua va Reset Office
--------------------------------------------------------------------------------
ENGLISH:
- Clears Office cache and temporary files
- Deletes corrupt settings files
- Resets Office to default configuration
- Fixes common Office errors:
  * Slow startup
  * Crashing
  * Activation problems
  * Add-in conflicts
- Preserves documents and data
- Supports Office 2013, 2016, 2019, 365

VIETNAMESE:
- Xoa cache va file tam cua Office
- Xoa cac file cai dat bi hong
- Reset Office ve cau hinh mac dinh
- Sua cac loi Office pho bien:
  * Khoi dong cham
  * Bi treo
  * Van de kich hoat
  * Xung dot Add-in
- Bao ton tai lieu va du lieu
- Ho tro Office 2013, 2016, 2019, 365

IMPORTANT: Close Office applications first!
QUAN TRONG: Dong cac ung dung Office truoc!

--------------------------------------------------------------------------------
[74] Remove Bloatware (Safe) / Xoa Ung Dung Rac (An Toan)
--------------------------------------------------------------------------------
ENGLISH:
- Windows 10/11: Uses PowerShell Get-AppxPackage to remove:
  * 3D Builder, 3D Viewer
  * Candy Crush, Bubble Witch
  * Mixed Reality Portal
  * Xbox apps (optional)
  * Skype (optional)
  * Maps, Weather (optional)
- Windows 7/8: Opens Programs and Features for manual removal
- Only removes safe-to-remove apps
- Does NOT remove essential system apps
- Frees up 500 MB - 2 GB of space

VIETNAMESE:
- Windows 10/11: Su dung PowerShell Get-AppxPackage de xoa:
  * 3D Builder, 3D Viewer
  * Candy Crush, Bubble Witch
  * Mixed Reality Portal
  * Cac ung dung Xbox (tuy chon)
  * Skype (tuy chon)
  * Maps, Weather (tuy chon)
- Windows 7/8: Mo Programs and Features de xoa thu cong
- Chi xoa cac ung dung an toan
- KHONG xoa cac ung dung he thong thiet yeu
- Giai phong 500 MB - 2 GB dung luong

WARNING: Some apps cannot be reinstalled from Store!
CANH BAO: Mot so ung dung khong the cai lai tu Store!

--------------------------------------------------------------------------------
[75] Bitlocker Management / Quan Ly Bitlocker
--------------------------------------------------------------------------------
ENGLISH:
- Displays Bitlocker status for all drives
- Uses manage-bde -status command
- Shows:
  * Encryption status
  * Protection status
  * Lock status
  * Encryption method
- INFORMATION ONLY - Does not encrypt/decrypt
- Safe to run

VIETNAMESE:
- Hien thi trang thai Bitlocker cho tat ca o dia
- Su dung lenh manage-bde -status
- Hien thi:
  * Trang thai ma hoa
  * Trang thai bao ve
  * Trang thai khoa
  * Phuong phap ma hoa
- CHI THONG TIN - Khong ma hoa/giai ma
- An toan de chay

NOTE: Does not modify Bitlocker settings
LUU Y: Khong sua doi cai dat Bitlocker

--------------------------------------------------------------------------------
[76] Check Activation Status / Kiem Tra Trang Thai Kich Hoat
--------------------------------------------------------------------------------
ENGLISH:
- Checks Windows activation status using slmgr.vbs /dli
- Checks Office activation status using ospp.vbs /dstatus
- Shows:
  * Product name and edition
  * Activation status (Licensed/Not Activated)
  * License type (Retail/OEM/Volume)
  * Partial product key
  * License expiration (if applicable)
- INFORMATION ONLY - Does not activate
- Safe and legal check

VIETNAMESE:
- Kiem tra trang thai kich hoat Windows bang slmgr.vbs /dli
- Kiem tra trang thai kich hoat Office bang ospp.vbs /dstatus
- Hien thi:
  * Ten san pham va phien ban
  * Trang thai kich hoat (Da cap phep/Chua kich hoat)
  * Loai giay phep (Retail/OEM/Volume)
  * Mot phan product key
  * Ngay het han giay phep (neu co)
- CHI THONG TIN - Khong kich hoat
- Kiem tra an toan va hop phap

IMPORTANT: Only checks status, does not activate!
QUAN TRONG: Chi kiem tra trang thai, khong kich hoat!

================================================================================

## CATEGORY 10: BACKUP AND RECOVERY [77-82] (NEW!)
## DANH MUC 10: SAO LUU VA KHOI PHUC [77-82] (MOI!)

--------------------------------------------------------------------------------
[77] Backup WiFi Passwords / Sao Luu Mat Khau Wifi
--------------------------------------------------------------------------------
ENGLISH:
- Exports all saved WiFi profiles with passwords
- Uses netsh wlan show profiles and netsh wlan export
- Creates individual profile files for each network
- Generates summary report with all passwords
- Backup location: Documents\WiFi_Backup_[TIMESTAMP]\
- Files created:
  * WiFi_[NetworkName].xml for each network
  * WiFi_Passwords.txt with readable password list

VIETNAMESE:
- Xuat tat ca cau hinh WiFi da luu voi mat khau
- Su dung netsh wlan show profiles va netsh wlan export
- Tao cac file cau hinh rieng cho moi mang
- Tao bao cao tom tat voi tat ca mat khau
- Vi tri sao luu: Documents\WiFi_Backup_[TIMESTAMP]\
- Cac file duoc tao:
  * WiFi_[TenMang].xml cho moi mang
  * WiFi_Passwords.txt voi danh sach mat khau de doc

TIME: 10-30 seconds / Mat 10-30 giay
USEFUL FOR: Reinstalling Windows, new PC setup
HUU ICH CHO: Cai dat lai Windows, thiet lap PC moi

--------------------------------------------------------------------------------
[78] Backup Drivers / Sao Luu Driver
--------------------------------------------------------------------------------
ENGLISH:
- Exports all third-party drivers using DISM
- Uses dism /online /export-driver command
- Creates driver .inf files for each device
- Generates CSV file with driver list (name, version, manufacturer, date)
- Backup location: Documents\Driver_Backup_[TIMESTAMP]\
- Can restore drivers after Windows reinstall
- Only exports non-Microsoft drivers

VIETNAMESE:
- Xuat tat ca driver ben thu ba bang DISM
- Su dung lenh dism /online /export-driver
- Tao cac file .inf cho moi thiet bi
- Tao file CSV voi danh sach driver (ten, phien ban, nha san xuat, ngay)
- Vi tri sao luu: Documents\Driver_Backup_[TIMESTAMP]\
- Co the khoi phuc driver sau khi cai dat lai Windows
- Chi xuat cac driver khong phai cua Microsoft

TIME: 1-3 minutes / Mat 1-3 phut
SPACE REQUIRED: 100-500 MB / Yeu cau 100-500 MB

--------------------------------------------------------------------------------
[79] Backup User Data / Sao Luu Du Lieu Nguoi Dung
--------------------------------------------------------------------------------
ENGLISH:
- Three backup modes:
  1. Quick Backup: Desktop, Documents, Pictures
  2. Full Backup: Desktop, Documents, Pictures, Downloads, Videos, Music
  3. Custom Backup: Opens File Explorer to select folders
- Uses xcopy with /EXCLUDE to prevent infinite loops
- Preserves folder structure
- Backup location: Documents\UserData_Backup_[TIMESTAMP]\
- Does NOT delete original files
- Progress shown for each folder

VIETNAMESE:
- Ba che do sao luu:
  1. Sao luu nhanh: Desktop, Documents, Pictures
  2. Sao luu day du: Desktop, Documents, Pictures, Downloads, Videos, Music
  3. Sao luu tuy chinh: Mo File Explorer de chon thu muc
- Su dung xcopy voi /EXCLUDE de tranh vong lap vo han
- Bao ton cau truc thu muc
- Vi tri sao luu: Documents\UserData_Backup_[TIMESTAMP]\
- KHONG xoa cac file goc
- Hien thi tien do cho moi thu muc

TIME: 10-60 minutes (depends on data size)
THOI GIAN: 10-60 phut (tuy kich thuoc du lieu)
SPACE REQUIRED: Same as source data / Yeu cau: Bang du lieu nguon

IMPORTANT: Ensure enough disk space! / QUAN TRONG: Dam bao du dung luong!

--------------------------------------------------------------------------------
[80] Backup Zalo Data / Sao Luu Du Lieu Zalo
--------------------------------------------------------------------------------
ENGLISH:
- Backs up complete Zalo PC data:
  * Main Zalo folder (AppData\Roaming\ZaloPC)
  * Zalo documents (Documents\ZaloData)
  * Zalo cache (LocalAppData\ZaloPC)
- Includes:
  * Messages and chat history
  * Media files (photos, videos)
  * Received files
  * Cache and settings
- Automatically stops Zalo process before backup
- Backup location: Documents\Zalo_Backup_[TIMESTAMP]\
- Can restore by copying files back

VIETNAMESE:
- Sao luu toan bo du lieu Zalo PC:
  * Thu muc Zalo chinh (AppData\Roaming\ZaloPC)
  * Tai lieu Zalo (Documents\ZaloData)
  * Cache Zalo (LocalAppData\ZaloPC)
- Bao gom:
  * Tin nhan va lich su tro chuyen
  * Cac file media (anh, video)
  * Cac file da nhan
  * Cache va cai dat
- Tu dong dung tien trinh Zalo truoc khi sao luu
- Vi tri sao luu: Documents\Zalo_Backup_[TIMESTAMP]\
- Co the khoi phuc bang cach copy file lai

WARNING: Close Zalo before running! / CANH BAO: Dong Zalo truoc khi chay!
TIME: 1-10 minutes / Mat 1-10 phut
SPACE REQUIRED: 500 MB - 5 GB / Yeu cau 500 MB - 5 GB

--------------------------------------------------------------------------------
[81] Backup Product Keys / Sao Luu Ban Quyen
--------------------------------------------------------------------------------
ENGLISH:
- Backs up Windows and Office product keys:
  * Windows OEM key (from BIOS)
  * Windows license status and details
  * Office license status and product key info
- Uses:
  * WMI to retrieve OEM key
  * slmgr.vbs for Windows license details
  * ospp.vbs for Office license details
- Creates text files with all license information
- Backup location: Documents\ProductKeys_Backup_[TIMESTAMP]\
- Files created:
  * Windows_Key.txt (OEM key if available)
  * Windows_License.txt (detailed license status)
  * Office_License.txt (Office activation info)

VIETNAMESE:
- Sao luu key san pham Windows va Office:
  * Key OEM cua Windows (tu BIOS)
  * Trang thai va chi tiet giay phep Windows
  * Trang thai giay phep va thong tin key Office
- Su dung:
  * WMI de lay key OEM
  * slmgr.vbs cho chi tiet giay phep Windows
  * ospp.vbs cho chi tiet giay phep Office
- Tao cac file text voi tat ca thong tin giay phep
- Vi tri sao luu: Documents\ProductKeys_Backup_[TIMESTAMP]\
- Cac file duoc tao:
  * Windows_Key.txt (key OEM neu co)
  * Windows_License.txt (trang thai giay phep chi tiet)
  * Office_License.txt (thong tin kich hoat Office)

WARNING: Keep backup files secure! / CANH BAO: Giu file sao luu an toan!
TIME: 10-30 seconds / Mat 10-30 giay

IMPORTANT: Store backup in safe location!
QUAN TRONG: Luu sao luu o vi tri an toan!

--------------------------------------------------------------------------------
[82] Data Recovery Tools / Cong Cu Khoi Phuc Du Lieu
--------------------------------------------------------------------------------
ENGLISH:
- Opens built-in Windows recovery tools:
  * File History (if configured)
  * System Restore
  * Backup and Restore (Windows 7)
  * Previous Versions feature
- Provides access to:
  * Restore from System Restore Point
  * Recover files from File History
  * Access Volume Shadow Copies
  * Restore from Windows Backup
- DOES NOT install third-party recovery software
- Uses only Windows built-in tools

VIETNAMESE:
- Mo cac cong cu khoi phuc tich hop cua Windows:
  * File History (neu da cau hinh)
  * System Restore
  * Backup and Restore (Windows 7)
  * Tinh nang Previous Versions
- Cung cap truy cap toi:
  * Khoi phuc tu System Restore Point
  * Khoi phuc file tu File History
  * Truy cap Volume Shadow Copies
  * Khoi phuc tu Windows Backup
- KHONG cai dat phan mem khoi phuc ben thu ba
- Chi su dung cac cong cu tich hop cua Windows

NOTE: Recovery options depend on your backup configuration
LUU Y: Tuy chon khoi phuc phu thuoc vao cau hinh sao luu cua ban

USEFUL FOR: Recovering accidentally deleted files
HUU ICH CHO: Khoi phuc cac file bi xoa nham

================================================================================

## QUICK ACTIONS / THAO TAC NHANH

--------------------------------------------------------------------------------
[88] RUN ALL CLEANUP TASKS / CHAY TAT CA DON DEP
--------------------------------------------------------------------------------
ENGLISH:
- Runs multiple cleanup tasks in sequence:
  1. Temp files (system and user)
  2. Recycle Bin
  3. Browser cache (Chrome, Edge, Firefox)
  4. Windows Update cache
  5. Thumbnail cache
  6. Icon cache
  7. DNS cache
  8. Prefetch files
  9. Event logs
  10. Delivery Optimization cache
- Fully automated, no user interaction needed
- Takes 5-15 minutes
- Frees 3-15 GB of space

VIETNAMESE:
- Chay nhieu tac vu don dep lien tiep:
  1. File tam (he thong va nguoi dung)
  2. Thung rac
  3. Cache trinh duyet (Chrome, Edge, Firefox)
  4. Cache Windows Update
  5. Cache thumbnail
  6. Cache icon
  7. Cache DNS
  8. File prefetch
  9. Nhat ky su kien
  10. Cache Delivery Optimization
- Hoan toan tu dong, khong can tuong tac
- Mat 5-15 phut
- Giai phong 3-15 GB dung luong

RECOMMENDED: Run monthly / DE XUAT: Chay hang thang

--------------------------------------------------------------------------------
[99] FULL SYSTEM OPTIMIZATION / TOI UU TOAN BO HE THONG
--------------------------------------------------------------------------------
ENGLISH:
- Comprehensive system optimization including:
  * All cleanup tasks from [88]
  * System file check (SFC)
  * DISM repair
  * Disk optimization (defrag/TRIM)
  * Registry optimization
  * Network optimization
  * Performance tweaks
  * Service optimization
- Creates system restore point first (if enabled)
- Takes 20-60 minutes
- Requires restart to complete
- Maximum performance improvement

VIETNAMESE:
- Toi uu hoa he thong toan dien bao gom:
  * Tat ca tac vu don dep tu [88]
  * Kiem tra file he thong (SFC)
  * Sua chua DISM
  * Toi uu hoa o dia (defrag/TRIM)
  * Toi uu hoa registry
  * Toi uu hoa mang
  * Tinh chinh hieu suat
  * Toi uu hoa dich vu
- Tao diem khoi phuc he thong truoc (neu da bat)
- Mat 20-60 phut
- Yeu cau khoi dong lai de hoan thanh
- Cai thien hieu suat toi da

BENEFIT: 20-40% faster system, 5-20 GB freed
LOI ICH: He thong nhanh hon 20-40%, giai phong 5-20 GB

RECOMMENDED: Run quarterly / DE XUAT: Chay moi quy

================================================================================

## COMPATIBILITY / TUONG THICH

WINDOWS 7:
- All 82 functions compatible
- Some features use fallback methods (Control Panel instead of Settings app)
- Bloatware removal limited (no UWP apps)

WINDOWS 8/8.1:
- All 82 functions compatible
- Some UWP apps can be removed
- Modern Settings app available

WINDOWS 10:
- Full compatibility with all functions
- Optimal performance
- All modern features supported

WINDOWS 11:
- Full compatibility with all functions
- Latest Windows features supported
- Recommended platform

================================================================================

## SAFETY NOTES / LUU Y AN TOAN

SAFE OPERATIONS / THAO TAC AN TOAN:
- All cleanup functions are SAFE
- Backup functions do NOT delete original data
- Registry changes are backed up automatically
- Confirmation required for risky operations

WARNINGS / CANH BAO:
- Windows.old deletion: Cannot downgrade Windows
- LCU backup deletion: Cannot uninstall updates
- Hibernation disable: Deletes hiberfil.sys
- Network reset: Requires restart and reconfiguration

RECOMMENDATIONS / DE XUAT:
1. Create System Restore Point before major changes
   Tao diem khoi phuc he thong truoc khi thay doi lon

2. Close all applications before running cleanup
   Dong tat ca ung dung truoc khi don dep

3. Backup important data regularly
   Sao luu du lieu quan trong thuong xuyen

4. Run as Administrator for full functionality
   Chay voi quyen Administrator de day du chuc nang

================================================================================

## SUPPORT / HO TRO

LANGUAGE TOGGLE / CHUYEN DOI NGON NGU:
- Press ` (backtick key) to switch between English and Vietnamese
- Nhan phim ` de chuyen giua tieng Anh va tieng Viet

TOOL VERSIONS / PHIEN BAN CONG CU:
- CMD Version: 82 functions with language toggle (UltimateSystemTool.cmd)
- PowerShell Version: 10 core functions with language toggle (UltimateSystemTool.ps1)

BOTH VERSIONS NOW SUPPORT LANGUAGE TOGGLE!
CA HAI PHIEN BAN GIO HO TRO CHUYEN DOI NGON NGU!

REQUIREMENTS / YEU CAU:
- Administrator rights / Quyen Administrator
- Windows 7/8/8.1/10/11
- 32-bit or 64-bit

================================================================================

Version: 5.0
Last Updated: 2025-11-03
Total Functions: 82 + 2 Quick Actions
Tested on: Windows 7/8/8.1/10/11
Status: STABLE - SAFE TO USE / ON DINH - AN TOAN SU DUNG

================================================================================
