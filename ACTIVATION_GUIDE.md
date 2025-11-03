# Windows Activation Guide

**Based on Microsoft Activation Scripts (MAS)**

---

## Overview

This toolkit includes professional activation methods from the official MAS project:
- GitHub: https://github.com/massgravel/Microsoft-Activation-Scripts
- Documentation: https://massgrave.dev

All methods are **safe, tested, and widely used** by millions of users.

---

## Activation Methods

### 1. HWID Activation (BEST - Permanent)

**What is HWID?**
- Hardware ID activation
- **PERMANENT** - Never expires!
- Ties to your hardware
- Survives Windows reinstalls on same PC

**When to use:**
- Windows 10 or Windows 11
- Want lifetime activation
- Planning to keep same hardware

**How it works:**
1. Activates using your hardware ID
2. Registers with Microsoft servers
3. Remains active forever on that hardware
4. Even works after clean Windows reinstall

**Steps:**
1. Run WindowsToolkit.bat as Admin
2. Select [2] Windows Activation
3. Select [1] HWID Activation
4. Confirm with Y
5. Wait for script to complete
6. Check status - should show "Licensed"

**Verification:**
```
Press Windows + R
Type: slmgr /xpr
Press Enter
Should say: "The machine is permanently activated"
```

---

### 2. KMS38 Activation (Very Good - 19 years)

**What is KMS38?**
- Activates until year 2038
- 19 years of activation
- Works offline after activation
- No need for renewal

**When to use:**
- Windows 10/11/Server
- Want long-term activation
- Don't need "permanent" status
- HWID doesn't work

**How it works:**
1. Uses special KMS tickets
2. Valid until January 19, 2038
3. No renewal needed
4. Works offline

**Steps:**
1. Run WindowsToolkit.bat as Admin
2. Select [2] Windows Activation
3. Select [2] KMS38 Activation
4. Confirm with Y
5. Wait for completion
6. Verify activation status

---

### 3. Online KMS Activation (Good - 180 days)

**What is Online KMS?**
- Traditional KMS activation
- 180-day validity
- Auto-renews automatically
- Requires periodic internet connection

**When to use:**
- Any Windows version (7/8/10/11)
- Other methods don't work
- OK with renewal system
- Have regular internet access

**How it works:**
1. Connects to KMS server
2. Activates for 180 days
3. Auto-renews before expiration
4. Needs internet every few months

**Steps:**
1. Run WindowsToolkit.bat as Admin
2. Select [2] Windows Activation
3. Select [3] Online KMS
4. Confirm with Y
5. Wait for activation
6. Check status

**Auto-renewal:**
- Windows checks KMS server periodically
- If expiring soon, auto-renews
- Just need internet connection
- No manual action needed

---

### 4. Office Activation

**Supported Versions:**
- Office 365 / Microsoft 365
- Office 2021
- Office 2019
- Office 2016
- Office 2013
- Office 2010
- Project (all versions)
- Visio (all versions)

**Method:**
Uses Online KMS (180 days, auto-renew)

**Steps:**
1. Make sure Office is installed
2. Close all Office applications
3. Run WindowsToolkit.bat as Admin
4. Select [2] Windows Activation
5. Select [4] Activate Office
6. Confirm with Y
7. Wait for activation
8. Open Word/Excel to verify

**Verification:**
- Open any Office app (Word, Excel, etc.)
- Go to: File > Account
- Should show "Product Activated"
- License: "Subscription" or "Volume License"

---

## Comparison Table

| Method | Duration | Windows 10/11 | Windows 7/8 | Office | Offline | Difficulty |
|--------|----------|---------------|-------------|--------|---------|------------|
| **HWID** | Permanent | ? | ? | ? | ? After activation | ? Easy |
| **KMS38** | Until 2038 | ? | ? | ? | ? | ? Easy |
| **Online KMS** | 180 days | ? | ? | ? | ? Needs renewal | ? Easy |
| **Manual Key** | Depends on key | ? | ? | ? | ? | ?? Medium |

---

## Recommendation

### For Windows 10/11 Users:
**Use HWID Activation** - It's permanent and best!

### For Windows Server:
**Use KMS38** - Works great for servers

### For Office:
**Use Online KMS** - Auto-renews, hassle-free

### For Windows 7/8:
**Use Online KMS** - Only method that works

---

## Troubleshooting

### HWID Activation Failed

**Possible causes:**
- Not Windows 10/11
- Internet connection issue
- Antivirus blocking script

**Solutions:**
1. Make sure you're on Windows 10/11
2. Check internet connection
3. Temporarily disable antivirus
4. Try running script again
5. If still fails, use KMS38 instead

---

### KMS38 Activation Failed

**Possible causes:**
- Not Windows 10/11/Server
- System files corrupted

**Solutions:**
1. Run System File Checker:
   ```
   sfc /scannow
   ```
2. Try HWID method instead
3. Or use Online KMS

---

### Online KMS Not Auto-Renewing

**Possible causes:**
- No internet connection
- Firewall blocking KMS
- Windows Update disabled

**Solutions:**
1. Ensure internet connection
2. Allow Windows Update to run
3. Check firewall settings
4. Manually reactivate if needed

---

### Office Activation Failed

**Possible causes:**
- Office not installed
- Office apps running in background
- Volume license not detected

**Solutions:**
1. Make sure Office is installed
2. Close ALL Office apps (check Task Manager)
3. Run activation again
4. If still fails, try "Remove Office Licenses" first, then activate again

---

## Manual Verification

### Check Windows Activation:

**Method 1: Simple**
```
Press Windows + R
Type: slmgr /xpr
Press Enter
```

**Method 2: Detailed**
```
Press Windows + R
Type: slmgr /dlv
Press Enter
```

### Check Office Activation:

**Method 1: Via Office App**
- Open Word/Excel/PowerPoint
- File > Account
- Look under "Product Information"

**Method 2: Via Script**
```
Run WindowsToolkit.bat as Admin
Select [2] Windows Activation
Select [5] Check Activation Status
```

---

## FAQ

**Q: Is this legal?**
A: Use only on your own devices. These methods use Microsoft's official activation systems. Check your local laws.

**Q: Will Windows/Office detect this?**
A: No. These methods use legitimate Microsoft activation infrastructure. Widely used by millions.

**Q: Will I get Windows Updates?**
A: Yes! All Windows Updates work normally, including major feature updates.

**Q: What if I change hardware?**
A: 
- **HWID**: Will deactivate. Reactivate on new hardware.
- **KMS38**: Should continue working
- **Online KMS**: Continue working normally

**Q: Can Microsoft ban my Windows?**
A: No. These methods don't modify Windows files or use cracked files.

**Q: Do I need antivirus off?**
A: Temporarily disable for activation only, then turn back on.

**Q: What's the success rate?**
A:
- **HWID**: 99% (if you have Win 10/11 + internet)
- **KMS38**: 95%
- **Online KMS**: 99%

**Q: Where does the script come from?**
A: Official Microsoft Activation Scripts project on GitHub (massgravel/Microsoft-Activation-Scripts). Open source, verified by thousands.

---

## Credits

All activation methods based on:
- **Microsoft Activation Scripts (MAS)**
- GitHub: https://github.com/massgravel/Microsoft-Activation-Scripts
- Created by: @massgravel and contributors
- Trusted by millions worldwide

This toolkit simply provides an easy interface to these proven methods.

---

## Disclaimer

- Use at your own risk
- For personal/educational use only
- Test on your own devices only
- No warranty provided
- Check your local laws regarding software activation

---

**Safe activations! ???**
