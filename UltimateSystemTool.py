#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Ultimate Windows System Tool v4.0 - GUI Edition
Professional System Optimization Suite with Modern UI
Based on open-source tools: BleachBit, CCleaner, PrivaZer
"""

import customtkinter as ctk
import tkinter as tk
from tkinter import messagebox, scrolledtext
import subprocess
import threading
import sys
import os
import ctypes

# Set appearance
ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")


class SystemTool(ctk.CTk):
    def __init__(self):
        super().__init__()

        # Window configuration
        self.title("Ultimate Windows System Tool v4.0 - Professional Edition")
        self.geometry("1200x800")
        self.iconbitmap_default = None
        
        # Check admin rights
        self.is_admin = self.check_admin()
        
        # Create UI
        self.create_widgets()
        
    def check_admin(self):
        """Check if running with admin privileges"""
        try:
            return ctypes.windll.shell32.IsUserAnAdmin()
        except:
            return False
    
    def elevate_privileges(self):
        """Request admin privileges"""
        if not self.is_admin:
            ctypes.windll.shell32.ShellExecuteW(
                None, "runas", sys.executable, " ".join(sys.argv), None, 1
            )
            sys.exit()
    
    def create_widgets(self):
        """Create main UI layout"""
        # Header
        self.header_frame = ctk.CTkFrame(self, height=80)
        self.header_frame.pack(fill="x", padx=10, pady=10)
        self.header_frame.pack_propagate(False)
        
        self.title_label = ctk.CTkLabel(
            self.header_frame,
            text="??? ULTIMATE WINDOWS SYSTEM TOOL v4.0",
            font=ctk.CTkFont(size=24, weight="bold")
        )
        self.title_label.pack(pady=10)
        
        self.subtitle_label = ctk.CTkLabel(
            self.header_frame,
            text="Complete System Optimization Suite - Song Ng? Anh-Vi?t",
            font=ctk.CTkFont(size=14)
        )
        self.subtitle_label.pack()
        
        # Admin status
        admin_text = "? Admin Rights" if self.is_admin else "?? Not Admin - Click to elevate"
        self.admin_label = ctk.CTkLabel(
            self.header_frame,
            text=admin_text,
            font=ctk.CTkFont(size=12),
            text_color="green" if self.is_admin else "red"
        )
        self.admin_label.pack(pady=5)
        if not self.is_admin:
            self.admin_label.bind("<Button-1>", lambda e: self.elevate_privileges())
            self.admin_label.configure(cursor="hand2")
        
        # Main content area with tabs
        self.tabview = ctk.CTkTabview(self, width=1180)
        self.tabview.pack(fill="both", expand=True, padx=10, pady=10)
        
        # Create tabs
        self.tab_cleanup = self.tabview.add("?? System Cleanup")
        self.tab_privacy = self.tabview.add("?? Privacy")
        self.tab_network = self.tabview.add("?? Network")
        self.tab_disk = self.tabview.add("?? Disk")
        self.tab_performance = self.tabview.add("? Performance")
        self.tab_maintenance = self.tabview.add("?? Maintenance")
        self.tab_registry = self.tabview.add("?? Registry")
        self.tab_advanced = self.tabview.add("?? Advanced")
        
        # Populate tabs
        self.create_cleanup_tab()
        self.create_privacy_tab()
        self.create_network_tab()
        self.create_disk_tab()
        self.create_performance_tab()
        self.create_maintenance_tab()
        self.create_registry_tab()
        self.create_advanced_tab()
        
        # Log area
        self.log_frame = ctk.CTkFrame(self)
        self.log_frame.pack(fill="both", expand=True, padx=10, pady=(0, 10))
        
        self.log_label = ctk.CTkLabel(
            self.log_frame,
            text="?? Activity Log - Nh?t k? ho?t ??ng",
            font=ctk.CTkFont(size=14, weight="bold")
        )
        self.log_label.pack(pady=5)
        
        self.log_text = scrolledtext.ScrolledText(
            self.log_frame,
            height=8,
            bg="#1e1e1e",
            fg="#00ff00",
            font=("Consolas", 10)
        )
        self.log_text.pack(fill="both", expand=True, padx=10, pady=5)
        
        # Progress bar
        self.progress = ctk.CTkProgressBar(self)
        self.progress.pack(fill="x", padx=10, pady=5)
        self.progress.set(0)
        
        # Status bar
        self.status_label = ctk.CTkLabel(
            self,
            text="Ready - S?n s?ng",
            font=ctk.CTkFont(size=12)
        )
        self.status_label.pack(pady=5)
    
    def create_cleanup_tab(self):
        """System Cleanup Tab - 12 functions"""
        title = ctk.CTkLabel(
            self.tab_cleanup,
            text="?? SYSTEM CLEANUP - D?N D?P H? TH?NG",
            font=ctk.CTkFont(size=16, weight="bold")
        )
        title.grid(row=0, column=0, columnspan=3, pady=10)
        
        buttons = [
            ("Quick Cleanup\nD?n D?p Nhanh", self.quick_cleanup),
            ("Deep Cleanup\nD?n D?p S?u", self.deep_cleanup),
            ("Browser Cache\nCache Tr?nh Duy?t", self.browser_cache),
            ("App Cache\nCache ?ng D?ng", self.app_cache),
            ("Windows Update\nWindows Update", self.windows_update_cleanup),
            ("Thumbnail Cache\nThumbnail Cache", self.thumbnail_cache),
            ("Icon Cache\nIcon Cache", self.icon_cache),
            ("Font Cache\nFont Cache", self.font_cache),
            ("Installer Cache\nWindows Installer", self.installer_cleanup),
            ("Old Windows\nWindows C?", self.old_windows),
            ("Recycle Bin\nTh?ng R?c", self.recycle_bin),
            ("Memory Dumps\nFile Dump", self.memory_dump),
        ]
        
        for i, (text, command) in enumerate(buttons):
            btn = ctk.CTkButton(
                self.tab_cleanup,
                text=text,
                command=command,
                width=200,
                height=60
            )
            btn.grid(row=i//3+1, column=i%3, padx=10, pady=10)
    
    def create_privacy_tab(self):
        """Privacy Protection Tab - 8 functions"""
        title = ctk.CTkLabel(
            self.tab_privacy,
            text="?? PRIVACY PROTECTION - B?O V? RI?NG T?",
            font=ctk.CTkFont(size=16, weight="bold")
        )
        title.grid(row=0, column=0, columnspan=3, pady=10)
        
        buttons = [
            ("Recent Documents\nT?i Li?u G?n ??y", self.recent_docs),
            ("Run History\nL?ch S? Run", self.run_history),
            ("Search History\nL?ch S? T?m Ki?m", self.search_history),
            ("Clipboard History\nL?ch S? Clipboard", self.clipboard_history),
            ("Error Reports\nB?o C?o L?i", self.error_reports),
            ("Disable Telemetry\nT?t Thu Th?p D? Li?u", self.disable_telemetry),
            ("Clear Event Logs\nX?a Nh?t K? S? Ki?n", self.event_logs),
            ("Clear DNS Cache\nX?a Cache DNS", self.dns_cache),
        ]
        
        for i, (text, command) in enumerate(buttons):
            btn = ctk.CTkButton(
                self.tab_privacy,
                text=text,
                command=command,
                width=200,
                height=60
            )
            btn.grid(row=i//3+1, column=i%3, padx=10, pady=10)
    
    def create_network_tab(self):
        """Network Optimization Tab - 6 functions"""
        title = ctk.CTkLabel(
            self.tab_network,
            text="?? NETWORK OPTIMIZATION - T?I ?U M?NG",
            font=ctk.CTkFont(size=16, weight="bold")
        )
        title.grid(row=0, column=0, columnspan=3, pady=10)
        
        buttons = [
            ("Reset Network\nReset C?i ??t M?ng", self.reset_network),
            ("Optimize Network\nT?i ?u Hi?u Su?t M?ng", self.optimize_network),
            ("Clear ARP Cache\nX?a Cache ARP", self.arp_cache),
            ("Reset Winsock\nReset Winsock", self.winsock_reset),
            ("Renew IP\nL?m M?i ??a Ch? IP", self.renew_ip),
            ("Fix Adapter\nS?a Card M?ng", self.fix_adapter),
        ]
        
        for i, (text, command) in enumerate(buttons):
            btn = ctk.CTkButton(
                self.tab_network,
                text=text,
                command=command,
                width=200,
                height=60
            )
            btn.grid(row=i//3+1, column=i%3, padx=10, pady=10)
    
    def create_disk_tab(self):
        """Disk Management Tab - 6 functions"""
        title = ctk.CTkLabel(
            self.tab_disk,
            text="?? DISK MANAGEMENT - QU?N L? ? ??A",
            font=ctk.CTkFont(size=16, weight="bold")
        )
        title.grid(row=0, column=0, columnspan=3, pady=10)
        
        buttons = [
            ("Disk Cleanup\nD?n D?p ? ??a", self.disk_cleanup),
            ("Disk Check\nKi?m Tra L?i", self.disk_check),
            ("Optimize Disk\nT?i ?u ? ??a", self.disk_optimize),
            ("Analyze Space\nPh?n T?ch Dung L??ng", self.disk_space),
            ("Clean Windows.old\nX?a Windows.old", self.windows_old),
            ("Compact OS\nN?n H? Th?ng", self.compact_os),
        ]
        
        for i, (text, command) in enumerate(buttons):
            btn = ctk.CTkButton(
                self.tab_disk,
                text=text,
                command=command,
                width=200,
                height=60
            )
            btn.grid(row=i//3+1, column=i%3, padx=10, pady=10)
    
    def create_performance_tab(self):
        """Performance Optimization Tab - 12 functions"""
        title = ctk.CTkLabel(
            self.tab_performance,
            text="? PERFORMANCE OPTIMIZATION - T?I ?U HI?U SU?T",
            font=ctk.CTkFont(size=16, weight="bold")
        )
        title.grid(row=0, column=0, columnspan=3, pady=10)
        
        buttons = [
            ("Disable Startup\nT?t Kh?i ??ng", self.disable_startup),
            ("Optimize Services\nT?i ?u D?ch V?", self.optimize_services),
            ("Clear Prefetch\nX?a Prefetch", self.prefetch),
            ("Clear SuperFetch\nX?a SuperFetch", self.superfetch),
            ("Disable Effects\nT?t Hi?u ?ng", self.visual_effects),
            ("Power Plan\nCh? ?? Ngu?n", self.power_plan),
            ("Disable Hibernation\nT?t Ng? ??ng", self.hibernation),
            ("Clear Memory\nX?a Cache B? Nh?", self.memory_cache),
            ("Optimize Search\nT?i ?u T?m Ki?m", self.search_index),
            ("Disable Animations\nT?t Ho?t ?nh", self.animations),
            ("Optimize SSD\nT?i ?u SSD", self.ssd_optimize),
            ("Reduce Menu Delay\nGi?m Tr? Menu", self.menu_delay),
        ]
        
        for i, (text, command) in enumerate(buttons):
            btn = ctk.CTkButton(
                self.tab_performance,
                text=text,
                command=command,
                width=200,
                height=60
            )
            btn.grid(row=i//3+1, column=i%3, padx=10, pady=10)
    
    def create_maintenance_tab(self):
        """System Maintenance Tab - 6 functions"""
        title = ctk.CTkLabel(
            self.tab_maintenance,
            text="?? SYSTEM MAINTENANCE - B?O TR? H? TH?NG",
            font=ctk.CTkFont(size=16, weight="bold")
        )
        title.grid(row=0, column=0, columnspan=3, pady=10)
        
        buttons = [
            ("SFC Scan\nKi?m Tra File H? Th?ng", self.sfc_scan),
            ("DISM Repair\nS?a Ch?a DISM", self.dism_repair),
            ("Component Cleanup\nD?n D?p Th?nh Ph?n", self.component_cleanup),
            ("Update Drivers\nC?p Nh?t Driver", self.update_drivers),
            ("Rebuild Icon Cache\nX?y D?ng L?i Icon", self.rebuild_icon),
            ("Rebuild Search\nX?y D?ng L?i T?m Ki?m", self.rebuild_search),
        ]
        
        for i, (text, command) in enumerate(buttons):
            btn = ctk.CTkButton(
                self.tab_maintenance,
                text=text,
                command=command,
                width=200,
                height=60
            )
            btn.grid(row=i//3+1, column=i%3, padx=10, pady=10)
    
    def create_registry_tab(self):
        """Registry Optimization Tab - 5 functions"""
        title = ctk.CTkLabel(
            self.tab_registry,
            text="?? REGISTRY OPTIMIZATION - T?I ?U REGISTRY",
            font=ctk.CTkFont(size=16, weight="bold")
        )
        title.grid(row=0, column=0, columnspan=3, pady=10)
        
        buttons = [
            ("Clean Registry\nD?n D?p Registry", self.clean_registry),
            ("Optimize Registry\nT?i ?u Registry", self.optimize_registry),
            ("Backup Registry\nSao L?u Registry", self.backup_registry),
            ("Disable Cortana\nT?t Cortana", self.disable_cortana),
            ("Disable Tips\nT?t G?i ? Windows", self.disable_tips),
        ]
        
        for i, (text, command) in enumerate(buttons):
            btn = ctk.CTkButton(
                self.tab_registry,
                text=text,
                command=command,
                width=200,
                height=60
            )
            btn.grid(row=i//3+1, column=i%3, padx=10, pady=10)
    
    def create_advanced_tab(self):
        """Advanced Tools Tab - 11 functions"""
        title = ctk.CTkLabel(
            self.tab_advanced,
            text="?? ADVANCED TOOLS - C?NG C? N?NG CAO",
            font=ctk.CTkFont(size=16, weight="bold")
        )
        title.grid(row=0, column=0, columnspan=3, pady=10)
        
        buttons = [
            ("Restore Point\nT?o ?i?m Kh?i Ph?c", self.restore_point),
            ("System Info\nTh?ng Tin H? Th?ng", self.system_info),
            ("Export Programs\nXu?t Danh S?ch", self.export_programs),
            ("Disk Health\nS?c Kh?e ? ??a", self.disk_health),
            ("Store Cache\nCache Windows Store", self.store_cache),
            ("Reset Update\nReset Windows Update", self.reset_update),
            ("Boot Time\nT?i ?u Kh?i ??ng", self.boot_time),
            ("Clean All Temp\nX?a T?t C? File T?m", self.all_temp),
            ("System Report\nT?o B?o C?o", self.system_report),
            ("?? RUN ALL CLEANUP\nCH?Y T?T C? D?N D?P", self.run_all_cleanup),
            ("? FULL OPTIMIZE\nT?I ?U TO?N B?", self.full_optimize),
        ]
        
        for i, (text, command) in enumerate(buttons):
            btn = ctk.CTkButton(
                self.tab_advanced,
                text=text,
                command=command,
                width=200,
                height=60,
                fg_color="darkgreen" if i >= 9 else None
            )
            btn.grid(row=i//3+1, column=i%3, padx=10, pady=10)
    
    # ==========================================================================
    # UTILITY FUNCTIONS
    # ==========================================================================
    
    def log(self, message):
        """Add message to log"""
        self.log_text.insert(tk.END, f"{message}\n")
        self.log_text.see(tk.END)
        self.update()
    
    def run_command(self, command, description):
        """Run command in separate thread"""
        if not self.is_admin:
            messagebox.showwarning(
                "Admin Required",
                "This function requires Administrator rights!\n"
                "Ch?c n?ng n?y c?n quy?n Administrator!"
            )
            return
        
        def task():
            self.status_label.configure(text=f"Running: {description}")
            self.log(f"\n[*] {description}")
            self.progress.set(0.3)
            
            try:
                if isinstance(command, list):
                    for i, cmd in enumerate(command):
                        self.log(f"    Executing: {cmd[:80]}...")
                        result = subprocess.run(
                            cmd,
                            shell=True,
                            capture_output=True,
                            text=True,
                            timeout=300
                        )
                        if result.stdout:
                            self.log(f"    {result.stdout[:200]}")
                        self.progress.set(0.3 + (0.6 * (i+1)/len(command)))
                else:
                    result = subprocess.run(
                        command,
                        shell=True,
                        capture_output=True,
                        text=True,
                        timeout=300
                    )
                    if result.stdout:
                        self.log(f"    {result.stdout[:200]}")
                
                self.progress.set(1.0)
                self.log(f"[?] Completed: {description}")
                self.status_label.configure(text="? Done - Ho?n th?nh")
                
                messagebox.showinfo(
                    "Success",
                    f"? {description}\nCompleted successfully!\nHo?n th?nh th?nh c?ng!"
                )
            except subprocess.TimeoutExpired:
                self.log(f"[!] Timeout: {description}")
                self.status_label.configure(text="?? Timeout")
                messagebox.showwarning("Timeout", "Operation took too long!")
            except Exception as e:
                self.log(f"[?] Error: {str(e)}")
                self.status_label.configure(text="? Error - L?i")
                messagebox.showerror("Error", f"Error: {str(e)}")
            finally:
                self.progress.set(0)
        
        threading.Thread(target=task, daemon=True).start()
    
    # ==========================================================================
    # SYSTEM CLEANUP FUNCTIONS
    # ==========================================================================
    
    def quick_cleanup(self):
        commands = [
            'del /f /s /q "%TEMP%\\*" 2>nul',
            'del /f /s /q "C:\\Windows\\Temp\\*" 2>nul',
            'rd /s /q C:\\$Recycle.Bin 2>nul',
            'ipconfig /flushdns',
            'del /f /s /q C:\\Windows\\Prefetch\\* 2>nul',
        ]
        self.run_command(commands, "Quick System Cleanup - D?n D?p Nhanh")
    
    def deep_cleanup(self):
        commands = [
            'del /f /s /q "%TEMP%\\*" 2>nul',
            'del /f /s /q "C:\\Windows\\Temp\\*" 2>nul',
            'del /f /s /q C:\\Windows\\Logs\\* 2>nul',
            'net stop wuauserv',
            'del /f /s /q C:\\Windows\\SoftwareDistribution\\Download\\* 2>nul',
            'net start wuauserv',
            'Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase',
        ]
        self.run_command(commands, "Deep System Cleanup - D?n D?p S?u")
    
    def browser_cache(self):
        commands = [
            'taskkill /F /IM chrome.exe 2>nul',
            'taskkill /F /IM msedge.exe 2>nul',
            'taskkill /F /IM firefox.exe 2>nul',
            'timeout /t 2',
            'del /f /s /q "%LocalAppData%\\Google\\Chrome\\User Data\\Default\\Cache\\*" 2>nul',
            'del /f /s /q "%LocalAppData%\\Microsoft\\Edge\\User Data\\Default\\Cache\\*" 2>nul',
            'del /f /s /q "%LocalAppData%\\Mozilla\\Firefox\\Profiles\\*.default\\cache2\\*" 2>nul',
        ]
        self.run_command(commands, "Browser Cache Cleanup - Cache Tr?nh Duy?t")
    
    def app_cache(self):
        commands = [
            'taskkill /F /IM Teams.exe 2>nul',
            'taskkill /F /IM Discord.exe 2>nul',
            'del /f /s /q "%AppData%\\Microsoft\\Teams\\Cache\\*" 2>nul',
            'del /f /s /q "%AppData%\\Discord\\Cache\\*" 2>nul',
            'del /f /s /q "%AppData%\\Slack\\Cache\\*" 2>nul',
            'del /f /s /q "%AppData%\\Spotify\\Storage\\*" 2>nul',
        ]
        self.run_command(commands, "Application Cache Cleanup - Cache ?ng D?ng")
    
    def windows_update_cleanup(self):
        commands = [
            'net stop wuauserv',
            'net stop bits',
            'del /f /s /q C:\\Windows\\SoftwareDistribution\\Download\\* 2>nul',
            'net start wuauserv',
            'net start bits',
            'Dism.exe /online /Cleanup-Image /StartComponentCleanup',
        ]
        self.run_command(commands, "Windows Update Cleanup")
    
    def thumbnail_cache(self):
        commands = [
            'taskkill /F /IM explorer.exe',
            'del /f /a /q "%LocalAppData%\\Microsoft\\Windows\\Explorer\\thumbcache_*.db" 2>nul',
            'start explorer.exe',
        ]
        self.run_command(commands, "Thumbnail Cache Cleanup")
    
    def icon_cache(self):
        commands = [
            'taskkill /F /IM explorer.exe',
            'del /f /a /q "%LocalAppData%\\IconCache.db" 2>nul',
            'del /f /a /q "%LocalAppData%\\Microsoft\\Windows\\Explorer\\iconcache_*.db" 2>nul',
            'start explorer.exe',
        ]
        self.run_command(commands, "Icon Cache Cleanup")
    
    def font_cache(self):
        commands = [
            'net stop "Windows Font Cache Service"',
            'del /f /s /q C:\\Windows\\ServiceProfiles\\LocalService\\AppData\\Local\\FontCache\\* 2>nul',
            'del /f /a /q C:\\Windows\\System32\\FNTCACHE.DAT 2>nul',
            'net start "Windows Font Cache Service"',
        ]
        self.run_command(commands, "Font Cache Cleanup")
    
    def installer_cleanup(self):
        commands = [
            'del /f /s /q C:\\Windows\\Installer\\$PatchCache$\\* 2>nul',
        ]
        self.run_command(commands, "Windows Installer Cleanup")
    
    def old_windows(self):
        if messagebox.askyesno("Confirm", "Delete Windows.old folder?\nX?a th? m?c Windows.old?"):
            commands = [
                'takeown /F C:\\Windows.old\\* /R /A /D Y',
                'icacls C:\\Windows.old\\*.* /T /grant administrators:F',
                'rd /s /q C:\\Windows.old',
                'Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase',
            ]
            self.run_command(commands, "Old Windows Installation Cleanup")
    
    def recycle_bin(self):
        commands = [
            'rd /s /q C:\\$Recycle.Bin 2>nul',
            'rd /s /q D:\\$Recycle.Bin 2>nul',
            'rd /s /q E:\\$Recycle.Bin 2>nul',
        ]
        self.run_command(commands, "Recycle Bin Cleanup - Th?ng R?c")
    
    def memory_dump(self):
        commands = [
            'del /f /q C:\\Windows\\MEMORY.DMP 2>nul',
            'del /f /q C:\\Windows\\Minidump\\*.dmp 2>nul',
            'del /f /s /q C:\\ProgramData\\Microsoft\\Windows\\WER\\* 2>nul',
        ]
        self.run_command(commands, "Memory Dump Files Cleanup")
    
    # ==========================================================================
    # PRIVACY PROTECTION FUNCTIONS
    # ==========================================================================
    
    def recent_docs(self):
        commands = [
            'del /f /s /q "%AppData%\\Microsoft\\Windows\\Recent\\*" 2>nul',
            'reg delete "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\RecentDocs" /f 2>nul',
        ]
        self.run_command(commands, "Clear Recent Documents")
    
    def run_history(self):
        self.run_command(
            'reg delete "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\RunMRU" /f 2>nul',
            "Clear Run History"
        )
    
    def search_history(self):
        commands = [
            'reg delete "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\WordWheelQuery" /f 2>nul',
            'reg delete "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\TypedPaths" /f 2>nul',
        ]
        self.run_command(commands, "Clear Search History")
    
    def clipboard_history(self):
        commands = [
            'echo off | clip',
            'del /f /s /q "%LocalAppData%\\Microsoft\\Windows\\Clipboard\\*" 2>nul',
        ]
        self.run_command(commands, "Clear Clipboard History")
    
    def error_reports(self):
        commands = [
            'del /f /s /q C:\\ProgramData\\Microsoft\\Windows\\WER\\* 2>nul',
            'reg add "HKLM\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f',
        ]
        self.run_command(commands, "Clear Windows Error Reports")
    
    def disable_telemetry(self):
        commands = [
            'sc config DiagTrack start= disabled',
            'sc stop DiagTrack',
            'sc config dmwappushservice start= disabled',
            'sc stop dmwappushservice',
            'reg add "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f',
        ]
        self.run_command(commands, "Disable Telemetry and Tracking")
    
    def event_logs(self):
        self.run_command(
            'for /f "tokens=*" %G in (\'wevtutil.exe el\') do wevtutil.exe cl "%G" 2>nul',
            "Clear Event Logs"
        )
    
    def dns_cache(self):
        self.run_command('ipconfig /flushdns', "Clear DNS Cache")
    
    # ==========================================================================
    # NETWORK OPTIMIZATION FUNCTIONS
    # ==========================================================================
    
    def reset_network(self):
        commands = [
            'netsh int ip reset',
            'netsh winsock reset',
            'ipconfig /flushdns',
            'ipconfig /release',
            'ipconfig /renew',
        ]
        self.run_command(commands, "Reset Network Settings")
    
    def optimize_network(self):
        commands = [
            'netsh int tcp set global autotuninglevel=normal',
            'netsh int tcp set global rsc=enabled',
            'reg add "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f',
        ]
        self.run_command(commands, "Optimize Network Performance")
    
    def arp_cache(self):
        self.run_command('netsh interface ip delete arpcache', "Clear ARP Cache")
    
    def winsock_reset(self):
        commands = [
            'netsh winsock reset',
            'netsh int ip reset',
        ]
        self.run_command(commands, "Reset Winsock")
    
    def renew_ip(self):
        commands = [
            'ipconfig /release',
            'ipconfig /renew',
            'ipconfig /flushdns',
        ]
        self.run_command(commands, "Renew IP Address")
    
    def fix_adapter(self):
        commands = [
            'netsh interface set interface "Ethernet" admin=disable',
            'netsh interface set interface "Wi-Fi" admin=disable',
            'timeout /t 3',
            'netsh interface set interface "Ethernet" admin=enable',
            'netsh interface set interface "Wi-Fi" admin=enable',
        ]
        self.run_command(commands, "Fix Network Adapter")
    
    # ==========================================================================
    # DISK MANAGEMENT FUNCTIONS
    # ==========================================================================
    
    def disk_cleanup(self):
        self.run_command('cleanmgr /sagerun:1', "Disk Cleanup")
    
    def disk_check(self):
        self.run_command('chkdsk C: /f /r /x', "Disk Error Check")
    
    def disk_optimize(self):
        self.run_command('defrag /C /O /H /U', "Disk Optimization")
    
    def disk_space(self):
        self.run_command('wmic logicaldisk get caption,size,freespace', "Analyze Disk Space")
    
    def windows_old(self):
        if messagebox.askyesno("Confirm", "Clean Windows.old folder?\nX?a th? m?c Windows.old?"):
            commands = [
                'takeown /F C:\\Windows.old\\* /R /A /D Y',
                'rd /s /q C:\\Windows.old',
            ]
            self.run_command(commands, "Clean Windows.old Folder")
    
    def compact_os(self):
        if messagebox.askyesno("Confirm", "Compress system files?\nN?n file h? th?ng?"):
            self.run_command('compact /compactos:always', "Compact OS")
    
    # ==========================================================================
    # PERFORMANCE OPTIMIZATION FUNCTIONS
    # ==========================================================================
    
    def disable_startup(self):
        os.system('start taskmgr /0 /startup')
        self.log("[*] Opening Task Manager - Startup tab")
    
    def optimize_services(self):
        commands = [
            'sc config Fax start= disabled',
            'sc stop Fax',
            'sc config RemoteRegistry start= disabled',
            'sc stop RemoteRegistry',
        ]
        self.run_command(commands, "Optimize Services")
    
    def prefetch(self):
        self.run_command('del /f /s /q C:\\Windows\\Prefetch\\* 2>nul', "Clear Prefetch")
    
    def superfetch(self):
        commands = [
            'sc stop SysMain',
            'del /f /s /q C:\\Windows\\Prefetch\\* 2>nul',
            'sc start SysMain',
        ]
        self.run_command(commands, "Clear SuperFetch Cache")
    
    def visual_effects(self):
        commands = [
            'reg add "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f',
            'reg add "HKCU\\Control Panel\\Desktop\\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f',
            'reg add "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f',
        ]
        self.run_command(commands, "Disable Visual Effects")
    
    def power_plan(self):
        self.run_command('powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c', "Set High Performance Power Plan")
    
    def hibernation(self):
        commands = [
            'powercfg -h off',
            'del C:\\hiberfil.sys /f /q 2>nul',
        ]
        self.run_command(commands, "Disable Hibernation")
    
    def memory_cache(self):
        self.run_command(
            'reg add "HKLM\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f',
            "Clear Memory Cache"
        )
    
    def search_index(self):
        commands = [
            'net stop WSearch',
            'del /f /s /q C:\\ProgramData\\Microsoft\\Search\\Data\\Applications\\Windows\\* 2>nul',
            'net start WSearch',
        ]
        self.run_command(commands, "Optimize Search Index")
    
    def animations(self):
        commands = [
            'reg add "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f',
            'reg add "HKCU\\Control Panel\\Desktop\\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f',
        ]
        self.run_command(commands, "Disable Windows Animations")
    
    def ssd_optimize(self):
        commands = [
            'fsutil behavior set DisableDeleteNotify 0',
            'schtasks /change /tn "\\Microsoft\\Windows\\Defrag\\ScheduledDefrag" /disable',
            'sc config SysMain start= disabled',
            'sc stop SysMain',
        ]
        self.run_command(commands, "Optimize SSD Settings")
    
    def menu_delay(self):
        self.run_command(
            'reg add "HKCU\\Control Panel\\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f',
            "Reduce Menu Show Delay"
        )
    
    # ==========================================================================
    # SYSTEM MAINTENANCE FUNCTIONS
    # ==========================================================================
    
    def sfc_scan(self):
        self.run_command('sfc /scannow', "System File Checker")
    
    def dism_repair(self):
        commands = [
            'Dism /Online /Cleanup-Image /CheckHealth',
            'Dism /Online /Cleanup-Image /ScanHealth',
            'Dism /Online /Cleanup-Image /RestoreHealth',
        ]
        self.run_command(commands, "DISM System Repair")
    
    def component_cleanup(self):
        commands = [
            'Dism.exe /online /Cleanup-Image /StartComponentCleanup',
            'Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase',
        ]
        self.run_command(commands, "Windows Component Cleanup")
    
    def update_drivers(self):
        os.system('start ms-settings:windowsupdate')
        self.log("[*] Opening Windows Update")
    
    def rebuild_icon(self):
        commands = [
            'taskkill /F /IM explorer.exe',
            'del /f /a /q "%LocalAppData%\\IconCache.db" 2>nul',
            'start explorer.exe',
        ]
        self.run_command(commands, "Rebuild Icon Cache")
    
    def rebuild_search(self):
        os.system('control /name Microsoft.IndexingOptions')
        self.log("[*] Opening Indexing Options")
    
    # ==========================================================================
    # REGISTRY OPTIMIZATION FUNCTIONS
    # ==========================================================================
    
    def clean_registry(self):
        commands = [
            'reg delete "HKCU\\Software\\Classes\\Local Settings\\Software\\Microsoft\\Windows\\Shell\\MuiCache" /f 2>nul',
            'reg delete "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\UserAssist" /f 2>nul',
            'reg delete "HKCU\\Software\\Microsoft\\Windows\\Windows Error Reporting" /f 2>nul',
        ]
        self.run_command(commands, "Clean Registry (Safe)")
    
    def optimize_registry(self):
        commands = [
            'reg add "HKLM\\SYSTEM\\CurrentControlSet\\Control" /v RegistrySizeLimit /t REG_DWORD /d 0x40000000 /f',
            'reg add "HKLM\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Memory Management" /v IoPageLockLimit /t REG_DWORD /d 0xf000000 /f',
        ]
        self.run_command(commands, "Optimize Registry")
    
    def backup_registry(self):
        import datetime
        date_str = datetime.datetime.now().strftime("%Y%m%d")
        commands = [
            'if not exist "C:\\RegistryBackup" mkdir "C:\\RegistryBackup"',
            f'reg export HKLM "C:\\RegistryBackup\\HKLM_{date_str}.reg" /y',
            f'reg export HKCU "C:\\RegistryBackup\\HKCU_{date_str}.reg" /y',
        ]
        self.run_command(commands, "Backup Registry")
    
    def disable_cortana(self):
        commands = [
            'reg add "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f',
            'reg add "HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f',
        ]
        self.run_command(commands, "Disable Cortana")
    
    def disable_tips(self):
        commands = [
            'reg add "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f',
            'reg add "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager" /v SoftLandingEnabled /t REG_DWORD /d 0 /f',
        ]
        self.run_command(commands, "Disable Windows Tips")
    
    # ==========================================================================
    # ADVANCED TOOLS FUNCTIONS
    # ==========================================================================
    
    def restore_point(self):
        self.run_command(
            'powershell -Command "Checkpoint-Computer -Description \'Ultimate System Tool Backup\' -RestorePointType \'MODIFY_SETTINGS\'"',
            "Create System Restore Point"
        )
    
    def system_info(self):
        os.system('start cmd /k systeminfo')
        self.log("[*] Opening System Information")
    
    def export_programs(self):
        desktop = os.path.join(os.path.expanduser("~"), "Desktop")
        self.run_command(
            f'wmic product get name,version /format:csv > "{desktop}\\InstalledPrograms.csv"',
            "Export Installed Programs List"
        )
    
    def disk_health(self):
        self.run_command('wmic diskdrive get status,model,size', "Check Disk Health")
    
    def store_cache(self):
        self.run_command('wsreset.exe', "Clear Windows Store Cache")
    
    def reset_update(self):
        commands = [
            'net stop wuauserv',
            'net stop cryptSvc',
            'net stop bits',
            'ren C:\\Windows\\SoftwareDistribution SoftwareDistribution.old',
            'ren C:\\Windows\\System32\\catroot2 catroot2.old',
            'net start wuauserv',
            'net start cryptSvc',
            'net start bits',
        ]
        self.run_command(commands, "Reset Windows Update Components")
    
    def boot_time(self):
        commands = [
            'reg add "HKLM\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Power" /v HiberbootEnabled /t REG_DWORD /d 1 /f',
            'bcdedit /timeout 3',
            'bcdedit /set quietboot on',
        ]
        self.run_command(commands, "Optimize Boot Time")
    
    def all_temp(self):
        commands = [
            'del /f /s /q "%TEMP%\\*" 2>nul',
            'del /f /s /q "C:\\Windows\\Temp\\*" 2>nul',
            'del /f /s /q C:\\Windows\\Prefetch\\* 2>nul',
            'del /f /s /q "%AppData%\\Microsoft\\Windows\\Recent\\*" 2>nul',
        ]
        self.run_command(commands, "Clean All Temporary Files")
    
    def system_report(self):
        os.system('perfmon /report')
        self.log("[*] Generating System Report")
    
    def run_all_cleanup(self):
        if messagebox.askyesno("Confirm", "Run ALL cleanup tasks?\nCh?y T?T C? d?n d?p?"):
            self.log("\n" + "="*80)
            self.log("RUNNING ALL CLEANUP TASKS - CH?Y T?T C? D?N D?P")
            self.log("="*80 + "\n")
            
            # Run all cleanup tasks sequentially
            self.quick_cleanup()
            self.browser_cache()
            self.app_cache()
            self.thumbnail_cache()
            self.icon_cache()
            self.recycle_bin()
            self.dns_cache()
            self.prefetch()
            self.all_temp()
    
    def full_optimize(self):
        if messagebox.askyesno(
            "Confirm Full Optimization",
            "This will perform FULL SYSTEM OPTIMIZATION!\n"
            "S? th?c hi?n T?I ?U TO?N B? H? TH?NG!\n\n"
            "This may take 15-30 minutes.\n"
            "C? th? m?t 15-30 ph?t.\n\n"
            "Continue? Ti?p t?c?"
        ):
            self.log("\n" + "="*80)
            self.log("FULL SYSTEM OPTIMIZATION - T?I ?U TO?N B? H? TH?NG")
            self.log("="*80 + "\n")
            
            # Create restore point first
            self.restore_point()
            
            # Run optimization tasks
            self.run_all_cleanup()
            self.optimize_network()
            self.visual_effects()
            self.power_plan()
            self.sfc_scan()
            self.component_cleanup()
            self.clean_registry()
            self.optimize_registry()
            
            messagebox.showinfo(
                "Completed",
                "? FULL SYSTEM OPTIMIZATION COMPLETED!\n"
                "? HO?N TH?NH T?I ?U TO?N B?!\n\n"
                "Please restart your computer.\n"
                "Vui l?ng kh?i ??ng l?i m?y t?nh."
            )


if __name__ == "__main__":
    app = SystemTool()
    app.mainloop()
