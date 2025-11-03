# ?? Quick Start Guide - WinClean Pro

## ? 30-Second Start

### Windows 10/11 Users

1. **Download** `WinCleanPro.cmd`
2. **Right-click** the file
3. Select **"Run as administrator"**
4. Press **`2`** for Standard Clean
5. Wait 5 minutes
6. Done! ??

---

## ?? First Time Setup

### Step 1: Download
```
Download WinCleanPro.cmd from:
https://github.com/winclean-pro/releases
```

### Step 2: Save to a Folder
```
Recommended location:
C:\Tools\WinCleanPro\
```

### Step 3: Run
```
Right-click WinCleanPro.cmd
? Run as administrator
? Click "Yes" on UAC prompt
```

---

## ?? Which Profile to Use?

### ?? Quick Clean (2-3 min)
**Best for:** Weekly maintenance

Cleans:
- Temp files
- Recycle bin
- Basic browser cache

**Recommended:** Run every week

---

### ? Standard Clean (5-7 min) - RECOMMENDED
**Best for:** Monthly deep clean

Cleans:
- Everything in Quick Clean
- All browser cache
- Chat apps (Discord, Teams)
- Game platforms (Steam, Epic)
- Developer tools

**Recommended:** Run every 2-4 weeks

---

### ?? Deep Clean (15-20 min)
**Best for:** Major cleanup

Cleans:
- Everything in Standard Clean
- Cloud storage cache
- Adobe products
- Office cache
- Package managers (npm, pip)
- System logs

**Recommended:** Run every 2-3 months

---

## ?? Menu Overview

```
??????????????????????????????????????
? [1] Quick Clean    - 2-3 min      ?
? [2] Standard Clean - 5-7 min ?   ?
? [3] Deep Clean     - 15-20 min    ?
? [4] Custom Clean   - Pick & choose?
??????????????????????????????????????
? [5] Analyze Only   - No cleaning  ?
? [6] View Report    - See history  ?
? [7] Settings       - Config       ?
? [8] About          - Info         ?
??????????????????????????????????????
? [0] Exit                           ?
??????????????????????????????????????
```

---

## ? What Will Be Cleaned?

### Safe to Clean ?
- Browser cache (Chrome, Edge, Firefox)
- Temporary files
- Windows Update cache
- Recycle Bin
- App caches (Discord, Spotify, etc)
- Crash dumps
- Log files

### Never Touched ?
- Personal documents
- Photos/Videos
- Game saves
- Application settings
- Passwords
- Email
- Source code

---

## ?? Analyze Before Cleaning

Want to see what will be cleaned first?

1. Run WinCleanPro.cmd as admin
2. Press `5` (Analyze Only)
3. Wait for scan to complete
4. Review report
5. Then choose cleanup profile

---

## ?? Expected Results

| Your Usage | Before | After | Freed |
|-----------|--------|-------|-------|
| Light user | 250 GB | 240 GB | 10 GB |
| Average user | 500 GB | 470 GB | 30 GB |
| Heavy user | 1 TB | 950 GB | 50 GB |
| Gamer/Dev | 2 TB | 1.8 TB | 200 GB |

---

## ??? Safety Tips

### Before First Run
1. ? Close all applications
2. ? Save your work
3. ? (Optional) Create system restore point

### During Cleanup
1. ? Don't interrupt the process
2. ? Don't turn off computer
3. ? Be patient (especially Deep Clean)

### After Cleanup
1. ? Restart browser (cache cleared)
2. ? First load might be slower
3. ? Everything returns to normal after

---

## ?? Troubleshooting

### "Access Denied"
**Fix:** Run as Administrator
```
Right-click ? Run as administrator
```

### Script Won't Start
**Fix:** Check antivirus
```
Temporarily disable antivirus
Or add WinCleanPro.cmd to exceptions
```

### Nothing Happens
**Fix:** Check execution policy
```
Open PowerShell as admin:
Set-ExecutionPolicy -Scope CurrentUser Unrestricted
```

---

## ?? Automate Cleanup

### Weekly Schedule

**Windows Task Scheduler:**

1. Open Task Scheduler
2. Create Basic Task
3. Name: "WinClean Weekly"
4. Trigger: Weekly, Sunday, 2:00 AM
5. Action: Start Program
   - Program: `C:\Tools\WinCleanPro\WinCleanPro.cmd`
6. Finish & enable

**Or use command:**
```batch
schtasks /create /tn "WinClean Weekly" /tr "C:\Tools\WinCleanPro\WinCleanPro.cmd" /sc weekly /d SUN /st 02:00 /rl HIGHEST
```

---

## ?? Monitoring Results

### View Logs
1. Run WinCleanPro.cmd
2. Press `6` (View Report)
3. See cleanup history

### Log Location
```
C:\Tools\WinCleanPro\logs\
```

---

## ?? Best Practices

### Frequency Recommendations

| Profile | Frequency | When |
|---------|-----------|------|
| Quick | Weekly | Every Sunday |
| Standard | Monthly | 1st of month |
| Deep | Quarterly | Jan, Apr, Jul, Oct |

### Optimal Workflow

**Week 1-3:** Quick Clean
**Week 4:** Standard Clean  
**Month 3:** Deep Clean

---

## ?? Pro Tips

1. **Run at night** - Schedule for 2 AM when PC is idle
2. **Close apps first** - Better cleanup results
3. **Check logs** - Review what was cleaned
4. **Combine with Defrag** - Run defrag after cleanup
5. **Update regularly** - Check for new versions

---

## ? FAQ

**Q: Will I lose my browser bookmarks?**  
A: No, only cache is cleaned, not bookmarks/passwords

**Q: Can I undo the cleanup?**  
A: No, but nothing important is deleted

**Q: How much space will I free?**  
A: Typically 10-50 GB, varies by usage

**Q: Is it safe?**  
A: Yes, only temporary files are removed

**Q: Do I need to backup first?**  
A: Not necessary, but always good practice

---

## ?? Need Help?

- ?? [Full Documentation](README.md)
- ?? [Report Issues](https://github.com/winclean-pro/issues)
- ?? [Community Support](https://github.com/winclean-pro/discussions)

---

## ? Next Steps

After your first successful cleanup:

1. ? Star the project on GitHub
2. ? Share with friends
3. ? Set up weekly schedule
4. ? Check back for updates

---

**Ready to clean? Run WinCleanPro.cmd now!** ??

---

*Last Updated: 2025-11-03*  
*Version: 3.0.0*
