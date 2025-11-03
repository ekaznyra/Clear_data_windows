# SafeClean v1.0 ???

**Ultra-Safe Windows Temp File Cleaner - Dry-Run Default, Whitelist-Based**

---

## ? Key Features

- ? **Default Dry-Run** - No accidental deletion
- ? **Whitelist-Only** - Only scans approved temp folders
- ? **Age-Based Filtering** - Only old files (30+ days default)
- ? **Recycle Bin Support** - Files recoverable by default
- ? **Detailed Logging** - Full audit trail
- ? **CLI Automation** - Perfect for scripts/scheduled tasks
- ? **100% Safe** - Never touches system/user data

---

## ?? Quick Start

### 1?? Preview (Safe - No Deletion)
```cmd
SafeClean.bat
```
Shows what files would be deleted, calculates space, but **doesn't delete anything**.

### 2?? Actually Clean
```cmd
SafeClean.bat --clean
```
Shows preview, asks for confirmation (type 'YES'), then deletes to Recycle Bin.

### 3?? Help
```cmd
SafeClean.bat --help
```

---

## ?? Common Commands

| Command | What It Does |
|---------|--------------|
| `SafeClean.bat` | Analyze only (preview, no deletion) |
| `SafeClean.bat --clean` | Clean with confirmation |
| `SafeClean.bat --clean --days 60` | Clean files older than 60 days |
| `SafeClean.bat --clean --yes` | Clean without confirmation (automation) |
| `SafeClean.bat --help` | Show full help |

---

## ?? What Gets Cleaned

### Default Whitelist (Without Admin):
- `%TEMP%` (user temp folder)
- `%LOCALAPPDATA%\Temp` (same as above)

### With Admin Rights:
- Above folders **+**
- `C:\Windows\Temp` (system temp)

---

## ?? What's NEVER Touched

SafeClean **NEVER** touches:

- ? User documents, pictures, videos, music
- ? `C:\Windows\` (except Temp folder)
- ? `C:\Program Files\`
- ? `C:\ProgramData\`
- ? Registry, drivers, system files
- ? Prefetch, pagefile, hiberfil
- ? System Restore points
- ? Windows Update cache

---

## ?? All CLI Options

```
SafeClean.bat [OPTIONS]

OPTIONS:
  --analyze              Analyze only (default, no deletion)
  --clean                Actually delete files (with confirmation)
  --days N               Only files older than N days (default: 30)
  --recycle on|off       Send to Recycle Bin (default: on)
  --yes                  Auto-confirm (no prompt)
  --empty-recycle-bin    Empty Recycle Bin after cleanup
  --log "path"           Save detailed log
  --paths "A;B;C"        Custom whitelist (advanced)
  --help, -h             Show help
```

---

## ?? Usage Examples

### Example 1: Safe Preview
```cmd
SafeClean.bat
```
**Result:** Lists files, shows space, no deletion.

### Example 2: Clean Safely
```cmd
SafeClean.bat --clean
```
**Result:** Preview ? Confirm 'YES' ? Delete to Recycle Bin.

### Example 3: Aggressive Cleanup
```cmd
SafeClean.bat --clean --days 14 --empty-recycle-bin
```
**Result:** Delete files older than 2 weeks + empty Recycle Bin.

### Example 4: Automation (Scheduled Task)
```cmd
SafeClean.bat --clean --yes --days 30 --log "C:\Logs\cleanup.log"
```
**Result:** Auto-clean, no prompts, save detailed log.

---

## ?? Safety Features

### Built-in Protection:

1. **Dry-Run Default**
   - Must explicitly use `--clean` to delete
   - No accidental deletion possible

2. **Age Filter**
   - Only processes files older than N days (default 30)
   - Recent files always safe

3. **Whitelist-Based**
   - Only scans approved temp folders
   - Cannot access user data/system folders

4. **Auto-Skip**
   - Skips locked files (in use)
   - Skips system/hidden files
   - Skips symlinks/junctions

5. **Confirmation Required**
   - Must type 'YES' to delete
   - Shows preview before deletion

6. **Recycle Bin Default**
   - Files sent to Recycle Bin (recoverable)
   - Must explicitly use `--recycle off` for permanent

---

## ?? Expected Results

| Scenario | Files Found | Space Freed |
|----------|-------------|-------------|
| Typical Home PC (30 days) | 100-500 | 500MB-2GB |
| Developer PC (30 days) | 500-2000 | 2GB-10GB |
| Server (30 days) | 1000-5000 | 5GB-20GB |
| Aggressive (14 days) | 2x more | 2x more |

---

## ?? Exit Codes

| Code | Meaning |
|------|---------|
| `0` | Success |
| `1` | Partial success (some files skipped) |
| `2` | Fatal error (bad parameters) |

---

## ?? Log Format

Sample log entry:
```
2024-11-03 07:00:16 [DEL->BIN] C:\Temp\old.tmp | Size: 2621440 bytes
2024-11-03 07:00:17 [ERR] C:\Temp\locked.file | Error: Access denied
```

Log types: `[SCAN]`, `[DRY]`, `[DEL]`, `[DEL->BIN]`, `[ERR]`, `[SKIP]`

---

## ?? Scheduled Task Setup

### Windows Task Scheduler:

```cmd
schtasks /create /tn "SafeClean Weekly" ^
  /tr "C:\Tools\SafeClean.bat --clean --yes --days 30" ^
  /sc weekly /d SUN /st 02:00 /ru SYSTEM
```

**Result:** Automatic weekly cleanup every Sunday at 2:00 AM.

---

## ?? Comparison

| Feature | SafeClean | CCleaner | Disk Cleanup |
|---------|-----------|----------|--------------|
| Default Safe | ? | ? | ? |
| Whitelist-Only | ? | ? | ? |
| Age Filter | ? | ? | ? |
| Recycle Bin | ? | ? | ? |
| CLI Full | ? | Limited | Limited |
| Free | ? | Freemium | ? |
| Single File | ? | ? | ? |

---

## ?? Best Practices

### Recommended Workflow:

1. **First Time**
   ```cmd
   SafeClean.bat --days 90
   ```
   Review carefully with conservative 90-day filter.

2. **Regular Use**
   ```cmd
   SafeClean.bat --clean --days 30
   ```
   Monthly cleanup with 30-day filter.

3. **Emergency Space**
   ```cmd
   SafeClean.bat --clean --days 14 --empty-recycle-bin
   ```
   Aggressive cleanup when disk full.

### Safety Tips:

- ? Always preview first (`--analyze` or no params)
- ? Keep Recycle Bin on (default)
- ? Start with high days value (60+)
- ? Test with `--analyze` before using `--yes`
- ? Don't use `--recycle off` unless necessary
- ? Don't use `--days` < 7 (too aggressive)

---

## ?? Troubleshooting

### "Access Denied" errors?
- Run as Administrator
- Close all applications
- Increase `--days` value

### No files found?
- Check `--days` setting (default 30)
- Try `--days 7` for more recent files
- Verify paths exist with `--analyze`

### Recycle Bin full?
- Use `--empty-recycle-bin` flag
- Or manually empty Recycle Bin

---

## ?? Requirements

- **OS:** Windows 7/8/10/11
- **PowerShell:** 2.0+ (pre-installed on modern Windows)
- **Privileges:** User (Admin for `C:\Windows\Temp`)
- **Size:** ~10KB (single file)
- **Dependencies:** None

---

## ?? Files Included

```
SafeClean.bat           # Main tool (run this)
SAFECLEAN_README.md     # This file (quick reference)
SAFECLEAN_GUIDE.md      # Complete guide (detailed docs)
```

---

## ?? Documentation

- **Quick Start:** This file (SAFECLEAN_README.md)
- **Complete Guide:** SAFECLEAN_GUIDE.md
- **Built-in Help:** `SafeClean.bat --help`

---

## ?? Support

### Common Questions:

**Q: Is it safe?**  
A: Yes! Default dry-run, whitelist-only, Recycle Bin default.

**Q: Will it delete my files?**  
A: No! Only touches temp folders. Never user data.

**Q: Can I recover deleted files?**  
A: Yes! Default sends to Recycle Bin (recoverable).

**Q: How often should I run it?**  
A: Monthly with `--days 30` is recommended.

**Q: Do I need admin rights?**  
A: No, but with admin you can also clean `C:\Windows\Temp`.

---

## ?? License

**MIT License** - Free and Open Source

---

## ?? Quick Reference Card

### Most Used Commands:
```cmd
SafeClean.bat                              # Preview (safe)
SafeClean.bat --clean                      # Clean (ask confirm)
SafeClean.bat --clean --days 60            # Clean older files
SafeClean.bat --clean --yes                # Auto-clean (no prompt)
SafeClean.bat --help                       # Show help
```

### Remember:
- ??? **Default = Safe** (dry-run, no deletion)
- ? **30 days** = default age filter
- ?? **Recycle Bin** = default (recoverable)
- ? **Confirmation** = required (unless `--yes`)

---

**SafeClean v1.0 - The Safest Way to Clean Temp Files** ????

For detailed documentation, see **SAFECLEAN_GUIDE.md**
