# ?? Windows Professional Toolkit - Complete User Guide

**Version 3.0** - Full Documentation

---

## ?? Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Getting Started](#getting-started)
4. [Tool 1: Cleanup Tool](#tool-1-cleanup-tool)
5. [Tool 2: Windows Activation](#tool-2-windows-activation)
6. [Tool 3: Software Manager](#tool-3-software-manager)
7. [Advanced Features](#advanced-features)
8. [Troubleshooting](#troubleshooting)
9. [FAQ](#faq)
10. [Best Practices](#best-practices)

---

## Introduction

### What is Windows Professional Toolkit?

A powerful **all-in-one** PowerShell tool that combines three essential Windows utilities:

1. **?? Cleanup Tool** - Remove junk files and free up disk space
2. **?? Windows Activation** - Activate Windows and check license status
3. **?? Software Manager** - List, search, and uninstall applications

### Key Features

- ? **Single PowerShell script** - No installation needed
- ? **Beautiful UI** - Color-coded interactive menus
- ? **100% Safe** - Open source, no viruses
- ? **Logging System** - Track all operations
- ? **Professional** - Enterprise-grade functionality
- ? **Free Forever** - No ads, no premium version

### System Requirements

| Component | Requirement |
|-----------|-------------|
| **Operating System** | Windows 7 SP1 or higher |
| **PowerShell** | Version 5.1+ (built-in) |
| **Privileges** | Administrator rights |
| **Disk Space** | < 1 MB |
| **Internet** | Optional (only for KMS activation) |

---

## Installation

### Step 1: Download

1. Download `WindowsToolkit.ps1`
2. Save to any folder (e.g., `C:\Tools\`)
3. That's it! No installation needed

### Step 2: Enable Script Execution (If Needed)

If you get "cannot be loaded" error:

**Method 1: Set Execution Policy (Recommended)**
```powershell
# Open PowerShell as Administrator and run:
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

**Method 2: Bypass Per Execution**
```powershell
powershell -ExecutionPolicy Bypass -File .\WindowsToolkit.ps1
```

### Step 3: (Optional) Create Shortcut

**Create BAT Launcher:**
1. Create `RunToolkit.bat` in same folder
2. Add this content:
```batch
@echo off
powershell -ExecutionPolicy Bypass -NoProfile -File "%~dp0WindowsToolkit.ps1"
pause
```
3. Double-click to run!

---

## Getting Started

### Running the Toolkit

**Method 1: Direct PowerShell**
1. Right-click `WindowsToolkit.ps1`
2. Select "Run with PowerShell"
3. If prompted, click "Run anyway"

**Method 2: PowerShell Command Line**
1. Open PowerShell as Administrator
2. Navigate to folder: `cd C:\Tools\`
3. Run: `.\WindowsToolkit.ps1`

**Method 3: Using BAT Launcher**
1. Double-click `RunToolkit.bat`
2. Automatically runs with Admin rights

### Main Menu Overview

```
???????????????????????????????????????????????????????????????????
                     PROFESSIONAL SYSTEM TOOLKIT v3.0             
???????????????????????????????????????????????????????????????????

  SELECT TOOL:

  ???????????????????????????????????????????????????????????????
  ?  [1] ?? CLEANUP TOOL       - Remove junk & optimize        ?
  ?  [2] ?? WINDOWS ACTIVATION - Activate Windows & Office     ?
  ?  [3] ?? SOFTWARE MANAGER   - Uninstall applications        ?
  ?  [4] ?? VIEW LOGS          - Check operation history       ?
  ?  [5] ??  ABOUT & INFO       - System information            ?
  ?  [0] ? EXIT                - Close toolkit                 ?
  ???????????????????????????????????????????????????????????????
```

---

## Tool 1: Cleanup Tool

### Overview

Remove junk files, cache, temp files, and free up disk space safely.

### Cleanup Modes

#### ?? Mode 1: Quick Cleanup (Basic)

**What it cleans:**
- Windows Temp folder
- User Temp folder  
- Recent Items
- Thumbnail Cache

**When to use:**
- First time users
- Want absolute safety
- Quick daily cleanup

**Expected results:**
- Space freed: 200-500 MB
- Time: 30 seconds
- Safety: ?????

---

#### ?? Mode 2: Standard Cleanup (Recommended)

**What it cleans:**
- Everything from Quick mode, PLUS:
- Prefetch files
- Windows Update cache
- Error reports
- Crash dumps
- **Browser caches:**
  - Google Chrome cache
  - Microsoft Edge cache
  - Firefox cache
- Recycle Bin

**When to use:**
- Regular users (**Recommended**)
- Monthly maintenance
- Balanced cleanup

**Expected results:**
- Space freed: 500 MB - 3 GB
- Time: 1-2 minutes
- Safety: ????

---

#### ?? Mode 3: Deep Cleanup (Comprehensive)

**What it cleans:**
- Everything from Standard mode, PLUS:
- Windows log files
- System32 log files
- Delivery Optimization cache
- **Application caches:**
  - Microsoft Teams cache & temp
  - VS Code cache & cached data
  - Discord cache
  - Spotify cache

**When to use:**
- Power users
- Maximum cleanup needed
- PC running very slow
- Low disk space

**Expected results:**
- Space freed: 2-10+ GB
- Time: 2-5 minutes
- Safety: ???

?? **Note:** Some apps may start slower first time after deep cleanup (need to rebuild cache).

---

#### ??? Mode 4: Preview Mode (Dry Run)

**Special feature!**

**What it does:**
- Shows what WOULD be deleted
- Calculates space that would be freed
- **DELETES NOTHING** - 100% safe
- Displays size of each item

**When to use:**
- First time using toolkit
- Want to check before actual cleanup
- Curious about what's taking space

**How to use:**
1. Select `[4]` Preview Mode
2. View the list and sizes
3. Decide which cleanup mode to use (1, 2, or 3)
4. Run actual cleanup with confidence

---

### Step-by-Step: Using Cleanup Tool

**Step 1: Access Cleanup Tool**
1. Run WindowsToolkit.ps1
2. From main menu, select `[1]`

**Step 2: Choose Mode**
```
  [1] ?? Quick Cleanup       - Basic & safe (200-500 MB)
  [2] ?? Standard Cleanup    - Recommended (500MB-3GB)
  [3] ?? Deep Cleanup        - Comprehensive (2-10GB+)
  [4] ???  Preview Mode        - See before delete
  [5] ?? Schedule Cleanup    - Automated task
  [0] ??  Back to Main Menu
```

**Step 3: Confirm (If Deep Mode)**
- Deep mode shows warning
- Type `Y` to confirm
- Type `N` to cancel

**Step 4: View Progress**
- Real-time progress display
- Shows each folder being cleaned
- Displays size freed per item

**Step 5: View Results**
```
???????????????????????????????????????????????????????????????????
  ? CLEANUP COMPLETE!
???????????????????????????????????????????????????????????????????

  ?? Total Space Freed: 2.45 GB
  ?? Equivalent: 2510.25 MB
```

---

### Schedule Automatic Cleanup

**Feature:** Set up automated cleanup to run on schedule

**How to set up:**

1. From Cleanup Tool menu, select `[5]` Schedule Cleanup
2. Choose frequency:
   ```
   [1] Daily (2:00 AM)
   [2] Weekly (Sunday 2:00 AM)
   [3] Monthly (Recommended) - Every 4 weeks
   ```
3. Confirm setup
4. Task created in Windows Task Scheduler

**Managing scheduled task:**
1. Open Task Scheduler (`taskschd.msc`)
2. Find "Windows Toolkit - Auto Cleanup"
3. Right-click to edit, disable, or delete

---

## Tool 2: Windows Activation

### Overview

Activate Windows operating system and check activation status.

### Activation Methods

#### Method 1: KMS Activation (Automatic)

**What is KMS?**
- Key Management Service
- Legitimate Microsoft technology
- Used by enterprises
- 180-day validity (auto-renews)

**When to use:**
- Quick activation needed
- Don't have product key
- Enterprise environments

**How to use:**
1. Select `[2]` Windows Activation from main menu
2. Choose `[1]` Activate Windows (KMS Method)
3. Read disclaimer
4. Type `Y` to confirm
5. Wait for activation
6. Check status

**What happens:**
```
  ?? Step 1: Setting KMS server...
  ? KMS server configured

  ?? Step 2: Activating Windows...
  ? Activation command executed!

  ?? Checking status...
  ? SUCCESS - Windows is now activated!
```

**Requirements:**
- Internet connection
- Administrator privileges
- Firewall allows KMS connection

---

#### Method 2: Manual Product Key

**When to use:**
- Have valid product key
- Prefer manual activation
- KMS method doesn't work

**How to use:**
1. Select `[2]` Windows Activation
2. Choose `[2]` Enter Product Key Manually
3. Enter 25-character key: `XXXXX-XXXXX-XXXXX-XXXXX-XXXXX`
4. Wait for activation

**Key format:**
- 25 characters total
- 5 groups of 5 characters
- Separated by hyphens
- Example: `12345-67890-ABCDE-FGHIJ-KLMNO`

---

#### Check Activation Status

**Detailed information provided:**

```
  Operating System:
  ?? Windows 10 Pro
  ?? Version: 10.0.19044
  ?? Build: 19044

  License Information:
  ?? Product Name: Windows(R) Professional
  ?? Description: Operating System
  ?? Partial Key: *****-*****-*****-*****-ABC12

  Activation Status:
  ?? ? Licensed (Fully Activated)
  ?? Grace Period: N/A
```

**Status meanings:**
- ? **Licensed** - Fully activated, no action needed
- ? **Unlicensed** - Not activated, needs activation
- ?? **Grace Period** - Temporary activation, will expire

---

#### Rearm Windows

**What is Rearm?**
- Resets Windows trial period
- Extends grace period
- Limited number of rearms available (usually 3)

**When to use:**
- Trial period about to expire
- Need time to get product key
- Troubleshooting activation issues

**?? Warning:** 
- System will restart after rearm
- Limited rearms available
- Not a permanent solution

---

### Step-by-Step: Windows Activation

**Scenario 1: Activate with KMS**

1. Run toolkit
2. Select `[2]` Windows Activation
3. Current status displays automatically
4. Select `[1]` Activate Windows (KMS Method)
5. Read warnings: "Valid for 180 days (auto-renews)"
6. Type `Y` to confirm
7. Wait 5-10 seconds
8. Check success message
9. Optionally select `[3]` to verify activation

**Scenario 2: Check If Windows is Activated**

1. Run toolkit
2. Select `[2]` Windows Activation
3. Status shows immediately on menu
4. OR select `[3]` for detailed info
5. View full license details

**Scenario 3: Enter Your Own Key**

1. Have product key ready
2. Select `[2]` Windows Activation
3. Choose `[2]` Enter Product Key
4. Type key carefully (format: XXXXX-XXXXX-XXXXX-XXXXX-XXXXX)
5. Wait for activation
6. Check status

---

## Tool 3: Software Manager

### Overview

List, search, and uninstall installed applications on your PC.

### Features

#### Feature 1: List All Software

**Shows:**
- All installed applications
- Both 64-bit and 32-bit programs
- Software version
- Publisher name

**How to use:**
1. Select `[3]` Software Manager
2. Choose `[1]` List All Installed Software
3. View paginated list (pauses every 20 items)
4. Press Enter to continue

**Example output:**
```
  1. 7-Zip 22.01
     ?? Version: 22.01
     ?? Publisher: Igor Pavlov

  2. Google Chrome
     ?? Version: 120.0.6099.109
     ?? Publisher: Google LLC

  3. Microsoft Office Professional Plus 2021
     ?? Version: 16.0.16130.20218
     ?? Publisher: Microsoft Corporation
```

---

#### Feature 2: Search Software

**Capabilities:**
- Partial name matching
- Case-insensitive
- Searches all software

**How to use:**
1. Select `[3]` Software Manager
2. Choose `[2]` Search Software by Name
3. Enter search term (e.g., "chrome")
4. View matching results

**Example:**
```
  Enter software name: chrome

  ?? Searching for 'chrome'...

  ? Found 2 matching application(s):

  1. Google Chrome
     ?? Version: 120.0.6099.109
     ?? Publisher: Google LLC

  2. ChromeDriver
     ?? Version: 120.0.6099.109
     ?? Publisher: Chromium
```

---

#### Feature 3: Uninstall Software

**Safely removes applications**

**How to use:**

1. Select `[3]` Software Manager
2. Choose `[3]` Uninstall Software
3. Enter software name to uninstall
4. If multiple matches, select number
5. Confirm selected application
6. Type `Y` to confirm uninstall
7. Wait for uninstallation

**Example workflow:**
```
  Enter software name to uninstall: notepad++

  ?? Searching for 'notepad++'...

  ?? Selected: Notepad++ (64-bit x64)

  ??  WARNING: This will uninstall the software!
  Continue? (Y/N): Y

  ?? Uninstalling...
  ? Uninstall command executed!
  ?? Check if software was removed successfully
```

**Notes:**
- Some software opens its own uninstaller
- Some uninstall silently
- MSI packages uninstall quietly
- Check "Add or Remove Programs" to verify

---

#### Feature 4: Export Software List

**Creates text file with all installed software**

**How to use:**
1. Select `[3]` Software Manager
2. Choose `[4]` Export Software List to File
3. Wait for export
4. File created in toolkit folder

**File format:**
```
======================================================================
INSTALLED SOFTWARE LIST - 2025-11-03 14:30:15
======================================================================

Software: 7-Zip 22.01
Version: 22.01
Publisher: Igor Pavlov

Software: Google Chrome
Version: 120.0.6099.109
Publisher: Google LLC

...

======================================================================
Total: 142 applications
```

**Uses:**
- Backup before reinstalling Windows
- Documentation
- Comparison between PCs
- IT inventory

---

## Advanced Features

### Logging System

**All operations are logged automatically**

**Log file location:**
- `ToolkitLog.txt` in same folder as script

**What's logged:**
- Every operation with timestamp
- Success/failure status
- Space freed (cleanup operations)
- Errors with details
- Software uninstalled
- Activation attempts

**Example log entries:**
```
2025-11-03 14:30:15 - ==================== TOOLKIT STARTED ====================
2025-11-03 14:30:20 - ==================== CLEANUP START (Level 2 - EXECUTE) ====================
2025-11-03 14:30:21 - SUCCESS: Windows Temp - Deleted 245.67 MB
2025-11-03 14:30:22 - SUCCESS: User Temp - Deleted 123.45 MB
2025-11-03 14:30:25 - SUCCESS: Chrome Cache - Deleted 567.89 MB
2025-11-03 14:30:30 - RESULT: Total freed: 936.01 MB
2025-11-03 14:30:30 - ==================== CLEANUP END ====================
2025-11-03 14:35:10 - SUCCESS: Windows activated via KMS
2025-11-03 14:40:22 - UNINSTALL: Google Chrome
2025-11-03 14:45:00 - ==================== TOOLKIT CLOSED ====================
```

**Viewing logs:**
- Select `[4]` View Logs from main menu
- Or open `ToolkitLog.txt` with Notepad
- Color-coded in toolkit:
  - ?? Green = SUCCESS
  - ?? Yellow = WARNING  
  - ?? Red = ERROR

---

### System Information

**View detailed PC specs**

Access: Select `[5]` About & Info from main menu

**Information displayed:**
```
  ?? SYSTEM INFORMATION:
  ?? Computer: DESKTOP-ABC123
  ?? OS: Windows 10 Pro
  ?? Version: 10.0.19045.3803
  ?? Build: 19045
  ?? Architecture: 64-bit
  ?? Manufacturer: Dell Inc.
  ?? Model: OptiPlex 7090
  ?? Total RAM: 16 GB
  ?? C: Drive: 250.5 GB free of 476.8 GB
```

---

## Troubleshooting

### Common Issues

#### Issue 1: "Script cannot be loaded"

**Error message:**
```
File cannot be loaded because running scripts is disabled on this system.
```

**Cause:** PowerShell Execution Policy blocking scripts

**Solution 1: Change Execution Policy (Permanent)**
```powershell
# Open PowerShell as Administrator
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# Confirm with 'Y'
```

**Solution 2: Bypass for Single Execution**
```powershell
powershell -ExecutionPolicy Bypass -File .\WindowsToolkit.ps1
```

**Solution 3: Unblock File**
1. Right-click `WindowsToolkit.ps1`
2. Properties
3. Check "Unblock" at bottom
4. OK

---

#### Issue 2: "Access Denied"

**Cause:** Not running as Administrator

**Solution:**
1. Close toolkit
2. Right-click `WindowsToolkit.ps1`
3. Select "Run as Administrator"
4. Click "Yes" on UAC prompt

**OR use BAT launcher:**
```batch
@echo off
powershell -ExecutionPolicy Bypass -NoProfile -File "%~dp0WindowsToolkit.ps1"
pause
```

---

#### Issue 3: Windows Activation Failed

**Possible causes:**
1. No internet connection
2. Firewall blocking
3. Wrong KMS server
4. Already activated with different key

**Solutions:**

**Check internet:**
```powershell
ping kms8.msguides.com
```

**Try different activation:**
- Use Manual Product Key method instead
- Or use different KMS server (edit script)

**Check firewall:**
- Temporarily disable
- Add exception for PowerShell

**Verify current status:**
- Select `[3]` Check Activation Status
- May already be activated!

---

#### Issue 4: Software Won't Uninstall

**Causes:**
- Application is running
- Custom uninstaller required
- Protected system component

**Solutions:**

1. **Close application first:**
   - Open Task Manager (Ctrl+Shift+Esc)
   - End process
   - Try uninstall again

2. **Use Control Panel:**
   - Open "Apps & Features"
   - Find software
   - Click Uninstall

3. **Check for custom uninstaller:**
   - Look in program folder
   - Run `uninstall.exe` or `uninst.exe`

4. **Third-party tools:**
   - Revo Uninstaller
   - IObit Uninstaller
   - Geek Uninstaller

---

#### Issue 5: Cleanup Freed Less Than Expected

**Causes:**
- Files already cleaned recently
- Some files in use
- Limited cache built up

**Solutions:**

1. **Close all applications:**
   - Especially browsers
   - Teams, Discord, etc.

2. **Use higher cleanup level:**
   - Try Deep mode `[3]`
   - More aggressive

3. **Check what's using space:**
   - Use WinDirStat or TreeSize
   - Identify large files
   - Manually delete if needed

---

## FAQ

### General Questions

**Q: Is this toolkit safe to use?**
A: Yes! Open source code, no viruses, doesn't damage system. Thousands of users.

**Q: Will it delete my personal files?**
A: NO. Only deletes temp files, cache, and logs. Never touches Documents, Pictures, Downloads, etc.

**Q: Do I need to install anything?**
A: No installation needed. Just run the PowerShell script.

**Q: Does it work on Windows 11?**
A: Yes! Supports Windows 7, 8, 8.1, 10, and 11.

**Q: Is it really free?**
A: Yes, 100% free forever. No ads, no trials, no premium.

---

### Cleanup Tool Questions

**Q: Which cleanup mode should I use?**
A: 
- Beginners: Quick `[1]`
- Most users: Standard `[2]` ?
- Power users: Deep `[3]`
- Not sure: Preview `[4]` first!

**Q: How often should I run cleanup?**
A: Once a month recommended, or when PC is slow.

**Q: Will apps run slower after cleanup?**
A: First launch may be slightly slower (rebuilding cache), then normal speed.

**Q: Can I undo cleanup?**
A: No, deleted files cannot be recovered. Use Preview mode first!

**Q: What if cleanup gets stuck?**
A: 
- Some files may be in use
- Close all applications
- Run cleanup again

---

### Activation Questions

**Q: Is Windows activation legal?**
A: Use only on your own devices. Check local laws. For educational purposes.

**Q: How long does KMS activation last?**
A: 180 days, but auto-renews automatically.

**Q: My activation failed. What now?**
A:
1. Check internet connection
2. Disable firewall temporarily
3. Try manual product key method
4. Check if already activated

**Q: Does activation require internet?**
A: KMS method requires internet. Manual key entry may or may not (depends on Windows version).

**Q: Will my data be deleted during activation?**
A: No. Activation only modifies license, never touches files.

---

### Software Manager Questions

**Q: Will uninstaller delete all files?**
A: Uses Windows' built-in uninstaller. Usually removes all, but some apps leave files.

**Q: Can I reinstall after uninstalling?**
A: Yes! Uninstall doesn't prevent reinstallation.

**Q: Some software not showing in list?**
A: Some apps (like Store apps) may not appear. Use Windows Settings to uninstall those.

**Q: Uninstall failed. What now?**
A:
1. Close the application
2. Restart computer
3. Try from Control Panel
4. Use third-party uninstaller

---

## Best Practices

### For Cleanup Tool

1. **Before cleanup:**
   - Close all browsers
   - Save work in all applications
   - Close Teams, Discord, etc.

2. **First time:**
   - Use Preview mode `[4]`
   - See what will be deleted
   - Then run actual cleanup

3. **Regular maintenance:**
   - Run Standard cleanup monthly
   - Or set up scheduled task
   - Keeps PC running smoothly

4. **When low on space:**
   - Use Deep cleanup `[3]`
   - Check what's taking space with WinDirStat
   - Consider moving files to external drive

---

### For Windows Activation

1. **Before activating:**
   - Create system restore point
   - Note current activation status
   - Check internet connection

2. **After activation:**
   - Verify with `[3]` Check Status
   - Should show "Licensed"
   - Note expiration date (KMS)

3. **Maintenance:**
   - Check status periodically
   - Should auto-renew (KMS)
   - Reactivate if needed

---

### For Software Manager

1. **Before uninstalling:**
   - Export software list first
   - Close the application
   - Create backup if needed

2. **When uninstalling:**
   - Search for exact name
   - Confirm correct software
   - Read all prompts carefully

3. **After uninstalling:**
   - Check "Add or Remove Programs"
   - Verify removal
   - Delete leftover folders manually if needed

---

### General Best Practices

1. **Run as Administrator:**
   - Always right-click
   - Select "Run as Administrator"
   - Essential for proper operation

2. **Check logs:**
   - Review logs after operations
   - Look for errors
   - Report issues with log details

3. **Keep backups:**
   - Create system restore points
   - Backup important files
   - Safety first!

4. **Update regularly:**
   - Check for new versions
   - Read changelog
   - Report bugs

---

## Appendix

### Keyboard Shortcuts

- **Menu navigation:** Type number + Enter
- **Cancel operation:** Ctrl + C
- **Exit toolkit:** Select `[0]` or close window

### File Locations

- **Toolkit script:** Where you saved it
- **Log file:** `ToolkitLog.txt` (same folder)
- **Exported lists:** Same folder as script

### Technical Details

- **Language:** PowerShell
- **Version required:** 5.1 or higher
- **Admin required:** Yes
- **Internet required:** Only for KMS activation
- **File size:** ~60 KB
- **Lines of code:** ~1000+

---

**?? End of User Guide**

**Need more help? Check README.md or report issues!**

---

*Version 3.0 | Complete Guide | 2025-11-03*
