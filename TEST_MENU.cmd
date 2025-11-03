@echo off
chcp 65001 >nul 2>&1
title Test - Ultimate Windows System Tool

:MAIN_MENU
cls
color 0B
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                  ULTIMATE WINDOWS SYSTEM TOOL v2.0                       ║
echo ║                   Complete System Optimization Suite                     ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  🧹 SYSTEM CLEANUP                                                       │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [1]  Quick System Cleanup                                              │
echo  │  [2]  Deep System Cleanup                                               │
echo  │  [3]  Browser Cache Cleanup                                             │
echo  │  [4]  Application Cache Cleanup                                         │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  ⚡ SYSTEM OPTIMIZATION                                                  │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [5]  Performance Boost                                                 │
echo  │  [6]  Memory (RAM) Optimization                                         │
echo  │  [7]  Network Optimization                                              │
echo  │  [8]  Disk Optimization                                                 │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  🔧 REPAIR AND MAINTENANCE                                               │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [9]  Automatic Windows Repair                                          │
echo  │  [10] Fix Windows Update Issues                                         │
echo  │  [11] Network Reset and Repair                                          │
echo  │  [12] Disk Check and Repair                                             │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  🛡️ SECURITY AND PRIVACY                                                │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [13] Privacy Cleanup (Remove Traces)                                   │
echo  │  [14] Startup Programs Manager                                          │
echo  │  [15] Malware Scan and Cleanup                                          │
echo  │  [16] Security Optimization                                             │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  📊 SYSTEM INFORMATION                                                   │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [17] Detailed System Information                                       │
echo  │  [18] Disk Space Analysis                                               │
echo  │  [19] Running Processes Monitor                                         │
echo  │  [20] System Health Check                                               │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌─────────────────────────────────────────────────────────────────────────┐
echo  │  🔥 ADVANCED TOOLS                                                       │
echo  ├─────────────────────────────────────────────────────────────────────────┤
echo  │  [21] Create System Restore Point                                       │
echo  │  [22] Delete Windows.old Folder                                         │
echo  │  [23] Disable Windows Telemetry                                         │
echo  │  [24] Registry Optimization                                             │
echo  │  [25] ALL-IN-ONE Complete Optimization                                  │
echo  └─────────────────────────────────────────────────────────────────────────┘
echo.
echo  [0]  Exit                                   [99] Reset Windows to Default
echo.
set /p choice="  ► Select function (0-25): "

if "%choice%"=="0" exit
if "%choice%"=="1" goto TEST_FUNCTION
if "%choice%"=="2" goto TEST_FUNCTION
if "%choice%"=="3" goto TEST_FUNCTION
if "%choice%"=="4" goto TEST_FUNCTION
if "%choice%"=="5" goto TEST_FUNCTION
goto MAIN_MENU

:TEST_FUNCTION
cls
echo.
echo ════════════════════════════════════════════
echo   TEST MODE - Function %choice% selected
echo ════════════════════════════════════════════
echo.
echo ✅ Menu system working correctly!
echo ✅ All text is in English!
echo ✅ Ready to use on Windows!
echo.
echo This is a test version to verify the menu works.
echo The actual UltimateSystemTool.cmd has all 25 functions.
echo.
pause
goto MAIN_MENU
