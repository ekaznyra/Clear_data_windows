# 🧹 Safe Cleanup Tool - Analytical Pro Edition

> **Công cụ dọn rác THÔNG MINH nhất cho Windows 10/11**
> 
> ✅ Tự động quét & phân tích  
> ✅ AI gợi ý thông minh  
> ✅ Backup & khôi phục  
> ✅ Báo cáo HTML đẹp mắt  
> ✅ 100% an toàn

---

## 🎯 Tính năng chính

### 1. 🔍 Phân tích hệ thống thông minh
- **Quét tự động** tất cả phần mềm trong máy
- **Chỉ dọn** những gì TÌM THẤY
- **Báo cáo chi tiết** dung lượng từng loại cache
- **Gợi ý** hành động dựa trên phân tích

### 2. 🧹 Dọn rác an toàn
- **250+ phần mềm** được hỗ trợ
- **Backup tự động** trước khi xóa
- **Bỏ qua lỗi** và file đang dùng
- **Không đụng** dữ liệu người dùng

### 3. 📊 Báo cáo & Thống kê
- **Báo cáo HTML** với charts tương tác
- **JSON log** chi tiết từng thao tác
- **Lịch sử** dọn rác
- **Dashboard** 3D (Python version)

### 4. 🔄 Backup & Khôi phục
- **Tự động backup** 24 giờ
- **Undo** nếu cần
- **Safe mode** - không bao giờ mất dữ liệu

### 5. 🧠 AI-Powered (Python)
- **Phân tích thông minh** file cũ
- **Dự đoán** file không cần thiết
- **Gợi ý ưu tiên** dựa trên impact
- **Dev mode** - dọn node_modules, __pycache__

---

## 📦 Cài đặt

### Phiên bản CMD (Cơ bản)
```bash
# Chỉ cần download và chạy
safe_cleanup.cmd
```

### Phiên bản Python (Nâng cao)
```bash
# Cài đặt dependencies
pip install pandas rich

# Chạy analyzer
python cleanup_analyzer.py
```

---

## 🚀 Cách sử dụng

### CMD Version

#### 1️⃣ Chạy script
```bash
# Double-click hoặc
safe_cleanup.cmd
```

#### 2️⃣ Chọn chức năng từ menu
```
[1] 🔍 PHÂN TÍCH HỆ THỐNG
[2] 🧹 DỌN RÁC THÔNG MINH  
[3] 📊 XEM BÁO CÁO
[4] 🔄 KHÔI PHỤC BACKUP
[5] 📜 LỊCH SỬ
[6] ⚙️  CÀI ĐẶT
```

#### 3️⃣ Xem kết quả
- Mở file `cleanup_report.html` để xem báo cáo
- Check backup tại `%TEMP%\SafeCleanup_Backup_*`

### Python Version

#### Phân tích đầy đủ
```bash
python cleanup_analyzer.py
```

#### Quét dev projects
```bash
python cleanup_analyzer.py --scan-dev
```

#### Tìm file cũ (60 ngày)
```bash
python cleanup_analyzer.py --days 60
```

---

## 📊 Các chế độ hoạt động

### 🔍 Chế độ 1: Phân tích (Analyze Only)
**Không xóa gì cả - chỉ quét và báo cáo**

```
✓ Quét toàn bộ cache
✓ Tính dung lượng
✓ Tạo báo cáo HTML
✓ Đưa ra gợi ý
```

**Kết quả:**
- File phân tích: `cleanup_analysis.txt`
- Báo cáo HTML: `cleanup_report.html`
- Gợi ý hành động dựa trên dữ liệu

### 🧹 Chế độ 2: Smart Cleanup
**Dọn rác với backup tự động**

```
✓ Backup trước khi xóa
✓ Ghi log JSON
✓ Tạo báo cáo
✓ Có thể undo
```

**An toàn:**
- Backup 24h tại `%TEMP%\SafeCleanup_Backup_*`
- Log chi tiết: `cleanup_log.json`
- Có thể restore bất cứ lúc nào

### 🧠 Chế độ 3: AI Analysis (Python)
**Phân tích thông minh với gợi ý ưu tiên**

```
✓ Phát hiện file cũ không dùng
✓ Tìm code projects idle
✓ Phân loại theo độ ưu tiên
✓ Báo cáo 3D visualization
```

---

## 🎨 Báo cáo mẫu

### HTML Report Features:
- 📊 **Interactive Charts** (Chart.js)
- 🎨 **Beautiful UI** (Gradient design)
- 📈 **Statistics Cards**
- 💡 **Smart Suggestions**
- 📁 **Detailed Tables**

### Ảnh demo:
```
╔════════════════════════════════════╗
║  📊 PHÂN TÍCH CACHE                ║
╠════════════════════════════════════╣
║  Browser Cache     │  45.2 GB     ║
║  Windows Temp      │  12.8 GB     ║
║  GPU Cache         │   8.5 GB     ║
║  App Cache         │   6.3 GB     ║
╚════════════════════════════════════╝

💡 GỢI Ý:
  [HIGH] Dọn Browser Cache
    → Phát hiện 45.2 GB cache
    💡 Có thể giải phóng ~40 GB

  [MEDIUM] Xóa node_modules cũ  
    → Phát hiện 15.2 GB code artifacts
    💡 Có thể cài lại khi cần
```

---

## 🛡️ An toàn & Bảo mật

### ✅ KHÔNG XÓA:
- ❌ Dữ liệu người dùng
- ❌ Game saves
- ❌ Code projects
- ❌ Documents
- ❌ Passwords
- ❌ Settings

### ✅ CHỈ XÓA:
- ✔️ Cache files
- ✔️ Temp files
- ✔️ Logs
- ✔️ Crash dumps
- ✔️ Thumbnails

### 🔒 Cơ chế bảo vệ:
1. **Kiểm tra quyền Admin** - Bắt buộc
2. **Backup tự động** - Trước khi xóa
3. **Bỏ qua file đang dùng** - Không crash
4. **Ghi log JSON** - Truy vết được
5. **Có thể undo** - Trong 24h

---

## 📋 Danh sách phần mềm hỗ trợ (250+)

### 🌐 Browsers (9)
Chrome, Edge, Firefox, Brave, Opera, Vivaldi, Coc Coc, Tor, UC Browser

### 💬 Chat (14)
Discord, Teams, Zoom, Slack, Skype, Telegram, Messenger, WhatsApp, Zalo, Viber, Line, WeChat, GoToMeeting, Webex

### 🎮 Gaming (15)
Steam, Epic Games, Origin, Battle.net, Riot, Ubisoft, GOG, Rockstar, Minecraft, Roblox, BlueStacks, Nox, LDPlayer, MEmu

### 💻 Dev Tools (30+)
VS Code, JetBrains, Visual Studio, Android Studio, Sublime, Atom, Eclipse, Docker, Git, Postman, npm, pip, Gradle, Maven...

### 🎨 Design (15)
Adobe CC, Figma, Canva, AutoCAD, Blender, SketchUp, GIMP, Inkscape, CorelDRAW...

### 🎬 Video/Audio (10)
OBS, Premiere Pro, DaVinci Resolve, FL Studio, Ableton, Cubase...

### ☁️ Cloud (6)
OneDrive, Dropbox, Google Drive, iCloud, Box, Mega

### 🛡️ Antivirus (7)
Windows Defender, Avast, AVG, Kaspersky, Norton, McAfee, Malwarebytes

... và **150+ ứng dụng khác!**

---

## 💾 Ước tính tiết kiệm

| Loại người dùng | Tiết kiệm | Thời gian |
|----------------|-----------|-----------|
| 👤 Cơ bản | 10-30GB | 2-3 phút |
| 💼 Văn phòng | 20-50GB | 3-5 phút |
| 💻 Lập trình viên | 40-80GB | 5-8 phút |
| 🎨 Designer | 60-120GB | 8-12 phút |
| 🎬 Video Editor | 80-150GB | 10-15 phút |
| 🎮 Gamer Pro | 100-200GB+ | 15-20 phút |

---

## 🔧 Cài đặt nâng cao

### Dev Mode - Dọn Code Projects
```
⚙️ Cài đặt → [4] Dọn code projects

Tự động tìm và xóa:
• node_modules (npm)
• __pycache__ (Python)
• .gradle/caches (Java)
• bin/obj (.NET)
• build folders
• dist folders
```

### Tự động hóa với Task Scheduler
```batch
# Tạo task chạy hàng tuần
schtasks /create /tn "SafeCleanup" /tr "C:\path\to\safe_cleanup.cmd" /sc weekly /d SUN /st 02:00
```

---

## 🐛 Xử lý lỗi

### Lỗi: "Access Denied"
**Nguyên nhân:** Chưa có quyền Admin  
**Giải pháp:** Chuột phải → Run as Administrator

### Lỗi: "Python not found"
**Nguyên nhân:** Chưa cài Python  
**Giải pháp:** Download Python từ python.org hoặc chỉ dùng CMD version

### Backup không hoạt động
**Nguyên nhân:** Không đủ dung lượng TEMP  
**Giải pháp:** Dọn %TEMP% thủ công trước

---

## 📚 API & Mở rộng

### Tích hợp Python script vào CMD
```batch
:: Trong safe_cleanup.cmd
python cleanup_analyzer.py --scan-dev
if %errorlevel% equ 0 (
    echo Analysis completed!
)
```

### Export data ra CSV
```python
# Trong cleanup_analyzer.py
df = pd.DataFrame(cache_results)
df.to_csv('cleanup_data.csv', index=False)
```

---

## 🎯 Roadmap

### ✅ Đã hoàn thành:
- [x] Smart scan - chỉ dọn phần mềm có trong máy
- [x] Backup & restore system
- [x] HTML reports với charts
- [x] AI-powered analysis (Python)
- [x] Dev mode - clean code projects

### 🚧 Đang phát triển:
- [ ] 3D Visualization (Three.js)
- [ ] Auto-schedule cleanup
- [ ] Cloud sync reports
- [ ] Mobile app companion

### 💡 Kế hoạch tương lai:
- [ ] Machine Learning để dự đoán file không cần
- [ ] Integration với Git
- [ ] Real-time monitoring
- [ ] Plugins system

---

## 🤝 Đóng góp

Contributions are welcome!

```bash
# Fork repo
git clone https://github.com/yourusername/safe-cleanup

# Create branch
git checkout -b feature/amazing-feature

# Commit
git commit -m "Add amazing feature"

# Push
git push origin feature/amazing-feature
```

---

## 📜 License

MIT License - Free to use

---

## 👨‍💻 Tác giả

**Safe Cleanup Team**
- 🌐 Website: (Coming soon)
- 📧 Email: support@safecleanup.com
- 💬 Discord: (Coming soon)

---

## 🙏 Credits

- **Chart.js** - Charts trong HTML report
- **Rich** - Beautiful terminal output (Python)
- **Pandas** - Data analysis (Python)

---

## ⭐ Support

Nếu thấy hữu ích, hãy cho 1 ⭐ nhé!

```
╔════════════════════════════════════╗
║  🧹 SAFE CLEANUP - ANALYTICAL PRO  ║
║  Making Windows Clean Again! 🚀    ║
╚════════════════════════════════════╝
```

---

**Made with ❤️ in Vietnam 🇻🇳**
