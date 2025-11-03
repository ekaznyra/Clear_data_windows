# ?? WINDOWS CLEANUP AUTOMATION TOOL

**Version 2.0** - Professional Windows cleanup tool with comprehensive features

Safely clean junk files, cache, temporary data and optimize Windows with an interactive menu interface.

---

## ?? TABLE OF CONTENTS

- [? What's New in v2.0](#-whats-new-in-v20)
- [Introduction](#-introduction)
- [How to Use](#-how-to-use)
- [File Details](#-file-details)
- [Cleanup Modes](#-cleanup-modes)
- [Advanced Features](#-advanced-features)
- [Safety Information](#?-safety-information)
- [Cleaned Directories](#?-cleaned-directories)
- [FAQ](#-frequently-asked-questions-faq)

---

## ? WHAT'S NEW IN V2.0

### ?? Major Upgrades:

#### 1. **Interactive Menu Interface**
   - Beautiful color-coded interface
   - Multiple flexible cleanup modes
   - User-friendly and intuitive

#### 2. **3 Cleanup Modes**
   - ?? **Quick** - Safest, basic temp files only
   - ?? **Standard** - Recommended, balanced safety and effectiveness
   - ?? **Deep** - Comprehensive, maximum cleanup (includes app caches, logs...)

#### 3. **Preview Mode (Dry Run)**
   - See what will be deleted before deletion
   - Display size of each item
   - **NOTHING gets deleted** - just preview!

#### 4. **Detailed Logging System**
   - Automatically logs cleanup history
   - Track what was deleted
   - View logs via menu option

#### 5. **Scheduled Task Creator**
   - Automatically cleanup on schedule
   - Choose: Daily / Weekly / Monthly
   - Runs in background, no manual intervention

#### 6. **Smart Size Display**
   - Automatically converts KB/MB/GB
   - Detailed report for each item
   - Overall summary after completion

#### 7. **Application Cache Cleanup**
   - Microsoft Teams
   - Discord
   - Spotify
   - VS Code
   - And many more applications

#### 8. **English Interface**
   - No encoding issues
   - Clean, professional display
   - Universal compatibility

---

## ?? INTRODUCTION

This tool helps you:
- ? **Automatically clean** junk files, cache, temp files
- ? **100% safe** - No viruses, doesn't delete important system files
- ? **Open source** - You can view and verify all code
- ? **Free** - No need for third-party software
- ? **Free up large space** - Usually 500MB to 10GB+
- ? **Interactive menu** - Easy to use, user-friendly
- ? **Multiple modes** - Flexible based on your needs

---

## ?? HOW TO USE

### ?? METHOD 1: Using CleanupTool.bat (RECOMMENDED)

**Step 1:** Download all files to same folder

**Step 2:** Double-click `CleanupTool.bat`

**Step 3:** Allow Administrator privileges when prompted

**Step 4:** Select mode from menu:

```
=============================================================
        WINDOWS CLEANUP AUTOMATION TOOL v2.0
=============================================================

Select cleanup mode:

  [1] Quick Cleanup (Basic - Safe)
  [2] Standard Cleanup (Recommended)
  [3] Deep Cleanup (Comprehensive)
  [4] Preview Mode (Dry Run - No Deletion)
  [5] Create Scheduled Task
  [6] View Cleanup History
  [0] Exit
```

---

### ? METHOD 2: Using QuickClean.bat (Fast)

**For:** Users who want quick cleanup without menus

1. Right-click `QuickClean.bat`
2. Select **"Run as administrator"**
3. Wait a few seconds

---

### ?? METHOD 3: Run PowerShell Directly (Advanced)

```powershell
# Step 1: Open PowerShell as Administrator
# (Win + X -> Windows PowerShell (Admin))

# Step 2: Navigate to folder
cd "C:\path\to\folder"

# Step 3: Run script
.\CleanupTool.ps1
```

**If you get execution policy error:**
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\CleanupTool.ps1
```

---

## ?? FILE DETAILS

| File | Size | Description | When to Use |
|------|------|-------------|-------------|
| **CleanupTool.ps1** | ~15KB | Main PowerShell script, full v2.0 features | Want interactive menu, multiple options |
| **CleanupTool.bat** | ~2KB | Launcher that auto-requests Admin rights | Daily use (RECOMMENDED) |
| **QuickClean.bat** | ~5KB | Pure CMD script, fast without menu | Old PC, want quick cleanup |
| **USER_GUIDE.md** | ~20KB | Detailed instructions (this file) | Read instructions |
| **README.md** | ~3KB | Quick introduction | Quick reference |
| **CleanupLog.txt** | Auto | Log file (auto-created after first run) | View history |

---

## ?? CLEANUP MODES

### ?? MODE 1: QUICK CLEANUP (Basic)

**For:** New users, want absolute safety

**Cleans:**
- Windows Temp
- User Temp
- Recent Items
- Thumbnail Cache

**Time:** ~30 seconds  
**Average Space:** 200-500 MB  
**Safety:** ????? (5/5)

---

### ?? MODE 2: STANDARD CLEANUP (Recommended)

**For:** Most users

**Additionally cleans:**
- Prefetch Files
- Windows Update Cache
- Error Reports
- Crash Dumps
- Browser Caches (Chrome, Edge, Firefox)
- Recycle Bin

**Time:** ~1-2 minutes  
**Average Space:** 500 MB - 3 GB  
**Safety:** ???? (4/5)

---

### ?? MODE 3: DEEP CLEANUP (Comprehensive)

**For:** Power users, when thorough cleanup needed

**Additionally cleans:**
- Windows Logs
- System32 Logs
- Delivery Optimization
- Microsoft Teams Cache
- Discord Cache
- VS Code Cache
- Spotify Cache
- And many other applications...

**Time:** ~2-5 minutes  
**Average Space:** 2 GB - 10+ GB  
**Safety:** ??? (3/5)

?? **Note:** Some apps may start slower first time after cleanup (need to recreate cache)

---

### ??? MODE 4: PREVIEW (Dry Run)

**Special Feature!**

- See what will be deleted
- Display size of each item
- **DELETES NOTHING**
- Use to check before actual cleanup

**How to use:**
1. Select option [4] in menu
2. View list and sizes
3. Decide which mode to use (1, 2, or 3)

---

## ?? ADVANCED FEATURES

### ?? CREATE SCHEDULED TASK

**Step 1:** Select option [5] in menu

**Step 2:** Choose frequency:
- `[1]` Daily (2:00 AM)
- `[2]` Weekly (Sunday 2:00 AM)
- `[3]` Monthly (Every 4 weeks) - **Recommended**

**Step 3:** Done! Task will run automatically

**Manage Task:**
- Open Task Scheduler (search in Start Menu)
- Find task named "Windows Cleanup Tool"
- Can disable/delete/edit as needed

---

### ?? VIEW CLEANUP HISTORY

**Purpose:** Track cleanup history

**How to view:**
- Select option [6] in menu
- Or open `CleanupLog.txt` with Notepad

**Log information:**
- Execution time
- Cleanup mode
- Deleted folders
- Space freed
- Errors (if any)

**Example log:**
```
2025-11-03 14:30:15 - ==================== START CLEANUP SESSION (Level 2 - EXECUTE) ====================
2025-11-03 14:30:16 - SUCCESS: Windows Temp - Deleted 245.67 MB
2025-11-03 14:30:17 - SUCCESS: User Temp - Deleted 123.45 MB
2025-11-03 14:30:20 - SUCCESS: Chrome Cache - Deleted 567.89 MB
2025-11-03 14:30:25 - RESULT: Total freed: 1.23 GB
```

---

### ?? BACKUP (Optional)

**Default:** OFF (to save disk space)

**Enable backup:**
1. Open `CleanupTool.ps1` with Notepad
2. Find line: `$BackupEnabled = $false`
3. Change to: `$BackupEnabled = $true`
4. Save file

**When backup is enabled:**
- Creates backup folder before deletion
- Saved at: `Backup_YYYYMMDD_HHMMSS`
- Can restore if needed

?? **Note:** Backup will consume disk space!

---

## ?? SAFETY INFORMATION

### ? SAFE

- ? This script **DOES NOT** contain viruses or malware
- ? **DOES NOT** delete personal files (photos, videos, documents)
- ? **DOES NOT** delete installed software
- ? **DOES NOT** damage Windows
- ? **DOES NOT** send data anywhere (100% offline)
- ? Only deletes temporary files, cache, junk
- ? Open source - All code visible

### ?? RECOMMENDATIONS

- ?? **Close all browsers** before running
- ?? **Save your work** in all applications
- ?? Run **once a month** or when PC is slow
- ?? First time: Select mode [4] Preview to check
- ?? New users: Use mode [1] or [2]

### ??? CREATE SYSTEM RESTORE POINT (OPTIONAL)

**If you're worried:**

1. Press `Win + R`
2. Type: `SystemPropertiesProtection`
3. Enter
4. Click "Create"
5. Name it (e.g., "Before Cleanup")
6. OK

**Restore if needed:**
1. `Win + R` -> `rstrui.exe`
2. Select the restore point you created
3. Next -> Finish

---

## ??? CLEANED DIRECTORIES

### ?? Basic (Level 1)

| Directory | Description | Safe | Avg Size |
|-----------|-------------|------|----------|
| `C:\Windows\Temp` | Windows temporary files | ? | 50-200 MB |
| `%TEMP%` | User temporary files | ? | 100-500 MB |
| `Recent Items` | Recently opened files list | ? | < 10 MB |
| `Thumbnail Cache` | Image thumbnail cache | ? | 50-200 MB |

### ?? Standard (Level 2)

| Directory | Description | Safe | Avg Size |
|-----------|-------------|------|----------|
| `Prefetch` | Prefetch files | ? | 50-100 MB |
| `Windows Update Cache` | Update cache | ? | 200 MB - 2 GB |
| `Error Reports` | Error reports | ? | 10-100 MB |
| `Crash Dumps` | Crash dump files | ? | 0-500 MB |
| **Chrome Cache** | Chrome cache | ? | 100 MB - 1 GB |
| **Edge Cache** | Edge cache | ? | 100 MB - 1 GB |
| **Firefox Cache** | Firefox cache | ? | 100 MB - 1 GB |
| `Recycle Bin` | Recycle bin | ? | Varies |

### ?? Deep (Level 3)

| Directory | Description | Safe | Avg Size |
|-----------|-------------|------|----------|
| `Windows Logs` | Windows log files | ?? | 50-500 MB |
| `System32 Logs` | System logs | ?? | 50-200 MB |
| `Delivery Optimization` | P2P update cache | ? | 500 MB - 5 GB |
| **Teams Cache** | Microsoft Teams | ? | 100 MB - 1 GB |
| **Discord Cache** | Discord app | ? | 100 MB - 2 GB |
| **VS Code Cache** | Visual Studio Code | ? | 50-500 MB |
| **Spotify Cache** | Spotify app | ? | 500 MB - 5 GB |

---

## ?? TIPS AND TRICKS

### ?? Create Quick Shortcut

**Step 1:** Create shortcut
1. Right-click `CleanupTool.bat`
2. Send to -> Desktop (create shortcut)

**Step 2:** Enable auto Admin rights
1. Right-click shortcut
2. Properties -> Shortcut tab
3. Advanced -> Check "Run as administrator"
4. OK -> Apply -> OK

**Step 3:** Change icon (optional)
1. Properties -> Change Icon
2. Select preferred icon
3. OK

Now just **double click** to run!

---

### ?? Create Keyboard Shortcut

**Step 1:** Create shortcut as above

**Step 2:** Set hotkey
1. Right-click shortcut -> Properties
2. "Shortcut" tab
3. "Shortcut key": Press `Ctrl + Alt + C` (or other combination)
4. OK

**Use:** Press `Ctrl + Alt + C` from anywhere!

---

### ?? Check Scheduled Task

**Method 1: Via Task Scheduler**
```
1. Win + R -> taskschd.msc
2. Find "Windows Cleanup Tool"
3. Right-click -> Properties
4. View/edit schedule
```

**Method 2: Via PowerShell**
```powershell
Get-ScheduledTask | Where-Object {$_.TaskName -like "*Cleanup*"}
```

---

### ?? View Code Before Running

**PowerShell Script:**
```
Right-click CleanupTool.ps1 -> Edit
```

**Batch Script:**
```
Right-click QuickClean.bat -> Edit
```

You'll see all code, nothing hidden!

---

## ?? TROUBLESHOOTING

### ? Error: "Script cannot be loaded"

**Cause:** PowerShell Execution Policy

**Solution 1:** (Recommended)
```powershell
# Run in PowerShell Admin
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

**Solution 2:** (Temporary)
```powershell
powershell -ExecutionPolicy Bypass -File .\CleanupTool.ps1
```

---

### ? Error: "Access Denied"

**Cause:** No Administrator privileges

**Solution:**
1. Right-click `.bat` file
2. Select "Run as administrator"
3. Allow when UAC prompts

---

### ? Error: "File not found"

**Cause:** `.ps1` and `.bat` not in same folder

**Solution:**
- Ensure both files in same folder

---

### ? Some files cannot be deleted

**Cause:** Files in use

**Solution:**
1. Close all browsers
2. Close applications (Teams, Discord...)
3. Run script again

**Or:**
- Restart computer -> Run script immediately

---

## ?? EXPECTED RESULTS

### ?? Space Freed

| PC Condition | Mode 1 | Mode 2 | Mode 3 |
|--------------|--------|--------|--------|
| **New** (< 1 month) | 100-300 MB | 300-800 MB | 0.5-1.5 GB |
| **Regular** (1-3 months) | 300-600 MB | 0.8-2 GB | 1.5-5 GB |
| **Old** (> 6 months) | 0.5-1 GB | 2-5 GB | 5-15+ GB |

### ?? Execution Time

| Mode | Average Time |
|------|-------------|
| Mode 1 | 30 seconds - 1 minute |
| Mode 2 | 1 - 3 minutes |
| Mode 3 | 2 - 5 minutes |
| Preview | 1 - 2 minutes |

---

## ? FREQUENTLY ASKED QUESTIONS (FAQ)

### Q1: Is this script safe?
**A:** Yes, completely safe. Open source, all code visible. No viruses, doesn't delete important files.

---

### Q2: Will personal files be deleted?
**A:** NO. Script only deletes:
- Temp files
- Browser/app cache
- Log files
- Recycle Bin
- DOES NOT touch Documents, Pictures, Downloads, Desktop...

---

### Q3: Which mode should I use?
**A:** 
- **New users:** Mode 1 or 2
- **Regular users:** Mode 2 (recommended)
- **Power users:** Mode 3
- **Not sure:** Mode 4 (Preview) first

---

### Q4: How often should I run this?
**A:**
- **Minimum:** Once a month
- **Recommended:** Every 2 weeks
- **Maximum:** Once a week
- **Or:** When PC is slow, disk is full

---

### Q5: Does it require Internet?
**A:** NO. Script runs 100% offline.

---

### Q6: Why does it need Administrator rights?
**A:** To delete files in:
- `C:\Windows\Temp`
- `C:\Windows\Prefetch`
- Other system folders

---

### Q7: Apps run slower after cleanup?
**A:** Normal! First time opening apps after clearing cache, may be slightly slower (need to recreate cache). Second time onwards will be fast again.

---

### Q8: Does script send data anywhere?
**A:** NO! 100% runs locally, no Internet connection, no data sent.

---

### Q9: How do I know when script ran?
**A:** 
- View log: Select option [6] in menu
- Or open `CleanupLog.txt`

---

### Q10: Can I cancel scheduled task?
**A:** Yes!
```
1. Win + R -> taskschd.msc
2. Find "Windows Cleanup Tool"
3. Right-click -> Delete
```

---

### Q11: Is Mode 3 dangerous?
**A:** NOT dangerous, but:
- Deletes more
- Some apps may start slower first time
- Recommended for experienced users

---

### Q12: Is backup necessary?
**A:** NOT necessary because:
- Only deletes junk, not important files
- Backup consumes space
- Disabled by default
- Enable only if you want extra caution

---

### Q13: Does it support Windows 7?
**A:** Yes! Supports:
- Windows 7 ?
- Windows 8/8.1 ?
- Windows 10 ?
- Windows 11 ?

---

### Q14: Does log file consume space?
**A:** Very little! Log file only ~100-500 KB. Can delete anytime.

---

### Q15: Compare to CCleaner?
**A:** 
- **Similar:** Both clean junk files
- **Different:** 
  - This tool: Free, open source, lighter
  - CCleaner: More features, has GUI

---

## ?? SUPPORT

### If you have issues:

1. **Read FAQ** above
2. **Read "Troubleshooting"** section
3. **View log** to see specific errors
4. **View code** to understand what script does
5. **Run Preview mode** first

### Report bugs:

If you find bugs, please:
- Note error information
- Take screenshots
- Check log file
- Report to developer

---

## ?? CHANGELOG

### Version 2.0 (2025-11-03)
- ? Added interactive menu
- ? 3 flexible cleanup modes
- ? Preview mode (Dry run)
- ? Detailed logging system
- ? Scheduled task creator
- ? Smart size display
- ? App cache cleanup (Teams, Discord, VS Code...)
- ? English interface
- ?? Fixed encoding issues
- ?? Better interface with colors

### Version 1.0 (2025-11-02)
- ?? First release
- ? Basic cleanup
- ? PowerShell + Batch scripts

---

## ?? LICENSE

- ? Free for personal use
- ? Can modify as you wish
- ? Can share with others
- ? Do not resell or commercialize
- ? Use at your own responsibility

---

## ?? CONCLUSION

### ? Thank you for using this tool!

**Our goals:**
- ?? Help your computer run faster
- ?? Free up disk space
- ?? Easy to use, no technical knowledge required
- ?? Safe, transparent, open source

**If you find it useful:**
- ? Share with friends
- ? Provide feedback for improvement
- ? Report bugs if found

**Wishing you a cleaner, faster, more efficient computer! ?????**

---

*Version: 2.0 | Updated: 2025-11-03 | Made with ??*
