# ?? Windows Cleanup Automation Tool

**Version 2.0** - Professional automated cleanup tool for Windows

[![Version](https://img.shields.io/badge/version-2.0-blue.svg)](https://github.com)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Windows%207%2B-lightgrey.svg)](https://www.microsoft.com/windows)

---

## ?? Introduction

Professional cleanup tool for junk files, cache, and Windows optimization with interactive menu interface, multiple flexible modes, safe and easy to use.

## ? New Features in v2.0

### ?? What's New:

- ?? **Interactive Menu** - Beautiful interface, easy to use
- ?? **3 Cleanup Modes** - Quick / Standard / Deep
- ??? **Preview Mode** - See before you delete
- ?? **Logging System** - Detailed history tracking
- ?? **Scheduled Tasks** - Automatic cleanup scheduling
- ?? **Smart Display** - Auto KB/MB/GB conversion
- ?? **App Cache Cleanup** - Teams, Discord, VS Code, Spotify...
- ?? **English Interface** - No encoding issues

## ?? Tool Components:

| File | Description |
|------|-------------|
| **CleanupTool.ps1** | Main PowerShell script - Full v2.0 features with menu |
| **CleanupTool.bat** | Launcher with auto Administrator rights request |
| **QuickClean.bat** | Fast CMD script, no PowerShell required |
| **USER_GUIDE.md** | Detailed 20+ page instructions |
| **README.md** | This file - Quick start guide |

## ?? Quick Start

### Method 1: CleanupTool.bat (Recommended)

```bash
1. Double-click "CleanupTool.bat"
2. Allow Administrator privileges
3. Select mode from menu:
   [1] Quick Cleanup (Basic)
   [2] Standard Cleanup (Recommended) ?
   [3] Deep Cleanup (Comprehensive)
   [4] Preview Mode
   [5] Create Scheduled Task
4. Done!
```

### Method 2: QuickClean.bat (Fast)

```bash
1. Right-click "QuickClean.bat"
2. Select "Run as administrator"
3. Wait a few seconds
```

## ?? Cleanup Modes

| Mode | Average Space | Time | Safety | For |
|------|---------------|------|--------|-----|
| ?? **Quick** | 200-500 MB | ~30s | ????? | New users |
| ?? **Standard** | 500 MB - 3 GB | ~1-2 min | ???? | Most users |
| ?? **Deep** | 2-10+ GB | ~2-5 min | ??? | Power users |
| ??? **Preview** | 0 (view only) | ~1-2 min | ????? | Check first |

## ??? What Gets Cleaned

### ? Always Safe:
- Windows Temp & User Temp
- Browser Cache (Chrome, Edge, Firefox)
- Thumbnail Cache & Prefetch
- Windows Update Cache
- Error Reports & Crash Dumps
- Recycle Bin

### ? Deep Mode Adds:
- Windows Logs
- Delivery Optimization
- Teams, Discord, VS Code, Spotify Cache
- And much more...

### ? NEVER Deletes:
- ? Personal files (Documents, Pictures, Downloads...)
- ? Installed software
- ? Important system files
- ? Your settings

## ?? Expected Results

```
????????????????????????????????????????????????????????????????????
?  PC Condition       ?   Mode 1     ?   Mode 2     ?   Mode 3     ?
????????????????????????????????????????????????????????????????????
? New (< 1 month)     ?  100-300 MB  ?  300-800 MB  ?  0.5-1.5 GB  ?
? Regular (1-3 month) ?  300-600 MB  ?  0.8-2 GB    ?  1.5-5 GB    ?
? Old (> 6 months)    ?  0.5-1 GB    ?  2-5 GB      ?  5-15+ GB    ?
????????????????????????????????????????????????????????????????????
```

## ?? Advanced Features

### ?? Automated Scheduling
```
Select [5] in menu -> Choose frequency:
  ? Daily
  ? Weekly  
  ? Monthly (Recommended)
```

### ?? View History
```
Select [6] in menu
Or open: CleanupLog.txt
```

### ??? Preview Before Deletion
```
Select [4] in menu
See what will be deleted WITHOUT deleting anything!
```

## ?? System Requirements

- ? Windows 7 / 8 / 10 / 11
- ? Administrator privileges
- ? PowerShell (built-in)
- ? ~50KB disk space

## ??? Safety & Security

- ? **100% safe** - No viruses
- ? **Open source** - All code visible
- ? **100% offline** - No data sent anywhere
- ? **No data collection**
- ? **Free forever**

## ?? Full Documentation

?? **Read complete guide (20+ pages):** [USER_GUIDE.md](USER_GUIDE.md)

Includes:
- Step-by-step instructions
- All features explained
- FAQ (15+ questions)
- Troubleshooting
- Tips & Tricks

## ?? Common Issues

### "Script cannot be loaded"
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

### "Access Denied"
```
Right-click -> "Run as administrator"
```

## ?? Changelog

### v2.0 (2025-11-03)
- ? Interactive menu with 3 modes
- ? Preview mode
- ? Logging system
- ? Scheduled task creator
- ? App cache cleanup (Teams, Discord...)
- ? English interface
- ?? Better UI

### v1.0 (2025-11-02)
- ?? Initial release

## ?? Contributing

- ? Star if you find it useful
- ?? Report bugs via Issues
- ?? Suggest improvements
- ?? Share with friends

## ?? License

MIT License - Free to use and modify

---

## ?? Recommendations

| Situation | Recommended Mode |
|-----------|------------------|
| ?? First time use | Mode [4] Preview |
| ?? New user | Mode [1] Quick |
| ?? Regular user | Mode [2] Standard ? |
| ?? Power user | Mode [3] Deep |
| ?? Regular use | Schedule [5] - Monthly |

---

**?? Goal:** Cleaner, faster, easier computer maintenance!

**? Enjoy a cleaner PC! ????**

---

*Version 2.0 | Updated: 2025-11-03 | Made with ??*
