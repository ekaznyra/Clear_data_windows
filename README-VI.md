# CONG CU TOI UU HE THONG WINDOWS v5.0 - PHIEN BAN CHUYEN NGHIEP

## Huong Dan Day Du Cac Chuc Nang - Phien Ban Tieng Viet

================================================================================

## BAT DAU NHANH

### Cach Su Dung:
1. **Chuot phai** vao UltimateSystemTool.cmd hoac .ps1
2. **Chon** "Run as Administrator" (CMD) hoac "Run with PowerShell"
3. **Nhan L** de chuyen doi ngon ngu (EN ? VI)
4. **Chon** so chuc nang (1-82, 88, hoac 99)
5. **Lam theo** huong dan tren man hinh

### Yeu Cau He Thong:
- Windows 7/8/8.1/10/11 (32-bit hoac 64-bit)
- Quyen Administrator
- PowerShell 2.0+ (cho phien ban .ps1)

================================================================================

## PHIEN BAN CONG CU

### Phien Ban CMD (UltimateSystemTool.cmd)
- **82 chuc nang** - Day du tinh nang
- **Chuyen doi ngon ngu** - Nhan L de chuyen EN ? VI ngay lap tuc
- **Tuong thich toi da** - Windows 7/8/8.1/10/11
- **Kich thuoc:** 133 KB

### Phien Ban PowerShell (UltimateSystemTool.ps1)
- **10 chuc nang chinh** - Don dep va sao luu thiet yeu
- **Giao dien hien dai** - Mau sac, giao dien nang cao
- **Chuyen doi ngon ngu** - Nhan L de chuyen EN ? VI
- **Kich thuoc:** 29 KB

================================================================================

## TAT CA 82 CHUC NANG - DANH SACH DAY DU

### DANH MUC 1: DON DEP HE THONG [1-12]

**[1] Don Dep Nhanh He Thong**
- Xoa %TEMP% va C:\Windows\Temp
- Lam trong thung rac
- Xoa cache DNS
- Xoa file prefetch
- Thoi gian: 10-30 giay
- Giai phong: 100 MB - 1 GB

**[2] Don Dep Sau He Thong**
- Tat ca thu muc tam
- Nhat ky Windows (CBS, DISM)
- Cache tai xuong cap nhat
- Cache thumbnail
- DISM component cleanup
- Thoi gian: 2-5 phut
- Giai phong: 1-5 GB

**[3] Don Dep Cache Trinh Duyet**
- Cache Chrome, Edge, Firefox
- Cache IE
- Tat ca trinh duyet Chromium
- Giai phong: 200 MB - 2 GB
- Luu y: Dong trinh duyet truoc

**[4] Don Dep Cache Ung Dung**
- Cache WPS Office, Adobe, Office
- Cache QQ, WeChat, Thunder
- Nhat ky Steam, cache Java
- Cache Visual Studio
- Giai phong: 100 MB - 3 GB

**[5] Don Dep Windows Update**
- SoftwareDistribution\Download
- Cache Delivery Optimization
- WindowsUpdate.log
- DISM cleanup
- Giai phong: 2-10 GB
- Canh bao: Khong the go cap nhat sau khi xoa

**[6] Don Dep Thumbnail Cache**
- Xoa thumbcache_*.db
- Khoi dong lai Explorer
- Giai phong: 50-500 MB

**[7] Don Dep Icon Cache**
- Xoa IconCache.db
- Xay dung lai tu dong
- Sua icon bi hong

**[8] Don Dep Font Cache**
- Xoa font cache
- Xoa FNTCACHE.DAT
- Sua loi hien thi font

**[9] Don Dep Windows Installer**
- Thu muc $PatchCache$
- Cac installer cu
- Giai phong: 500 MB - 3 GB

**[10] Don Dep Windows Cu**
- Xoa C:\Windows.old
- Yeu cau xac nhan 2 lan
- Giai phong: 10-30 GB
- Canh bao: Khong the ha cap sau khi xoa

**[11] Don Dep Thung Rac**
- Lam trong thung rac
- Xoa vinh vien
- Nhanh va im lang

**[12] Don Dep File Dump Bo Nho**
- MEMORY.DMP
- Thu muc Minidump
- File crash dump
- Giai phong: 100 MB - 5 GB

---

### DANH MUC 2: BAO VE RIENG TU [13-20]

**[13] Xoa Tai Lieu Gan Day**
- Xoa shortcut *.lnk
- Bao ve cac muc da ghim

**[14] Xoa Lich Su Run**
- Xoa lich su hop thoai Run tu registry

**[15] Xoa Lich Su Tim Kiem**
- Thu muc ConnectedSearch\History
- Goi y tim kiem

**[16] Xoa Lich Su Clipboard**
- Du lieu clipboard (Windows 10/11)
- PowerShell Clear-Clipboard

**[17] Xoa Bao Cao Loi Windows**
- Don dep thu muc WER
- Giai phong: 100 MB - 2 GB

**[18] Tat Thu Thap Du Lieu**
- Vo hieu hoa dich vu DiagTrack
- Sua doi registry
- Tap trung vao rieng tu

**[19] Xoa Nhat Ky Su Kien**
- Nhat ky Application, System, Security
- Canh bao: Xoa thong tin khai

**[20] Xoa Cache DNS**
- ipconfig /flushdns
- ipconfig /registerdns
- Sua van de DNS

---

### DANH MUC 3: TOI UU MANG [21-26]

**[21] Reset Cai Dat Mang**
- Reset TCP/IP
- Reset Winsock
- Yeu cau khoi dong lai

**[22] Toi Uu Hieu Suat Mang**
- Vo hieu hoa throttling
- Toi uu cai dat TCP
- Tang 10-30% toc do

**[23] Xoa Cache ARP**
- Lenh arp -d *
- Lam moi ket noi adapter

**[24] Reset Winsock**
- netsh winsock reset
- Sua mang bi hong
- Yeu cau khoi dong lai

**[25] Lam Moi Dia Chi IP**
- ipconfig /release
- ipconfig /renew
- Sua van de DHCP

**[26] Sua Card Mang**
- Vo hieu/kich hoat adapter
- Khoi dong lai PowerShell
- Sua van de phat hien

---

### DANH MUC 4: QUAN LY O DIA [27-32]

**[27] Don Dep O Dia (Tich Hop)**
- Tien ich cleanmgr cua Windows
- Giao dien GUI
- Giai phong: 1-10 GB

**[28] Kiem Tra Loi O Dia**
- Quet CHKDSK
- Hen lich khi khoi dong lai
- Thoi gian: 10-60 phut

**[29] Toi Uu O Dia**
- HDD: Defragmentation
- SSD: Lenh TRIM
- Thoi gian: 30 phut - 2 gio

**[30] Phan Tich Dung Luong**
- Hien thi dung luong trong tren o dia
- Phan tich PowerShell

**[31] Xoa Thu Muc Windows.old**
- Giong [10]
- Yeu cau xac nhan 2 lan

**[32] Nen He Thong**
- Nen cac file he thong
- Giai phong: 2-4 GB
- Khong anh huong hieu suat

---

### DANH MUC 5: TOI UU HIEU SUAT [33-44]

**[33] Tat Chuong Trinh Khoi Dong**
- Tab Startup cua Task Manager
- Khoi dong nhanh hon 20-50%

**[34] Toi Uu Dich Vu**
- Vo hieu hoa cac dich vu khong can
- Che do Manual cho mot so dich vu

**[35] Xoa File Prefetch**
- C:\Windows\Prefetch
- An toan de xoa

**[36] Xoa Cache SuperFetch**
- Dung Superfetch
- Huu ich cho SSD

**[37] Tat Hieu Ung Hinh Anh**
- Che do "Best Performance"
- Tang 15-30% tren PC cu

**[38] Toi Uu Che Do Nguon**
- Che do High Performance
- Hieu suat CPU toi da
- Khong cho laptop dang dung pin

**[39] Tat Che Do Ngu Dong**
- Xoa hiberfil.sys
- Giai phong: 4-32 GB (kich thuoc RAM)

**[40] Xoa Cache Bo Nho**
- Giam bo nho tien trinh
- Tang RAM tam thoi

**[41] Toi Uu Tim Kiem**
- Xay dung lai chi muc
- Thoi gian: 30-60 phut

**[42] Tat Hoat Anh Windows**
- Phan hoi UI nhanh hon
- Cam giac nhanh hon

**[43] Toi Uu SSD**
- Vo hieu defrag cho SSD
- Kich hoat TRIM
- Quan trong: Chi cho SSD!

**[44] Giam Tre Hien Thi Menu**
- MenuShowDelay = 0
- Menu hien thi ngay lap tuc

---

### DANH MUC 6: BAO TRI HE THONG [45-50]

**[45] Kiem Tra File He Thong (SFC)**
- sfc /scannow
- Sua chua file bi hong
- Thoi gian: 15-30 phut

**[46] Sua Chua He Thong DISM**
- DISM /RestoreHealth
- Toan dien hon SFC
- Thoi gian: 20-40 phut

**[47] Don Dep Thanh Phan Windows**
- Xoa cac component cu
- Giam kich thuoc WinSxS
- Giai phong: 1-5 GB

**[48] Cap Nhat Driver Windows**
- Mo Device Manager
- Nguoi dung kiem soat

**[49] Xay Dung Lai Icon Cache**
- Giong [7]
- Sua icon bi hong

**[50] Xay Dung Lai Tim Kiem**
- Mo Indexing Options
- Xay dung lai thu cong

---

### DANH MUC 7: TOI UU REGISTRY [51-55]

**[51] Don Dep Registry (An Toan)**
- Don dep MUI cache
- Tu dong sao luu truoc

**[52] Toi Uu Registry**
- Nen cac registry hive
- Yeu cau khoi dong lai

**[53] Sao Luu Registry**
- Xuat ra thu muc Documents
- Ten file co thoi gian

**[54] Tat Cortana**
- Sua doi registry
- Giai phong 100-300 MB RAM
- Chi Windows 10/11

**[55] Tat Goi Y Windows**
- Dung thong bao popup
- Trai nghiem sach hon

---

### DANH MUC 8: CONG CU NANG CAO [56-70]

**[56] Tao Diem Khoi Phuc He Thong**
- Tao bang PowerShell
- Thoi gian: 1-5 phut

**[57] Xem Thong Tin He Thong**
- Mo msinfo32
- Thong tin he thong chi tiet

**[58] Xuat Danh Sach Chuong Trinh**
- Danh sach WMIC
- Luu vao Documents

**[59] Kiem Tra Suc Khoe O Dia**
- Trang thai SMART
- Du doan loi o dia

**[60] Xoa Cache Windows Store**
- wsreset.exe
- Sua loi Store
- Thoi gian: 1-2 phut

**[61] Reset Thanh Phan Update**
- Sua chua toan dien
- Giai phap cuoi cung

**[62] Toi Uu Thoi Gian Khoi Dong**
- powercfg /bootrace
- Xac dinh diem nghen

**[63] Xoa Tat Ca File Tam**
- *.tmp, *.bak, *.old
- Giai phong: 500 MB - 5 GB

**[64] Tao Bao Cao He Thong**
- perfmon /report
- Thoi gian: 60 giay

**[65] Xoa Cache Phan Mem**
- Giong [4]

**[66] Xoa Delivery Optimization**
- File cap nhat peer-to-peer
- Giai phong: 500 MB - 5 GB

**[67] Xoa Sao Luu Cap Nhat (LCU)**
- Sao luu Latest Cumulative Update
- Giai phong: 2-8 GB
- Canh bao: Khong the hoan tac cap nhat

**[68] Toi Uu Bo Nho RAM**
- Giong [40]
- Giai phong 100-500 MB

**[69] Xem Bao Cao Dung Luong**
- So sanh truoc/sau
- Theo doi tien do

**[70] Lam Moi Icon Cache**
- Giong [7], [49]

---

### DANH MUC 9: TIEN ICH HE THONG [71-76]

**[71] Kiem Tra Thong Tin May**
- Ten may, nha san xuat
- Model va toc do CPU
- RAM, phien ban OS
- Kien truc (32/64-bit)
- Phien ban BIOS

**[72] Trung Tam Cai Dat Windows**
- Windows 10/11: Ung dung Settings
- Windows 7/8: Control Panel

**[73] Sua Chua va Reset Office**
- Xoa cache Office
- Reset ve mac dinh
- Sua cac loi pho bien
- Dong cac ung dung Office truoc

**[74] Xoa Ung Dung Rac (An Toan)**
- Windows 10/11: Xoa bang PowerShell
  - 3D Builder, Candy Crush
  - Mixed Reality Portal
  - Cac ung dung Xbox (tuy chon)
- Windows 7/8: Programs and Features
- Giai phong: 500 MB - 2 GB
- Canh bao: Mot so ung dung khong the cai lai

**[75] Quan Ly Bitlocker**
- Hien thi trang thai Bitlocker
- manage-bde -status
- Chi thong tin - khong sua doi

**[76] Kiem Tra Trang Thai Kich Hoat**
- Windows: slmgr.vbs /dli
- Office: ospp.vbs /dstatus
- Chi thong tin - khong kich hoat

---

### DANH MUC 10: SAO LUU VA KHOI PHUC [77-82] ? MOI!

**[77] Sao Luu Mat Khau Wifi**
- Xuat tat ca cau hinh WiFi da luu
- netsh wlan export
- Tao WiFi_Passwords.txt
- Vi tri: Documents\WiFi_Backup_[TIMESTAMP]\
- Thoi gian: 10-30 giay

**[78] Sao Luu Driver**
- Xuat driver DISM
- Chi driver ben thu ba
- Tao cac file .inf
- Danh sach driver CSV
- Vi tri: Documents\Driver_Backup_[TIMESTAMP]\
- Thoi gian: 1-3 phut
- Yeu cau: 100-500 MB

**[79] Sao Luu Du Lieu Nguoi Dung**
- Ba che do:
  1. Nhanh: Desktop, Documents, Pictures
  2. Day du: + Downloads, Videos, Music
  3. Tuy chinh: Chon thu muc bang File Explorer
- Su dung xcopy voi /EXCLUDE
- KHONG xoa file goc
- Vi tri: Documents\UserData_Backup_[TIMESTAMP]\
- Thoi gian: 10-60 phut
- Yeu cau: Bang du lieu nguon

**[80] Sao Luu Du Lieu Zalo**
- Du lieu Zalo PC day du:
  - AppData\Roaming\ZaloPC
  - Documents\ZaloData
  - LocalAppData\ZaloPC
- Tin nhan, media, cache
- Dung Zalo tu dong
- Vi tri: Documents\Zalo_Backup_[TIMESTAMP]\
- Thoi gian: 1-10 phut
- Yeu cau: 500 MB - 5 GB
- Canh bao: Dong Zalo truoc

**[81] Sao Luu Ban Quyen**
- Key OEM Windows (tu BIOS)
- Trang thai giay phep Windows
- Trang thai giay phep Office
- Tao cac file text
- Vi tri: Documents\ProductKeys_Backup_[TIMESTAMP]\
- Thoi gian: 10-30 giay
- Canh bao: Giu sao luu an toan!

**[82] Cong Cu Khoi Phuc Du Lieu**
- Mo cac cong cu tich hop Windows:
  - File History
  - System Restore
  - Previous Versions
  - Volume Shadow Copies
- KHONG cai dat phan mem ben thu ba
- Phu thuoc vao cau hinh sao luu

---

### THAO TAC NHANH

**[88] CHAY TAT CA DON DEP**
- Chay 10 tac vu don dep:
  1. File tam
  2. Thung rac
  3. Cache trinh duyet
  4. Cache Windows Update
  5. Cache thumbnail
  6. Cache icon
  7. Cache DNS
  8. Prefetch
  9. Nhat ky su kien
  10. Delivery Optimization
- Hoan toan tu dong
- Thoi gian: 5-15 phut
- Giai phong: 3-15 GB
- De xuat: Hang thang

**[99] TOI UU TOAN BO HE THONG**
- Tat ca tac vu don dep tu [88]
- Kiem tra file he thong (SFC)
- Sua chua DISM
- Toi uu hoa o dia
- Toi uu hoa registry
- Toi uu hoa mang
- Tinh chinh hieu suat
- Toi uu hoa dich vu
- Tao diem khoi phuc truoc
- Thoi gian: 20-60 phut
- Yeu cau khoi dong lai
- Giai phong: 5-20 GB
- Loi ich: He thong nhanh hon 20-40%
- De xuat: Moi quy

================================================================================

## TUONG THICH

- **Windows 7**: Tat ca 82 chuc nang tuong thich (mot so dung fallback)
- **Windows 8/8.1**: Tat ca 82 chuc nang tuong thich
- **Windows 10**: Tuong thich day du - nen tang toi uu
- **Windows 11**: Tuong thich day du - tinh nang moi nhat

================================================================================

## LUU Y AN TOAN

### Thao Tac An Toan:
? Tat ca chuc nang don dep AN TOAN
? Chuc nang sao luu KHONG xoa file goc
? Thay doi registry tu dong sao luu
? Yeu cau xac nhan cho cac thao tac nguy hiem

### Canh Bao:
?? Xoa Windows.old: Khong the ha cap
?? Xoa sao luu LCU: Khong the go cap nhat
?? Vo hieu Hibernation: Xoa hiberfil.sys
?? Reset mang: Yeu cau khoi dong lai

### De Xuat:
1. Tao diem khoi phuc he thong truoc khi thay doi lon
2. Dong tat ca ung dung truoc khi don dep
3. Sao luu du lieu quan trong thuong xuyen
4. Chay voi quyen Administrator

================================================================================

## CHUYEN DOI NGON NGU

Nhan phim **L** tai bat ky menu nao de chuyen doi ngay lap tuc giua tieng Anh va tieng Viet.

================================================================================

Phien ban: 5.0
Cap nhat: 2025-11-03
Tong chuc nang: 82 + 2 thao tac nhanh
Trang thai: ON DINH - AN TOAN SU DUNG
Giay phep: Ma nguon mo
