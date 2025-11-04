# LANGUAGE TOGGLE FEATURE / TINH NANG CHUYEN DOI NGON NGU

## HOW IT WORKS / CACH HOAT DONG

### DEFAULT LANGUAGE / NGON NGU MAC DINH
- Tool kh?i ??ng v?i **English** (EN) m?c ??nh
- The tool starts in **English** (EN) by default

### SWITCHING LANGUAGES / CHUYEN DOI NGON NGU

1. **Press `` ` `` key** (backtick - ph?m b?n tr?i s? 1)
2. **Instant toggle** - Chuy?n ngay l?p t?c:
   - EN ? VI (English to Vietnamese)
   - VI ? EN (Vietnamese to English)
3. **No menu** - Kh?ng c? menu l?a ch?n, ch? c?n nh?n `` ` ``

### EXAMPLE / VI DU

```
Starting screen: ENGLISH MENU
User action: Press `
Result: VIETNAMESE MENU

Current screen: VIETNAMESE MENU  
User action: Press `
Result: ENGLISH MENU
```

## FEATURES / TINH NANG

### ? ADVANTAGES / UU DIEM
- **Instant toggle** - Chuy?n ngay l?p t?c
- **Simple** - Ch? 1 ph?m
- **Clean interface** - Giao di?n s?ch, ch? 1 ng?n ng? t?i 1 th?i ?i?m
- **Preserved preference** - Gi? nguy?n l?a ch?n trong su?t phi?n l?m vi?c

### ?? MENU LAYOUT

#### ENGLISH MENU
```
================================================================================
                                                                                
              ULTIMATE WINDOWS SYSTEM TOOL v5.0 - PROFESSIONAL                
              Comprehensive Optimization Suite - 82 Functions                 
                    Press ` to switch language                                
                                                                                
================================================================================

-------------------------------------------------------------------------------
  CATEGORY 1: SYSTEM CLEANUP [1-12]
-------------------------------------------------------------------------------
  [1]  Quick System Cleanup            [2]  Deep System Cleanup
  [3]  Browser Cache Cleanup           [4]  Application Cache Cleanup
  ...

-------------------------------------------------------------------------------
  [0]  EXIT                             [`]  Switch to Vietnamese
================================================================================
```

#### VIETNAMESE MENU
```
================================================================================
                                                                                
              CONG CU TOI UU HE THONG WINDOWS v5.0 - CHUYEN NGHIEP            
                  Bo Cong Cu Toi Uu Toan Dien - 82 Chuc Nang                  
                    Nhan ` de chuyen doi ngon ngu                              
                                                                                
================================================================================

-------------------------------------------------------------------------------
  DANH MUC 1: DON DEP HE THONG [1-12]
-------------------------------------------------------------------------------
  [1]  Don Dep Nhanh He Thong          [2]  Don Dep Sau He Thong
  [3]  Don Dep Cache Trinh Duyet       [4]  Don Dep Cache Ung Dung
  ...

-------------------------------------------------------------------------------
  [0]  THOAT                            [`]  Chuyen sang tieng Anh
================================================================================
```

## TECHNICAL DETAILS / CHI TIET KY THUAT

### Implementation Logic:
```batch
1. Default: LANG=EN
2. User presses `: goto SWITCH_LANGUAGE
3. SWITCH_LANGUAGE:
   - If LANG=EN ? Set LANG=VI ? goto MAIN_MENU_VI
   - If LANG=VI ? Set LANG=EN ? goto MAIN_MENU_EN
4. All functions return to: goto MAIN_MENU
5. MAIN_MENU redirects to:
   - MAIN_MENU_EN if LANG=EN
   - MAIN_MENU_VI if LANG=VI
```

### Code Snippet:
```batch
:SWITCH_LANGUAGE
if "%LANG%"=="EN" (
    set LANG=VI
    goto MAIN_MENU_VI
)
if "%LANG%"=="VI" (
    set LANG=EN
    goto MAIN_MENU_EN
)
set LANG=EN
goto MAIN_MENU_EN
```

## BENEFITS / LOI ICH

### For International Users:
? **Choose your language** - Pick EN or VI
? **Easy to switch** - Just one key press
? **Clean display** - No bilingual clutter
? **Professional** - Single language looks cleaner

### For Vietnamese Users:
? **Ti?ng Vi?t ??y ??** - Menu ho?n to?n ti?ng Vi?t
? **D? ??c** - Kh?ng b? l?n v?i ti?ng Anh
? **Chuy?n nhanh** - Ch? 1 ph?m
? **Chuy?n nghi?p** - Giao di?n g?n g?ng

## COMPARISON / SO SANH

| Feature | Old (Bilingual) | New (Toggle) |
|---------|----------------|--------------|
| **Display** | Both languages at once | One language at a time |
| **Readability** | Cluttered | Clean |
| **Switch method** | Menu selection (3 options) | One key press (` key) |
| **Speed** | 3+ steps | Instant |
| **Professional look** | Moderate | High |

## FAQ / CAU HOI THUONG GAP

### Q1: What is the `` ` `` key? / Ph?m `` ` `` l? g??
**A:** It's the backtick/grave accent key, located to the left of the "1" key on US keyboards. On Vietnamese keyboards, it's usually on the same key.
**?:** L? ph?m backtick (d?u huy?n), n?m b?n tr?i ph?m s? "1" tr?n b?n ph?m.

### Q2: Can I set Vietnamese as default? / C? th? ??t ti?ng Vi?t l?m m?c ??nh?
**A:** Yes! Edit line 26 in the CMD file: Change `set LANG=EN` to `set LANG=VI`
**?:** C?! S?a d?ng 26 trong file CMD: ??i `set LANG=EN` th?nh `set LANG=VI`

### Q3: Does it remember my choice? / N? c? nh? l?a ch?n c?a t?i?
**A:** Yes, during the current session. The language stays until you close the tool.
**?:** C?, trong su?t phi?n l?m vi?c. Ng?n ng? s? gi? nguy?n ??n khi ??ng tool.

### Q4: What if I press `` ` `` while a function is running?
**A:** The toggle only works at the main menu. You can't switch during function execution.
**?:** Ch? chuy?n ???c ? menu ch?nh. Kh?ng th? chuy?n khi ?ang ch?y ch?c n?ng.

---

## POWERSHELL VERSION NOTE

The PowerShell version (UltimateSystemTool.ps1) currently displays bilingual menus only. Language toggle feature is planned for v6.0.

B?n PowerShell hi?n t?i ch? hi?n th? menu song ng?. T?nh n?ng chuy?n ??i ng?n ng? s? c? trong v6.0.

---

**Version:** 5.0
**Last Updated:** 2025-11-03
**Feature Status:** ? FULLY IMPLEMENTED / HOAN THANH
