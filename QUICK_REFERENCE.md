# QUICK REFERENCE / TAM TAT NHANH

## LANGUAGE TOGGLE / CHUYEN DOI NGON NGU

### HOW TO SWITCH / CACH CHUYEN DOI
```
Press ` key (backtick) = Instant switch EN ? VI
Nhan phim ` (backtick) = Chuyen ngay EN ? VI
```

### DEFAULT / MAC DINH
- **Starts in:** English (EN)
- **Khoi dong:** Tieng Anh (EN)

### CHANGE DEFAULT / DOI MAC DINH
Edit line 26 in UltimateSystemTool.cmd:
```batch
# For English default:
if not defined LANG set LANG=EN

# For Vietnamese default:
if not defined LANG set LANG=VI
```

---

## FILE OVERVIEW / TONG QUAN FILE

### MAIN TOOLS / CONG CU CHINH

#### UltimateSystemTool.cmd (133 KB)
- **82 functions** - Full feature set
- **Language toggle** - `` ` `` key
- **Compatible:** Windows 7/8/8.1/10/11
- **Usage:** Right-click ? Run as Administrator

#### UltimateSystemTool.ps1 (30 KB)
- **10 core functions** - Essential tools
- **Modern UI** - Colorful interface
- **Compatible:** Windows 7/8/8.1/10/11 (PowerShell 2.0+)
- **Usage:** Right-click ? Run with PowerShell

---

## DOCUMENTATION / TAI LIEU

### README.md
- **Quick start guide**
- **Feature comparison**
- **System requirements**
- **Safety notes**

### LANGUAGE_TOGGLE_GUIDE.md
- **How language toggle works**
- **Key press instructions**
- **FAQ**
- **Technical details**

### COMPARISON_GUIDE.md
- **CMD vs PowerShell**
- **Feature-by-feature comparison**
- **Use case recommendations**
- **Performance comparison**

### CHANGELOG.md
- **Version history**
- **New features**
- **Bug fixes**
- **Upgrade path**

---

## FUNCTION CATEGORIES / DANH MUC CHUC NANG

### CMD VERSION (82 Functions)

```
[1-12]   System Cleanup / Don Dep He Thong
[13-20]  Privacy Protection / Bao Ve Rieng Tu
[21-26]  Network Optimization / Toi Uu Mang
[27-32]  Disk Management / Quan Ly O Dia
[33-44]  Performance Optimization / Toi Uu Hieu Suat
[45-50]  System Maintenance / Bao Tri He Thong
[51-55]  Registry Optimization / Toi Uu Registry
[56-70]  Advanced Tools / Cong Cu Nang Cao
[71-76]  System Utilities / Tien Ich He Thong
[77-82]  Backup & Recovery / Sao Luu Va Khoi Phuc (NEW!)

[88]     Run All Cleanup / Chay Tat Ca Don Dep
[99]     Full System Optimization / Toi Uu Toan Bo
```

### POWERSHELL VERSION (10 Functions)

```
[1]   Quick System Cleanup
[2]   Deep System Cleanup
[77]  Backup WiFi Passwords
[78]  Backup Drivers
[79]  Backup User Data
[80]  Backup Zalo Data
[81]  Backup Product Keys
[88]  Run All Cleanup Tasks
```

---

## KEYBOARD SHORTCUTS / PHIM TAT

### In Main Menu:
- **`` ` ``** = Toggle language / Chuyen doi ngon ngu
- **0** = Exit / Thoat
- **1-82** = Select function / Chon chuc nang
- **88** = Run all cleanup / Chay tat ca don dep
- **99** = Full optimization / Toi uu toan bo

---

## BACKUP LOCATIONS / VI TRI SAO LUU

All backups are saved to:
```
%USERPROFILE%\Documents\[Function]_Backup_[YYYYMMDD_HHMMSS]\
```

Examples:
- WiFi: `Documents\WiFi_Backup_20251103_143000\`
- Drivers: `Documents\Driver_Backup_20251103_143000\`
- User Data: `Documents\UserData_Backup_20251103_143000\`
- Zalo: `Documents\Zalo_Backup_20251103_143000\`
- Keys: `Documents\ProductKeys_Backup_20251103_143000\`

---

## SAFETY CHECKLIST / KIEM TRA AN TOAN

### Before Running:
- ? Close all important applications
- ? Save your work
- ? Create system restore point (optional)
- ? Read function description

### For Backup Functions:
- ? Ensure enough disk space (2-20 GB)
- ? Close target applications (e.g., Zalo, Office)
- ? Backup to external drive (recommended)

### For Cleanup Functions:
- ? Understand what will be deleted
- ? Check for important temp files
- ? Note: Cleanup is safe, but permanent

---

## COMMON ISSUES / VAN DE THUONG GAP

### Issue: Tool won't open / Khong mo duoc
**Solution:** Right-click ? Run as Administrator

### Issue: Can't find `` ` `` key / Khong tim thay phim `` ` ``
**Solution:** It's left of the "1" key, top-left of keyboard

### Issue: Function not working / Chuc nang khong hoat dong
**Solution:** 
1. Check Windows version compatibility
2. Run as Administrator
3. Close target applications

### Issue: Backup takes too long / Sao luu lau qua
**Solution:** 
- This is normal for large data
- User Data backup can take 10-60 minutes
- Monitor progress in console

---

## PERFORMANCE EXPECTATIONS / MONG DOI HIEU SUAT

### Cleanup Times:
- **Quick Cleanup:** 10-30 seconds
- **Deep Cleanup:** 2-5 minutes
- **Full Optimization:** 10-20 minutes

### Backup Times:
- **WiFi Passwords:** 5-10 seconds
- **Drivers:** 1-3 minutes
- **User Data:** 10-60 minutes (depends on size)
- **Zalo Data:** 1-10 minutes
- **Product Keys:** 5-10 seconds

### Disk Space Freed:
- **Quick Cleanup:** 100 MB - 1 GB
- **Deep Cleanup:** 1-5 GB
- **Full Optimization:** 2-10 GB

---

## TROUBLESHOOTING / GIAI QUYET SU CO

### Administrator Rights / Quyen Administrator
```batch
Problem: "Access Denied" errors
Solution: Always run as Administrator
```

### Antivirus Blocking / Phan Mem Diet Virus Chan
```batch
Problem: Tool blocked by antivirus
Solution: Add to whitelist or disable temporarily
```

### PowerShell Execution Policy
```powershell
Problem: "Execution Policy" error
Solution: Run this first in PowerShell:
Set-ExecutionPolicy Bypass -Scope Process
```

---

## TIPS & TRICKS / MAO VA THU THUAT

### Best Practices:
1. **Run cleanup monthly** - Duy tri hang thang
2. **Backup before major cleanup** - Sao luu truoc khi don lon
3. **Check disk space first** - Kiem tra dung luong truoc
4. **Close browsers before cleanup** - Dong trinh duyet truoc

### Power User Tips:
1. **Schedule with Task Scheduler** - Hen gio tu dong
2. **Export backup to external drive** - Sao luu ra o ngoai
3. **Customize default language** - Tuy chinh ngon ngu mac dinh
4. **Use PowerShell for quick tasks** - Dung PS cho viec nhanh

---

## VERSION COMPARISON / SO SANH PHIEN BAN

| Feature | v4.5 | v5.0 |
|---------|------|------|
| Functions | 76 | 82 |
| Language | Menu | Toggle (`` ` ``) |
| Interface | Bilingual | Single language |
| Backup Suite | No | Yes (6 functions) |
| PowerShell | No | Yes (10 functions) |
| Win 7/8 Support | Limited | Full |

---

## CONTACT & SUPPORT / LIEN HE VA HO TRO

### For Help:
1. Read documentation (.md files)
2. Check LANGUAGE_TOGGLE_GUIDE.md
3. Review TROUBLESHOOTING section
4. Test on different Windows versions

### For Customization:
- Edit .cmd file with Notepad++
- Modify default language (line 26)
- Add custom cleanup paths
- Create custom functions

---

**Version:** 5.0
**Last Updated:** 2025-11-03
**Total Files:** 6 (2 tools + 4 docs)
**Total Size:** 187 KB
**Status:** ? READY TO USE / SAN SANG SU DUNG
