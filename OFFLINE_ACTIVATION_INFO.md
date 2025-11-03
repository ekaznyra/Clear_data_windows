# Offline Activation Information

## Windows Professional Toolkit v4.2 - OFFLINE EDITION

### What's New?

**ALL MAS (Microsoft Activation Scripts) are now included locally!**

No internet connection required for activation. Everything works offline.

---

## What's Included?

### MAS_Scripts Folder (1.1 MB)

10 activation scripts from massgravel/Microsoft-Activation-Scripts:

| Script | Size | Function |
|--------|------|----------|
| HWID_Activation.cmd | 82 KB | Permanent Windows 10/11 activation |
| KMS38_Activation.cmd | 86 KB | Windows activation until 2038 |
| Ohook_Activation_AIO.cmd | 164 KB | Permanent Office activation |
| Online_KMS_Activation.cmd | 173 KB | 180-day Windows/Office activation |
| Troubleshoot.cmd | 57 KB | Fix activation issues |
| Check_Activation_Status.cmd | 48 KB | View detailed activation status |
| Change_Windows_Edition.cmd | 49 KB | Change Windows edition (Home to Pro, etc.) |
| Change_Office_Edition.cmd | 56 KB | Change Office edition |
| Extract_OEM_Folder.cmd | 26 KB | Extract OEM information and keys |
| TSforge_Activation.cmd | 358 KB | Advanced activation method |

**Total: 1.1 MB**

---

## How It Works

### Before (v4.1):
```batch
powershell -Command "irm https://massgrave.dev/get | iex"
```
- Required internet connection
- Downloaded scripts from remote server
- Slower (download + execution time)
- Failed if server was down

### Now (v4.2):
```batch
call "%~dp0MAS_Scripts\HWID_Activation.cmd" /HWID
```
- No internet required
- Direct local execution
- Faster (immediate execution)
- 100% reliable

---

## Installation

### Method 1: Keep Together (Recommended)

```
?? Your Folder
  ??? WindowsToolkit.bat
  ??? ?? MAS_Scripts
       ??? HWID_Activation.cmd
       ??? KMS38_Activation.cmd
       ??? Ohook_Activation_AIO.cmd
       ??? Online_KMS_Activation.cmd
       ??? Troubleshoot.cmd
       ??? Check_Activation_Status.cmd
       ??? Change_Windows_Edition.cmd
       ??? Change_Office_Edition.cmd
       ??? Extract_OEM_Folder.cmd
       ??? TSforge_Activation.cmd
```

### Method 2: Portable USB

1. Copy both `WindowsToolkit.bat` and `MAS_Scripts` folder to USB
2. Run from USB on any PC
3. No installation needed
4. Works completely offline

---

## Usage

1. Right-click `WindowsToolkit.bat`
2. Select "Run as administrator"
3. Choose option [2] Windows Activation
4. Select your activation method
5. Follow the prompts

**No internet connection required!**

---

## Benefits

### ? Offline Operation
- Work without internet
- No external dependencies
- No remote server calls

### ? Speed
- Instant execution
- No download time
- Faster than online method

### ? Reliability
- No server downtime issues
- Always available
- Consistent performance

### ? Privacy
- No data sent to external servers
- All processing local
- Complete control

### ? Portability
- Carry on USB drive
- Use on multiple PCs
- No installation needed

---

## Technical Details

### Script Execution

Each activation method now calls local scripts:

**HWID (Permanent):**
```batch
call "%~dp0MAS_Scripts\HWID_Activation.cmd" /HWID
```

**KMS38 (Until 2038):**
```batch
call "%~dp0MAS_Scripts\KMS38_Activation.cmd" /KMS38
```

**Ohook Office (Permanent):**
```batch
call "%~dp0MAS_Scripts\Ohook_Activation_AIO.cmd" /Ohook
```

**Online KMS (180 days):**
```batch
call "%~dp0MAS_Scripts\Online_KMS_Activation.cmd" /KMS-ActAndRenewalTask
```

### Fallback Mechanism

If MAS scripts are missing, toolkit will:
1. Show error message
2. Display fallback options
3. Guide user to reinstall scripts

---

## Troubleshooting

### "MAS Scripts not found" Error

**Cause:** `MAS_Scripts` folder is missing or in wrong location

**Solution:**
1. Ensure `MAS_Scripts` folder is in same directory as `WindowsToolkit.bat`
2. Download complete package again if needed
3. Don't separate the files

### Antivirus Blocking

**Cause:** Antivirus may flag activation scripts

**Solution:**
1. Add exception for `MAS_Scripts` folder
2. Temporarily disable antivirus during activation
3. These are official MAS scripts (open source)

### Activation Failed

**Cause:** Various reasons (unsupported edition, corrupted files, etc.)

**Solution:**
1. Use option [6] Activation Troubleshoot
2. Check activation status with option [7]
3. Try alternative activation method

---

## Version History

### v4.2 (Current) - OFFLINE EDITION
- Added all MAS scripts locally
- Removed remote server calls
- Improved speed and reliability
- Added offline support

### v4.1 - ASCII EDITION
- Removed Unicode characters
- Fixed encoding issues
- Simplified interface

### v4.0 - PROFESSIONAL EDITION
- Major UI overhaul
- Added System Info module
- Enhanced optimizer

---

## Credits

- **MAS Scripts:** massgravel/Microsoft-Activation-Scripts
- **Source:** https://github.com/massgravel/Microsoft-Activation-Scripts
- **License:** GNU GPL v3.0

All MAS scripts are open source and maintained by the community.

---

## License

This toolkit is provided under MIT License.

MAS scripts retain their original GNU GPL v3.0 license.

See LICENSE file for full details.

---

## Support

For activation issues:
- Use built-in Troubleshoot tool
- Check MAS documentation
- Visit: https://massgrave.dev

For toolkit issues:
- Check README.md
- Review documentation files
- Verify folder structure

---

**Enjoy your offline activation capability!**

Windows Professional Toolkit v4.2 - OFFLINE EDITION
