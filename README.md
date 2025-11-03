# ?? Windows Professional Toolkit

**Version 3.0** - All-in-One System Management Tool

[![Version](https://img.shields.io/badge/version-3.0-blue.svg)](https://github.com)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Windows%207%2B-lightgrey.svg)](https://www.microsoft.com/windows)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)](https://docs.microsoft.com/powershell/)

---

## ?? Overview

**Professional all-in-one toolkit** for Windows system management with beautiful interactive UI. Three powerful tools in one script!

---

## ? Features - 3 Main Tools

### ?? 1. CLEANUP TOOL
**Remove junk files & optimize system**
- ?? Quick Cleanup (Basic - 200-500 MB)
- ?? Standard Cleanup (Recommended - 500MB-3GB)
- ?? Deep Cleanup (Comprehensive - 2-10GB+)
- ??? Preview Mode (See before delete)
- ?? Schedule Automation

### ?? 2. WINDOWS ACTIVATION
**Activate Windows & Office**
- ?? KMS Activation (Automatic)
- ?? Manual Product Key Entry
- ?? Check Activation Status
- ?? Rearm Windows (Reset trial)
- ?? View License Information

### ?? 3. SOFTWARE MANAGER
**Uninstall applications easily**
- ?? List All Installed Software
- ?? Search by Name
- ??? Uninstall Applications
- ?? Export Software List

---

## ?? Quick Start

### Method 1: Direct PowerShell (Recommended)

```powershell
# Right-click WindowsToolkit.ps1 -> Run with PowerShell (Admin)
# OR
# Open PowerShell as Administrator and run:
.\WindowsToolkit.ps1
```

### Method 2: Create BAT Launcher

Create `RunToolkit.bat` with this content:
```batch
@echo off
powershell -ExecutionPolicy Bypass -File "%~dp0WindowsToolkit.ps1"
pause
```

Then double-click the BAT file!

---

## ?? User Interface

```
???????????????????????????????????????????????????????????????????
              ??     ?? ?? ???    ?? ??????   ??????  ??     ??   
              ??     ?? ?? ????   ?? ??   ?? ??    ?? ??     ??   
              ??  ?  ?? ?? ?? ??  ?? ??   ?? ??    ?? ??  ?  ??   
              ?? ??? ?? ?? ??  ?? ?? ??   ?? ??    ?? ?? ??? ??   
               ??? ???  ?? ??   ???? ??????   ??????   ??? ???    
                     PROFESSIONAL SYSTEM TOOLKIT v3.0             
???????????????????????????????????????????????????????????????????

  SELECT TOOL:

  ???????????????????????????????????????????????????????????????
  ?                                                             ?
  ?  [1] ?? CLEANUP TOOL       - Remove junk & optimize        ?
  ?                                                             ?
  ?  [2] ?? WINDOWS ACTIVATION - Activate Windows & Office     ?
  ?                                                             ?
  ?  [3] ?? SOFTWARE MANAGER   - Uninstall applications        ?
  ?                                                             ?
  ?  [4] ?? VIEW LOGS          - Check operation history       ?
  ?                                                             ?
  ?  [5] ??  ABOUT & INFO       - System information            ?
  ?                                                             ?
  ?  [0] ? EXIT                - Close toolkit                 ?
  ?                                                             ?
  ???????????????????????????????????????????????????????????????
```

---

## ?? Detailed Features

### ?? Cleanup Tool Features

| Mode | What It Cleans | Space Freed | Time | Safety |
|------|----------------|-------------|------|--------|
| ?? **Quick** | Temp files, thumbnails | 200-500 MB | 30s | ????? |
| ?? **Standard** | + Browser cache, updates | 500MB-3GB | 1-2min | ???? |
| ?? **Deep** | + App cache, logs | 2-10GB+ | 2-5min | ??? |
| ??? **Preview** | Shows what will be deleted | 0 (view only) | 1-2min | ????? |

**Cleaned Items:**
- Windows Temp & User Temp
- Browser Cache (Chrome, Edge, Firefox)
- Windows Update Cache
- Prefetch Files
- Error Reports & Crash Dumps
- Thumbnail Cache
- Recycle Bin
- App Cache (Teams, Discord, VS Code, Spotify...)
- Windows Logs (Deep mode)
- And much more!

**Advanced:**
- ?? Schedule automatic cleanup (Daily/Weekly/Monthly)
- ?? Detailed logging system
- ??? Preview before deletion

---

### ?? Windows Activation Features

**Activation Methods:**
1. **KMS Activation** - Automatic (180-day validity, auto-renews)
2. **Product Key** - Enter your own key
3. **Status Check** - Detailed activation info
4. **Rearm** - Reset trial period
5. **License Info** - View full license details

**Supported:**
- Windows 7, 8, 8.1, 10, 11
- Windows Server editions
- Works with most editions (Home, Pro, Enterprise)

?? **Disclaimer:** Use only on your own devices. For educational purposes.

---

### ?? Software Manager Features

**Capabilities:**
- ?? **List All Software** - View every installed application
- ?? **Search** - Find software by name (partial match works)
- ??? **Uninstall** - Remove applications safely
- ?? **Export** - Save software list to text file

**Supports:**
- Both 64-bit and 32-bit applications
- MSI and EXE installers
- Automatic duplicate removal
- Publisher and version info

**Smart Features:**
- Multiple match handling
- Safe uninstall commands
- Silent uninstall support
- Detailed application info

---

## ?? System Requirements

| Requirement | Details |
|-------------|---------|
| **OS** | Windows 7 / 8 / 10 / 11 |
| **PowerShell** | Version 5.1 or higher (built-in) |
| **Privileges** | Administrator rights required |
| **Disk Space** | < 1 MB for script |
| **RAM** | Any (lightweight) |

---

## ??? Safety & Security

### ? What This Tool DOES:
- ? Cleans junk files safely
- ? Activates Windows (your choice)
- ? Manages software installations
- ? Logs all operations
- ? Provides preview mode

### ? What This Tool DOES NOT:
- ? Contains NO viruses or malware
- ? Does NOT delete personal files
- ? Does NOT damage Windows
- ? Does NOT send data anywhere (100% offline)
- ? Does NOT collect information
- ? Does NOT install anything

### ?? Open Source
- All code visible
- No hidden functions
- Free forever
- Community verified

---

## ?? Usage Guide

### ?? Using Cleanup Tool

1. Select `[1]` from main menu
2. Choose cleanup mode:
   - `[1]` Quick - For beginners
   - `[2]` Standard - **Recommended**
   - `[3]` Deep - For power users
   - `[4]` Preview - Check first!
3. Wait for completion
4. View results

**First time?** Use `[4]` Preview mode!

---

### ?? Using Windows Activation

1. Select `[2]` from main menu
2. Check current status
3. Choose activation method:
   - `[1]` KMS Activation - **Easiest**
   - `[2]` Enter product key manually
   - `[3]` Check detailed status
4. Follow prompts
5. Restart if needed

**Note:** KMS activation lasts 180 days but auto-renews.

---

### ?? Using Software Manager

**To list all software:**
1. Select `[3]` from main menu
2. Choose `[1]` List All
3. Browse through list

**To uninstall software:**
1. Select `[3]` from main menu
2. Choose `[3]` Uninstall
3. Enter software name
4. Confirm uninstall
5. Wait for completion

**To search:**
1. Choose `[2]` Search
2. Enter partial name (e.g., "chrome")
3. View results

---

## ?? Tips & Tricks

### ?? Create Desktop Shortcut

**Method 1: PowerShell Shortcut**
1. Right-click `WindowsToolkit.ps1`
2. Send to -> Desktop (create shortcut)
3. Right-click shortcut -> Properties
4. Target: `powershell.exe -ExecutionPolicy Bypass -File "C:\path\to\WindowsToolkit.ps1"`
5. Run as administrator: Advanced -> Check box

**Method 2: BAT Launcher**
1. Create `WindowsToolkit.bat`:
```batch
@echo off
powershell -ExecutionPolicy Bypass -NoProfile -File "%~dp0WindowsToolkit.ps1"
pause
```
2. Create shortcut to this BAT file

---

### ?? Schedule Automatic Cleanup

**Option 1: Using Built-in Scheduler**
1. Open Cleanup Tool
2. Select `[5]` Schedule
3. Choose frequency
4. Done!

**Option 2: Windows Task Scheduler**
1. Open Task Scheduler
2. Create Basic Task
3. Action: Start program
4. Program: `powershell.exe`
5. Arguments: `-ExecutionPolicy Bypass -File "C:\path\to\WindowsToolkit.ps1"`

---

### ?? View Operation History

1. Select `[4]` from main menu
2. View last 100 log entries
3. Color-coded:
   - ?? Green = Success
   - ?? Yellow = Warning
   - ?? Red = Error

---

## ?? Troubleshooting

### ? "Script cannot be loaded"

**Cause:** PowerShell Execution Policy

**Solution:**
```powershell
# Run PowerShell as Admin:
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

**OR**

```powershell
# Run script directly with bypass:
powershell -ExecutionPolicy Bypass -File .\WindowsToolkit.ps1
```

---

### ? "Access Denied"

**Cause:** Not running as Administrator

**Solution:**
1. Right-click script
2. Select "Run as Administrator"
3. Click "Yes" on UAC prompt

---

### ? Activation Failed

**Possible Causes:**
- No internet connection (for KMS)
- Firewall blocking KMS server
- Wrong product key
- Already activated with different key

**Solutions:**
1. Check internet connection
2. Temporarily disable firewall
3. Try different KMS server
4. Use product key method instead

---

### ? Software Won't Uninstall

**Causes:**
- Software has custom uninstaller
- Application is running
- Insufficient permissions

**Solutions:**
1. Close the application first
2. Run toolkit as Admin
3. Uninstall manually via Control Panel
4. Check Event Viewer for errors

---

## ?? Logs & History

**Log File Location:**
- `ToolkitLog.txt` (same folder as script)

**What's Logged:**
- All operations with timestamps
- Success/failure status
- Errors with details
- Space freed (cleanup)
- Software uninstalled
- Activation attempts

**Log Format:**
```
2025-11-03 14:30:15 - SUCCESS: Windows Temp - Deleted 245.67 MB
2025-11-03 14:30:20 - SUCCESS: Chrome Cache - Deleted 567.89 MB
2025-11-03 14:31:00 - UNINSTALL: Google Chrome
```

---

## ?? FAQ

**Q: Is this safe to use?**
A: Yes! Open source, no viruses, doesn't damage system.

**Q: Will it delete my files?**
A: NO. Only deletes junk/temp files, cache, logs. Never touches personal files.

**Q: Is Windows activation legal?**
A: Use only on your own devices. Check your local laws.

**Q: How often should I run cleanup?**
A: Once a month recommended, or when PC is slow.

**Q: Does it need internet?**
A: Only for Windows KMS activation. Cleanup and Software Manager work offline.

**Q: Can I undo changes?**
A: Deleted files cannot be recovered. Use Preview mode first!

**Q: Which cleanup mode should I use?**
A: Standard `[2]` for most users. Quick `[1]` if worried. Deep `[3]` for maximum cleanup.

**Q: Will apps run slower after cleanup?**
A: First launch may be slightly slower (rebuilding cache), then normal.

**Q: Does it work on Windows 11?**
A: Yes! Supports Windows 7, 8, 10, and 11.

**Q: Is it really free?**
A: Yes, 100% free forever. No ads, no premium version.

---

## ?? Changelog

### Version 3.0 (2025-11-03)
- ?? **Complete rewrite** - All-in-one toolkit
- ? Added Windows Activation tool
- ? Added Software Manager/Uninstaller
- ? Beautiful ASCII art interface
- ? Color-coded menus
- ? Improved logging system
- ? Combined 3 tools in one script
- ? Full English interface
- ??? Removed BAT files (PowerShell only)
- ?? Professional UI design

### Version 2.0 (2025-11-03)
- Interactive menu
- 3 cleanup modes
- Preview mode
- Logging system

### Version 1.0 (2025-11-02)
- Initial release
- Basic cleanup

---

## ?? Contributing

- ? Star this project
- ?? Report bugs
- ?? Suggest features
- ?? Share with others
- ?? Submit pull requests

---

## ?? License

**MIT License** - Free to use and modify

```
Copyright (c) 2025

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software to use, copy, modify, merge, publish, distribute, and/or sell
copies of the Software, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.
```

---

## ?? Disclaimer

- Use at your own risk and responsibility
- No warranty provided
- For personal/educational use only
- Check local laws regarding software activation
- Always backup important data before system operations
- Author not responsible for misuse

---

## ?? Recommendations

| Your Need | Recommended Tool | Mode |
|-----------|-----------------|------|
| ?? Clean junk files | Cleanup Tool | Standard [2] |
| ?? Activate Windows | Windows Activation | KMS [1] |
| ?? Remove software | Software Manager | Uninstall [3] |
| ??? First time use | Cleanup Tool | Preview [4] |
| ?? Regular maintenance | Schedule Cleanup | Monthly |

---

## ?? Support

If you need help:
1. Read this README thoroughly
2. Check the FAQ section
3. View log files for errors
4. Check Troubleshooting section
5. Report issues on GitHub

---

## ?? Project Stats

- **Lines of Code:** ~1000+
- **Functions:** 20+
- **Features:** 15+
- **Supported OS:** 4 (Win 7/8/10/11)
- **Language:** PowerShell
- **File Size:** ~60 KB
- **Dependencies:** None (built-in commands only)

---

**?? Thank you for using Windows Professional Toolkit!**

**? Enjoy a cleaner, activated, and well-managed Windows system! ????**

---

*Version 3.0 | Updated: 2025-11-03 | Made with ??*

*PowerShell Only | No BAT files | Professional Edition*
