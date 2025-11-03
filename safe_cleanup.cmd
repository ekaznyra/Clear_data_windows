@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: ===============================================
:: 🧹 SAFE CLEANUP TOOL - Xóa rác an toàn
:: CHỈ XÓA CACHE/LOGS/TEMP - KHÔNG ĐỤNG DỮ LIỆU!
:: ===============================================

:: Kiểm tra quyền Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Cần quyền Administrator để chạy script này.
    echo [*] Đang yêu cầu quyền Admin...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║  🧹 SAFE CLEANUP TOOL - Xóa rác an toàn               ║
echo ║  CHỈ XÓA: Cache, Logs, Temp                           ║
echo ║  KHÔNG XÓA: Dữ liệu, Settings, Files người dùng       ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo [*] Bắt đầu dọn rác hệ thống...
echo.

:: ===============================================
:: Hàm CleanDir - Xóa nội dung bên trong thư mục
:: ===============================================
goto :main

:CleanDir
set "dir_path=%~1"
if not exist "%dir_path%" goto :eof
echo [clean] %dir_path%
del /f /s /q "%dir_path%\*" >nul 2>&1
for /d %%i in ("%dir_path%\*") do (
    rd /s /q "%%i" >nul 2>&1
)
goto :eof

:: ===============================================
:: MAIN - Dọn rác các thư mục
:: ===============================================
:main

echo [1/16] Dọn rác hệ thống và người dùng...
echo.

:: Temp folders
call :CleanDir "%TEMP%"
call :CleanDir "C:\Windows\Temp"
call :CleanDir "C:\Windows\Prefetch"

:: Crash dumps
call :CleanDir "%LocalAppData%\CrashDumps"

:: Recent files
call :CleanDir "%AppData%\Microsoft\Windows\Recent"

:: Internet cache
call :CleanDir "%LocalAppData%\Microsoft\Windows\INetCache"
call :CleanDir "%LocalAppData%\Microsoft\Windows\WebCache"

:: Thumbnail cache (CHỈ XÓA CACHE, KHÔNG XÓA FILE)
del /f /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1

:: Font cache
call :CleanDir "%LocalAppData%\Microsoft\Windows\Fonts"

:: Windows logs (AN TOÀN - chỉ logs cũ)
call :CleanDir "C:\Windows\Logs\CBS"
call :CleanDir "C:\Windows\Logs\DISM"
call :CleanDir "C:\Windows\Logs\DPX"

:: Delivery Optimization
call :CleanDir "%SystemRoot%\SoftwareDistribution\DeliveryOptimization"

echo.
echo [2/16] Dọn Windows Update cache...
echo.

:: Windows Update Download cache (AN TOÀN)
call :CleanDir "C:\Windows\SoftwareDistribution\Download"

:: Windows Installer temp
call :CleanDir "C:\Windows\Installer\$PatchCache$"

echo.
echo [3/16] Dọn thùng rác (Recycle Bin)...
echo.

:: Recycle Bin trên tất cả ổ đĩa
for %%d in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%d:\$Recycle.Bin (
        call :CleanDir "%%d:\$Recycle.Bin"
    )
)

echo.
echo [4/16] Dọn cache trình duyệt...
echo.

:: Chrome
call :CleanDir "%LocalAppData%\Google\Chrome\User Data\Default\Cache"
call :CleanDir "%LocalAppData%\Google\Chrome\User Data\Default\Code Cache"
call :CleanDir "%LocalAppData%\Google\Chrome\User Data\Default\GPUCache"
call :CleanDir "%LocalAppData%\Google\Chrome\User Data\Default\Service Worker"
call :CleanDir "%LocalAppData%\Google\Chrome\User Data\ShaderCache"

:: Edge
call :CleanDir "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache"
call :CleanDir "%LocalAppData%\Microsoft\Edge\User Data\Default\Code Cache"
call :CleanDir "%LocalAppData%\Microsoft\Edge\User Data\Default\GPUCache"
call :CleanDir "%LocalAppData%\Microsoft\Edge\User Data\ShaderCache"

:: Firefox
for /d %%p in ("%AppData%\Mozilla\Firefox\Profiles\*") do (
    call :CleanDir "%%p\cache2"
    call :CleanDir "%%p\jumpListCache"
    call :CleanDir "%%p\startupCache"
)

:: Brave
call :CleanDir "%LocalAppData%\BraveSoftware\Brave-Browser\User Data\Default\Cache"
call :CleanDir "%LocalAppData%\BraveSoftware\Brave-Browser\User Data\Default\Code Cache"

:: Opera
call :CleanDir "%AppData%\Opera Software\Opera Stable\Cache"
call :CleanDir "%AppData%\Opera Software\Opera Stable\GPUCache"

:: Vivaldi
call :CleanDir "%LocalAppData%\Vivaldi\User Data\Default\Cache"
call :CleanDir "%LocalAppData%\Vivaldi\User Data\Default\Code Cache"

:: Coc Coc (phổ biến tại Việt Nam)
call :CleanDir "%LocalAppData%\CocCoc\Browser\User Data\Default\Cache"
call :CleanDir "%LocalAppData%\CocCoc\Browser\User Data\Default\Code Cache"

:: Internet Explorer
call :CleanDir "%LocalAppData%\Microsoft\Windows\INetCache"
call :CleanDir "%LocalAppData%\Microsoft\Windows\Temporary Internet Files"

echo.
echo [5/16] Dọn cache ứng dụng chat và nhắn tin...
echo.

:: Discord
call :CleanDir "%AppData%\discord\Cache"
call :CleanDir "%AppData%\discord\Code Cache"
call :CleanDir "%AppData%\discord\GPUCache"

:: Microsoft Teams
call :CleanDir "%AppData%\Microsoft\Teams\Cache"
call :CleanDir "%AppData%\Microsoft\Teams\blob_storage"
call :CleanDir "%AppData%\Microsoft\Teams\databases"
call :CleanDir "%AppData%\Microsoft\Teams\GPUCache"
call :CleanDir "%AppData%\Microsoft\Teams\IndexedDB"
call :CleanDir "%AppData%\Microsoft\Teams\Local Storage"
call :CleanDir "%AppData%\Microsoft\Teams\tmp"

:: Zoom
call :CleanDir "%AppData%\Zoom\logs"
call :CleanDir "%AppData%\Zoom\bin\CrashReport"

:: Slack
call :CleanDir "%AppData%\Slack\Cache"
call :CleanDir "%AppData%\Slack\Code Cache"
call :CleanDir "%AppData%\Slack\GPUCache"

:: Skype
call :CleanDir "%AppData%\Microsoft\Skype for Desktop\Cache"

:: Telegram
call :CleanDir "%AppData%\Telegram Desktop\tdata\user_data"
call :CleanDir "%AppData%\Telegram Desktop\tdata\emoji"

:: Messenger Desktop
call :CleanDir "%AppData%\Messenger\Cache"
call :CleanDir "%AppData%\Messenger\Code Cache"

:: WhatsApp Desktop
call :CleanDir "%LocalAppData%\WhatsApp\Cache"

:: Zalo (phổ biến tại Việt Nam)
call :CleanDir "%AppData%\Zalo\ZaloData\Cache"

:: Viber
call :CleanDir "%AppData%\ViberPC\cache"

:: Line
call :CleanDir "%LocalAppData%\LINE\Cache"

:: WeChat
call :CleanDir "%AppData%\Tencent\WeChat\All Users\CefResources\cache"

echo.
echo [6/16] Dọn cache game launchers...
echo.

:: Steam
call :CleanDir "C:\Program Files (x86)\Steam\appcache"
call :CleanDir "C:\Program Files (x86)\Steam\logs"
call :CleanDir "C:\Program Files (x86)\Steam\dumps"
call :CleanDir "C:\Program Files (x86)\Steam\config\htmlcache"

:: Epic Games Launcher
call :CleanDir "%LocalAppData%\EpicGamesLauncher\Saved\Logs"
call :CleanDir "%LocalAppData%\EpicGamesLauncher\Saved\webcache"

:: EA Origin
call :CleanDir "%ProgramData%\Origin\Logs"
call :CleanDir "%LocalAppData%\Origin\Logs"

:: Battle.net (Blizzard)
call :CleanDir "%ProgramData%\Blizzard Entertainment\Battle.net\Cache"
call :CleanDir "%LocalAppData%\Blizzard Entertainment\Battle.net\Cache"

:: Riot Games (League of Legends, Valorant)
call :CleanDir "%LocalAppData%\Riot Games\Riot Client\Logs"

:: Ubisoft Connect
call :CleanDir "%LocalAppData%\Ubisoft Game Launcher\logs"

:: GOG Galaxy
call :CleanDir "%ProgramData%\GOG.com\Galaxy\logs"

:: Rockstar Games Launcher
call :CleanDir "%LocalAppData%\Rockstar Games\Launcher\logs"

:: Bethesda Launcher
call :CleanDir "%LocalAppData%\Bethesda.net Launcher\logs"

echo.
echo [7/16] Dọn cache ứng dụng giải trí...
echo.

:: Spotify
call :CleanDir "%AppData%\Spotify\Data"
call :CleanDir "%LocalAppData%\Spotify\Data"

:: iTunes (CHỈ CACHE, KHÔNG XÓA NHẠC)
call :CleanDir "%AppData%\Apple Computer\iTunes\iPhone Software Updates"
call :CleanDir "%LocalAppData%\Apple Computer\iTunes\iPod Software Updates"

:: VLC
call :CleanDir "%AppData%\vlc\art"

:: Windows Media Player
call :CleanDir "%LocalAppData%\Microsoft\Media Player\Art Cache"

:: QuickTime
call :CleanDir "%LocalAppData%\Apple Computer\QuickTime\downloads"

:: TikTok
call :CleanDir "%AppData%\TikTok\Cache"

:: NVIDIA GPU cache (AN TOÀN)
call :CleanDir "%LocalAppData%\NVIDIA\DXCache"
call :CleanDir "%LocalAppData%\NVIDIA\GLCache"
call :CleanDir "%ProgramData%\NVIDIA Corporation\NV_Cache"

:: AMD GPU cache (AN TOÀN)
call :CleanDir "%LocalAppData%\AMD\DxCache"

:: DirectX Shader Cache (AN TOÀN)
call :CleanDir "%LocalAppData%\D3DSCache"

echo.
echo [8/16] Dọn cache Adobe Creative Cloud...
echo.

:: Adobe Photoshop (CHỈ LOGS/TEMP, KHÔNG XÓA PROJECT)
for /d %%i in ("%AppData%\Adobe\Adobe Photoshop*") do (
    call :CleanDir "%%i\Logs"
)
call :CleanDir "%LocalAppData%\Temp\Adobe"

:: Adobe Premiere Pro
call :CleanDir "%AppData%\Adobe\Common\Media Cache Files"
call :CleanDir "%AppData%\Adobe\Common\Peak Files"

:: Adobe After Effects
call :CleanDir "%LocalAppData%\Temp\Adobe After Effects"

:: Adobe Creative Cloud
call :CleanDir "%LocalAppData%\Adobe\Adobe Creative Cloud\ACC\Cache"
call :CleanDir "%AppData%\Adobe\Adobe Creative Cloud\logs"

:: Adobe Illustrator
call :CleanDir "%AppData%\Adobe\Adobe Illustrator*\Logs"

:: Adobe InDesign
call :CleanDir "%AppData%\Adobe\InDesign\*\Caches"

echo.
echo [9/16] Dọn cache Microsoft Office...
echo.

:: Office Cache (CHỈ CACHE, KHÔNG XÓA DOCUMENTS)
call :CleanDir "%LocalAppData%\Microsoft\Office\16.0\OfficeFileCache"
call :CleanDir "%LocalAppData%\Microsoft\Office\16.0\WebServiceCache"

:: OneNote Cache
call :CleanDir "%LocalAppData%\Microsoft\OneNote\16.0\cache"

:: Outlook Temp
call :CleanDir "%Temp%\OutlookLogging"

:: Word Temp
del /f /q "%AppData%\Microsoft\Word\~$*" >nul 2>&1

:: Excel Temp
del /f /q "%AppData%\Microsoft\Excel\~$*" >nul 2>&1

echo.
echo [10/16] Dọn cache cloud storage...
echo.

:: OneDrive (CHỈ LOGS, KHÔNG XÓA FILES)
call :CleanDir "%LocalAppData%\Microsoft\OneDrive\logs"

:: Dropbox
call :CleanDir "%LocalAppData%\Dropbox\logs"
call :CleanDir "%AppData%\Dropbox\logs"

:: Google Drive
call :CleanDir "%LocalAppData%\Google\DriveFS\Logs"

:: iCloud
call :CleanDir "%LocalAppData%\Apple Computer\iCloud\Logs"

echo.
echo [11/16] Dọn cache công cụ lập trình...
echo.

:: Visual Studio Code
call :CleanDir "%AppData%\Code\Cache"
call :CleanDir "%AppData%\Code\CachedData"
call :CleanDir "%AppData%\Code\Code Cache"
call :CleanDir "%AppData%\Code\GPUCache"
call :CleanDir "%AppData%\Code\logs"

:: JetBrains IDEs (IntelliJ, PyCharm, WebStorm...)
for /d %%i in ("%LocalAppData%\JetBrains\*") do (
    call :CleanDir "%%i\log"
    call :CleanDir "%%i\tmp"
)

:: Visual Studio (CHỈ CACHE, KHÔNG XÓA PROJECTS)
for /d %%i in ("%LocalAppData%\Microsoft\VisualStudio\*") do (
    call :CleanDir "%%i\ComponentModelCache"
)
call :CleanDir "%Temp%\VSFeedbackIntelliCodeLogs"

:: Android Studio
for /d %%i in ("%LocalAppData%\Google\AndroidStudio*") do (
    call :CleanDir "%%i\log"
)
call :CleanDir "%UserProfile%\.android\cache"

:: Sublime Text
call :CleanDir "%AppData%\Sublime Text*\Cache"

:: Atom
call :CleanDir "%AppData%\Atom\Cache"
call :CleanDir "%AppData%\Atom\GPUCache"

:: Brackets
call :CleanDir "%AppData%\Brackets\cache"

:: Eclipse
call :CleanDir "%UserProfile%\.eclipse\*\*.log"

:: Node.js npm cache (CHỈ CACHE, KHÔNG XÓA node_modules)
if exist "%AppData%\npm-cache" (
    echo [clean] %AppData%\npm-cache
    call npm cache clean --force >nul 2>&1
)

:: Yarn cache
call :CleanDir "%LocalAppData%\Yarn\Cache"

:: Composer cache (PHP)
call :CleanDir "%LocalAppData%\Composer\cache"
call :CleanDir "%AppData%\Composer\cache"

:: pip cache (Python)
call :CleanDir "%LocalAppData%\pip\cache"

:: Gradle cache (Java/Android)
call :CleanDir "%UserProfile%\.gradle\caches\build-cache-1"

:: Maven logs
for /d %%i in ("%UserProfile%\.m2\repository\*") do (
    call :CleanDir "%%i\_remote.repositories"
)

:: Docker Desktop
call :CleanDir "%LocalAppData%\Docker\log"

:: Git temp
for /d %%i in ("%Temp%\.git*") do (
    call :CleanDir "%%i"
)

:: Postman
call :CleanDir "%AppData%\Postman\logs"

echo.
echo [12/16] Dọn cache công cụ thiết kế & đồ họa...
echo.

:: Figma Desktop
call :CleanDir "%AppData%\Figma\Cache"
call :CleanDir "%AppData%\Figma\Code Cache"

:: Canva Desktop
call :CleanDir "%AppData%\Canva\Cache"

:: Blender (CHỈ TEMP, KHÔNG XÓA PROJECTS)
call :CleanDir "%LocalAppData%\Blender Foundation\Blender\*\cache"
call :CleanDir "%Temp%\blender_*"

:: AutoCAD (CHỈ LOGS/TEMP, KHÔNG XÓA DWG FILES)
call :CleanDir "%LocalAppData%\Autodesk\Autodesk Desktop App\Logs"
for /d %%i in ("%AppData%\Autodesk\AutoCAD*") do (
    call :CleanDir "%%i\PlotterLog"
    call :CleanDir "%%i\Logs"
)

:: SketchUp
call :CleanDir "%LocalAppData%\SketchUp\SketchUp*\working"

:: GIMP
call :CleanDir "%AppData%\GIMP\*\tmp"

:: Paint.NET
call :CleanDir "%LocalAppData%\paint.net\thumbnails"

:: Inkscape
call :CleanDir "%AppData%\Inkscape\cache"

:: CorelDRAW
call :CleanDir "%AppData%\Corel\Messages\*\Logs"

echo.
echo [13/16] Dọn cache công cụ video & streaming...
echo.

:: OBS Studio (CHỈ LOGS, KHÔNG XÓA RECORDINGS)
call :CleanDir "%AppData%\obs-studio\logs"
call :CleanDir "%AppData%\obs-studio\crashes"

:: Bandicam (CHỈ TEMP, KHÔNG XÓA VIDEOS)
call :CleanDir "%Temp%\Bandicam"

:: CapCut (CHỈ CACHE, KHÔNG XÓA PROJECTS)
call :CleanDir "%AppData%\CapCut\Cache"
call :CleanDir "%LocalAppData%\CapCut\Cache"

:: Camtasia
call :CleanDir "%LocalAppData%\TechSmith\Camtasia Studio\*\Cache"

:: DaVinci Resolve (CHỈ CACHE, KHÔNG XÓA PROJECTS)
call :CleanDir "%AppData%\Blackmagic Design\DaVinci Resolve\logs"

:: Adobe Audition
call :CleanDir "%AppData%\Adobe\Audition\*\Peak Files"

:: Audacity (CHỈ TEMP, KHÔNG XÓA AUDIO FILES)
call :CleanDir "%Temp%\audacity_*"

echo.
echo [14/16] Dọn cache công cụ download & torrent...
echo.

:: Internet Download Manager (CHỈ TEMP, KHÔNG XÓA DOWNLOADS)
call :CleanDir "%AppData%\IDM\DwnlData\Temp"

:: uTorrent (CHỈ LOGS, KHÔNG XÓA TORRENTS)
call :CleanDir "%AppData%\uTorrent\logs"

:: qBittorrent
call :CleanDir "%LocalAppData%\qBittorrent\logs"

:: Free Download Manager
call :CleanDir "%AppData%\Free Download Manager\logs"

:: JDownloader
call :CleanDir "%AppData%\JDownloader\logs"

echo.
echo [15/16] Dọn cache công cụ khác...
echo.

:: WinRAR Temp (CHỈ TEMP, KHÔNG XÓA ARCHIVES)
for /d %%i in ("%Temp%\Rar*") do (
    call :CleanDir "%%i"
)

:: 7-Zip Temp
for /d %%i in ("%Temp%\7z*") do (
    call :CleanDir "%%i"
)

:: WinZip Temp
for /d %%i in ("%Temp%\wz*") do (
    call :CleanDir "%%i"
)

:: CCleaner Temp
call :CleanDir "%LocalAppData%\Temp\CCleaner"

:: TeamViewer Logs
call :CleanDir "%ProgramData%\TeamViewer\Logs"

:: AnyDesk Logs
call :CleanDir "%ProgramData%\AnyDesk\logs"

:: Chrome Remote Desktop
call :CleanDir "%LocalAppData%\Google\Chrome Remote Desktop\Logs"

:: FileZilla (CHỈ LOGS, KHÔNG XÓA BOOKMARKS)
call :CleanDir "%AppData%\FileZilla\logs"

:: PuTTY Logs
call :CleanDir "%AppData%\PuTTY\Logs"

:: VMware (CHỈ LOGS/TEMP, KHÔNG XÓA VMs)
call :CleanDir "%AppData%\VMware\logs"
call :CleanDir "%Temp%\vmware-*"

:: VirtualBox (CHỈ LOGS, KHÔNG XÓA VMs)
call :CleanDir "%UserProfile%\.VirtualBox\VBoxSVC.log*"

:: XAMPP Logs
call :CleanDir "C:\xampp\apache\logs"
call :CleanDir "C:\xampp\mysql\data\*.err"

:: MySQL Workbench
call :CleanDir "%AppData%\MySQL\Workbench\log"

:: MongoDB Compass
call :CleanDir "%AppData%\MongoDB Compass\logs"

:: LibreOffice (CHỈ CACHE, KHÔNG XÓA DOCUMENTS)
call :CleanDir "%AppData%\LibreOffice\*\cache"

:: WPS Office (CHỈ CACHE, KHÔNG XÓA DOCUMENTS)
call :CleanDir "%AppData%\kingsoft\office6\cache"

:: Foxit Reader (CHỈ CACHE, KHÔNG XÓA PDFs)
call :CleanDir "%AppData%\Foxit Software\Foxit Reader\Cache"

:: Adobe Acrobat Reader (CHỈ CACHE, KHÔNG XÓA PDFs)
call :CleanDir "%LocalAppData%\Adobe\Acrobat\DC\Cache"

:: Notepad++ (CHỈ BACKUP CŨ - COMMENTED)
rem call :CleanDir "%AppData%\Notepad++\backup"

:: Windows Store Cache
for /d %%i in ("%LocalAppData%\Packages\Microsoft.WindowsStore_*") do (
    call :CleanDir "%%i\LocalCache"
)

:: Microsoft Store Apps Cache
for /d %%i in ("%LocalAppData%\Packages\*") do (
    call :CleanDir "%%i\LocalCache"
    call :CleanDir "%%i\TempState"
)

echo.
echo [16/16] Dọn rác Windows và temp files...
echo.

:: Windows Installer Temp
for /d %%i in ("%Temp%\MSI*") do (
    call :CleanDir "%%i"
)

:: DirectX Web Setup
for /d %%i in ("%Temp%\DX*") do (
    call :CleanDir "%%i"
)

:: Windows Error Reporting
call :CleanDir "%ProgramData%\Microsoft\Windows\WER\ReportArchive"
call :CleanDir "%ProgramData%\Microsoft\Windows\WER\ReportQueue"
call :CleanDir "%ProgramData%\Microsoft\Windows\WER\Temp"

:: Windows Defender logs (AN TOÀN)
call :CleanDir "%ProgramData%\Microsoft\Windows Defender\Scans\History\Results\Quick"
call :CleanDir "%ProgramData%\Microsoft\Windows Defender\Scans\History\Results\Resource"

:: Minidump
call :CleanDir "C:\Windows\Minidump"

:: Memory dumps (AN TOÀN - CHỈ DUMPS, KHÔNG XÓA HỆ THỐNG)
del /f /q "C:\Windows\*.dmp" >nul 2>&1
del /f /q "C:\Windows\memory.dmp" >nul 2>&1

:: Temp installers
call :CleanDir "%SystemDrive%\Temp"

:: Adobe Flash Player Cache (legacy)
call :CleanDir "%AppData%\Adobe\Flash Player\AssetCache"

:: Java Cache
call :CleanDir "%LocalAppData%\Sun\Java\Deployment\cache"
call :CleanDir "%AppData%\Sun\Java\Deployment\cache"

echo.
echo ════════════════════════════════════════════════════════
echo ✅ Hoàn tất dọn rác an toàn.
echo 🛡️ CHỈ XÓA: Cache, Logs, Temp files
echo 💾 KHÔNG XÓA: Dữ liệu, Settings, Files người dùng
echo ════════════════════════════════════════════════════════
echo.

pause
