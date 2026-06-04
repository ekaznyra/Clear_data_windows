#Requires -Version 5.1
param(
    [ValidateSet('Menu','Safe','Recommended','Deep','Scan')][string]$Mode = 'Menu',
    [switch]$ScanOnly,
    [switch]$AllUsers,
    [switch]$Yes,
    [switch]$LargeFiles,
    [switch]$AutoScan,
    [switch]$AutoClean,
    [int]$LargeFileMB = 1024
)

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::InputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
$Script:Version = '3.5.0'
$Script:LogDir = Join-Path $PSScriptRoot 'logs'
$Script:RulesFile = Join-Path $PSScriptRoot 'cleanup-rules.json'
$Script:LogFile = Join-Path $Script:LogDir ('cleanup_' + (Get-Date -Format 'yyyy-MM-dd_HH-mm-ss') + '.log')
$Script:LastScan = @()

function VN { param([int[]]$Codes) -join ($Codes | ForEach-Object { [char]$_ }) }
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
    @{ Id=1;  Mode='Safe'; Name='Temp User'; Type='MultiPath'; Paths=@(LocalPath 'Temp'); MinAgeHours=2; RequireAdmin=$false; Description='Temp moi user' },
    @{ Id=2;  Mode='Recommended'; Name='Temp System'; Type='FolderContents'; Path='C:\Windows\Temp'; MinAgeHours=24; RequireAdmin=$true; Description='Temp Windows' },
    @{ Id=3;  Mode='Recommended'; Name='Recycle Bin'; Type='RecycleBin'; Path=''; MinAgeHours=0; RequireAdmin=$false; Description='Thung rac' },
    @{ Id=4;  Mode='Safe'; Name='Chrome Cache'; Type='ChromiumCache'; Paths=@(LocalPath 'Google\Chrome\User Data'); RequireAdmin=$false; Description='Chrome tat ca profile' },
    @{ Id=5;  Mode='Safe'; Name='Edge Cache'; Type='ChromiumCache'; Paths=@(LocalPath 'Microsoft\Edge\User Data'); RequireAdmin=$false; Description='Edge tat ca profile' },
    @{ Id=6;  Mode='Safe'; Name='Brave Cache'; Type='ChromiumCache'; Paths=@(LocalPath 'BraveSoftware\Brave-Browser\User Data'); RequireAdmin=$false; Description='Brave cache' },
    @{ Id=7;  Mode='Safe'; Name='Firefox Cache'; Type='FirefoxCache'; Paths=@(LocalPath 'Mozilla\Firefox\Profile'); RequireAdmin=$false; Description='Firefox cache' },
    @{ Id=8;  Mode='Safe'; Name='Opera Cache'; Type='OperaCache'; Paths=@(RoamPath 'Opera Software'); RequireAdmin=$false; Description='Opera/Opera GX cache' },
    @{ Id=9;  Mode='Safe'; Name='Thumbnails Cache'; Type='Thumbnails'; Paths=@(LocalPath 'Microsoft\Windows\Explorer'); RequireAdmin=$false; Description='Explorer thumbs' },
    @{ Id=10; Mode='Safe'; Name='DirectX Shader Cache'; Type='MultiPath'; Paths=@(LocalPath 'D3DSCache'); MinAgeHours=24; RequireAdmin=$false; Description='DirectX shader' },
    @{ Id=11; Mode='Safe'; Name='INetCache'; Type='MultiPath'; Paths=@(LocalPath 'Microsoft\Windows\INetCache'); MinAgeHours=24; RequireAdmin=$false; Description='Windows web cache' },
    @{ Id=12; Mode='Recommended'; Name='Recent Files'; Type='MultiPath'; Paths=@(RoamPath 'Microsoft\Windows\Recent'); MinAgeHours=0; RequireAdmin=$false; Description='Shortcut gan day' },
    @{ Id=13; Mode='Recommended'; Name='Windows Error Reports'; Type='MultiPath'; Paths=@(LocalPath 'Microsoft\Windows\WER'); MinAgeHours=24; RequireAdmin=$false; Description='Bao cao loi' },
    @{ Id=14; Mode='Recommended'; Name='Delivery Optimization'; Type='MultiPath'; Paths=@(LocalPath 'Microsoft\Windows\DeliveryOptimization'); MinAgeHours=24; RequireAdmin=$false; Description='Cache Delivery Optimization' },
    @{ Id=15; Mode='Deep'; Name='Prefetch'; Type='FolderContents'; Path='C:\Windows\Prefetch'; MinAgeHours=24; RequireAdmin=$true; Description='Prefetch se tu tao lai' },
    @{ Id=16; Mode='Deep'; Name='Windows Logs tam'; Type='WindowsLogs'; Path='C:\Windows\Logs'; MinAgeHours=168; RequireAdmin=$true; Description='Chi .log/.tmp/.etl cu' },
    @{ Id=17; Mode='Deep'; Name='DISM Component Cleanup'; Type='DISM'; Path=''; RequireAdmin=$true; Description='DISM chinh thuc Windows' },
    @{ Id=18; Mode='Recommended'; Name='Windows Update Cache'; Type='FolderContents'; Path='C:\Windows\SoftwareDistribution\Download'; MinAgeHours=24; RequireAdmin=$true; Description='Cache update da tai' },
    @{ Id=19; Mode='Safe'; Name='CrashDumps'; Type='MultiPath'; Paths=@(LocalPath 'CrashDumps'); MinAgeHours=24; RequireAdmin=$false; Description='Dump loi app' },
    @{ Id=20; Mode='Safe'; Name='NVIDIA Cache'; Type='MultiPath'; Paths=@((LocalPath 'NVIDIA\DXCache')+(LocalPath 'NVIDIA\GLCache')+(LocalPath 'NVIDIA Corporation\NV_Cache')); MinAgeHours=24; RequireAdmin=$false; Description='GPU cache NVIDIA' },
    @{ Id=21; Mode='Safe'; Name='AMD Cache'; Type='MultiPath'; Paths=@((LocalPath 'AMD\DxCache')+(LocalPath 'AMD\GLCache')); MinAgeHours=24; RequireAdmin=$false; Description='GPU cache AMD' },
    @{ Id=22; Mode='Safe'; Name='Discord Cache'; Type='MultiPath'; Paths=@((RoamPath 'discord\Cache')+(RoamPath 'discord\Code Cache')+(RoamPath 'discord\GPUCache')); MinAgeHours=24; RequireAdmin=$false; Description='Discord cache' },
    @{ Id=23; Mode='Safe'; Name='Teams Cache'; Type='MultiPath'; Paths=@((RoamPath 'Microsoft\Teams\Cache')+(RoamPath 'Microsoft\Teams\Code Cache')+(RoamPath 'Microsoft\Teams\GPUCache')); MinAgeHours=24; RequireAdmin=$false; Description='Teams cache' },
    @{ Id=24; Mode='Safe'; Name='VS Code Cache'; Type='MultiPath'; Paths=@((RoamPath 'Code\Cache')+(RoamPath 'Code\CachedData')+(RoamPath 'Code\GPUCache')); MinAgeHours=24; RequireAdmin=$false; Description='VS Code cache' },
    @{ Id=25; Mode='Safe'; Name='Telegram Cache'; Type='MultiPath'; Paths=@((RoamPath 'Telegram Desktop\tdata\user_data\cache')+(RoamPath 'Telegram Desktop\tdata\user_data\media_cache')); MinAgeHours=24; RequireAdmin=$false; Description='Telegram cache' },
    @{ Id=26; Mode='Safe'; Name='Package Caches'; Type='MultiPath'; Paths=@((LocalPath 'npm-cache')+(LocalPath 'pip\Cache')+(UserPath '.nuget\packages')+(LocalPath 'Yarn\Cache')+(LocalPath 'pnpm-store')+(RoamPath 'Composer\Cache')+(UserPath '.gradle\caches')+(UserPath '.m2\repository')+(UserPath '.cargo\registry\cache')+(LocalPath 'go-build')); MinAgeHours=168; RequireAdmin=$false; Description='npm/pip/nuget/yarn/pnpm/composer/gradle/maven/cargo/go' },
    @{ Id=27; Mode='Safe'; Name='Slack Cache'; Type='MultiPath'; Paths=@((RoamPath 'Slack\Cache')+(RoamPath 'Slack\Code Cache')+(RoamPath 'Slack\GPUCache')); MinAgeHours=24; RequireAdmin=$false; Description='Slack cache' },
    @{ Id=28; Mode='Safe'; Name='Zoom Cache'; Type='MultiPath'; Paths=@((RoamPath 'Zoom\data\Cache')+(RoamPath 'Zoom\data\Code Cache')+(RoamPath 'Zoom\data\GPUCache')); MinAgeHours=24; RequireAdmin=$false; Description='Zoom cache' },
    @{ Id=29; Mode='Safe'; Name='Spotify Cache'; Type='MultiPath'; Paths=@((LocalPath 'Spotify\Storage')+(RoamPath 'Spotify\Browser\Cache')); MinAgeHours=24; RequireAdmin=$false; Description='Spotify cache' },
    @{ Id=30; Mode='Safe'; Name='Steam Shader Cache'; Type='MultiPath'; Paths=@((LocalPath 'Steam\htmlcache')+(UserPath 'AppData\Local\Steam\shadercache')); MinAgeHours=168; RequireAdmin=$false; Description='Steam cache nhe' },
    @{ Id=31; Mode='Safe'; Name='Epic Launcher Cache'; Type='MultiPath'; Paths=@((LocalPath 'EpicGamesLauncher\Saved\webcache')+(LocalPath 'EpicGamesLauncher\Saved\webcache_4430')+(LocalPath 'EpicGamesLauncher\Saved\Logs')); MinAgeHours=24; RequireAdmin=$false; Description='Epic cache/log' },
    @{ Id=32; Mode='Safe'; Name='BattleNet Cache'; Type='MultiPath'; Paths=@((LocalPath 'Battle.net\Cache')+(LocalPath 'Blizzard Entertainment\Battle.net\Cache')); MinAgeHours=24; RequireAdmin=$false; Description='Battle.net cache' },
    @{ Id=33; Mode='Safe'; Name='Adobe Cache'; Type='MultiPath'; Paths=@((RoamPath 'Adobe\Common\Media Cache')+(RoamPath 'Adobe\Common\Media Cache Files')+(LocalPath 'Adobe\Acrobat\DC\Cache')); MinAgeHours=168; RequireAdmin=$false; Description='Adobe media/acrobat cache' },
    @{ Id=34; Mode='Safe'; Name='VLC Cache'; Type='MultiPath'; Paths=@(RoamPath 'vlc\art'); MinAgeHours=168; RequireAdmin=$false; Description='VLC art cache' },
    @{ Id=35; Mode='Safe'; Name='JetBrains Cache'; Type='MultiPath'; Paths=@((LocalPath 'JetBrains') | ForEach-Object { if (Test-Path $_) { Get-ChildItem $_ -Directory -ErrorAction SilentlyContinue | ForEach-Object { Join-Path $_.FullName 'caches' } } }); MinAgeHours=168; RequireAdmin=$false; Description='JetBrains IDE caches' },
    @{ Id=36; Mode='Safe'; Name='Android Studio Cache'; Type='MultiPath'; Paths=@((LocalPath 'Google\AndroidStudio') | ForEach-Object { if (Test-Path $_) { Get-ChildItem $_ -Directory -ErrorAction SilentlyContinue | ForEach-Object { Join-Path $_.FullName 'caches' } } }); MinAgeHours=168; RequireAdmin=$false; Description='Android Studio caches' },
    @{ Id=37; Mode='Recommended'; Name='Windows Minidump'; Type='MultiPath'; Paths=@('C:\Windows\Minidump','C:\Windows\LiveKernelReports'); MinAgeHours=168; RequireAdmin=$true; Description='Dump loi Windows cu' }
)

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

function Test-PathAllowedForCleanup {
    param([string]$Path)
    if ([string]::IsNullOrWhiteSpace($Path) -or -not (Test-Path $Path)) { return $false }
    $full = Resolve-FullPathSafe $Path
    if (-not $full) { return $false }
    $protected = @($env:SystemDrive,$env:WINDIR,(Join-Path $env:WINDIR 'System32'),(Join-Path $env:WINDIR 'SysWOW64'),$env:ProgramFiles,${env:ProgramFiles(x86)}) + (Get-UserRoots | ForEach-Object { @($_,(Join-Path $_ 'Desktop'),(Join-Path $_ 'Documents'),(Join-Path $_ 'Downloads'),(Join-Path $_ 'Pictures'),(Join-Path $_ 'Videos'),(Join-Path $_ 'Music')) })
    foreach ($p in ($protected | Where-Object { $_ } | ForEach-Object { Resolve-FullPathSafe $_ })) { if ($full -ieq $p) { return $false } }
    $markers = @('\Temp','\Cache','\Code Cache','\GPUCache','\CacheStorage','\Media Cache','\Storage','\D3DSCache','\INetCache','\Recent','\WER','\DeliveryOptimization','\Prefetch','\Windows\Logs','\SoftwareDistribution\Download','\CrashDumps','\DXCache','\GLCache','\NV_Cache','\DxCache','\shadercache','\webcache','\htmlcache','\Saved\Logs','\Minidump','\LiveKernelReports','\npm-cache','\pip\Cache','\.nuget\packages','\Yarn\Cache','\pnpm-store','\Composer\Cache','\.gradle\caches','\.m2\repository','\.cargo\registry\cache','\go-build','\art','\caches')
    foreach ($m in $markers) { if ($full -like "*$m*") { return $true } }
    return $false
}

function Get-ChromiumCachePaths { param([array]$Roots) $paths=@(); foreach ($root in $Roots) { if (Test-Path $root) { Get-ChildItem $root -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -match '^(Default|Profile \d+|Guest Profile|System Profile)$' } | ForEach-Object { foreach ($sub in @('Cache','Code Cache','GPUCache','Service Worker\CacheStorage','Media Cache')) { $p=Join-Path $_.FullName $sub; if (Test-Path $p) { $paths += $p } } } } }; $paths }
function Get-FirefoxCachePaths { param([array]$Roots) $paths=@(); foreach ($root in $Roots) { if (Test-Path $root) { Get-ChildItem $root -Directory -ErrorAction SilentlyContinue | ForEach-Object { foreach ($sub in @('cache2','startupCache','OfflineCache')) { $p=Join-Path $_.FullName $sub; if (Test-Path $p) { $paths += $p } } } } }; $paths }
function Get-OperaCachePaths { param([array]$Roots) $paths=@(); foreach ($root in $Roots) { if (Test-Path $root) { Get-ChildItem $root -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like 'Opera*' } | ForEach-Object { foreach ($sub in @('Cache','Code Cache','GPUCache','Service Worker\CacheStorage','Media Cache')) { $p=Join-Path $_.FullName $sub; if (Test-Path $p) { $paths += $p } } } } }; $paths }
function Get-TargetPaths { param($Target) switch ($Target.Type) { 'ChromiumCache' { @(Get-ChromiumCachePaths $Target.Paths) } 'FirefoxCache' { @(Get-FirefoxCachePaths $Target.Paths) } 'OperaCache' { @(Get-OperaCachePaths $Target.Paths) } 'MultiPath' { @($Target.Paths | Where-Object { $_ -and (Test-Path $_) }) } default { if ($Target.Path) { @($Target.Path) } else { @() } } } }

function Get-ItemsForPath {
    param([string]$Path,[int]$MinAgeHours=0,[string[]]$Extensions=@())
    if (-not (Test-PathAllowedForCleanup $Path)) { Write-Log "BLOCKED unsafe path: $Path"; return @() }
    $cutoff = (Get-Date).AddHours(-1 * $MinAgeHours)
    if ($Extensions.Count -gt 0) { $items = Get-ChildItem $Path -Recurse -File -Force -ErrorAction SilentlyContinue | Where-Object { $Extensions -contains $_.Extension.ToLowerInvariant() } }
    else { $items = Get-ChildItem $Path -Force -ErrorAction SilentlyContinue }
    if ($MinAgeHours -gt 0) { $items = $items | Where-Object { $_.LastWriteTime -lt $cutoff } }
    @($items)
}

function Get-PathSizeFromItems { param([array]$Items) $size=0L; $file=0; foreach ($item in $Items) { try { if ($item.PSIsContainer) { $child=Get-ChildItem -LiteralPath $item.FullName -Recurse -File -Force -ErrorAction SilentlyContinue; if ($child) { $m=$child|Measure-Object Length -Sum; $size += [long]$m.Sum; $file += $child.Count } } else { $size += [long]$item.Length; $file++ } } catch {} }; @{Size=$size;FileCount=$file;ItemCount=@($Items).Count} }
function Get-RecycleBinSize { $r=@{Size=0L;FileCount=0;ItemCount=0}; try { Get-PSDrive -PSProvider FileSystem | ForEach-Object { $p=Join-Path $_.Root '$Recycle.Bin'; if(Test-Path $p){ $f=Get-ChildItem $p -Recurse -File -Force -ErrorAction SilentlyContinue; if($f){$m=$f|Measure-Object Length -Sum; $r.Size+=[long]$m.Sum; $r.FileCount+=$f.Count; $r.ItemCount+=$f.Count}} } } catch {}; $r }
function Get-TargetScanResult { param($Target) if($Target.Type -eq 'RecycleBin'){return Get-RecycleBinSize}; if($Target.Type -eq 'DISM'){return @{Size=0L;FileCount=0;ItemCount=0;Note='DISM tinh khi chay'}}; $total=@{Size=0L;FileCount=0;ItemCount=0}; $ext=if($Target.Type -eq 'WindowsLogs'){@('.log','.tmp','.etl')}else{@()}; foreach($path in (Get-TargetPaths $Target)){ $x=Get-PathSizeFromItems (Get-ItemsForPath $path ([int]$Target.MinAgeHours) $ext); $total.Size+=$x.Size; $total.FileCount+=$x.FileCount; $total.ItemCount+=$x.ItemCount }; $total }

function Show-Banner { Clear-Host; Write-Host ''; Write-Host '    ==========================================================' -ForegroundColor Cyan; Write-Host '    CLEAR DATA WINDOWS - SAFE POWER CLEANER' -ForegroundColor Yellow; Write-Host "    $(VN @(80,104,105,234,110,32,98,7843,110)) $Script:Version | $(Get-Date -Format 'dd/MM/yyyy HH:mm')" -ForegroundColor DarkGray; if(Test-AdminRights){Write-Host "    $(VN @(81,117,121,7873,110)): Administrator" -ForegroundColor Green}else{Write-Host "    $(VN @(81,117,121,7873,110)): $(VN @(85,115,101,114,32,116,104,432,7901,110,103)) ($(VN @(109,7909,99,32,65,100,109,105,110,47,65,108,108,85,115,101,114,115,32,115,7869,32,98,7883,32,98,7887,32,113,117,97)))" -ForegroundColor Yellow}; Write-Host "    $(VN @(81,117,233,116,32,116,114,432,7899,99,32,45,32,120,225,99,32,110,104,7853,110,32,109,7899,105,32,120,111,225,32,45,32,99,104,7881,32,100,7885,110,32,99,97,99,104,101,47,116,101,109,112,32,97,110,32,116,111,224,110))" -ForegroundColor DarkGray; Write-Host '    ==========================================================' -ForegroundColor Cyan; Write-Host '' }
function Show-Menu { Write-Host '    MENU' -ForegroundColor Cyan; Write-Host "      [1] $(VN @(81,117,233,116,32,116,7845,116,32,99,7843,32,118,224,32,120,101,109,32,100,117,110,103,32,108,432,7907,110,103))"; Write-Host "      [2] $(VN @(68,7885,110,32,100,7865,112)) $(VN @(65,78,32,84,79,192,78)) (Safe)" -ForegroundColor Green; Write-Host "      [3] $(VN @(68,7885,110,32,100,7865,112)) $(VN @(272,7872,32,88,85,7844,84)) (Safe + Recommended)" -ForegroundColor Yellow; Write-Host "      [4] $(VN @(68,7885,110,32,100,7865,112)) $(VN @(83,194,85)) (Deep)" -ForegroundColor Red; Write-Host "      [5] $(VN @(67,104,7885,110,32,116,7915,110,103,32,109,7909,99))"; Write-Host "      [6] $(VN @(88,101,109,32,108,7883,99,104,32,115,7917))"; Write-Host "      [7] $(VN @(77,7903,32,108,111,103,115))"; Write-Host "      [8] $(VN @(84,104,244,110,103,32,116,105,110,32,7893,32,273,297,97))"; Write-Host "      [9] $(VN @(84,7841,111)) Restore Point"; Write-Host "      [10] $(VN @(81,117,233,116,32,102,105,108,101,32,108,7899,110)) ($(VN @(107,104,244,110,103,32,120,111,225)))"; Write-Host "      [11] $(VN @(84,7841,111,32,108,7883,99,104,32,100,7885,110,32,104,7857,110,103,32,116,117,7847,110))"; Write-Host "      [12] $(VN @(84,7841,111,32,108,7883,99,104,32,116,7921,32,113,117,233,116,32,104,7857,110,103,32,110,103,224,121))"; Write-Host "      [13] $(VN @(65,117,116,111,32,99,108,101,97,110,32,116,104,244,110,103,32,109,105,110,104,32,110,103,97,121,32,98,226,121,32,103,105,7901))"; Write-Host '      [14] Network/WiFi: xem thong tin'; Write-Host '      [15] Network/WiFi: toi uu nhe'; Write-Host '      [16] Network/WiFi: reset sau (can reboot)'; Write-Host "      [0] $(VN @(84,104,111,225,116))" -ForegroundColor DarkGray; Write-Host '' }
function Show-ProgressBar {
    param([int]$Current,[int]$Total,[string]$Activity='ang x l')
    if($Total -le 0){$Total=1}
    $pct=[math]::Min(100,[math]::Round(($Current/$Total)*100))
    $len=30
    $fill=[math]::Round($len*$pct/100)
    Write-Host ("`r    $Activity ["+('#'*$fill)+('-'*($len-$fill))+"] $pct%   ") -NoNewline
    if($Current -eq $Total){Write-Host ''}
}

function Get-IdsByMode { param([string[]]$Modes) @($Script:CleanupTargets | Where-Object { $Modes -contains $_.Mode } | ForEach-Object { [int]$_.Id }) }

function Invoke-Scan {
    param([int[]]$TargetIds=@())
    $targets=if($TargetIds.Count){$Script:CleanupTargets|Where-Object{$TargetIds -contains $_.Id}}else{$Script:CleanupTargets}
    $admin=Test-AdminRights
    $res=@(); $i=0
    foreach($t in $targets){
        $i++
        Show-ProgressBar $i @($targets).Count "Qut: $($t.Name)"
        if($t.RequireAdmin -and -not $admin){
            $res += [pscustomobject]@{Id=$t.Id;Mode=$t.Mode;Name=$t.Name;Size=0L;FileCount=0;Skipped=$true;Note='Cn Admin'}
            continue
        }
        $x=Get-TargetScanResult $t
        $res += [pscustomobject]@{Id=$t.Id;Mode=$t.Mode;Name=$t.Name;Size=[long]$x.Size;FileCount=[int]$x.FileCount;Skipped=$false;Note=$x.Note}
    }
    Write-Host ''
    $Script:LastScan=$res
    $res
}

function Show-ScanResults {
    param([array]$Results)
    $total=0L; $file=0
    Write-Host ''
    Write-Host '    +----+-------------+------------------------------+--------------+----------+' -ForegroundColor DarkCyan
    Write-Host '    | #  | Ch       | Mc                          | Dung lng   | File     |' -ForegroundColor DarkCyan
    Write-Host '    +----+-------------+------------------------------+--------------+----------+' -ForegroundColor DarkCyan
    foreach($r in $Results){
        $total+=$r.Size; $file+=$r.FileCount
        $size=if($r.Skipped){'B QUA'}else{Format-FileSize $r.Size}
        Write-Host ("    | {0,2} | {1,-11} | {2,-28} | {3,-12} | {4,8} |" -f $r.Id,$r.Mode,$r.Name,$size,$r.FileCount)
    }
    Write-Host '    +----+-------------+------------------------------+--------------+----------+' -ForegroundColor DarkCyan
    Write-Host ("    Tng c th dn: {0} / {1} file" -f (Format-FileSize $total),$file) -ForegroundColor Green
    Write-Host ''
    @{TotalSize=$total;TotalFiles=$file}
}

function Show-RunningAppWarnings {
    $names=@('chrome','msedge','firefox','brave','opera','discord','teams','code','steam','slack','telegram','zoom','spotify','EpicGamesLauncher','Battle.net')
    $running=@()
    foreach($n in $names){ if(Get-Process -Name $n -ErrorAction SilentlyContinue){$running+=$n} }
    if($running.Count){
        Write-Host "    ng dng ang m: $($running -join ', ')" -ForegroundColor Yellow
        Write-Host '    Nn ng ng dng  xo cache c nhiu hn. Cng c khng t tt ng dng.' -ForegroundColor DarkYellow
    }
}

function Remove-SafeItems { param([string]$Path,[int]$MinAgeHours=0,[string[]]$Extensions=@()) $deleted=0; foreach($item in (Get-ItemsForPath $Path $MinAgeHours $Extensions)){ try{ Remove-Item -LiteralPath $item.FullName -Recurse -Force -ErrorAction SilentlyContinue; $deleted++ }catch{} }; $deleted }

function Invoke-Clean {
    param([int[]]$TargetIds)
    $admin=Test-AdminRights; $total=0L; $file=0; $i=0
    Write-Log '=== BT U DN DP ==='
    foreach($id in $TargetIds){
        $t=$Script:CleanupTargets|Where-Object{$_.Id -eq $id}
        if(-not $t){continue}
        $i++
        if($t.RequireAdmin -and -not $admin){Write-Host "    [SKIP] $($t.Name) - can Admin" -ForegroundColor DarkYellow; continue}
        Show-ProgressBar $i $TargetIds.Count "Don: $($t.Name)"
        $before=Get-TargetScanResult $t; $deleted=0
        try{
            switch($t.Type){
                'RecycleBin'{Clear-RecycleBin -Force -ErrorAction SilentlyContinue; $deleted=$before.FileCount}
                'DISM'{dism.exe /Online /Cleanup-Image /StartComponentCleanup | Out-Null; $deleted=1}
                'WindowsLogs'{foreach($p in (Get-TargetPaths $t)){$deleted+=Remove-SafeItems $p ([int]$t.MinAgeHours) @('.log','.tmp','.etl')}}
                default{foreach($p in (Get-TargetPaths $t)){$deleted+=Remove-SafeItems $p ([int]$t.MinAgeHours)}}
            }
            $total+=$before.Size; $file+=$before.FileCount
            Write-Host "    [OK] $($t.Name): $(Format-FileSize $before.Size)" -ForegroundColor Green
            Write-Log "OK: $($t.Name) - $(Format-FileSize $before.Size) - file=$($before.FileCount) - mc  xo=$deleted"
        }catch{
            Write-Host "    [LOI] $($t.Name): $($_.Exception.Message)" -ForegroundColor Red
            Write-Log "LOI: $($t.Name) - $($_.Exception.Message)"
        }
    }
    Write-Host "`n    Hon tt: $(Format-FileSize $total) / $file file" -ForegroundColor Green
    Write-Log "Tong giai phong: $(Format-FileSize $total) - Tong file: $file"
    Write-Log '---'
}

function Confirm-And-Clean {
    param([int[]]$Ids,[string]$Title)
    Show-Banner
    Write-Host "    $Title" -ForegroundColor Yellow
    Show-RunningAppWarnings
    $r=Invoke-Scan $Ids
    $s=Show-ScanResults $r
    if($ScanOnly){return}
    if($s.TotalSize -le 0 -and -not ($r|Where-Object{$_.Name -eq 'DISM Component Cleanup'})){Write-Host '    Khng c g cn dn.' -ForegroundColor Green; return}
    if(-not $Yes){Write-Host '    Nhp YES  xc nhn xo cache/temp: ' -NoNewline -ForegroundColor Yellow; if((Read-Host) -ne 'YES'){Write-Host '     hu.' -ForegroundColor DarkGray; return}}
    $clean=@($r|Where-Object{-not $_.Skipped -and ($_.Size -gt 0 -or $_.Name -eq 'DISM Component Cleanup')}|ForEach-Object{$_.Id})
    if($clean.Count){Invoke-Clean $clean}
}

function Show-SelectMenu {
    Write-Host '    Chn mc cn dn (vd: 1,2,4 hoac all):' -ForegroundColor Cyan
    foreach($t in $Script:CleanupTargets){
        $a=if($t.RequireAdmin){' [Admin]'}else{''}
        Write-Host ("      [{0,2}] {1,-11} {2} - {3}{4}" -f $t.Id,$t.Mode,$t.Name,$t.Description,$a)
    }
    Write-Host '    Nhp: ' -NoNewline -ForegroundColor Yellow
    $text=Read-Host
    if($text -match '^(all|tat ca)$'){return @($Script:CleanupTargets|ForEach-Object{[int]$_.Id})}
    @($text -split '[,\s]+' | Where-Object{$_ -match '^\d+$'} | ForEach-Object{[int]$_} | Where-Object{$Script:CleanupTargets.Id -contains $_})
}

function Show-CleanupHistory {
    if(-not(Test-Path $Script:LogDir)){Write-Host '    Cha c log.'; return}
    Get-ChildItem $Script:LogDir -Filter 'cleanup_*.log' -File | Sort-Object LastWriteTime -Descending | Select-Object -First 10 | ForEach-Object{
        $sum=Get-Content $_.FullName -Encoding UTF8 -ErrorAction SilentlyContinue | Where-Object{$_ -match 'Tong giai phong:'} | Select-Object -Last 1
        Write-Host "    $($_.Name)  $sum"
    }
}
function Open-LogsFolder { Ensure-LogDir; Start-Process explorer.exe -ArgumentList $Script:LogDir }
function Show-DiskInfo { Get-PSDrive -PSProvider FileSystem | Sort-Object Name | ForEach-Object{ $total=$_.Used+$_.Free; if($total -gt 0){Write-Host ("    {0}: free {1} / total {2}" -f $_.Name,(Format-FileSize $_.Free),(Format-FileSize $total))} } }
function New-SafeRestorePoint { if(-not(Test-AdminRights)){Write-Host '    Cn Admin.' -ForegroundColor Yellow; return}; try{Checkpoint-Computer -Description 'Before Clear Data Windows cleanup' -RestorePointType 'MODIFY_SETTINGS'; Write-Host '     to Restore Point.' -ForegroundColor Green}catch{Write-Host "    Khng to c: $($_.Exception.Message)" -ForegroundColor Yellow} }
function Find-LargeFiles { param([int]$MinMB=1024) Ensure-LogDir; $report=Join-Path $Script:LogDir ('large_file_'+(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss')+'.txt'); $min=[int64]$MinMB*1MB; $roots=@(Get-UserRoots); Write-Host "    ang tm file >= $MinMB MB (khng xo)..." -ForegroundColor Cyan; $file=@(); foreach($root in $roots){$file += Get-ChildItem $root -Recurse -File -Force -ErrorAction SilentlyContinue | Where-Object{$_.Length -ge $min}}; $file|Sort-Object Length -Descending|Select-Object -First 200|ForEach-Object{ '{0,12}  {1}' -f (Format-FileSize $_.Length),$_.FullName } | Set-Content $report -Encoding UTF8; Write-Host "    Report: $report" -ForegroundColor Green }
function Register-WeeklyCleanupTask { if(-not(Test-AdminRights)){Write-Host '    Cn Admin.' -ForegroundColor Yellow; return}; $scriptPath=(Join-Path $PSScriptRoot 'ClearData.ps1'); $action=New-ScheduledTaskAction -Execute 'powershell.exe' -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`" -Mode Recommended -Yes"; $trigger=New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At 10am; Register-ScheduledTask -TaskName 'ClearDataWindowsWeekly' -Action $action -Trigger $trigger -Description 'Weekly safe Windows cache cleanup' -Force | Out-Null; Write-Host '     to lch: Sunday 10:00, Recommended.' -ForegroundColor Green }

function Export-ScanReport {
    param([array]$Results)
    Ensure-LogDir
    $report = Join-Path $Script:LogDir ('scan_report_' + (Get-Date -Format 'yyyy-MM-dd_HH-mm-ss') + '.txt')
    $lines = @()
    $lines += "Clear Data Windows scan report - $(Get-Date)"
    $lines += "Mode: scan only, no delete"
    $lines += ""
    foreach ($r in ($Results | Sort-Object Size -Descending)) {
        $lines += ('{0,12}  {1,8} files  [{2}] {3}' -f (Format-FileSize $r.Size), $r.FileCount, $r.Mode, $r.Name)
    }
    $lines | Set-Content -Path $report -Encoding UTF8
    Write-Host "    Scan report: $report" -ForegroundColor Green
    Write-Log "Scan report: $report"
    return $report
}

function Invoke-AutoScan {
    Write-Host '    AUTO SCAN: chi quet, khng xo.' -ForegroundColor Cyan
    $r = Invoke-Scan
    Show-ScanResults $r | Out-Null
    Export-ScanReport $r | Out-Null
}

function Invoke-SmartAutoClean {
    Write-Host '    AUTO CLEAN THNG MINH: ch dn Safe + Recommended c dung lng > 0.' -ForegroundColor Yellow
    Show-RunningAppWarnings
    $ids = Get-IdsByMode @('Safe','Recommended')
    $r = Invoke-Scan $ids
    Show-ScanResults $r | Out-Null
    Export-ScanReport $r | Out-Null
    $clean = @($r | Where-Object { -not $_.Skipped -and $_.Size -gt 0 } | Sort-Object Size -Descending | ForEach-Object { $_.Id })
    if (-not $clean.Count) { Write-Host '    Khng c rc ph hp  xo.' -ForegroundColor Green; return }
    if (-not $Yes) {
        Write-Host '    Cng c  lc danh sch cn xo. Nhp YES  xo cc mc trn: ' -NoNewline -ForegroundColor Yellow
        if ((Read-Host) -ne 'YES') { Write-Host '    Da huy, khng xo gi.' -ForegroundColor DarkGray; return }
    }
    Invoke-Clean $clean
}

function Register-DailyAutoScanTask {
    if (-not (Test-AdminRights)) { Write-Host '    Cn Admin.' -ForegroundColor Yellow; return }
    $scriptPath = Join-Path $PSScriptRoot 'ClearData.ps1'
    $action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`" -AutoScan"
    $trigger = New-ScheduledTaskTrigger -Daily -At 9am
    Register-ScheduledTask -TaskName 'ClearDataWindowsDailyScan' -Action $action -Trigger $trigger -Description 'Daily scan only, no delete' -Force | Out-Null
    Write-Host '     to lch tu quet hang ngay: 09:00, khng xo.' -ForegroundColor Green
}

function Show-NetworkInfo {
    Write-Host ''
    Write-Host '    NETWORK / WIFI INFO' -ForegroundColor Cyan
    Write-Host '    ----------------------------------------------------------' -ForegroundColor DarkCyan
    try {
        Get-NetAdapter -Physical -ErrorAction SilentlyContinue | Sort-Object Status,Name | ForEach-Object {
            Write-Host ("    Adapter: {0} | Status: {1} | Link: {2}" -f $_.Name,$_.Status,$_.LinkSpeed) -ForegroundColor White
        }
    } catch { Write-Host '    Khong doc duoc Get-NetAdapter.' -ForegroundColor Yellow }
    Write-Host ''
    Write-Host '    IP config:' -ForegroundColor Cyan
    try { ipconfig | Select-String -Pattern 'adapter|IPv4|Default Gateway|DNS Servers' | ForEach-Object { Write-Host ('    ' + $_.Line.Trim()) } } catch {}
    Write-Host ''
    Write-Host '    WiFi signal/profile:' -ForegroundColor Cyan
    try { netsh wlan show interfaces | Select-String -Pattern 'Name|State|SSID|Signal|Radio type|Channel|Receive rate|Transmit rate' | ForEach-Object { Write-Host ('    ' + $_.Line.Trim()) } } catch {}
    Write-Host ''
}

function Optimize-NetworkLight {
    Write-Host ''
    Write-Host '    TOI UU NETWORK/WIFI NHE' -ForegroundColor Cyan
    Write-Host '    Tac vu an toan: flush DNS, renew IP, refresh ARP/NetBIOS.' -ForegroundColor DarkGray
    Write-Host '    Nhap YES de thuc hien: ' -NoNewline -ForegroundColor Yellow
    if ((Read-Host) -ne 'YES') { Write-Host '    Da huy.' -ForegroundColor DarkGray; return }
    try { ipconfig /flushdns | Out-Null; Write-Host '    [OK] Flush DNS' -ForegroundColor Green } catch { Write-Host '    [LOI] Flush DNS' -ForegroundColor Red }
    try { arp -d * | Out-Null; Write-Host '    [OK] Clear ARP cache' -ForegroundColor Green } catch { Write-Host '    [SKIP] Clear ARP cache' -ForegroundColor Yellow }
    try { nbtstat -R | Out-Null; nbtstat -RR | Out-Null; Write-Host '    [OK] Refresh NetBIOS cache' -ForegroundColor Green } catch { Write-Host '    [SKIP] NetBIOS refresh' -ForegroundColor Yellow }
    try { ipconfig /release | Out-Null; ipconfig /renew | Out-Null; Write-Host '    [OK] Renew IP DHCP' -ForegroundColor Green } catch { Write-Host '    [SKIP] Renew IP DHCP' -ForegroundColor Yellow }
    Write-Host '    Hoan tat toi uu nhe.' -ForegroundColor Green
}

function Reset-NetworkDeep {
    Write-Host ''
    Write-Host '    RESET NETWORK SAU' -ForegroundColor Red
    Write-Host '    Se chay: winsock reset, ip reset, reset proxy winhttp, flush DNS.' -ForegroundColor Yellow
    Write-Host '    Luu y: can khoi dong lai may. Co the lam mat cau hinh IP tinh/VPN/proxy tuy bien.' -ForegroundColor Yellow
    Write-Host '    Nhap RESET de xac nhan: ' -NoNewline -ForegroundColor Red
    if ((Read-Host) -ne 'RESET') { Write-Host '    Da huy.' -ForegroundColor DarkGray; return }
    if (-not (Test-AdminRights)) { Write-Host '    Can chay Administrator.' -ForegroundColor Yellow; return }
    try { netsh winsock reset | Out-Null; Write-Host '    [OK] Winsock reset' -ForegroundColor Green } catch { Write-Host '    [LOI] Winsock reset' -ForegroundColor Red }
    try { netsh int ip reset | Out-Null; Write-Host '    [OK] IP stack reset' -ForegroundColor Green } catch { Write-Host '    [LOI] IP stack reset' -ForegroundColor Red }
    try { netsh winhttp reset proxy | Out-Null; Write-Host '    [OK] WinHTTP proxy reset' -ForegroundColor Green } catch { Write-Host '    [SKIP] WinHTTP proxy reset' -ForegroundColor Yellow }
    try { ipconfig /flushdns | Out-Null; Write-Host '    [OK] Flush DNS' -ForegroundColor Green } catch {}
    Write-Host '    Xong. Hay khoi dong lai may de ap dung day du.' -ForegroundColor Green
}

function Pause-Back { Write-Host ''; Write-Host '    ENTER  quay li...' -NoNewline -ForegroundColor DarkGray; Read-Host | Out-Null }

function Start-MainLoop {
    Ensure-LogDir; Add-ExternalRules
    while($true){
        Show-Banner; Show-Menu
        Write-Host "    $(VN @(76,7921,97,32,99,104,7885,110)): " -NoNewline -ForegroundColor Yellow
        $c=Read-Host
        switch($c){
            '1'{$r=Invoke-Scan; Show-ScanResults $r|Out-Null; Pause-Back}
            '2'{Confirm-And-Clean (Get-IdsByMode @('Safe')) 'DN DP AN TON'; Pause-Back}
            '3'{Confirm-And-Clean (Get-IdsByMode @('Safe','Recommended')) 'DN DP  XUT'; Pause-Back}
            '4'{Confirm-And-Clean (Get-IdsByMode @('Safe','Recommended','Deep')) 'DN DP SU'; Pause-Back}
            '5'{$ids=Show-SelectMenu; if($ids.Count){Confirm-And-Clean $ids 'DN DP TU CHN'}; Pause-Back}
            '6'{Show-CleanupHistory; Pause-Back}
            '7'{Open-LogsFolder; Pause-Back}
            '8'{Show-DiskInfo; Pause-Back}
            '9'{New-SafeRestorePoint; Pause-Back}
            '10'{Find-LargeFiles $LargeFileMB; Pause-Back}
            '11'{Register-WeeklyCleanupTask; Pause-Back}
            '12'{Register-DailyAutoScanTask; Pause-Back}
            '13'{Invoke-SmartAutoClean; Pause-Back}
            '14'{Show-NetworkInfo; Pause-Back}
            '15'{Optimize-NetworkLight; Pause-Back}
            '16'{Reset-NetworkDeep; Pause-Back}
            '0'{return}
            default{Write-Host '    Sai la chn.' -ForegroundColor Red; Start-Sleep 1}
        }
    }
}
[Console]::OutputEncoding=[System.Text.Encoding]::UTF8
$OutputEncoding=[System.Text.Encoding]::UTF8
Ensure-LogDir
Add-ExternalRules
if($LargeFiles){ Find-LargeFiles $LargeFileMB; return }
if($AutoScan){ Invoke-AutoScan; return }
if($AutoClean){ Invoke-SmartAutoClean; return }
if($Mode -ne 'Menu'){
    $ids = switch($Mode){ 'Safe' { Get-IdsByMode @('Safe') } 'Recommended' { Get-IdsByMode @('Safe','Recommended') } 'Deep' { Get-IdsByMode @('Safe','Recommended','Deep') } 'Scan' { @() } }
    if($Mode -eq 'Scan' -or $ScanOnly){ $r=Invoke-Scan; Show-ScanResults $r|Out-Null; return }
    Confirm-And-Clean $ids "DON DEP $Mode"
    return
}
Start-MainLoop
