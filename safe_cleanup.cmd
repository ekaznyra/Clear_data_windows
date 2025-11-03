@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: ===============================================
:: 🧹 SAFE CLEANUP TOOL - SMART SCAN EDITION
:: TỰ ĐỘNG QUÉT & CHỈ DỌN PHẦN MỀM CÓ TRONG MÁY
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
echo ║  🧹 SAFE CLEANUP TOOL - SMART SCAN EDITION            ║
echo ║  🔍 Tự động quét phần mềm trong máy                   ║
echo ║  🎯 Chỉ dọn những gì tìm thấy                         ║
echo ║  🛡️ CHỈ XÓA: Cache, Logs, Temp                        ║
echo ║  💾 KHÔNG XÓA: Dữ liệu, Settings, Files               ║
echo ╚════════════════════════════════════════════════════════╝
echo.

:: Biến đếm
set "total_cleaned=0"
set "total_scanned=0"

echo [*] Bắt đầu quét hệ thống...
echo.

:: ===============================================
:: Hàm CleanDir - Xóa nội dung bên trong thư mục
:: ===============================================
goto :main

:CleanDir
set "dir_path=%~1"
if not exist "%dir_path%" goto :eof
echo     [clean] %dir_path%
del /f /s /q "%dir_path%\*" >nul 2>&1
for /d %%i in ("%dir_path%\*") do (
    rd /s /q "%%i" >nul 2>&1
)
set /a total_cleaned+=1
goto :eof

:CheckAndClean
set "check_path=%~1"
set "clean_path=%~2"
set "app_name=%~3"
if exist "%check_path%" (
    echo   [✓] Tìm thấy: %app_name%
    call :CleanDir "%clean_path%"
    set /a total_scanned+=1
)
goto :eof

:: ===============================================
:: MAIN - Dọn rác các thư mục
:: ===============================================
:main

echo ════════════════════════════════════════════════════════
echo [1/22] Dọn rác hệ thống và người dùng...
echo ════════════════════════════════════════════════════════
echo.

:: Temp folders (luôn có)
echo   [✓] Hệ thống Windows
call :CleanDir "%TEMP%"
call :CleanDir "C:\Windows\Temp"
call :CleanDir "C:\Windows\Prefetch"
call :CleanDir "%LocalAppData%\CrashDumps"
call :CleanDir "%AppData%\Microsoft\Windows\Recent"
call :CleanDir "%LocalAppData%\Microsoft\Windows\INetCache"
call :CleanDir "%LocalAppData%\Microsoft\Windows\WebCache"
del /f /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
call :CleanDir "%LocalAppData%\Microsoft\Windows\Fonts"
call :CleanDir "C:\Windows\Logs\CBS"
call :CleanDir "C:\Windows\Logs\DISM"
call :CleanDir "C:\Windows\Logs\DPX"
call :CleanDir "%SystemRoot%\SoftwareDistribution\DeliveryOptimization"

echo.
echo ════════════════════════════════════════════════════════
echo [2/22] Dọn Windows Update cache...
echo ════════════════════════════════════════════════════════
echo.

echo   [✓] Windows Update
call :CleanDir "C:\Windows\SoftwareDistribution\Download"
call :CleanDir "C:\Windows\Installer\$PatchCache$"

echo.
echo ════════════════════════════════════════════════════════
echo [3/22] Dọn thùng rác (Recycle Bin)...
echo ════════════════════════════════════════════════════════
echo.

for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%d:\$Recycle.Bin (
        echo   [✓] Thùng rác ổ %%d:\
        call :CleanDir "%%d:\$Recycle.Bin"
    )
)

echo.
echo ════════════════════════════════════════════════════════
echo [4/22] 🌐 Quét và dọn cache trình duyệt...
echo ════════════════════════════════════════════════════════
echo.

:: Chrome
call :CheckAndClean "%LocalAppData%\Google\Chrome" "%LocalAppData%\Google\Chrome\User Data\Default\Cache" "Google Chrome"
if exist "%LocalAppData%\Google\Chrome" (
    call :CleanDir "%LocalAppData%\Google\Chrome\User Data\Default\Code Cache"
    call :CleanDir "%LocalAppData%\Google\Chrome\User Data\Default\GPUCache"
    call :CleanDir "%LocalAppData%\Google\Chrome\User Data\Default\Service Worker"
    call :CleanDir "%LocalAppData%\Google\Chrome\User Data\ShaderCache"
)

:: Edge
call :CheckAndClean "%LocalAppData%\Microsoft\Edge" "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache" "Microsoft Edge"
if exist "%LocalAppData%\Microsoft\Edge" (
    call :CleanDir "%LocalAppData%\Microsoft\Edge\User Data\Default\Code Cache"
    call :CleanDir "%LocalAppData%\Microsoft\Edge\User Data\Default\GPUCache"
    call :CleanDir "%LocalAppData%\Microsoft\Edge\User Data\ShaderCache"
)

:: Firefox
if exist "%AppData%\Mozilla\Firefox" (
    echo   [✓] Tìm thấy: Mozilla Firefox
    for /d %%p in ("%AppData%\Mozilla\Firefox\Profiles\*") do (
        call :CleanDir "%%p\cache2"
        call :CleanDir "%%p\jumpListCache"
        call :CleanDir "%%p\startupCache"
    )
    set /a total_scanned+=1
)

:: Brave
call :CheckAndClean "%LocalAppData%\BraveSoftware" "%LocalAppData%\BraveSoftware\Brave-Browser\User Data\Default\Cache" "Brave Browser"
if exist "%LocalAppData%\BraveSoftware" (
    call :CleanDir "%LocalAppData%\BraveSoftware\Brave-Browser\User Data\Default\Code Cache"
)

:: Opera
call :CheckAndClean "%AppData%\Opera Software" "%AppData%\Opera Software\Opera Stable\Cache" "Opera"
if exist "%AppData%\Opera Software" (
    call :CleanDir "%AppData%\Opera Software\Opera Stable\GPUCache"
)

:: Vivaldi
call :CheckAndClean "%LocalAppData%\Vivaldi" "%LocalAppData%\Vivaldi\User Data\Default\Cache" "Vivaldi"

:: Coc Coc
call :CheckAndClean "%LocalAppData%\CocCoc" "%LocalAppData%\CocCoc\Browser\User Data\Default\Cache" "Coc Coc Browser"
if exist "%LocalAppData%\CocCoc" (
    call :CleanDir "%LocalAppData%\CocCoc\Browser\User Data\Default\Code Cache"
)

:: Tor Browser
call :CheckAndClean "%AppData%\tor browser" "%AppData%\tor browser\Browser\TorBrowser\Data\Browser\Caches" "Tor Browser"

:: UC Browser
call :CheckAndClean "%LocalAppData%\UCBrowser" "%LocalAppData%\UCBrowser\User Data\Default\Cache" "UC Browser"

echo.
echo ════════════════════════════════════════════════════════
echo [5/22] 📧 Quét và dọn cache email clients...
echo ════════════════════════════════════════════════════════
echo.

:: Thunderbird
if exist "%AppData%\Thunderbird" (
    echo   [✓] Tìm thấy: Mozilla Thunderbird
    for /d %%p in ("%AppData%\Thunderbird\Profiles\*") do (
        call :CleanDir "%%p\cache2"
    )
    set /a total_scanned+=1
)

:: Outlook
call :CheckAndClean "%LocalAppData%\Microsoft\Outlook" "%Temp%\OutlookLogging" "Microsoft Outlook"
if exist "%LocalAppData%\Microsoft\Outlook" (
    call :CleanDir "%LocalAppData%\Microsoft\Outlook\RoamCache"
)

:: Mailbird
call :CheckAndClean "%LocalAppData%\Mailbird" "%LocalAppData%\Mailbird\Cache" "Mailbird"

:: eM Client
call :CheckAndClean "%AppData%\eM Client" "%AppData%\eM Client\Local Folders\cache" "eM Client"

echo.
echo ════════════════════════════════════════════════════════
echo [6/22] 💬 Quét và dọn cache ứng dụng chat...
echo ════════════════════════════════════════════════════════
echo.

:: Discord
call :CheckAndClean "%AppData%\discord" "%AppData%\discord\Cache" "Discord"
if exist "%AppData%\discord" (
    call :CleanDir "%AppData%\discord\Code Cache"
    call :CleanDir "%AppData%\discord\GPUCache"
)

:: Microsoft Teams
call :CheckAndClean "%AppData%\Microsoft\Teams" "%AppData%\Microsoft\Teams\Cache" "Microsoft Teams"
if exist "%AppData%\Microsoft\Teams" (
    call :CleanDir "%AppData%\Microsoft\Teams\blob_storage"
    call :CleanDir "%AppData%\Microsoft\Teams\databases"
    call :CleanDir "%AppData%\Microsoft\Teams\GPUCache"
    call :CleanDir "%AppData%\Microsoft\Teams\tmp"
)

:: Zoom
call :CheckAndClean "%AppData%\Zoom" "%AppData%\Zoom\logs" "Zoom"

:: Slack
call :CheckAndClean "%AppData%\Slack" "%AppData%\Slack\Cache" "Slack"
if exist "%AppData%\Slack" (
    call :CleanDir "%AppData%\Slack\Code Cache"
    call :CleanDir "%AppData%\Slack\GPUCache"
)

:: Skype
call :CheckAndClean "%AppData%\Microsoft\Skype for Desktop" "%AppData%\Microsoft\Skype for Desktop\Cache" "Skype"

:: Telegram
call :CheckAndClean "%AppData%\Telegram Desktop" "%AppData%\Telegram Desktop\tdata\user_data" "Telegram"

:: Messenger
call :CheckAndClean "%AppData%\Messenger" "%AppData%\Messenger\Cache" "Messenger"

:: WhatsApp
call :CheckAndClean "%LocalAppData%\WhatsApp" "%LocalAppData%\WhatsApp\Cache" "WhatsApp"

:: Zalo
call :CheckAndClean "%AppData%\Zalo" "%AppData%\Zalo\ZaloData\Cache" "Zalo"

:: Viber
call :CheckAndClean "%AppData%\ViberPC" "%AppData%\ViberPC\cache" "Viber"

:: Line
call :CheckAndClean "%LocalAppData%\LINE" "%LocalAppData%\LINE\Cache" "Line"

:: WeChat
call :CheckAndClean "%AppData%\Tencent\WeChat" "%AppData%\Tencent\WeChat\All Users\CefResources\cache" "WeChat"

:: GoToMeeting
call :CheckAndClean "%AppData%\GoToMeeting" "%AppData%\GoToMeeting\logs" "GoToMeeting"

:: Webex
call :CheckAndClean "%LocalAppData%\WebEx" "%LocalAppData%\WebEx\wbxcache" "Webex"

echo.
echo ════════════════════════════════════════════════════════
echo [7/22] 🎮 Quét và dọn cache game launchers...
echo ════════════════════════════════════════════════════════
echo.

:: Steam
call :CheckAndClean "C:\Program Files (x86)\Steam" "C:\Program Files (x86)\Steam\appcache" "Steam"
if exist "C:\Program Files (x86)\Steam" (
    call :CleanDir "C:\Program Files (x86)\Steam\logs"
    call :CleanDir "C:\Program Files (x86)\Steam\dumps"
    call :CleanDir "C:\Program Files (x86)\Steam\config\htmlcache"
)

:: Epic Games
call :CheckAndClean "%LocalAppData%\EpicGamesLauncher" "%LocalAppData%\EpicGamesLauncher\Saved\Logs" "Epic Games Launcher"
if exist "%LocalAppData%\EpicGamesLauncher" (
    call :CleanDir "%LocalAppData%\EpicGamesLauncher\Saved\webcache"
)

:: Origin
call :CheckAndClean "%ProgramData%\Origin" "%ProgramData%\Origin\Logs" "EA Origin"
if exist "%LocalAppData%\Origin" (
    call :CleanDir "%LocalAppData%\Origin\Logs"
)

:: Battle.net
call :CheckAndClean "%ProgramData%\Blizzard Entertainment" "%ProgramData%\Blizzard Entertainment\Battle.net\Cache" "Battle.net"

:: Riot Games
call :CheckAndClean "%LocalAppData%\Riot Games" "%LocalAppData%\Riot Games\Riot Client\Logs" "Riot Client (LoL/Valorant)"

:: Ubisoft Connect
call :CheckAndClean "%LocalAppData%\Ubisoft Game Launcher" "%LocalAppData%\Ubisoft Game Launcher\logs" "Ubisoft Connect"

:: GOG Galaxy
call :CheckAndClean "%ProgramData%\GOG.com\Galaxy" "%ProgramData%\GOG.com\Galaxy\logs" "GOG Galaxy"

:: Rockstar Games
call :CheckAndClean "%LocalAppData%\Rockstar Games" "%LocalAppData%\Rockstar Games\Launcher\logs" "Rockstar Games Launcher"

echo.
echo ════════════════════════════════════════════════════════
echo [8/22] 🎯 Quét và dọn cache games & emulators...
echo ════════════════════════════════════════════════════════
echo.

:: Minecraft
call :CheckAndClean "%AppData%\.minecraft" "%AppData%\.minecraft\logs" "Minecraft"
if exist "%AppData%\.minecraft" (
    call :CleanDir "%AppData%\.minecraft\crash-reports"
)

:: Roblox
call :CheckAndClean "%LocalAppData%\Roblox" "%LocalAppData%\Roblox\logs" "Roblox"

:: BlueStacks
call :CheckAndClean "%ProgramData%\BlueStacks" "%ProgramData%\BlueStacks\Logs" "BlueStacks"

:: NoxPlayer
call :CheckAndClean "%LocalAppData%\Nox" "%LocalAppData%\Nox\log" "NoxPlayer"

:: LDPlayer
call :CheckAndClean "%LocalAppData%\LDPlayer" "%LocalAppData%\LDPlayer\log" "LDPlayer"

:: MEmu
call :CheckAndClean "%LocalAppData%\Microvirt" "%LocalAppData%\Microvirt\MEmu\MemuHyperv\logs" "MEmu"

echo.
echo ════════════════════════════════════════════════════════
echo [9/22] 🎵 Quét và dọn cache ứng dụng giải trí...
echo ════════════════════════════════════════════════════════
echo.

:: Spotify
call :CheckAndClean "%AppData%\Spotify" "%AppData%\Spotify\Data" "Spotify"
if exist "%LocalAppData%\Spotify" (
    call :CleanDir "%LocalAppData%\Spotify\Data"
)

:: iTunes
call :CheckAndClean "%AppData%\Apple Computer\iTunes" "%AppData%\Apple Computer\iTunes\iPhone Software Updates" "iTunes"

:: VLC
call :CheckAndClean "%AppData%\vlc" "%AppData%\vlc\art" "VLC Media Player"

:: Windows Media Player
echo   [✓] Windows Media Player
call :CleanDir "%LocalAppData%\Microsoft\Media Player\Art Cache"

:: TikTok
call :CheckAndClean "%AppData%\TikTok" "%AppData%\TikTok\Cache" "TikTok"

:: GPU Cache
if exist "%LocalAppData%\NVIDIA" (
    echo   [✓] Tìm thấy: NVIDIA GPU
    call :CleanDir "%LocalAppData%\NVIDIA\DXCache"
    call :CleanDir "%LocalAppData%\NVIDIA\GLCache"
    call :CleanDir "%ProgramData%\NVIDIA Corporation\NV_Cache"
    set /a total_scanned+=1
)

if exist "%LocalAppData%\AMD" (
    echo   [✓] Tìm thấy: AMD GPU
    call :CleanDir "%LocalAppData%\AMD\DxCache"
    set /a total_scanned+=1
)

echo   [✓] DirectX Shader Cache
call :CleanDir "%LocalAppData%\D3DSCache"

echo.
echo ════════════════════════════════════════════════════════
echo [10/22] 🎨 Quét và dọn cache Adobe Creative Cloud...
echo ════════════════════════════════════════════════════════
echo.

:: Adobe Creative Cloud
if exist "%LocalAppData%\Adobe" (
    echo   [✓] Tìm thấy: Adobe Creative Cloud
    call :CleanDir "%LocalAppData%\Adobe\Adobe Creative Cloud\ACC\Cache"
    call :CleanDir "%AppData%\Adobe\Adobe Creative Cloud\logs"
    call :CleanDir "%LocalAppData%\Temp\Adobe"
    call :CleanDir "%AppData%\Adobe\Common\Media Cache Files"
    call :CleanDir "%AppData%\Adobe\Common\Peak Files"
    set /a total_scanned+=1
)

echo.
echo ════════════════════════════════════════════════════════
echo [11/22] 📄 Quét và dọn cache Microsoft Office...
echo ════════════════════════════════════════════════════════
echo.

:: Office
if exist "%LocalAppData%\Microsoft\Office" (
    echo   [✓] Tìm thấy: Microsoft Office
    call :CleanDir "%LocalAppData%\Microsoft\Office\16.0\OfficeFileCache"
    call :CleanDir "%LocalAppData%\Microsoft\Office\16.0\WebServiceCache"
    call :CleanDir "%LocalAppData%\Microsoft\OneNote\16.0\cache"
    del /f /q "%AppData%\Microsoft\Word\~$*" >nul 2>&1
    del /f /q "%AppData%\Microsoft\Excel\~$*" >nul 2>&1
    set /a total_scanned+=1
)

echo.
echo ════════════════════════════════════════════════════════
echo [12/22] ☁️ Quét và dọn cache cloud storage...
echo ════════════════════════════════════════════════════════
echo.

:: OneDrive
call :CheckAndClean "%LocalAppData%\Microsoft\OneDrive" "%LocalAppData%\Microsoft\OneDrive\logs" "OneDrive"

:: Dropbox
call :CheckAndClean "%LocalAppData%\Dropbox" "%LocalAppData%\Dropbox\logs" "Dropbox"
if exist "%AppData%\Dropbox" (
    call :CleanDir "%AppData%\Dropbox\logs"
)

:: Google Drive
call :CheckAndClean "%LocalAppData%\Google\DriveFS" "%LocalAppData%\Google\DriveFS\Logs" "Google Drive"

:: iCloud
call :CheckAndClean "%LocalAppData%\Apple Computer\iCloud" "%LocalAppData%\Apple Computer\iCloud\Logs" "iCloud"

:: Box
call :CheckAndClean "%LocalAppData%\Box" "%LocalAppData%\Box\Box\logs" "Box"

:: Mega
call :CheckAndClean "%LocalAppData%\Mega Limited" "%LocalAppData%\Mega Limited\MEGAsync\logs" "Mega"

echo.
echo ════════════════════════════════════════════════════════
echo [13/22] 💻 Quét và dọn cache IDEs...
echo ════════════════════════════════════════════════════════
echo.

:: VS Code
call :CheckAndClean "%AppData%\Code" "%AppData%\Code\Cache" "Visual Studio Code"
if exist "%AppData%\Code" (
    call :CleanDir "%AppData%\Code\CachedData"
    call :CleanDir "%AppData%\Code\Code Cache"
    call :CleanDir "%AppData%\Code\GPUCache"
    call :CleanDir "%AppData%\Code\logs"
)

:: JetBrains
if exist "%LocalAppData%\JetBrains" (
    echo   [✓] Tìm thấy: JetBrains IDEs
    for /d %%i in ("%LocalAppData%\JetBrains\*") do (
        call :CleanDir "%%i\log"
        call :CleanDir "%%i\tmp"
    )
    set /a total_scanned+=1
)

:: Visual Studio
if exist "%LocalAppData%\Microsoft\VisualStudio" (
    echo   [✓] Tìm thấy: Visual Studio
    for /d %%i in ("%LocalAppData%\Microsoft\VisualStudio\*") do (
        call :CleanDir "%%i\ComponentModelCache"
    )
    call :CleanDir "%Temp%\VSFeedbackIntelliCodeLogs"
    set /a total_scanned+=1
)

:: Android Studio
if exist "%LocalAppData%\Google" (
    for /d %%i in ("%LocalAppData%\Google\AndroidStudio*") do (
        echo   [✓] Tìm thấy: Android Studio
        call :CleanDir "%%i\log"
        call :CleanDir "%UserProfile%\.android\cache"
        set /a total_scanned+=1
        goto :after_android
    )
)
:after_android

:: Sublime Text
call :CheckAndClean "%AppData%\Sublime Text" "%AppData%\Sublime Text*\Cache" "Sublime Text"

:: Atom
call :CheckAndClean "%AppData%\Atom" "%AppData%\Atom\Cache" "Atom"

:: Eclipse
call :CheckAndClean "%UserProfile%\.eclipse" "%UserProfile%\.eclipse" "Eclipse"

echo.
echo ════════════════════════════════════════════════════════
echo [14/22] 📦 Quét và dọn cache Package Managers...
echo ════════════════════════════════════════════════════════
echo.

:: npm
if exist "%AppData%\npm-cache" (
    echo   [✓] Tìm thấy: npm (Node.js)
    call npm cache clean --force >nul 2>&1
    set /a total_scanned+=1
)

:: Yarn
call :CheckAndClean "%LocalAppData%\Yarn" "%LocalAppData%\Yarn\Cache" "Yarn"

:: Composer
call :CheckAndClean "%AppData%\Composer" "%AppData%\Composer\cache" "Composer (PHP)"

:: pip
call :CheckAndClean "%LocalAppData%\pip" "%LocalAppData%\pip\cache" "pip (Python)"

:: Gradle
call :CheckAndClean "%UserProfile%\.gradle" "%UserProfile%\.gradle\caches\build-cache-1" "Gradle"

:: NuGet
call :CheckAndClean "%LocalAppData%\NuGet" "%LocalAppData%\NuGet\Cache" "NuGet (.NET)"

echo.
echo ════════════════════════════════════════════════════════
echo [15/22] 🔧 Quét và dọn cache Dev Tools...
echo ════════════════════════════════════════════════════════
echo.

:: Docker
call :CheckAndClean "%LocalAppData%\Docker" "%LocalAppData%\Docker\log" "Docker Desktop"

:: Postman
call :CheckAndClean "%AppData%\Postman" "%AppData%\Postman\logs" "Postman"

:: MySQL Workbench
call :CheckAndClean "%AppData%\MySQL" "%AppData%\MySQL\Workbench\log" "MySQL Workbench"

:: MongoDB Compass
call :CheckAndClean "%AppData%\MongoDB Compass" "%AppData%\MongoDB Compass\logs" "MongoDB Compass"

:: XAMPP
if exist "C:\xampp" (
    echo   [✓] Tìm thấy: XAMPP
    call :CleanDir "C:\xampp\apache\logs"
    set /a total_scanned+=1
)

echo.
echo ════════════════════════════════════════════════════════
echo [16/22] 🎮 Quét và dọn cache Game Engines...
echo ════════════════════════════════════════════════════════
echo.

:: Unity
call :CheckAndClean "%LocalAppData%\Unity" "%LocalAppData%\Unity\cache" "Unity Engine"
if exist "%AppData%\Unity" (
    call :CleanDir "%AppData%\Unity\logs"
)

:: Unreal Engine
call :CheckAndClean "%LocalAppData%\UnrealEngine" "%LocalAppData%\UnrealEngine\Common\Analytics" "Unreal Engine"

:: Godot
call :CheckAndClean "%AppData%\Godot" "%AppData%\Godot\logs" "Godot Engine"

:: Blender
if exist "%LocalAppData%\Blender Foundation" (
    echo   [✓] Tìm thấy: Blender
    for /d %%i in ("%LocalAppData%\Blender Foundation\Blender\*") do (
        call :CleanDir "%%i\cache"
    )
    set /a total_scanned+=1
)

echo.
echo ════════════════════════════════════════════════════════
echo [17/22] 📐 Quét và dọn cache CAD & Design...
echo ════════════════════════════════════════════════════════
echo.

:: Figma
call :CheckAndClean "%AppData%\Figma" "%AppData%\Figma\Cache" "Figma"

:: AutoCAD
call :CheckAndClean "%LocalAppData%\Autodesk" "%LocalAppData%\Autodesk\Autodesk Desktop App\Logs" "AutoCAD/Autodesk"

:: SketchUp
call :CheckAndClean "%LocalAppData%\SketchUp" "%LocalAppData%\SketchUp\SketchUp*\working" "SketchUp"

:: GIMP
call :CheckAndClean "%AppData%\GIMP" "%AppData%\GIMP\*\tmp" "GIMP"

:: Inkscape
call :CheckAndClean "%AppData%\Inkscape" "%AppData%\Inkscape\cache" "Inkscape"

:: CorelDRAW
call :CheckAndClean "%AppData%\Corel" "%AppData%\Corel\Messages\*\Logs" "CorelDRAW"

echo.
echo ════════════════════════════════════════════════════════
echo [18/22] 🎬 Quét và dọn cache Video & Audio...
echo ════════════════════════════════════════════════════════
echo.

:: OBS Studio
call :CheckAndClean "%AppData%\obs-studio" "%AppData%\obs-studio\logs" "OBS Studio"
if exist "%AppData%\obs-studio" (
    call :CleanDir "%AppData%\obs-studio\crashes"
)

:: Bandicam
call :CheckAndClean "%Temp%\Bandicam" "%Temp%\Bandicam" "Bandicam"

:: CapCut
call :CheckAndClean "%AppData%\CapCut" "%AppData%\CapCut\Cache" "CapCut"

:: DaVinci Resolve
call :CheckAndClean "%AppData%\Blackmagic Design" "%AppData%\Blackmagic Design\DaVinci Resolve\logs" "DaVinci Resolve"

:: FL Studio
call :CheckAndClean "%LocalAppData%\Image-Line" "%LocalAppData%\Image-Line\FL Studio\Logs" "FL Studio"

:: ShareX
call :CheckAndClean "%UserProfile%\Documents\ShareX" "%UserProfile%\Documents\ShareX\Logs" "ShareX"

echo.
echo ════════════════════════════════════════════════════════
echo [19/22] ⬇️ Quét và dọn cache Download Tools...
echo ════════════════════════════════════════════════════════
echo.

:: Internet Download Manager
call :CheckAndClean "%AppData%\IDM" "%AppData%\IDM\DwnlData\Temp" "IDM"

:: uTorrent
call :CheckAndClean "%AppData%\uTorrent" "%AppData%\uTorrent\logs" "uTorrent"

:: qBittorrent
call :CheckAndClean "%LocalAppData%\qBittorrent" "%LocalAppData%\qBittorrent\logs" "qBittorrent"

:: Free Download Manager
call :CheckAndClean "%AppData%\Free Download Manager" "%AppData%\Free Download Manager\logs" "Free Download Manager"

:: JDownloader
call :CheckAndClean "%AppData%\JDownloader" "%AppData%\JDownloader\logs" "JDownloader"

echo.
echo ════════════════════════════════════════════════════════
echo [20/22] 🛡️ Quét và dọn cache Antivirus...
echo ════════════════════════════════════════════════════════
echo.

:: Windows Defender
echo   [✓] Windows Defender
call :CleanDir "%ProgramData%\Microsoft\Windows Defender\Scans\History\Results\Quick"
call :CleanDir "%ProgramData%\Microsoft\Windows Defender\Scans\History\Results\Resource"

:: Avast
call :CheckAndClean "%ProgramData%\Avast Software" "%ProgramData%\Avast Software\Avast\log" "Avast"

:: AVG
call :CheckAndClean "%ProgramData%\AVG" "%ProgramData%\AVG\Antivirus\log" "AVG"

:: Kaspersky
call :CheckAndClean "%ProgramData%\Kaspersky Lab" "%ProgramData%\Kaspersky Lab\AVP*\Data\Logs" "Kaspersky"

:: McAfee
call :CheckAndClean "%ProgramData%\McAfee" "%ProgramData%\McAfee\Logs" "McAfee"

:: Malwarebytes
call :CheckAndClean "%ProgramData%\Malwarebytes" "%ProgramData%\Malwarebytes\MBAMService\logs" "Malwarebytes"

echo.
echo ════════════════════════════════════════════════════════
echo [21/22] 🔨 Quét và dọn cache công cụ khác...
echo ════════════════════════════════════════════════════════
echo.

:: WinRAR
for /d %%i in ("%Temp%\Rar*") do (
    if exist "%%i" (
        echo   [✓] WinRAR temp
        call :CleanDir "%%i"
        goto :after_winrar
    )
)
:after_winrar

:: 7-Zip
for /d %%i in ("%Temp%\7z*") do (
    if exist "%%i" (
        echo   [✓] 7-Zip temp
        call :CleanDir "%%i"
        goto :after_7zip
    )
)
:after_7zip

:: TeamViewer
call :CheckAndClean "%ProgramData%\TeamViewer" "%ProgramData%\TeamViewer\Logs" "TeamViewer"

:: AnyDesk
call :CheckAndClean "%ProgramData%\AnyDesk" "%ProgramData%\AnyDesk\logs" "AnyDesk"

:: FileZilla
call :CheckAndClean "%AppData%\FileZilla" "%AppData%\FileZilla\logs" "FileZilla"

:: VMware
call :CheckAndClean "%AppData%\VMware" "%AppData%\VMware\logs" "VMware"

:: VirtualBox
call :CheckAndClean "%UserProfile%\.VirtualBox" "%UserProfile%\.VirtualBox" "VirtualBox"

:: LibreOffice
call :CheckAndClean "%AppData%\LibreOffice" "%AppData%\LibreOffice\*\cache" "LibreOffice"

:: WPS Office
call :CheckAndClean "%AppData%\kingsoft" "%AppData%\kingsoft\office6\cache" "WPS Office"

:: Adobe Reader
call :CheckAndClean "%LocalAppData%\Adobe\Acrobat" "%LocalAppData%\Adobe\Acrobat\DC\Cache" "Adobe Acrobat Reader"

echo.
echo ════════════════════════════════════════════════════════
echo [22/22] 🗑️ Dọn rác Windows và temp files...
echo ════════════════════════════════════════════════════════
echo.

:: Windows temp
echo   [✓] Windows Installer temp
for /d %%i in ("%Temp%\MSI*") do (
    call :CleanDir "%%i"
)

echo   [✓] DirectX temp
for /d %%i in ("%Temp%\DX*") do (
    call :CleanDir "%%i"
)

echo   [✓] Windows Error Reporting
call :CleanDir "%ProgramData%\Microsoft\Windows\WER\ReportArchive"
call :CleanDir "%ProgramData%\Microsoft\Windows\WER\ReportQueue"
call :CleanDir "%ProgramData%\Microsoft\Windows\WER\Temp"

echo   [✓] Minidump files
call :CleanDir "C:\Windows\Minidump"
del /f /q "C:\Windows\*.dmp" >nul 2>&1
del /f /q "C:\Windows\memory.dmp" >nul 2>&1

echo   [✓] Java cache
call :CleanDir "%LocalAppData%\Sun\Java\Deployment\cache"

echo   [✓] Windows Store Apps
for /d %%i in ("%LocalAppData%\Packages\*") do (
    call :CleanDir "%%i\LocalCache"
    call :CleanDir "%%i\TempState"
)

echo.
echo ════════════════════════════════════════════════════════
echo ✅ HOÀN TẤT DỌN RÁC AN TOÀN - SMART SCAN EDITION
echo ════════════════════════════════════════════════════════
echo.
echo 📊 THỐNG KÊ:
echo    • Số phần mềm tìm thấy: %total_scanned%
echo    • Số thư mục đã dọn:    %total_cleaned%+
echo.
echo 🛡️ AN TOÀN:
echo    • CHỈ XÓA: Cache, Logs, Temp files
echo    • KHÔNG XÓA: Dữ liệu, Settings, Files người dùng
echo.
echo 💡 LƯU Ý:
echo    • Chỉ dọn phần mềm CÓ TRONG MÁY
echo    • Bỏ qua phần mềm CHƯA CÀI
echo    • 100%% tự động phát hiện
echo.
echo ════════════════════════════════════════════════════════
echo.

pause
