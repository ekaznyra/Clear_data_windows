# 🤝 Contributing to Safe Cleanup

Cảm ơn bạn quan tâm đến việc đóng góp cho Safe Cleanup! 🎉

---

## 📋 Mục lục

- [Code of Conduct](#code-of-conduct)
- [Cách đóng góp](#cách-đóng-góp)
- [Báo lỗi](#báo-lỗi)
- [Đề xuất tính năng](#đề-xuất-tính-năng)
- [Pull Requests](#pull-requests)
- [Coding Standards](#coding-standards)

---

## 📜 Code of Conduct

Project này tuân theo [Contributor Covenant](https://www.contributor-covenant.org/). Khi tham gia, bạn được kỳ vọng sẽ tôn trọng code này.

---

## 🚀 Cách đóng góp

### 1. Fork Repository
```bash
# Click nút "Fork" trên GitHub
# Sau đó clone về máy
git clone https://github.com/your-username/safe-cleanup.git
cd safe-cleanup
```

### 2. Tạo Branch mới
```bash
# Đặt tên branch mô tả rõ ràng
git checkout -b feature/ten-tinh-nang
# hoặc
git checkout -b fix/ten-loi
```

### 3. Làm việc
```bash
# Code your changes
# Test kỹ lưỡng
# Commit với message rõ ràng
git commit -m "Add: Tính năng X"
```

### 4. Push & PR
```bash
git push origin feature/ten-tinh-nang
# Mở Pull Request trên GitHub
```

---

## 🐛 Báo lỗi

### Trước khi báo lỗi:
1. ✅ Kiểm tra [Issues](https://github.com/your-repo/issues) đã có ai báo chưa
2. ✅ Đảm bảo bạn đang dùng phiên bản mới nhất
3. ✅ Thử chạy với quyền Administrator

### Template báo lỗi:

```markdown
**Mô tả lỗi:**
Mô tả ngắn gọn về lỗi

**Các bước tái hiện:**
1. Mở script
2. Chọn option X
3. Lỗi xảy ra

**Kết quả mong đợi:**
Nên hiện gì

**Kết quả thực tế:**
Thực tế hiện gì

**Screenshots:**
(Nếu có)

**Môi trường:**
- OS: Windows 10/11
- Python version: (nếu dùng)
- Phiên bản Safe Cleanup: 2.0.0

**Log:**
```
Paste log ở đây nếu có
```
```

---

## 💡 Đề xuất tính năng

### Template đề xuất:

```markdown
**Tính năng đề xuất:**
Mô tả tính năng

**Vấn đề cần giải quyết:**
Tính năng này giải quyết vấn đề gì?

**Giải pháp đề xuất:**
Bạn muốn nó hoạt động như thế nào?

**Lựa chọn thay thế:**
Có cách nào khác không?

**Thông tin thêm:**
Screenshots, mockups, v.v.
```

---

## 🔀 Pull Requests

### Checklist trước khi PR:

- [ ] Code chạy được không lỗi
- [ ] Đã test thủ công
- [ ] Comment code rõ ràng
- [ ] Update README nếu cần
- [ ] Update CHANGELOG
- [ ] Tuân theo Coding Standards

### PR Template:

```markdown
**Mô tả thay đổi:**
Tóm tắt ngắn gọn

**Loại thay đổi:**
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

**Testing:**
Đã test như thế nào?

**Screenshots:**
(Nếu có UI changes)

**Related Issues:**
Closes #123
```

---

## 📝 Coding Standards

### CMD/Batch Script

```batch
:: Luôn comment rõ ràng
:: Sử dụng :functions cho code reuse
:: Echo thông báo cho user

:FunctionName
set "variable_name=value"  :: Descriptive variable names
:: Your code here
goto :eof
```

**Quy tắc:**
- ✅ Variables: `snake_case` hoặc `PascalCase`
- ✅ Functions: `:PascalCase`
- ✅ Comments: Tiếng Việt OK, nhưng ưu tiên tiếng Anh
- ✅ Indent: 4 spaces (hoặc tab)
- ✅ Dòng trống giữa các sections

### Python

```python
def function_name(param1: str, param2: int) -> bool:
    """
    Docstring mô tả function
    
    Args:
        param1: Mô tả tham số 1
        param2: Mô tả tham số 2
    
    Returns:
        Boolean value
    """
    # Your code here
    return True
```

**Quy tắc:**
- ✅ Follow PEP 8
- ✅ Type hints
- ✅ Docstrings cho functions
- ✅ Max line length: 100
- ✅ Use `black` formatter

### Commit Messages

Format:
```
Type: Short description

Longer description if needed

Closes #issue_number
```

Types:
- `Add:` Tính năng mới
- `Fix:` Sửa lỗi
- `Update:` Cập nhật tính năng có sẵn
- `Refactor:` Cải thiện code
- `Docs:` Documentation
- `Test:` Testing
- `Style:` Formatting

Examples:
```
Add: Support for custom cache locations

Fix: Admin check failing on some systems  
Closes #42

Update: Improve HTML report design
- Add gradient backgrounds
- Better mobile support

Refactor: Cleanup analyzer class structure
```

---

## 🧪 Testing

### Manual Testing Checklist:

**CMD Script:**
- [ ] Chạy với quyền Admin
- [ ] Chạy không có quyền (test UAC)
- [ ] Test trên Windows 10
- [ ] Test trên Windows 11
- [ ] Kiểm tra với ít nhất 5 app khác nhau
- [ ] Test backup/restore

**Python Script:**
- [ ] Test với Python 3.8+
- [ ] Test với/không có pandas
- [ ] Test với/không có rich
- [ ] Kiểm tra HTML report generation
- [ ] Test dev mode scanning

---

## 📚 Areas to Contribute

### 🌟 High Priority:
- [ ] 3D Visualization (Three.js)
- [ ] Machine Learning predictions
- [ ] Cloud sync
- [ ] Mobile app

### 🎯 Medium Priority:
- [ ] More application support
- [ ] Better error handling
- [ ] Performance optimization
- [ ] Internationalization (i18n)

### 💡 Ideas Welcome:
- Integration với antivirus
- Auto-schedule cleanup
- Plugin system
- Real-time monitoring

---

## 🏆 Recognition

Contributors sẽ được:
- ✨ Tên trong README
- 🎖️ Badge trong GitHub profile
- 💝 Eternal gratitude

---

## ❓ Questions?

- 💬 Discord: (Coming soon)
- 📧 Email: support@safecleanup.com
- 📖 Docs: [README.md](README.md)

---

## 📄 License

Bằng việc contribute, bạn đồng ý code của bạn được license dưới [MIT License](LICENSE).

---

**Thank you for making Safe Cleanup better! 🎉**

Made with ❤️ in Vietnam 🇻🇳
