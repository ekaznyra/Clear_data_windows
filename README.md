# CleanMaster v2.0 ??

**Ultra Safe Windows Junk Cleaner - Auto Admin | Dry-Run Default | 30+ Days Filter**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows%2010%2F11-blue)](https://www.microsoft.com/windows)
[![Language](https://img.shields.io/badge/Language-CMD%2FPowerShell-green)](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)

---

## ?? Overview

**CleanMaster** is a single-file, ultra-safe Windows cleaning tool that automatically removes old temporary files and caches without touching your important data or system files.

### Why CleanMaster?

- ? **100% Safe** - Only touches whitelisted temp folders
- ? **Auto Admin** - Automatically requests elevation when needed
- ? **Dry-Run Default** - Preview before deletion (no accidents)
- ? **Age-Based** - Only deletes files older than 30 days (customizable)
- ? **Recoverable** - Sends files to Recycle Bin (not permanent deletion)
- ? **No Installation** - Single .cmd file, runs immediately
- ? **Detailed Logging** - Full audit trail of all operations
- ? **Windows 10/11** - Tested and working

---

## ?? Quick Start

### 1. Download
Download `CleanMaster.cmd` from this repository.

### 2. Preview (Safe, No Deletion)
Double-click `CleanMaster.cmd` or run:
```cmd
CleanMaster.cmd
```

**Result:** Shows what would be deleted, but **doesn't delete anything**.

### 3. Actually Clean
```cmd
CleanMaster.cmd --clean
```

**Result:** Shows preview, asks for confirmation, then deletes to Recycle Bin.

---

## ?? Features

### Core Features
- **Auto Admin Request** - Elevates privileges automatically via UAC
- **Dry-Run Default** - `--dry` mode by default (safe preview)
- **30-Day Filter** - Only processes files older than 30 days
- **Recycle Bin** - Files sent to Recycle Bin (recoverable)
- **Whitelist-Based** - Only scans approved safe locations
- **Detailed Logs** - Timestamps, file paths, sizes, operations
- **Error Handling** - Continues on error, logs everything
- **No System Impact** - Never touches Registry, system files, or drivers

### What Gets Cleaned

| Category | Location | Description |
|----------|----------|-------------|
| User Temp | `%TEMP%` | Temporary files from applications |
| Local Temp | `%LOCALAPPDATA%\Temp` | Local application temp files |
| Windows Temp | `C:\Windows\Temp` | System temporary files (admin only) |
| Browser Caches | Chrome, Edge, Firefox | Browser cache and code cache |
| Thumbnails | Explorer cache | Windows thumbnail cache |
| Error Reports | WER | Windows Error Reporting archives |
| Crash Dumps | `%LOCALAPPDATA%\CrashDumps` | Application crash dumps |
| Log Files | `*.log` in temp | Old temporary log files |
| IE Cache | INetCache | Internet Explorer cache |
| Old Caches | WebCache.old | Old web cache data |
| Recycle Bin | - | Emptied after cleanup (clean mode only) |

### What's NEVER Touched

? **User Data:**
- Documents, Pictures, Videos, Music
- Desktop files, Downloads
- User profile data

? **System Critical:**
- `C:\Windows\` (except Temp folder)
- `C:\Program Files\`
- `C:\Program Files (x86)\`
- `C:\ProgramData\`
- Registry
- Drivers
- System32

? **Special Files:**
- Prefetch files
- pagefile.sys
- hiberfil.sys
- System Restore points
- Windows Update cache (`SoftwareDistribution`)
- Event logs

---

## ?? Usage

### Command Syntax
```cmd
CleanMaster.cmd [OPTIONS]
```

### Available Options

| Option | Description | Default |
|--------|-------------|---------|
| `--dry` | Dry-run mode (preview only, no deletion) | ? Default |
| `--clean` | Actually delete files (with confirmation) | - |
| `--days N` | Only process files older than N days | 30 |
| `--log "path"` | Custom log file location | Auto-generated |
| `--yes` | Auto-confirm (skip prompts) | - |
| `--help`, `-h` | Show help message | - |

### Examples

#### Example 1: Safe Preview (Default)
```cmd
CleanMaster.cmd
```
**Output:**
```
[SCAN] User TEMP...
  [DRY] oldfile.tmp (2.5 MB, 45 days old)
  [DRY] cache.dat (1.2 MB, 60 days old)
  Found: 156 files (523.45 MB)

SUMMARY:
  Files Processed:     156
  Total Size Found:    523.45 MB
  Mode:                DRY-RUN (no files deleted)
```

#### Example 2: Clean with Confirmation
```cmd
CleanMaster.cmd --clean
```
Shows preview ? Asks "Type 'YES' to confirm" ? Deletes to Recycle Bin

#### Example 3: Aggressive Cleanup (60+ Days)
```cmd
CleanMaster.cmd --clean --days 60
```
Only deletes files older than 60 days (very safe).

#### Example 4: Automated (No Prompts)
```cmd
CleanMaster.cmd --clean --yes
```
Perfect for scheduled tasks - no user interaction required.

#### Example 5: Custom Log Location
```cmd
CleanMaster.cmd --clean --log "C:\Logs\cleanup_%DATE%.log"
```

---

## ?? Expected Results

Based on typical Windows systems:

| System Type | Files Found | Space Freed |
|------------|-------------|-------------|
| Home PC (30 days) | 100-500 | 500MB-2GB |
| Work PC (30 days) | 500-2000 | 2GB-5GB |
| Developer PC (30 days) | 1000-3000 | 5GB-15GB |
| Server (30 days) | 2000-5000 | 10GB-30GB |

---

## ?? Safety Guarantees

### Built-in Protection

1. **Dry-Run Default**
   - Must explicitly use `--clean` to delete
   - No accidental deletion possible

2. **Age Filter**
   - Only files older than 30 days (default)
   - Recent files always protected

3. **Whitelist-Based**
   - Only scans approved temp folders
   - Cannot access user data

4. **Auto-Skip Protection**
   - Skips locked files (in use)
   - Skips system files (attrib S)
   - Skips hidden files
   - Skips symlinks/junctions (reparse points)

5. **Recycle Bin**
   - All files sent to Recycle Bin
   - Fully recoverable
   - Not permanent deletion

6. **Error Handling**
   - Continues on error
   - Logs all issues
   - Never crashes

### Security Features

- ? Auto requests Admin via UAC (Windows security)
- ? No Registry modifications
- ? No service stops/starts
- ? No driver manipulation
- ? No system file changes
- ? Completely transparent (full logging)

---

## ?? Logging

### Log Format

```
2024-11-03 07:15:30 [SCAN] Scanning: C:\Users\John\AppData\Local\Temp
2024-11-03 07:15:31 [DRY] C:\Users\John\AppData\Local\Temp\old.tmp | Size: 2621440 bytes | Age: 45 days
2024-11-03 07:15:32 [DEL] C:\Users\John\AppData\Local\Temp\cache.dat | Size: 1258291 bytes
2024-11-03 07:15:33 [ERR] C:\Users\John\AppData\Local\Temp\locked.file | Error: Access denied
2024-11-03 07:15:35 [INFO] User TEMP - Files: 156, Size: 548847632 bytes
2024-11-03 07:15:36 SUMMARY: Files=156, Size=548847632 bytes, Deleted=153, Errors=3
```

### Log Tags

| Tag | Meaning |
|-----|---------|
| `[SCAN]` | Scanning directory |
| `[DRY]` | Dry-run: would delete this file |
| `[DEL]` | File deleted (sent to Recycle Bin) |
| `[ERR]` | Error accessing/deleting file |
| `[SKIP]` | Skipped (locked, not found, etc.) |
| `[INFO]` | Informational message |

---

## ?? Exit Codes

| Code | Meaning | Example Scenario |
|------|---------|------------------|
| `0` | Success | All operations completed successfully |
| `1` | Partial success | Some files skipped (locked/no permission) |
| `2` | Fatal error | Invalid parameters (bad --days value) |

### Usage in Scripts

```cmd
CleanMaster.cmd --clean --yes
if %errorlevel% equ 0 (
    echo Success
) else if %errorlevel% equ 1 (
    echo Completed with errors
) else (
    echo Failed
)
```

---

## ?? Scheduled Task Setup

### Windows Task Scheduler

Run cleanup automatically every week:

```cmd
schtasks /create /tn "CleanMaster Weekly" ^
  /tr "C:\Tools\CleanMaster.cmd --clean --yes --days 30" ^
  /sc weekly /d SUN /st 02:00 /ru SYSTEM /rl HIGHEST
```

**Result:** Automatic cleanup every Sunday at 2:00 AM.

### Manual Task Scheduler (GUI)

1. Open **Task Scheduler**
2. Create Basic Task
3. **Name:** CleanMaster Weekly
4. **Trigger:** Weekly, Sunday, 2:00 AM
5. **Action:** Start a program
   - **Program:** `C:\Path\To\CleanMaster.cmd`
   - **Arguments:** `--clean --yes --days 30`
6. ? **Run with highest privileges**

---

## ?? Comparison

| Feature | CleanMaster | CCleaner | Disk Cleanup | BleachBit |
|---------|-------------|----------|--------------|-----------|
| **Single File** | ? | ? | ? | ? |
| **Auto Admin** | ? | ? | ? | ? |
| **Dry-Run Default** | ? | ? | ? | ? |
| **Age Filter** | ? | ? | ? | ? |
| **Recycle Bin** | ? | ? | ? | Optional |
| **CLI Full** | ? | Limited | Limited | ? |
| **Free** | ? | Freemium | ? | ? |
| **Open Source** | ? | ? | ? | ? |
| **No Install** | ? | ? | ? | ? |
| **Detailed Log** | ? | ? | ? | ? |

---

## ?? Troubleshooting

### "Access Denied" Errors

**Cause:** File locked or insufficient permissions.

**Solution:**
1. Close all applications
2. Run as Administrator (auto-requested)
3. Increase `--days` (older files less likely locked)

### No Files Found

**Cause:** Files not old enough.

**Solution:**
- Check `--days` setting (default 30)
- Try `--days 7` for more recent files
- Run `--dry` mode first to verify

### UAC Prompt Not Appearing

**Cause:** UAC disabled or group policy.

**Solution:**
- Manually right-click ? "Run as administrator"
- Check UAC settings in Control Panel

### "Bad Parameters" Error

**Cause:** Invalid command-line arguments.

**Solution:**
- Ensure `--days` is a number
- Use quotes for paths with spaces
- Run `--help` to see correct syntax

---

## ?? Best Practices

### Recommended Workflow

1. **First Time - Very Safe (90 days)**
   ```cmd
   CleanMaster.cmd --days 90
   ```
   Review output carefully.

2. **Regular Monthly - Standard (30 days)**
   ```cmd
   CleanMaster.cmd --clean --days 30
   ```
   Good balance of safety and cleaning.

3. **Emergency - Aggressive (14 days)**
   ```cmd
   CleanMaster.cmd --clean --days 14
   ```
   When disk is nearly full.

### Safety Tips

- ? Always preview first (default dry-run)
- ? Start with high `--days` value (60+)
- ? Review log file after cleanup
- ? Test with dry-run before using `--yes`
- ? Don't use `--days` < 7 (too aggressive)
- ? Don't skip confirmation unless tested

---

## ?? Requirements

- **OS:** Windows 10 or Windows 11
- **PowerShell:** 3.0+ (pre-installed on Windows 10/11)
- **Privileges:** User (Admin auto-requested when needed)
- **Dependencies:** None (self-contained)
- **Size:** ~22 KB (single file)

---

## ?? Files

```
CleanMaster/
??? CleanMaster.cmd    # Main tool (all-in-one)
??? README.md          # This file
??? LICENSE            # MIT License
```

---

## ?? Contributing

Found a bug or have a suggestion?

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

### Reporting Issues

When reporting issues, please include:
- Windows version (10 or 11)
- Command used
- Error message
- Log file (if available)

---

## ?? License

**MIT License** - Free and Open Source

```
MIT License

Copyright (c) 2024 CleanMaster

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## ? Quick Reference

### Common Commands

```cmd
# Preview (safe, no deletion)
CleanMaster.cmd

# Clean with confirmation
CleanMaster.cmd --clean

# Clean older files (60+ days)
CleanMaster.cmd --clean --days 60

# Automated cleanup (no prompts)
CleanMaster.cmd --clean --yes

# Help
CleanMaster.cmd --help
```

### Remember

- ??? **Default = Safe** (dry-run mode)
- ? **30 days** = default age filter
- ?? **Recycle Bin** = files recoverable
- ? **Confirmation** = required (unless --yes)
- ?? **Logging** = automatic, detailed

---

## ?? Why Choose CleanMaster?

### Advantages

1. **Safest by Design**
   - Dry-run default
   - Whitelist-only
   - Recycle Bin support
   - Age-based filtering

2. **User-Friendly**
   - No installation
   - Auto admin request
   - Clear messages
   - Detailed logs

3. **Automation-Ready**
   - Full CLI support
   - Exit codes
   - Silent mode (`--yes`)
   - Perfect for scheduled tasks

4. **Transparent**
   - Open source
   - Readable code
   - Full logging
   - No hidden operations

5. **Reliable**
   - Error handling
   - Never crashes
   - Continues on error
   - Tested on Win 10/11

---

## ?? Support

### Quick Answers

**Q: Is it safe?**  
A: Yes! Default dry-run, whitelist-only, Recycle Bin, age filter.

**Q: Will it delete my files?**  
A: No! Only temporary files in temp folders. Never user data.

**Q: Can I recover deleted files?**  
A: Yes! All files sent to Recycle Bin (recoverable).

**Q: How often should I run it?**  
A: Monthly with `--days 30` is recommended.

**Q: Does it need internet?**  
A: No! 100% offline, no external dependencies.

---

## ?? Acknowledgments

Inspired by and improving upon:
- CCleaner
- BleachBit
- Windows Disk Cleanup
- Community feedback

Special thanks to all contributors and testers!

---

**CleanMaster v2.0 - Clean Safe, Sleep Sound** ???

*Made with ?? for the Windows Community*
