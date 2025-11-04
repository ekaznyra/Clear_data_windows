# ULTIMATE WINDOWS SYSTEM TOOL v5.0
# COMPLETE FUNCTIONS GUIDE - HUONG DAN DAY DU

**English Version** | **Phien Ban Tieng Viet**

================================================================================

## QUICK START | BAT DAU NHANH

### English:
1. **Right-click** UltimateSystemTool.cmd or .ps1
2. **Select** "Run as Administrator"
3. **Press L** to switch language EN ? VI
4. **Choose** function number (1-82, 88, or 99)

### Tieng Viet:
1. **Chuot phai** vao UltimateSystemTool.cmd hoac .ps1
2. **Chon** "Run as Administrator"
3. **Nhan L** de chuyen ngon ngu EN ? VI
4. **Chon** so chuc nang (1-82, 88, hoac 99)

================================================================================

## TOOL VERSIONS | PHIEN BAN CONG CU

### CMD Version - 82 Functions
- **English**: Complete feature set with language toggle (Press L)
- **Tieng Viet**: Day du tinh nang voi chuyen doi ngon ngu (Nhan L)
- **Size**: 133 KB | **Compatibility**: Windows 7/8/8.1/10/11

### PowerShell Version - 10 Core Functions
- **English**: Essential cleanup & backup with modern UI
- **Tieng Viet**: Don dep va sao luu thiet yeu voi giao dien hien dai
- **Size**: 29 KB | **Compatibility**: Windows 7/8/8.1/10/11

================================================================================

## ALL 82 FUNCTIONS | TAT CA 82 CHUC NANG

---

### [1] Quick System Cleanup | Don Dep Nhanh He Thong

**English:**
- Cleans %TEMP% and C:\Windows\Temp folders
- Empties Recycle Bin completely
- Flushes DNS cache for better connectivity
- Deletes prefetch files
- **Time**: 10-30 seconds
- **Space freed**: 100 MB - 1 GB

**Tieng Viet:**
- Xoa thu muc %TEMP% va C:\Windows\Temp
- Lam trong thung rac hoan toan
- Xoa cache DNS de ket noi tot hon
- Xoa cac file prefetch
- **Thoi gian**: 10-30 giay
- **Giai phong**: 100 MB - 1 GB

---

### [2] Deep System Cleanup | Don Dep Sau He Thong

**English:**
- Comprehensive cleanup of all temporary folders
- Cleans Windows logs (CBS, DISM, etc.)
- Clears Windows Update download cache
- Removes thumbnail cache
- Runs DISM component cleanup with /ResetBase
- **Time**: 2-5 minutes
- **Space freed**: 1-5 GB

**Tieng Viet:**
- Don dep toan dien tat ca thu muc tam
- Xoa nhat ky Windows (CBS, DISM, v.v.)
- Xoa cache tai xuong Windows Update
- Xoa cache thumbnail
- Chay DISM component cleanup voi /ResetBase
- **Thoi gian**: 2-5 phut
- **Giai phong**: 1-5 GB

---

### [3] Browser Cache Cleanup | Don Dep Cache Trinh Duyet

**English:**
- Cleans Chrome cache (Cache and GPUCache)
- Cleans Edge cache (Cache and GPUCache)
- Cleans Firefox cache (cache2 folder)
- Cleans Internet Explorer cache
- Auto-detects other Chromium browsers
- **Note**: Close browsers before running
- **Space freed**: 200 MB - 2 GB

**Tieng Viet:**
- Xoa cache Chrome (Cache va GPUCache)
- Xoa cache Edge (Cache va GPUCache)
- Xoa cache Firefox (thu muc cache2)
- Xoa cache Internet Explorer
- Tu dong phat hien cac trinh duyet Chromium khac
- **Luu y**: Dong trinh duyet truoc khi chay
- **Giai phong**: 200 MB - 2 GB

---

### [4] Application Cache Cleanup | Don Dep Cache Ung Dung

**English:**
- WPS Office, Adobe, Microsoft Office cache
- QQ, WeChat, Thunder download cache
- Steam logs, Java deployment cache
- Visual Studio component cache
- **Space freed**: 100 MB - 3 GB

**Tieng Viet:**
- Cache WPS Office, Adobe, Microsoft Office
- Cache QQ, WeChat, Thunder download
- Nhat ky Steam, cache Java deployment
- Cache Visual Studio component
- **Giai phong**: 100 MB - 3 GB

---

### [5] Windows Update Cleanup | Don Dep Windows Update

**English:**
- Clears SoftwareDistribution\Download folder
- Removes Delivery Optimization cache
- Deletes WindowsUpdate.log
- Runs DISM cleanup with /StartComponentCleanup
- **Warning**: Cannot uninstall updates after cleanup
- **Space freed**: 2-10 GB

**Tieng Viet:**
- Xoa thu muc SoftwareDistribution\Download
- Xoa cache Delivery Optimization
- Xoa WindowsUpdate.log
- Chay DISM cleanup voi /StartComponentCleanup
- **Canh bao**: Khong the go cap nhat sau khi don dep
- **Giai phong**: 2-10 GB

---

### [6] Thumbnail Cache Cleanup | Don Dep Thumbnail Cache

**English:**
- Stops Explorer process
- Deletes thumbcache_*.db files
- Restarts Explorer automatically
- **Space freed**: 50-500 MB

**Tieng Viet:**
- Dung tien trinh Explorer
- Xoa cac file thumbcache_*.db
- Khoi dong lai Explorer tu dong
- **Giai phong**: 50-500 MB

---

### [7] Icon Cache Cleanup | Don Dep Icon Cache

**English:**
- Deletes IconCache.db and iconcache_*.db
- Rebuilds icon cache automatically
- **Use for**: Fixing corrupted or missing icons

**Tieng Viet:**
- Xoa IconCache.db va iconcache_*.db
- Xay dung lai icon cache tu dong
- **Dung de**: Sua icon bi hong hoac mat

---

### [8] Font Cache Cleanup | Don Dep Font Cache

**English:**
- Clears font cache in ServiceProfiles
- Deletes FNTCACHE.DAT
- **Use for**: Font rendering problems

**Tieng Viet:**
- Xoa font cache trong ServiceProfiles
- Xoa FNTCACHE.DAT
- **Dung de**: Van de hien thi font

---

### [9] Windows Installer Cleanup | Don Dep Windows Installer

**English:**
- Cleans $PatchCache$ folder
- Removes outdated installation files
- **Space freed**: 500 MB - 3 GB

**Tieng Viet:**
- Xoa thu muc $PatchCache$
- Xoa cac file cai dat da loi thoi
- **Giai phong**: 500 MB - 3 GB

---

### [10] Old Windows Installation Cleanup | Don Dep Windows Cu

**English:**
- Deletes C:\Windows.old folder
- Requires double confirmation
- **Warning**: Cannot downgrade Windows after deletion
- **Space freed**: 10-30 GB

**Tieng Viet:**
- Xoa thu muc C:\Windows.old
- Yeu cau xac nhan 2 lan
- **Canh bao**: Khong the ha cap Windows sau khi xoa
- **Giai phong**: 10-30 GB

---

### [11] Recycle Bin Cleanup | Don Dep Thung Rac

**English:**
- Empties Recycle Bin using PowerShell
- Permanent deletion of all files
- Fast and silent operation

**Tieng Viet:**
- Lam trong thung rac bang PowerShell
- Xoa vinh vien tat ca file
- Thao tac nhanh va im lang

---

### [12] Memory Dump Files Cleanup | Don Dep File Dump Bo Nho

**English:**
- Deletes MEMORY.DMP and Minidump folder
- Removes crash dump files
- **Space freed**: 100 MB - 5 GB

**Tieng Viet:**
- Xoa MEMORY.DMP va thu muc Minidump
- Xoa cac file crash dump
- **Giai phong**: 100 MB - 5 GB

---

### [13] Clear Recent Documents | Xoa Tai Lieu Gan Day

**English:**
- Deletes recent documents shortcuts (*.lnk)
- Preserves Quick Access pinned items

**Tieng Viet:**
- Xoa shortcut tai lieu gan day (*.lnk)
- Bao ve cac muc da ghim trong Quick Access

---

### [14] Clear Run History | Xoa Lich Su Run

**English:**
- Clears Run dialog history from registry

**Tieng Viet:**
- Xoa lich su hop thoai Run tu registry

---

### [15] Clear Search History | Xoa Lich Su Tim Kiem

**English:**
- Deletes ConnectedSearch\History folder
- Removes search suggestions

**Tieng Viet:**
- Xoa thu muc ConnectedSearch\History
- Xoa cac goi y tim kiem

---

### [16] Clear Clipboard History | Xoa Lich Su Clipboard

**English:**
- Clears clipboard data (Windows 10/11)
- Uses PowerShell Clear-Clipboard

**Tieng Viet:**
- Xoa du lieu clipboard (Windows 10/11)
- Su dung PowerShell Clear-Clipboard

---

### [17] Clear Windows Error Reports | Xoa Bao Cao Loi Windows

**English:**
- Deletes Windows Error Reporting files
- **Space freed**: 100 MB - 2 GB

**Tieng Viet:**
- Xoa cac file Windows Error Reporting
- **Giai phong**: 100 MB - 2 GB

---

### [18] Disable Telemetry and Tracking | Tat Thu Thap Du Lieu

**English:**
- Disables Windows telemetry services
- Stops DiagTrack service
- Privacy-focused feature

**Tieng Viet:**
- Vo hieu hoa dich vu thu thap du lieu Windows
- Dung dich vu DiagTrack
- Tinh nang tap trung vao rieng tu

---

### [19] Clear Event Logs | Xoa Nhat Ky Su Kien

**English:**
- Clears Application, System, Security logs
- **Warning**: Removes troubleshooting information

**Tieng Viet:**
- Xoa nhat ky Application, System, Security
- **Canh bao**: Xoa thong tin khai

---

### [20] Clear DNS Cache | Xoa Cache DNS

**English:**
- Flushes DNS resolver cache
- Registers DNS with ipconfig
- **Use for**: Network connectivity problems

**Tieng Viet:**
- Xoa cache DNS resolver
- Dang ky DNS voi ipconfig
- **Dung de**: Van de ket noi mang

---

### [21] Reset Network Settings | Reset Cai Dat Mang

**English:**
- Resets TCP/IP stack and Winsock
- Requires restart to complete

**Tieng Viet:**
- Reset TCP/IP stack va Winsock
- Yeu cau khoi dong lai de hoan thanh

---

### [22] Optimize Network Performance | Toi Uu Hieu Suat Mang

**English:**
- Disables network throttling
- Optimizes TCP settings
- **Benefit**: 10-30% network speed improvement

**Tieng Viet:**
- Vo hieu hoa network throttling
- Toi uu cai dat TCP
- **Loi ich**: Tang 10-30% toc do mang

---

### [23] Clear ARP Cache | Xoa Cache ARP

**English:**
- Uses arp -d * command

**Tieng Viet:**
- Su dung lenh arp -d *

---

### [24] Reset Winsock | Reset Winsock

**English:**
- Fixes corrupted network stack
- Requires restart

**Tieng Viet:**
- Sua mang bi hong
- Yeu cau khoi dong lai

---

### [25] Renew IP Address | Lam Moi Dia Chi IP

**English:**
- Releases and renews IP address
- Fixes DHCP issues

**Tieng Viet:**
- Giai phong va lam moi dia chi IP
- Sua van de DHCP

---

### [26] Fix Network Adapter | Sua Card Mang

**English:**
- Disables and re-enables network adapters

**Tieng Viet:**
- Vo hieu hoa va kich hoat lai card mang

---

### [27] Disk Cleanup (Built-in) | Don Dep O Dia (Tich Hop)

**English:**
- Launches Windows cleanmgr utility
- **Space freed**: 1-10 GB

**Tieng Viet:**
- Khoi dong tien ich cleanmgr cua Windows
- **Giai phong**: 1-10 GB

---

### [28] Disk Error Check | Kiem Tra Loi O Dia

**English:**
- Runs CHKDSK to check disk errors
- **Time**: 10-60 minutes (on restart)

**Tieng Viet:**
- Chay CHKDSK de kiem tra loi o dia
- **Thoi gian**: 10-60 phut (khi khoi dong lai)

---

### [29] Disk Optimization | Toi Uu O Dia

**English:**
- HDD: Defragmentation
- SSD: TRIM command
- **Time**: 30 minutes - 2 hours

**Tieng Viet:**
- HDD: Defragmentation
- SSD: Lenh TRIM
- **Thoi gian**: 30 phut - 2 gio

---

### [30] Analyze Disk Space | Phan Tich Dung Luong

**English:**
- Shows free space on all drives

**Tieng Viet:**
- Hien thi dung luong trong tren tat ca o dia

---

### [31] Clean Windows.old Folder | Xoa Thu Muc Windows.old

**English:**
- Same as [10] - Double confirmation required

**Tieng Viet:**
- Giong [10] - Yeu cau xac nhan 2 lan

---

### [32] Compact OS | Nen He Thong

**English:**
- Compresses Windows system files
- **Space freed**: 2-4 GB
- No performance impact

**Tieng Viet:**
- Nen cac file he thong Windows
- **Giai phong**: 2-4 GB
- Khong anh huong hieu suat

---

### [33] Disable Startup Programs | Tat Chuong Trinh Khoi Dong

**English:**
- Opens Task Manager Startup tab
- **Benefit**: 20-50% faster boot

**Tieng Viet:**
- Mo tab Startup cua Task Manager
- **Loi ich**: Khoi dong nhanh hon 20-50%

---

### [34] Optimize Services | Toi Uu Dich Vu

**English:**
- Disables unnecessary Windows services

**Tieng Viet:**
- Vo hieu hoa cac dich vu Windows khong can thiet

---

### [35-44] Performance Optimization Functions

**[35]** Clear Prefetch Files | Xoa File Prefetch
**[36]** Clear SuperFetch Cache | Xoa Cache SuperFetch
**[37]** Disable Visual Effects | Tat Hieu Ung Hinh Anh
**[38]** Optimize Power Plan | Toi Uu Che Do Nguon
**[39]** Disable Hibernation | Tat Che Do Ngu Dong
**[40]** Clear Memory Cache | Xoa Cache Bo Nho
**[41]** Optimize Search Index | Toi Uu Tim Kiem
**[42]** Disable Windows Animations | Tat Hoat Anh Windows
**[43]** Optimize SSD Settings | Toi Uu SSD
**[44]** Reduce Menu Show Delay | Giam Tre Hien Thi Menu

---

### [45] System File Checker (SFC) | Kiem Tra File He Thong

**English:**
- Runs sfc /scannow
- Repairs corrupted system files
- **Time**: 15-30 minutes

**Tieng Viet:**
- Chay sfc /scannow
- Sua chua file he thong bi hong
- **Thoi gian**: 15-30 phut

---

### [46] DISM System Repair | Sua Chua He Thong DISM

**English:**
- DISM /RestoreHealth
- More comprehensive than SFC
- **Time**: 20-40 minutes

**Tieng Viet:**
- DISM /RestoreHealth
- Toan dien hon SFC
- **Thoi gian**: 20-40 phut

---

### [47-55] Maintenance & Registry Functions

**[47]** Windows Component Cleanup | Don Dep Thanh Phan Windows
**[48]** Update Windows Drivers | Cap Nhat Driver Windows
**[49]** Rebuild Icon Cache | Xay Dung Lai Icon Cache
**[50]** Rebuild Windows Search Index | Xay Dung Lai Tim Kiem
**[51]** Clean Registry (Safe) | Don Dep Registry (An Toan)
**[52]** Optimize Registry | Toi Uu Registry
**[53]** Backup Registry | Sao Luu Registry
**[54]** Disable Cortana | Tat Cortana
**[55]** Disable Windows Tips | Tat Goi Y Windows

---

### [56-70] Advanced Tools

**[56]** Create System Restore Point | Tao Diem Khoi Phuc
**[57]** View System Information | Xem Thong Tin He Thong
**[58]** Export Programs List | Xuat Danh Sach Chuong Trinh
**[59]** Check Disk Health (SMART) | Kiem Tra Suc Khoe O Dia
**[60]** Clear Windows Store Cache | Xoa Cache Windows Store
**[61]** Reset Windows Update Components | Reset Thanh Phan Update
**[62]** Optimize Boot Time | Toi Uu Thoi Gian Khoi Dong
**[63]** Clean All Temporary Files | Xoa Tat Ca File Tam
**[64]** Generate System Report | Tao Bao Cao He Thong
**[65]** Clean Software Cache | Xoa Cache Phan Mem
**[66]** Clean Delivery Optimization | Xoa Delivery Optimization
**[67]** Clean Update Backup (LCU) | Xoa Sao Luu Cap Nhat
**[68]** Optimize Memory (RAM) | Toi Uu Bo Nho RAM
**[69]** Show Disk Space Report | Xem Bao Cao Dung Luong
**[70]** Refresh Icon Cache | Lam Moi Icon Cache

---

### [71] Check System Information | Kiem Tra Thong Tin May

**English:**
- Computer name, manufacturer
- CPU model and speed
- RAM, OS version
- Architecture (32/64-bit)

**Tieng Viet:**
- Ten may, nha san xuat
- Model va toc do CPU
- RAM, phien ban OS
- Kien truc (32/64-bit)

---

### [72] Windows Settings Center | Trung Tam Cai Dat Windows

**English:**
- Windows 10/11: Settings app
- Windows 7/8: Control Panel

**Tieng Viet:**
- Windows 10/11: Ung dung Settings
- Windows 7/8: Control Panel

---

### [73] Office Repair and Reset | Sua Chua va Reset Office

**English:**
- Clears Office cache
- Resets to default configuration
- **Note**: Close Office apps first

**Tieng Viet:**
- Xoa cache Office
- Reset ve cau hinh mac dinh
- **Luu y**: Dong cac ung dung Office truoc

---

### [74] Remove Bloatware (Safe) | Xoa Ung Dung Rac (An Toan)

**English:**
- Windows 10/11: PowerShell removal (3D Builder, Candy Crush, etc.)
- Windows 7/8: Programs and Features
- **Space freed**: 500 MB - 2 GB

**Tieng Viet:**
- Windows 10/11: Xoa bang PowerShell (3D Builder, Candy Crush, v.v.)
- Windows 7/8: Programs and Features
- **Giai phong**: 500 MB - 2 GB

---

### [75] Bitlocker Management | Quan Ly Bitlocker

**English:**
- Displays Bitlocker status for all drives
- Information only - no modifications

**Tieng Viet:**
- Hien thi trang thai Bitlocker cho tat ca o dia
- Chi thong tin - khong sua doi

---

### [76] Check Activation Status | Kiem Tra Trang Thai Kich Hoat

**English:**
- Windows: slmgr.vbs /dli
- Office: ospp.vbs /dstatus
- Information only - does not activate

**Tieng Viet:**
- Windows: slmgr.vbs /dli
- Office: ospp.vbs /dstatus
- Chi thong tin - khong kich hoat

---

### [77] Backup WiFi Passwords | Sao Luu Mat Khau Wifi

**English:**
- Exports all saved WiFi profiles with passwords
- Creates WiFi_Passwords.txt
- **Location**: Documents\WiFi_Backup_[TIMESTAMP]\
- **Time**: 10-30 seconds

**Tieng Viet:**
- Xuat tat ca cau hinh WiFi da luu voi mat khau
- Tao WiFi_Passwords.txt
- **Vi tri**: Documents\WiFi_Backup_[TIMESTAMP]\
- **Thoi gian**: 10-30 giay

---

### [78] Backup Drivers | Sao Luu Driver

**English:**
- DISM driver export (third-party only)
- Creates driver .inf files + CSV list
- **Location**: Documents\Driver_Backup_[TIMESTAMP]\
- **Time**: 1-3 minutes
- **Space required**: 100-500 MB

**Tieng Viet:**
- Xuat driver DISM (chi ben thu ba)
- Tao cac file .inf + danh sach CSV
- **Vi tri**: Documents\Driver_Backup_[TIMESTAMP]\
- **Thoi gian**: 1-3 phut
- **Yeu cau**: 100-500 MB

---

### [79] Backup User Data | Sao Luu Du Lieu Nguoi Dung

**English:**
- Three modes:
  1. Quick: Desktop, Documents, Pictures
  2. Full: + Downloads, Videos, Music
  3. Custom: File Explorer selection
- Uses xcopy with /EXCLUDE
- **Location**: Documents\UserData_Backup_[TIMESTAMP]\
- **Time**: 10-60 minutes

**Tieng Viet:**
- Ba che do:
  1. Nhanh: Desktop, Documents, Pictures
  2. Day du: + Downloads, Videos, Music
  3. Tuy chinh: Chon bang File Explorer
- Su dung xcopy voi /EXCLUDE
- **Vi tri**: Documents\UserData_Backup_[TIMESTAMP]\
- **Thoi gian**: 10-60 phut

---

### [80] Backup Zalo Data | Sao Luu Du Lieu Zalo

**English:**
- Complete Zalo PC data (messages, media, cache)
- Stops Zalo automatically before backup
- **Location**: Documents\Zalo_Backup_[TIMESTAMP]\
- **Time**: 1-10 minutes
- **Warning**: Close Zalo first

**Tieng Viet:**
- Du lieu Zalo PC day du (tin nhan, media, cache)
- Dung Zalo tu dong truoc khi sao luu
- **Vi tri**: Documents\Zalo_Backup_[TIMESTAMP]\
- **Thoi gian**: 1-10 phut
- **Canh bao**: Dong Zalo truoc

---

### [81] Backup Product Keys | Sao Luu Ban Quyen

**English:**
- Windows OEM key (from BIOS)
- Windows & Office license status
- **Location**: Documents\ProductKeys_Backup_[TIMESTAMP]\
- **Time**: 10-30 seconds
- **Warning**: Keep backup secure!

**Tieng Viet:**
- Key OEM Windows (tu BIOS)
- Trang thai giay phep Windows & Office
- **Vi tri**: Documents\ProductKeys_Backup_[TIMESTAMP]\
- **Thoi gian**: 10-30 giay
- **Canh bao**: Giu sao luu an toan!

---

### [82] Data Recovery Tools | Cong Cu Khoi Phuc Du Lieu

**English:**
- Opens Windows built-in tools:
  - File History
  - System Restore
  - Previous Versions

**Tieng Viet:**
- Mo cac cong cu tich hop Windows:
  - File History
  - System Restore
  - Previous Versions

---

### [88] RUN ALL CLEANUP TASKS | CHAY TAT CA DON DEP

**English:**
- Runs 10 cleanup tasks automatically
- **Time**: 5-15 minutes
- **Space freed**: 3-15 GB
- **Recommended**: Monthly

**Tieng Viet:**
- Chay 10 tac vu don dep tu dong
- **Thoi gian**: 5-15 phut
- **Giai phong**: 3-15 GB
- **De xuat**: Hang thang

---

### [99] FULL SYSTEM OPTIMIZATION | TOI UU TOAN BO HE THONG

**English:**
- All cleanup tasks + SFC + DISM + optimization
- Creates restore point first
- **Time**: 20-60 minutes
- **Space freed**: 5-20 GB
- **Benefit**: 20-40% faster system
- **Recommended**: Quarterly

**Tieng Viet:**
- Tat ca don dep + SFC + DISM + toi uu hoa
- Tao diem khoi phuc truoc
- **Thoi gian**: 20-60 phut
- **Giai phong**: 5-20 GB
- **Loi ich**: He thong nhanh hon 20-40%
- **De xuat**: Moi quy

================================================================================

## LANGUAGE TOGGLE | CHUYEN DOI NGON NGU

**English**: Press **L** key at any menu to switch EN ? VI
**Tieng Viet**: Nhan phim **L** tai bat ky menu nao de chuyen EN ? VI

================================================================================

## COMPATIBILITY | TUONG THICH

- Windows 7: All 82 functions | Tat ca 82 chuc nang ?
- Windows 8/8.1: All 82 functions | Tat ca 82 chuc nang ?
- Windows 10: Full compatibility | Tuong thich day du ?
- Windows 11: Full compatibility | Tuong thich day du ?

================================================================================

## SAFETY | AN TOAN

**English:**
? All cleanup functions are SAFE
? Backup functions do NOT delete originals
? Registry changes backed up automatically
?? Windows.old deletion: Cannot downgrade
?? Hibernation disable: Deletes hiberfil.sys

**Tieng Viet:**
? Tat ca chuc nang don dep AN TOAN
? Chuc nang sao luu KHONG xoa file goc
? Thay doi registry tu dong sao luu
?? Xoa Windows.old: Khong the ha cap
?? Vo hieu Hibernation: Xoa hiberfil.sys

================================================================================

Version: 5.0 | Last Updated: 2025-11-03
Total Functions: 82 + 2 Quick Actions
Status: STABLE - SAFE TO USE | ON DINH - AN TOAN SU DUNG
