# SafeClean v1.0 - Complete User Guide

## ??? The Safest Windows Temp Cleaner

**SafeClean** is a ultra-safe, whitelist-based temporary file cleaner designed with safety as the #1 priority.

---

## ?? Design Philosophy

### Safety First Approach:

1. **Default Dry-Run** - No accidental deletion
2. **Whitelist Only** - Only touches approved temp folders
3. **Age-Based** - Only deletes old files (30+ days default)
4. **Explicit Confirmation** - Must type 'YES' to delete
5. **Recycle Bin Default** - Files recoverable by default
6. **Never System Files** - Skips system/hidden/locked files

---

## ?? Quick Start

### 1. Analyze Only (Safe Preview)
```cmd
SafeClean.bat
```
**Result:** Lists files that would be deleted, calculates space, but **DOESN'T DELETE ANYTHING**.

### 2. Actually Clean
```cmd
SafeClean.bat --clean
```
**Result:** Shows preview, asks for confirmation, then deletes (sends to Recycle Bin).

### 3. Clean Older Files
```cmd
SafeClean.bat --clean --days 60
```
**Result:** Only deletes files older than 60 days.

---

## ?? Complete Command Reference

### Basic Commands

| Command | Description |
|---------|-------------|
| `SafeClean.bat` | Analyze mode (no deletion) |
| `SafeClean.bat --help` | Show help |
| `SafeClean.bat --analyze` | Explicit analyze mode |
| `SafeClean.bat --clean` | Clean mode (with confirmation) |

### Advanced Options

| Option | Values | Default | Description |
|--------|--------|---------|-------------|
| `--days N` | Number | 30 | Only process files older than N days |
| `--recycle` | on/off | on | Send to Recycle Bin (on) or permanent delete (off) |
| `--yes` | - | - | Auto-confirm (no prompt) |
| `--empty-recycle-bin` | - | - | Empty Recycle Bin after cleanup |
| `--log "path"` | Path | - | Save detailed log to file |
| `--paths "A;B;C"` | Paths | Auto | Custom whitelist paths (semicolon-separated) |

---

## ?? Default Whitelist Paths

SafeClean ONLY operates on these safe temp folders:

### Without Admin Rights:
- `%TEMP%` (usually `C:\Users\YourName\AppData\Local\Temp`)
- `%LOCALAPPDATA%\Temp` (same as above)

### With Admin Rights:
- `%TEMP%`
- `%LOCALAPPDATA%\Temp`
- `C:\Windows\Temp` ?? (only with admin)

### Custom Paths:
```cmd
SafeClean.bat --paths "C:\MyTemp;D:\OldCache;E:\TempFiles"
```

---

## ?? What SafeClean NEVER Touches

### Absolutely Protected:

? **User Data:**
- Documents folder
- Pictures, Videos, Music
- Desktop files
- Downloads (unless in custom paths)

? **System Critical:**
- `C:\Windows\` (except Temp folder)
- `C:\Program Files\`
- `C:\Program Files (x86)\`
- `C:\ProgramData\`
- Registry
- Drivers
- System32

? **Special Files:**
- `Prefetch` files
- `pagefile.sys`
- `hiberfil.sys`
- System Restore points
- Windows Update cache
- Event logs

? **In-Use Files:**
- Locked files (open by applications)
- System files
- Hidden files (automatically skipped)

---

## ?? Usage Examples

### Example 1: First Time User (Safe Preview)
```cmd
SafeClean.bat
```

**Output:**
```
================================================================
  SafeClean v1.0 - Ultra Safe Temp File Cleaner
================================================================

  Configuration:
  - Mode:           ANALYZE (DRY-RUN: No files will be deleted)
  - File Age:       Files older than 30 days
  - Recycle Bin:    on (send to Recycle Bin if on)
  
  Whitelist Paths (ONLY these will be scanned):
    [OK] C:\Users\John\AppData\Local\Temp
    [OK] C:\Windows\Temp

================================================================

[*] Starting scan...

Scanning for files older than 30 days...
Cutoff date: 2024-10-04 07:00:00

[SCAN] Scanning: C:\Users\John\AppData\Local\Temp
  [DRY] C:\Users\John\AppData\Local\Temp\oldfile.tmp (2.5 MB, 45 days old)
  [DRY] C:\Users\John\AppData\Local\Temp\cache.dat (1.2 MB, 60 days old)
  ...

================================================================
  SUMMARY
================================================================
  Total files found:    156
  Total size:           523.45 MB (548,847,632 bytes)
================================================================

================================================================
  DRY-RUN MODE - NO FILES WERE DELETED
================================================================

  To actually delete these files, run:
  SafeClean.bat --clean --days 30

  Files will be sent to Recycle Bin (can be recovered)

================================================================

[SUCCESS] Operation completed successfully.
```

---

### Example 2: Clean with Default Settings
```cmd
SafeClean.bat --clean
```

**Process:**
1. Shows preview (same as analyze)
2. Asks: "Type 'YES' to confirm deletion:"
3. If you type 'YES': deletes files (sends to Recycle Bin)
4. If you type anything else: cancels, no deletion

---

### Example 3: Aggressive Cleanup (90+ days old)
```cmd
SafeClean.bat --clean --days 90
```

**Result:** Only deletes files older than 3 months (very safe).

---

### Example 4: Permanent Deletion (No Recycle Bin)
```cmd
SafeClean.bat --clean --recycle off
```

**Warning:** Files will be **permanently deleted** and **cannot be recovered**!

---

### Example 5: Automated Cleanup (Scripts/Tasks)
```cmd
SafeClean.bat --clean --yes --log "C:\Logs\cleanup_%date%.log"
```

**Result:**
- No confirmation prompt (auto-yes)
- Saves detailed log
- Perfect for scheduled tasks

---

### Example 6: Full Cleanup with Recycle Bin Empty
```cmd
SafeClean.bat --clean --empty-recycle-bin
```

**Result:**
- Deletes temp files (sends to Recycle Bin)
- Then empties Recycle Bin
- Maximum space recovery

---

### Example 7: Custom Paths
```cmd
SafeClean.bat --clean --paths "C:\BuildTemp;D:\CacheFolder" --days 7
```

**Result:**
- Ignores default paths
- Only scans specified folders
- Deletes files older than 7 days

---

## ?? Log File Format

### Example Log Output (`--log "cleanup.log"`):

```
SafeClean v1.0 - Session Started: 2024-11-03 07:00:00
Mode: CLEAN
Days: 30
Paths: C:\Users\John\AppData\Local\Temp;C:\Windows\Temp

2024-11-03 07:00:15 [SCAN] Scanning: C:\Users\John\AppData\Local\Temp
2024-11-03 07:00:16 [DEL->BIN] C:\Users\John\AppData\Local\Temp\old.tmp | Size: 2621440 bytes
2024-11-03 07:00:16 [DEL->BIN] C:\Users\John\AppData\Local\Temp\cache.dat | Size: 1258291 bytes
2024-11-03 07:00:17 [ERR] C:\Users\John\AppData\Local\Temp\locked.file | Error: Access denied
2024-11-03 07:00:18 [SKIP] Path not found: C:\NonExistent\Path

2024-11-03 07:00:20 SUMMARY: Files=156, Size=548847632 bytes, Deleted=153, Freed=546589341 bytes, Errors=3

Session Ended: 2024-11-03 07:00:20
Exit Code: 1
```

### Log Entry Types:

| Type | Meaning |
|------|---------|
| `[SCAN]` | Scanning directory |
| `[DRY]` | Dry-run mode: would delete this file |
| `[DEL]` | File permanently deleted |
| `[DEL->BIN]` | File sent to Recycle Bin |
| `[ERR]` | Error accessing/deleting file |
| `[SKIP]` | Skipped (path not found, etc.) |

---

## ?? Exit Codes

SafeClean returns standard exit codes for automation:

| Code | Meaning | Example |
|------|---------|---------|
| `0` | Success, no errors | All files processed successfully |
| `1` | Partial success | Some files skipped (locked/no permission) |
| `2` | Fatal error | Bad parameters, invalid days value |

### Usage in Scripts:
```cmd
SafeClean.bat --clean --yes
if %errorlevel% equ 0 (
    echo Cleanup successful
) else if %errorlevel% equ 1 (
    echo Cleanup completed with some errors
) else (
    echo Cleanup failed
)
```

---

## ? Performance & Limits

### File Processing:
- **Method:** Stream-based (low memory usage)
- **Speed:** ~1000 files/second on SSD
- **Filter:** LastWriteTime comparison only
- **No Size Limit:** Can handle millions of files

### Safety Checks:
- ? Skips reparse points (symlinks/junctions)
- ? Skips locked files (ErrorAction SilentlyContinue)
- ? Skips system/hidden files (automatic)
- ? Continues on error (doesn't stop entire operation)

---

## ?? Security & Permissions

### Administrator Rights:

**Without Admin:**
- Can clean user temp folders only
- `%TEMP%`, `%LOCALAPPDATA%\Temp`

**With Admin:**
- Can also clean `C:\Windows\Temp`
- Can empty system-wide Recycle Bin

### To Run as Admin:
1. Right-click `SafeClean.bat`
2. Select "Run as administrator"
3. Click "Yes" on UAC prompt

---

## ?? Use Cases

### 1. Home Users - Monthly Cleanup
```cmd
SafeClean.bat --clean --days 30
```
**Benefit:** Free up 500MB-2GB safely.

### 2. Power Users - Aggressive Cleanup
```cmd
SafeClean.bat --clean --days 14 --empty-recycle-bin
```
**Benefit:** Maximum space recovery.

### 3. Developers - Clear Build Caches
```cmd
SafeClean.bat --clean --paths "C:\BuildOutput;D:\TempBuild" --days 7
```
**Benefit:** Clean old build artifacts.

### 4. IT Admins - Scheduled Task
```cmd
SafeClean.bat --clean --yes --log "\\Server\Logs\%COMPUTERNAME%.log"
```
**Benefit:** Automated maintenance across fleet.

### 5. Cautious Users - Preview First
```cmd
SafeClean.bat --days 60
```
Then review, then:
```cmd
SafeClean.bat --clean --days 60
```
**Benefit:** Complete control and visibility.

---

## ?? Scheduled Task Setup

### Create Weekly Cleanup Task:

1. Open Task Scheduler
2. Create Basic Task
3. Name: "SafeClean Weekly"
4. Trigger: Weekly, Sunday, 2:00 AM
5. Action: Start a program
   - Program: `C:\Path\To\SafeClean.bat`
   - Arguments: `--clean --yes --days 30 --log "C:\Logs\cleanup.log"`
6. Run with highest privileges (check box)

### One-liner PowerShell:
```powershell
schtasks /create /tn "SafeClean Weekly" /tr "C:\Tools\SafeClean.bat --clean --yes --days 30" /sc weekly /d SUN /st 02:00 /ru SYSTEM
```

---

## ?? Troubleshooting

### Issue: "Access Denied" Errors

**Cause:** File locked by application or no permission.

**Solution:**
1. Close all applications
2. Run as Administrator
3. Increase `--days` value (older files less likely locked)

### Issue: No Files Found

**Cause:** Files not old enough.

**Solution:**
- Check your `--days` setting (default 30)
- Try `--days 7` for more recent files
- Verify paths exist: run with `--analyze` first

### Issue: Recycle Bin Full

**Cause:** Many files sent to Recycle Bin.

**Solution:**
- Use `--empty-recycle-bin` flag
- Or manually empty Recycle Bin after

### Issue: "Bad Parameters" Error (Exit Code 2)

**Cause:** Invalid command-line arguments.

**Solution:**
- Check `--days` is a number
- Check `--recycle` is "on" or "off"
- Check `--paths` uses semicolons (`;`)

---

## ?? SafeClean vs Other Tools

| Feature | SafeClean | CCleaner | Disk Cleanup | Manual Delete |
|---------|-----------|----------|--------------|---------------|
| **Default Safe** | ? Dry-run | ? | ? | ? |
| **Whitelist-based** | ? | ? | ? | ? |
| **Age Filter** | ? Configurable | ? | ? | Manual |
| **Recycle Bin** | ? Default | ? | ? | ? |
| **Detailed Log** | ? | ? | ? | ? |
| **CLI Automation** | ? Full | Limited | Limited | ? |
| **Free** | ? | Freemium | ? | ? |
| **Open Source** | ? | ? | ? | ? |
| **Single File** | ? | ? | ? | ? |
| **No Install** | ? | ? | ? | ? |

---

## ?? Technical Details

### PowerShell Helper Script:

SafeClean uses a hybrid approach:
- **CMD Wrapper:** Parameter parsing, user interaction
- **PowerShell Engine:** File processing, age filtering

### File Age Calculation:
```powershell
$cutoffDate = (Get-Date).AddDays(-$Days)
$files = Get-ChildItem -File -Recurse | 
         Where-Object { $_.LastWriteTime -lt $cutoffDate }
```

### Recycle Bin Method:
```powershell
[Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile(
    $file.FullName, 
    'OnlyErrorDialogs', 
    'SendToRecycleBin'
)
```

### Safety Filters:
```powershell
Where-Object { 
    -not $_.Attributes.ToString().Contains('ReparsePoint') -and
    $_.LastWriteTime -lt $cutoffDate
}
```

---

## ?? License & Credits

**License:** MIT License - Free and Open Source

**Author:** SafeClean Development Team

**Version:** 1.0

**Year:** 2024

---

## ?? Contributing

Found a bug or want to improve SafeClean?

### Report Issues:
- Describe the problem
- Include command used
- Attach log file if available

### Suggest Features:
- Explain use case
- Describe expected behavior

---

## ?? Important Disclaimers

### Read Before Use:

1. **Always Run Analyze First**
   - See what will be deleted before cleaning
   - Review file list carefully

2. **Age Parameter is Critical**
   - Default 30 days is safe for most users
   - Reducing below 7 days not recommended
   - Increasing to 60+ days is safest

3. **Recycle Bin is Your Friend**
   - Keep `--recycle on` (default)
   - Only use `--recycle off` if you're sure
   - Remember Recycle Bin has size limits

4. **Backups**
   - SafeClean is safe, but backups are always good
   - Critical data should be backed up anyway

5. **Custom Paths**
   - Only use `--paths` if you know what you're doing
   - Never point to user data folders
   - Stick with temp folders only

---

## ?? Quick Reference Card

### Everyday Commands:
```cmd
# Preview what would be deleted
SafeClean.bat

# Actually delete (safe: Recycle Bin, 30+ days)
SafeClean.bat --clean

# More aggressive (60+ days)
SafeClean.bat --clean --days 60

# Help
SafeClean.bat --help
```

### Safety Tips:
- ? Always preview first (`--analyze`)
- ? Keep `--recycle on` (default)
- ? Start with high `--days` value (60+)
- ? Review log files
- ? Don't use `--yes` until tested
- ? Don't use `--recycle off` unless necessary
- ? Don't use custom paths unless expert

---

## ?? Learning Path

### Beginner:
1. Run `SafeClean.bat --help`
2. Run `SafeClean.bat` (analyze only)
3. Review output carefully
4. Run `SafeClean.bat --clean` (with confirmation)

### Intermediate:
1. Experiment with `--days` parameter
2. Use `--log` to save reports
3. Try `--empty-recycle-bin`
4. Set up monthly manual runs

### Advanced:
1. Create scheduled tasks
2. Use `--yes` for automation
3. Integrate with monitoring systems
4. Use custom `--paths` for special cases

---

## ?? Best Practices

### Monthly Maintenance:
```cmd
SafeClean.bat --clean --days 30 --log "C:\Maintenance\cleanup_%date%.log"
```

### Pre-Upgrade Cleanup:
```cmd
SafeClean.bat --clean --days 14 --empty-recycle-bin
```

### Safe First-Time Run:
```cmd
SafeClean.bat --days 90
# Review carefully
SafeClean.bat --clean --days 90
```

### Maximum Space Recovery:
```cmd
SafeClean.bat --clean --days 14 --empty-recycle-bin --yes
```
?? Only after testing with analyze mode!

---

**SafeClean v1.0 - Clean Safe, Sleep Sound** ????
