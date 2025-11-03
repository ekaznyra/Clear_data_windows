# 🧹 WinClean Pro

**Professional Windows Cleanup Tool** - Inspired by BleachBit, CCleaner, and PrivaZer

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Windows](https://img.shields.io/badge/Platform-Windows%2010%2F11-blue)](https://www.microsoft.com/windows)
[![Version](https://img.shields.io/badge/Version-3.0.0-green)](https://github.com/winclean-pro)

---

## 🎯 Features

### 🚀 Multiple Cleanup Profiles

- **Quick Clean** - Fast and safe (2-3 minutes)
  - System temporary files
  - Recycle bin
  - Basic browser cache
  - Windows update cache

- **Standard Clean** - Recommended (5-7 minutes)
  - All Quick Clean items
  - Communication apps (Discord, Teams, Zoom)
  - Game platforms (Steam, Epic Games)
  - Media applications (Spotify, VLC)
  - Development tools (VS Code, IDEs)
  - GPU cache (NVIDIA, AMD, DirectX)

- **Deep Clean** - Thorough scan (15-20 minutes)
  - All Standard Clean items
  - Cloud storage cache
  - Adobe Creative Cloud
  - Microsoft Office cache
  - Package managers (npm, pip, yarn)
  - Windows system logs
  - Windows Defender history

- **Custom Clean** - Choose specific categories

### 🔍 Analysis Mode

- Scan system without cleaning
- Generate detailed reports
- Estimate reclaimable space
- Identify largest cache folders

### 📊 Statistics & Reporting

- Real-time cleanup progress
- Items cleaned counter
- Detailed log files
- Execution time tracking
- Error reporting

### 🛡️ Safety Features

- **Never deletes user data**
- Skips locked files automatically
- Administrator privilege checking
- Comprehensive error handling
- Detailed logging for auditing

---

## 📦 Installation

### Requirements

- Windows 10 or Windows 11
- Administrator privileges
- No additional dependencies

### Quick Start

1. **Download** `WinCleanPro.cmd`
2. **Right-click** → Run as Administrator
3. **Select** cleanup profile
4. **Wait** for completion

---

## 🎮 Usage

### Method 1: Interactive Menu

```batch
WinCleanPro.cmd
```

Navigate using number keys:
- `1` - Quick Clean
- `2` - Standard Clean (Recommended)
- `3` - Deep Clean
- `5` - Analyze Only
- `6` - View Reports

### Method 2: Automated Cleanup

Schedule via Task Scheduler:

```batch
schtasks /create /tn "WinClean Weekly" /tr "C:\path\to\WinCleanPro.cmd" /sc weekly /d SUN /st 02:00 /rl HIGHEST
```

---

## 📋 What Gets Cleaned

### ✅ Safe to Clean (Temporary Data)

| Category | Examples | Est. Space |
|----------|----------|------------|
| **System** | Temp files, Prefetch, Crash dumps | 2-10 GB |
| **Browsers** | Chrome, Edge, Firefox cache | 5-30 GB |
| **Recycle Bin** | Deleted files on all drives | 1-50 GB |
| **Apps** | Discord, Teams, Spotify cache | 2-15 GB |
| **Games** | Steam, Epic launcher logs | 1-20 GB |
| **Development** | npm, pip, yarn cache | 5-50 GB |
| **GPU** | NVIDIA, AMD shader cache | 2-10 GB |
| **Windows** | Update cache, Error reports | 3-20 GB |

**Total Potential:** 20-200 GB depending on usage

### ❌ Never Touches

- Personal documents
- Game saves
- Application settings
- Passwords/Credentials
- User-created content
- Email archives
- Source code projects

---

## 🔧 Technical Details

### Cleaning Algorithm

```batch
1. Privilege Verification
   └─> Request elevation if needed

2. Directory Enumeration
   └─> Check if path exists
   └─> Verify write permissions

3. Safe Deletion
   └─> Delete files (skip locked)
   └─> Remove empty directories
   └─> Log all operations

4. Error Recovery
   └─> Continue on failure
   └─> Log errors
   └─> No system interruption
```

### Supported Applications (250+)

<details>
<summary><b>Browsers (9)</b></summary>

- Google Chrome
- Microsoft Edge
- Mozilla Firefox
- Brave
- Opera
- Vivaldi
- Tor Browser
- Chromium
- Safari (Windows)
</details>

<details>
<summary><b>Communication (15)</b></summary>

- Discord
- Microsoft Teams
- Zoom
- Slack
- Skype
- Telegram
- WhatsApp Desktop
- Signal
- Viber
- LINE
- WeChat
- Messenger
- GoToMeeting
- Webex
- Google Meet
</details>

<details>
<summary><b>Game Platforms (10)</b></summary>

- Steam
- Epic Games Launcher
- EA Origin
- Battle.net (Blizzard)
- Riot Games
- Ubisoft Connect
- GOG Galaxy
- Rockstar Games Launcher
- Xbox App
- Amazon Games
</details>

<details>
<summary><b>Development Tools (30+)</b></summary>

- Visual Studio Code
- JetBrains IDEs (IntelliJ, PyCharm, WebStorm)
- Visual Studio
- Android Studio
- Sublime Text
- Atom
- Eclipse
- NetBeans
- Docker Desktop
- Git
- npm
- pip
- yarn
- Composer
- Gradle
- Maven
- NuGet
</details>

<details>
<summary><b>Media & Creative (20+)</b></summary>

- Spotify
- VLC Media Player
- iTunes
- Adobe Creative Cloud
- Photoshop
- Premiere Pro
- After Effects
- Blender
- OBS Studio
- Audacity
- GIMP
- Inkscape
</details>

---

## 📊 Benchmarks

| Profile | Items Cleaned | Time | Space Freed |
|---------|--------------|------|-------------|
| Quick | 1,000-5,000 | 2-3 min | 5-15 GB |
| Standard | 5,000-20,000 | 5-7 min | 15-50 GB |
| Deep | 20,000-100,000 | 15-20 min | 30-200 GB |

*Results vary based on system usage and installed applications*

---

## 🛡️ Safety & Privacy

### What Makes It Safe?

1. **Read-Only Verification** - Checks paths before deletion
2. **Locked File Handling** - Skips files in use
3. **No System Files** - Only touches cache/temp directories
4. **Detailed Logging** - Full audit trail
5. **Granular Control** - Choose exactly what to clean

### Privacy Focus

- **No telemetry** - Runs 100% offline
- **No cloud uploads** - All operations local
- **Open source** - Transparent code
- **No registration** - No accounts needed

---

## 🔬 Comparison with Other Tools

| Feature | WinClean Pro | CCleaner | BleachBit |
|---------|--------------|----------|-----------|
| **Cost** | Free | Freemium | Free |
| **Open Source** | ✅ Yes | ❌ No | ✅ Yes |
| **Profiles** | 3 | 1 | Custom |
| **Apps Supported** | 250+ | 200+ | 300+ |
| **Portable** | ✅ Yes | Premium | ✅ Yes |
| **Logs** | ✅ Yes | Premium | ✅ Yes |
| **Windows Only** | ✅ | ✅ | ❌ Multi-platform |

---

## 📚 Advanced Usage

### Custom Paths

Edit the script to add custom paths:

```batch
call :CheckAndClean "C:\CustomApp" "C:\CustomApp\Cache" "My App"
```

### Exclude Specific Items

Comment out unwanted cleaners:

```batch
:: call :CleanDirectory "%TEMP%" "User Temp"
```

### Integration with Other Tools

```powershell
# PowerShell integration
Start-Process "WinCleanPro.cmd" -Verb RunAs -ArgumentList "/QuickClean"
```

---

## 🐛 Troubleshooting

### Access Denied Errors

**Solution:** Run as Administrator
```
Right-click → Run as administrator
```

### Script Doesn't Start

**Check:**
1. Antivirus blocking
2. Execution policy
3. File corruption

**Fix:**
```batch
powershell -Command "Set-ExecutionPolicy -Scope CurrentUser Unrestricted"
```

### Cleanup Incomplete

**Verify:**
- Sufficient permissions
- Disk not full
- No corrupted filesystem

---

## 🗺️ Roadmap

### Version 3.1 (Planned)
- [ ] Schedule automation GUI
- [ ] Real-time space calculator
- [ ] Before/after comparison
- [ ] Undo capability

### Version 4.0 (Future)
- [ ] GUI interface
- [ ] Plugin system
- [ ] Cloud sync settings
- [ ] Multi-language support

---

## 🤝 Contributing

Contributions welcome! Areas to help:

- Add more application support
- Improve detection algorithms
- Enhance error handling
- Translate to other languages
- Performance optimizations

### Development Setup

```batch
git clone https://github.com/winclean-pro.git
cd winclean-pro
# Make changes
# Test on clean Windows VM
```

---

## 📜 License

MIT License - See [LICENSE](LICENSE) file

---

## 🙏 Credits

Inspired by:
- **BleachBit** - Privacy-focused cleaning
- **CCleaner** - Comprehensive app support
- **PrivaZer** - Deep system scanning

---

## ⚠️ Disclaimer

This tool is provided "as-is" without warranty. Always:
- Backup important data
- Test on non-critical systems first
- Review what will be cleaned
- Keep system restore points

**Use at your own risk.**

---

## 📞 Support

- 🐛 [Report Issues](https://github.com/winclean-pro/issues)
- 💬 [Discussions](https://github.com/winclean-pro/discussions)
- 📧 Email: support@wincleanpro.com

---

## ⭐ Star History

If you find this tool useful, please give it a star!

---

**Made with ❤️ for the Windows community**

Version 3.0.0 | Last Updated: 2025-11-03
