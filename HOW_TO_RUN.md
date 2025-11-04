# 🚀 CÁCH CHẠY POWERSHELL SCRIPT / HOW TO RUN

## ✅ TẤT CẢ LỖI ĐÃ ĐƯỢC SỬA / ALL ERRORS FIXED

### Các lỗi đã sửa:
1. ✅ Array syntax error (Function 88) - FIXED
2. ✅ Unicode characters (✓✗⚠ℹ★) - REPLACED with ASCII
3. ✅ Commas in Read-Host prompts - FIXED
4. ✅ Keywords 'or' in prompts - FIXED
5. ✅ All parser errors - RESOLVED

---

## 🔓 BƯỚC 1: UNBLOCK FILE (BẮT BUỘC)

### Khi bạn tải file từ internet, Windows tự động block. PHẢI unblock trước!

**Cách 1: Dùng PowerShell (KHUYẾN NGHỊ)**
```powershell
# Mở PowerShell as Administrator
# Chạy lệnh này:
Unblock-File -Path "C:\Users\nguye\Downloads\UltimateSystemTool.ps1"
```

**Cách 2: Dùng Properties**
1. Right-click file `UltimateSystemTool.ps1`
2. Chọn `Properties`
3. Tích vào `Unblock` ở dưới cùng
4. Click `OK`

**Cách 3: Unblock tất cả files trong folder**
```powershell
Get-ChildItem -Path "C:\Users\nguye\Downloads" -Recurse | Unblock-File
```

---

## 🚀 BƯỚC 2: CHẠY SCRIPT

### Sau khi đã Unblock, chọn 1 trong các cách sau:

### Cách 1: Right-Click (ĐƠN GIẢN NHẤT)
```
1. Right-click UltimateSystemTool.ps1
2. Chọn "Run with PowerShell"
3. Script sẽ tự động xin quyền Admin
```

### Cách 2: Từ PowerShell
```powershell
# Mở PowerShell as Administrator
cd "C:\Users\nguye\Downloads"
.\UltimateSystemTool.ps1
```

### Cách 3: Bypass Execution Policy
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\nguye\Downloads\UltimateSystemTool.ps1"
```

### Cách 4: Set Execution Policy (1 LẦN)
```powershell
# Mở PowerShell as Administrator
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# Sau đó chạy script bình thường
.\UltimateSystemTool.ps1
```

---

## 📝 ĐẦY ĐỦ LỆNH UNBLOCK + RUN

### Copy và paste toàn bộ vào PowerShell (Run as Admin):

```powershell
# UNBLOCK FILE
Unblock-File -Path "C:\Users\nguye\Downloads\UltimateSystemTool.ps1"

# SET EXECUTION POLICY (cho phép chạy script)
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# CHẠY SCRIPT
cd "C:\Users\nguye\Downloads"
.\UltimateSystemTool.ps1
```

---

## ⚠️ NẾU VẪN GẶP LỖI

### Lỗi: "File cannot be loaded because running scripts is disabled"
**Giải pháp:**
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

### Lỗi: "Security warning"
**Giải pháp:**
```powershell
Unblock-File -Path "C:\Users\nguye\Downloads\UltimateSystemTool.ps1"
```

### Lỗi: Parser error
**Đảm bảo:**
- ✅ File đã download hoàn chỉnh (không bị corrupt)
- ✅ File encoding là UTF-8
- ✅ Đã Unblock file

---

## 🧪 TEST TRƯỚC KHI CHẠY

### Chạy test script nhỏ trước:

```powershell
# Download và unblock Test-PowerShell.ps1 trước
Unblock-File -Path "C:\Users\nguye\Downloads\Test-PowerShell.ps1"

# Chạy test
.\Test-PowerShell.ps1

# Nếu test OK → Chạy script chính
```

---

## ✅ SAU KHI CHẠY THÀNH CÔNG

Script sẽ:
1. ✅ Hiển thị welcome screen với ASCII art
2. ✅ Tự động xin quyền Administrator
3. ✅ Hiển thị menu với 82 functions + 2 quick actions
4. ✅ Cho phép chuyển đổi ngôn ngữ (nhấn L)

### Các function an toàn để test đầu tiên:
- **Function 11**: Recycle Bin Cleanup (rất an toàn)
- **Function 20**: Clear DNS Cache (an toàn, có thể revert)
- **Function 30**: Analyze Disk Space (chỉ xem, không thay đổi)
- **Function 57**: View System Information (chỉ xem)
- **Function 69**: Show Disk Space Report (chỉ xem)
- **Function L**: Switch Language (test chuyển ngôn ngữ)

---

## 📊 VERIFICATION

Kiểm tra script đã OK:
```powershell
# Check syntax (không chạy, chỉ kiểm tra)
$errors = @()
$content = Get-Content "UltimateSystemTool.ps1" -Raw
$null = [System.Management.Automation.PSParser]::Tokenize($content, [ref]$errors)
if ($errors.Count -eq 0) {
    Write-Host "✅ Syntax OK!" -ForegroundColor Green
} else {
    Write-Host "❌ Có lỗi:" -ForegroundColor Red
    $errors | ForEach-Object { Write-Host "  Line $($_.StartLine): $($_.Message)" }
}
```

---

## 🎯 SUMMARY

**Để chạy thành công:**
1. ✅ Unblock file: `Unblock-File -Path "path\to\file.ps1"`
2. ✅ Set Execution Policy: `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`
3. ✅ Chạy script: `.\UltimateSystemTool.ps1`

**HOẶC đơn giản hơn:**
```powershell
Unblock-File -Path "C:\Users\nguye\Downloads\UltimateSystemTool.ps1"; Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; cd "C:\Users\nguye\Downloads"; .\UltimateSystemTool.ps1
```

---

**Tác giả / Author:** Nguyen Ngoc Anh Tu  
**Version:** 5.0 Professional Edition  
**Status:** ✅ ALL ERRORS FIXED - READY TO USE!
