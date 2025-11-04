# ULTIMATE WINDOWS SYSTEM TOOL v5.0 - PROFESSIONAL EDITION

## Complete Functions Guide - English Version

================================================================================

## QUICK START

### How to Use:
1. **Right-click** UltimateSystemTool.cmd or .ps1
2. **Select** "Run as Administrator" (CMD) or "Run with PowerShell"
3. **Press L** to switch language (EN ? VI)
4. **Choose** function number (1-82, 88, or 99)
5. **Follow** on-screen instructions

### System Requirements:
- Windows 7/8/8.1/10/11 (32-bit or 64-bit)
- Administrator rights
- PowerShell 2.0+ (for .ps1 version)

================================================================================

## TOOL VERSIONS

### CMD Version (UltimateSystemTool.cmd)
- **82 functions** - Complete feature set
- **Language toggle** - Press L to switch EN ? VI instantly
- **Maximum compatibility** - Windows 7/8/8.1/10/11
- **File size:** 133 KB

### PowerShell Version (UltimateSystemTool.ps1)
- **10 core functions** - Essential cleanup & backup
- **Modern UI** - Colorful, enhanced interface
- **Language toggle** - Press L to switch EN ? VI
- **File size:** 29 KB

================================================================================

## ALL 82 FUNCTIONS - COMPLETE LIST

### CATEGORY 1: SYSTEM CLEANUP [1-12]

**[1] Quick System Cleanup**
- Cleans %TEMP% and C:\Windows\Temp
- Empties Recycle Bin
- Flushes DNS cache
- Deletes prefetch files
- Time: 10-30 seconds
- Space freed: 100 MB - 1 GB

**[2] Deep System Cleanup**
- All temporary folders
- Windows logs (CBS, DISM)
- Update download cache
- Thumbnail cache
- DISM component cleanup
- Time: 2-5 minutes
- Space freed: 1-5 GB

**[3] Browser Cache Cleanup**
- Chrome, Edge, Firefox cache
- IE cache
- All Chromium-based browsers
- Space freed: 200 MB - 2 GB
- Note: Close browsers first

**[4] Application Cache Cleanup**
- WPS Office, Adobe, Office cache
- QQ, WeChat, Thunder cache
- Steam logs, Java cache
- Visual Studio cache
- Space freed: 100 MB - 3 GB

**[5] Windows Update Cleanup**
- SoftwareDistribution\Download
- Delivery Optimization cache
- WindowsUpdate.log
- DISM cleanup
- Space freed: 2-10 GB
- Warning: Cannot uninstall updates after

**[6] Thumbnail Cache Cleanup**
- Deletes thumbcache_*.db
- Restarts Explorer
- Space freed: 50-500 MB

**[7] Icon Cache Cleanup**
- Deletes IconCache.db
- Rebuilds automatically
- Fixes corrupted icons

**[8] Font Cache Cleanup**
- Clears font cache
- Deletes FNTCACHE.DAT
- Fixes font display issues

**[9] Windows Installer Cleanup**
- $PatchCache$ folder
- Outdated installers
- Space freed: 500 MB - 3 GB

**[10] Old Windows Installation Cleanup**
- Deletes C:\Windows.old
- Requires double confirmation
- Space freed: 10-30 GB
- Warning: Cannot downgrade after

**[11] Recycle Bin Cleanup**
- Empties Recycle Bin
- Permanent deletion
- Fast and silent

**[12] Memory Dump Files Cleanup**
- MEMORY.DMP
- Minidump folder
- Crash dump files
- Space freed: 100 MB - 5 GB

---

### CATEGORY 2: PRIVACY PROTECTION [13-20]

**[13] Clear Recent Documents**
- Deletes *.lnk shortcuts
- Preserves pinned items

**[14] Clear Run History**
- Removes Run dialog history from registry

**[15] Clear Search History**
- ConnectedSearch\History folder
- Search suggestions

**[16] Clear Clipboard History**
- Clipboard data (Windows 10/11)
- PowerShell Clear-Clipboard

**[17] Clear Windows Error Reports**
- WER folder cleanup
- Space freed: 100 MB - 2 GB

**[18] Disable Telemetry and Tracking**
- Disables DiagTrack service
- Modifies registry
- Privacy-focused

**[19] Clear Event Logs**
- Application, System, Security logs
- Warning: Removes troubleshooting info

**[20] Clear DNS Cache**
- ipconfig /flushdns
- ipconfig /registerdns
- Fixes DNS issues

---

### CATEGORY 3: NETWORK OPTIMIZATION [21-26]

**[21] Reset Network Settings**
- TCP/IP reset
- Winsock reset
- Requires restart

**[22] Optimize Network Performance**
- Disables throttling
- TCP settings optimization
- 10-30% speed improvement

**[23] Clear ARP Cache**
- arp -d * command
- Refreshes adapter connections

**[24] Reset Winsock**
- netsh winsock reset
- Fixes corrupted stack
- Requires restart

**[25] Renew IP Address**
- ipconfig /release
- ipconfig /renew
- Fixes DHCP issues

**[26] Fix Network Adapter**
- Disable/enable adapters
- PowerShell restart
- Fixes detection issues

---

### CATEGORY 4: DISK MANAGEMENT [27-32]

**[27] Disk Cleanup (Built-in)**
- Windows cleanmgr utility
- Interactive GUI
- Space freed: 1-10 GB

**[28] Disk Error Check**
- CHKDSK scan
- Schedules on next reboot
- Time: 10-60 minutes

**[29] Disk Optimization**
- HDD: Defragmentation
- SSD: TRIM command
- Time: 30 min - 2 hours

**[30] Analyze Disk Space**
- Shows free space on drives
- PowerShell analysis

**[31] Clean Windows.old**
- Same as [10]
- Double confirmation required

**[32] Compact OS**
- Compresses system files
- Space freed: 2-4 GB
- No performance impact

---

### CATEGORY 5: PERFORMANCE OPTIMIZATION [33-44]

**[33] Disable Startup Programs**
- Task Manager Startup tab
- 20-50% faster boot

**[34] Optimize Services**
- Disables unnecessary services
- Manual mode for some

**[35] Clear Prefetch Files**
- C:\Windows\Prefetch
- Safe to delete

**[36] Clear SuperFetch Cache**
- Stops Superfetch
- Useful for SSD

**[37] Disable Visual Effects**
- "Best Performance" mode
- 15-30% boost on old PCs

**[38] Optimize Power Plan**
- High Performance mode
- Maximum CPU performance
- Not for laptops on battery

**[39] Disable Hibernation**
- Deletes hiberfil.sys
- Space freed: 4-32 GB (RAM size)

**[40] Clear Memory Cache**
- Minimizes process memory
- Temporary RAM boost

**[41] Optimize Search Index**
- Rebuilds index
- Time: 30-60 minutes

**[42] Disable Windows Animations**
- Faster UI response
- Snappier feel

**[43] Optimize SSD Settings**
- Disables defrag for SSD
- Enables TRIM
- Important: SSD only!

**[44] Reduce Menu Show Delay**
- MenuShowDelay = 0
- Instant menus

---

### CATEGORY 6: SYSTEM MAINTENANCE [45-50]

**[45] System File Checker (SFC)**
- sfc /scannow
- Repairs corrupted files
- Time: 15-30 minutes

**[46] DISM System Repair**
- DISM /RestoreHealth
- More comprehensive than SFC
- Time: 20-40 minutes

**[47] Windows Component Cleanup**
- Removes old components
- Reduces WinSxS size
- Space freed: 1-5 GB

**[48] Update Windows Drivers**
- Opens Device Manager
- User-controlled

**[49] Rebuild Icon Cache**
- Same as [7]
- Fixes corrupted icons

**[50] Rebuild Search Index**
- Opens Indexing Options
- Manual rebuild

---

### CATEGORY 7: REGISTRY OPTIMIZATION [51-55]

**[51] Clean Registry (Safe)**
- MUI cache cleanup
- Auto-backup first

**[52] Optimize Registry**
- Compacts registry hives
- Requires reboot

**[53] Backup Registry**
- Exports to Documents folder
- Timestamped filename

**[54] Disable Cortana**
- Registry modification
- Frees 100-300 MB RAM
- Windows 10/11 only

**[55] Disable Windows Tips**
- Stops notification popups
- Cleaner experience

---

### CATEGORY 8: ADVANCED TOOLS [56-70]

**[56] Create System Restore Point**
- PowerShell creation
- Time: 1-5 minutes

**[57] View System Information**
- Opens msinfo32
- Detailed system info

**[58] Export Programs List**
- WMIC program list
- Saves to Documents

**[59] Check Disk Health (SMART)**
- SMART status
- Predicts disk failure

**[60] Clear Windows Store Cache**
- wsreset.exe
- Fixes Store errors
- Time: 1-2 minutes

**[61] Reset Windows Update Components**
- Comprehensive repair
- Last resort for update problems

**[62] Optimize Boot Time**
- powercfg /bootrace
- Identifies bottlenecks

**[63] Clean All Temporary Files**
- *.tmp, *.bak, *.old
- Space freed: 500 MB - 5 GB

**[64] Generate System Report**
- perfmon /report
- Time: 60 seconds

**[65] Clean Software Cache**
- Same as [4]

**[66] Clean Delivery Optimization**
- Peer-to-peer update files
- Space freed: 500 MB - 5 GB

**[67] Clean Update Backup (LCU)**
- Latest Cumulative Update backup
- Space freed: 2-8 GB
- Warning: Cannot roll back updates

**[68] Optimize Memory (RAM)**
- Same as [40]
- Frees 100-500 MB

**[69] Show Disk Space Report**
- Before/after comparison
- Tracks progress

**[70] Refresh Icon Cache**
- Same as [7], [49]

---

### CATEGORY 9: SYSTEM UTILITIES [71-76]

**[71] Check System Information**
- Computer name, manufacturer
- CPU model and speed
- RAM, OS version
- Architecture (32/64-bit)
- BIOS version

**[72] Windows Settings Center**
- Windows 10/11: Settings app
- Windows 7/8: Control Panel

**[73] Office Repair and Reset**
- Clears Office cache
- Resets to default
- Fixes common errors
- Close Office apps first

**[74] Remove Bloatware (Safe)**
- Windows 10/11: PowerShell removal
  - 3D Builder, Candy Crush
  - Mixed Reality Portal
  - Xbox apps (optional)
- Windows 7/8: Programs and Features
- Space freed: 500 MB - 2 GB
- Warning: Some apps cannot be reinstalled

**[75] Bitlocker Management**
- Shows Bitlocker status
- manage-bde -status
- Information only - no modifications

**[76] Check Activation Status**
- Windows: slmgr.vbs /dli
- Office: ospp.vbs /dstatus
- Information only - does not activate

---

### CATEGORY 10: BACKUP AND RECOVERY [77-82] ? NEW!

**[77] Backup WiFi Passwords**
- Exports all saved WiFi profiles
- netsh wlan export
- Creates WiFi_Passwords.txt
- Location: Documents\WiFi_Backup_[TIMESTAMP]\
- Time: 10-30 seconds

**[78] Backup Drivers**
- DISM driver export
- Third-party drivers only
- Creates driver .inf files
- CSV driver list
- Location: Documents\Driver_Backup_[TIMESTAMP]\
- Time: 1-3 minutes
- Space required: 100-500 MB

**[79] Backup User Data**
- Three modes:
  1. Quick: Desktop, Documents, Pictures
  2. Full: + Downloads, Videos, Music
  3. Custom: File Explorer selection
- Uses xcopy with /EXCLUDE
- Does NOT delete originals
- Location: Documents\UserData_Backup_[TIMESTAMP]\
- Time: 10-60 minutes
- Space required: Same as source data

**[80] Backup Zalo Data**
- Complete Zalo PC data:
  - AppData\Roaming\ZaloPC
  - Documents\ZaloData
  - LocalAppData\ZaloPC
- Messages, media, cache
- Stops Zalo automatically
- Location: Documents\Zalo_Backup_[TIMESTAMP]\
- Time: 1-10 minutes
- Space required: 500 MB - 5 GB
- Warning: Close Zalo first

**[81] Backup Product Keys**
- Windows OEM key (from BIOS)
- Windows license status
- Office license status
- Creates text files
- Location: Documents\ProductKeys_Backup_[TIMESTAMP]\
- Time: 10-30 seconds
- Warning: Keep backup secure!

**[82] Data Recovery Tools**
- Opens Windows built-in tools:
  - File History
  - System Restore
  - Previous Versions
  - Volume Shadow Copies
- Does NOT install third-party software
- Depends on backup configuration

---

### QUICK ACTIONS

**[88] RUN ALL CLEANUP TASKS**
- Runs 10 cleanup tasks:
  1. Temp files
  2. Recycle Bin
  3. Browser cache
  4. Windows Update cache
  5. Thumbnail cache
  6. Icon cache
  7. DNS cache
  8. Prefetch
  9. Event logs
  10. Delivery Optimization
- Fully automated
- Time: 5-15 minutes
- Space freed: 3-15 GB
- Recommended: Monthly

**[99] FULL SYSTEM OPTIMIZATION**
- All cleanup tasks from [88]
- System file check (SFC)
- DISM repair
- Disk optimization
- Registry optimization
- Network optimization
- Performance tweaks
- Service optimization
- Creates restore point first
- Time: 20-60 minutes
- Requires restart
- Space freed: 5-20 GB
- Benefit: 20-40% faster system
- Recommended: Quarterly

================================================================================

## COMPATIBILITY

- **Windows 7**: All 82 functions compatible (some use fallbacks)
- **Windows 8/8.1**: All 82 functions compatible
- **Windows 10**: Full compatibility - optimal platform
- **Windows 11**: Full compatibility - latest features

================================================================================

## SAFETY NOTES

### Safe Operations:
? All cleanup functions are SAFE
? Backup functions do NOT delete originals
? Registry changes backed up automatically
? Confirmation required for risky operations

### Warnings:
?? Windows.old deletion: Cannot downgrade
?? LCU backup deletion: Cannot uninstall updates
?? Hibernation disable: Deletes hiberfil.sys
?? Network reset: Requires restart

### Recommendations:
1. Create System Restore Point before major changes
2. Close all applications before cleanup
3. Backup important data regularly
4. Run as Administrator

================================================================================

## LANGUAGE TOGGLE

Press **L** key at any menu to instantly switch between English and Vietnamese.

================================================================================

Version: 5.0
Last Updated: 2025-11-03
Total Functions: 82 + 2 Quick Actions
Status: STABLE - SAFE TO USE
License: Open Source
