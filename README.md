# ?? Windows Professional Toolkit

**Version 4.0 - ULTIMATE EDITION** ?

![Version](https://img.shields.io/badge/version-4.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Platform](https://img.shields.io/badge/platform-Windows-lightgrey.svg)
![Language](https://img.shields.io/badge/language-CMD%2FBatch-yellow.svg)

**All-in-One System Tool - Pure CMD/Batch - No PowerShell Required!**

---

## Overview

Professional Windows management tool built with **pure CMD/Batch scripts**. No PowerShell required!

**Four powerful tools in one beautiful BAT file:**

?? **Cleanup Tool** - Remove junk files & free disk space (5 modes)  
?? **Windows Activation** - Activate Windows & Office with MAS (14 methods)  
? **Windows Optimizer** - Make your PC faster & smoother (15 tweaks)  
?? **Software Manager** - Uninstall applications easily  

**Plus:** Logging, System Info, About & Help

---

## Features

### 1. ?? Cleanup Tool

**5 Cleanup Modes:**
- ? **Quick Cleanup** - Fast & safe (200-500 MB) - 30 seconds
- ? **Standard Cleanup** - Recommended (500MB-3GB) - 1-2 minutes  
- ?? **Deep Cleanup** - Maximum cleaning (2-10GB+) - 2-5 minutes
- ??? **Preview Mode** - See before delete - No actual deletion
- ?? **Custom Cleanup** - Choose what to clean - NEW in v4.0!

**14+ Cleanup Targets:**
- Windows Temp, User Temp, Prefetch
- Browser Caches (Chrome, Edge, Firefox)
- Windows Update Cache, Error Reports
- Recycle Bin, Recent Items, Thumbnails
- DNS Cache, Font Cache, Icon Cache
- App Caches (Teams, Discord, VS Code, Spotify, Slack, Zoom)
- Windows Logs, Delivery Optimization

### 2. Windows Activation (Based on MAS)
- **HWID** - Permanent activation (Windows 10/11)
- **KMS38** - Valid until 2038 (Win 10/11/Server)
- **Online KMS** - 180 days, auto-renew (All Windows)
- **Office** - Activate all Office versions
- Check status & license info
- Remove licenses

### 3. Windows Optimizer (NEW!)

**Quick Actions:**
- One-click optimization
- Chris Titus WinUtil integration

**Performance Tweaks:**
- Disable visual effects
- Optimize services
- Optimize startup programs
- High performance power plan
- Network optimization

**Privacy & Debloat:**
- Remove bloatware apps
- Disable telemetry
- Privacy settings
- Disable Cortana

**System Tweaks:**
- Clean system cache
- Defragment drives
- Update Group Policy
- Restore defaults

### 4. Software Manager
- List all installed software
- Uninstall by name
- Export software list to file

### 5. ?? View Logs
- Real-time operation logs
- Last 50 log entries
- Timestamp for each operation
- Error tracking

### 6. ?? System Information (ENHANCED!)

**6 Information Modes:**
- ?? **Quick Overview** - Essential system info at a glance
- ??? **Detailed Report** - Complete system analysis
- ?? **Hardware Details** - CPU, RAM, GPU, Motherboard, BIOS
- ?? **Storage Information** - Disks, partitions, space usage
- ?? **Network Information** - Adapters, IP config, connectivity test
- ?? **Export Full Report** - Save complete report to text file

**Information Includes:**
- Computer name, user, domain
- Operating system details and version
- CPU: Name, cores, speed
- RAM: Total, available, virtual memory
- GPU: Model, driver, VRAM
- Storage: Disks, partitions, free space (with health indicators)
- Network: Adapters, IP addresses, connectivity status
- BIOS and motherboard information
- Windows updates history
- System uptime

### 7. ?? About & Help
- Complete tool information
- Quick start guides (beginner & advanced)
- Documentation links
- Safety information
- Credits and sources

---

## Requirements

- Windows 7 / 8 / 10 / 11
- Administrator rights
- No PowerShell needed
- No installation required

---

## How to Use

### Simple Method
1. Download `WindowsToolkit.bat`
2. Right-click on file
3. Select **"Run as administrator"**
4. Choose option from menu
5. Done!

### Menu Navigation
```
================================================================
           WINDOWS PROFESSIONAL TOOLKIT v3.0
================================================================

  SELECT TOOL:

  [1] Cleanup Tool        - Remove junk and optimize
  [2] Windows Activation  - Activate Windows & Office
  [3] Windows Optimizer   - Optimize Windows 10/11 (NEW!)
  [4] Software Manager    - Uninstall applications
  [5] View Logs           - Check operation history
  [6] System Info         - View system information
  [0] Exit                - Close toolkit

================================================================
```

---

## Cleanup Tool

### Quick Cleanup
Cleans:
- Windows Temp
- User Temp
- Recent Items
- Thumbnail Cache

**Space freed:** 200-500 MB  
**Time:** 30 seconds

### Standard Cleanup
Cleans everything above plus:
- Prefetch files
- Windows Update cache
- Error reports
- Crash dumps
- Browser caches (Chrome, Edge, Firefox)
- Recycle Bin

**Space freed:** 500 MB - 3 GB  
**Time:** 1-2 minutes

### Deep Cleanup
Cleans everything above plus:
- Windows logs
- Delivery Optimization
- App caches (Teams, Discord, VS Code, Spotify, Slack, Zoom)

**Space freed:** 2-10+ GB  
**Time:** 2-5 minutes

---

## Windows Activation

**Based on Microsoft Activation Scripts (MAS)**  
Source: https://github.com/massgravel/Microsoft-Activation-Scripts

### HWID Activation (Recommended)
- **PERMANENT** activation (lifetime!)
- Works on Windows 10/11
- Survives reinstalls on same hardware
- Most reliable method

### KMS38 Activation
- Valid until year **2038** (19 years!)
- Works on Windows 10/11/Server
- No renewal needed
- Offline activation

### Online KMS Activation
- Valid for 180 days
- Auto-renews automatically
- Works on all Windows versions
- Requires periodic internet

### Office Activation
- Supports Office 365/2021/2019/2016/2013/2010
- All editions (Professional, Home, Business)
- Project and Visio support
- 180-day validity, auto-renew

### Other Features
- Manual product key entry
- Check activation status (Windows + Office)
- View license information
- Remove Office licenses

---

## Software Manager

### List Software
Shows all installed applications with:
- Software name
- Version number
- Vendor/Publisher

### Uninstall
- Search by name
- Confirm before uninstall
- Uses Windows built-in uninstaller

### Export List
Saves complete software list to text file with timestamp.

---

## Safety

- **100% Safe** - Pure CMD/Batch script
- **No Viruses** - Open source code
- **No Installation** - Just run the BAT file
- **Logging** - All operations logged
- **Tested** - Works on all Windows versions

### What It Does NOT Do
- Does NOT delete personal files
- Does NOT damage Windows
- Does NOT install anything
- Does NOT collect data
- Does NOT send information anywhere

---

## Logging

All operations are automatically logged to `ToolkitLog.txt` in the same folder.

Log format:
```
[2025-11-03 14:30:15] ==================== QUICK CLEANUP START ====================
[2025-11-03 14:30:16] SUCCESS: Windows Temp cleaned
[2025-11-03 14:30:17] SUCCESS: User Temp cleaned
[2025-11-03 14:30:20] ==================== QUICK CLEANUP END ====================
```

---

## Troubleshooting

### "Access Denied"
**Solution:** Run as Administrator (right-click -> Run as administrator)

### Software list not showing
**Solution:** Some apps don't register in Windows. Try Control Panel instead.

### Activation failed
**Solutions:**
- Check internet connection
- Try manual key method
- Disable antivirus temporarily

### Cleanup freed less space
**Solutions:**
- Close all browsers and apps
- Try Deep Cleanup mode
- Some files may be in use

---

## FAQ

**Q: Is this safe?**  
A: Yes! Pure CMD script, no viruses, open source.

**Q: Will it delete my files?**  
A: NO. Only deletes temp files, cache, logs. Never touches personal files.

**Q: Need installation?**  
A: No installation needed. Just run the BAT file.

**Q: Works on Windows 11?**  
A: Yes! Supports Windows 7, 8, 10, and 11.

**Q: Is activation legal?**  
A: Use only on your own devices. Check your local laws.

**Q: Why CMD not PowerShell?**  
A: CMD works everywhere, no execution policy issues, faster, simpler.

---

## File Structure

```
/workspace/
  - WindowsToolkit.bat     (Main tool - run this!)
  - ToolkitLog.txt         (Auto-created after first use)
  - README.md              (This file)
```

---

## ?? What's New in v4.0

### ?? **ULTIMATE EDITION** - Major UI Overhaul!

**? NEW FEATURES:**
- ?? **Custom Cleanup Mode** - Choose exactly what to clean
- ?? **About & Help Section** - Complete documentation and guides
- ?? **Beautiful ASCII Art** - Professional UI with box-drawing characters
- ?? **Emoji Icons** - Better visual navigation
- ? **Better Error Handling** - Clearer messages and validation

**?? UI IMPROVEMENTS:**
- ASCII art headers for all menus
- Unicode box-drawing borders
- Color-coded sections
- Professional window titles
- Helpful tips and recommendations

**?? NEW DOCUMENTATION:**
- CHANGELOG.md - Complete version history
- LICENSE - MIT License file
- Enhanced README with badges
- Updated all guides

### Previous Versions

**Version 3.0** (2025-11-03)
- Added Windows Optimizer (15 features)
- Microsoft Activation Scripts integration (14 methods)
- Enhanced cleanup with 4 modes
- Complete documentation suite

**Version 2.0** (2025-11-02)
- Migrated to pure CMD/Batch
- Fixed encoding issues
- English interface

**Version 1.0** (2025-11-01)
- Initial release with PowerShell

---

## License

**MIT License** - Free to use and modify

Use at your own risk. No warranty provided.  
For personal/educational use only.

---

## Quick Reference

| Task | Menu Option |
|------|-------------|
| Clean junk files | [1] -> [2] Standard |
| Activate Windows | [2] -> [1] KMS |
| Uninstall app | [3] -> [2] Uninstall |
| View logs | [4] |
| System info | [5] |

---

**Made with CMD/Batch - No PowerShell Required!**

**Version 3.0 | 2025-11-03**
