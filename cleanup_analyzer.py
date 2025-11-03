#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🧹 SAFE CLEANUP ANALYZER - AI POWERED
Phân tích thông minh dung lượng ổ đĩa và gợi ý dọn rác
"""

import os
import sys
import json
import shutil
from pathlib import Path
from datetime import datetime, timedelta
from collections import defaultdict
import argparse

try:
    import pandas as pd
    HAS_PANDAS = True
except ImportError:
    HAS_PANDAS = False
    print("⚠️  pandas không được cài đặt. Một số tính năng bị giới hạn.")

try:
    from rich.console import Console
    from rich.table import Table
    from rich.progress import track
    from rich import print as rprint
    HAS_RICH = True
except ImportError:
    HAS_RICH = False
    print("⚠️  rich không được cài đặt. Hiển thị đơn giản hơn.")


class CleanupAnalyzer:
    """Phân tích hệ thống và đưa ra gợi ý thông minh"""
    
    def __init__(self):
        self.console = Console() if HAS_RICH else None
        self.scan_results = defaultdict(list)
        self.suggestions = []
        
    def print(self, *args, **kwargs):
        """Print wrapper"""
        if HAS_RICH:
            rprint(*args, **kwargs)
        else:
            print(*args, **kwargs)
    
    def get_dir_size(self, path):
        """Tính tổng dung lượng thư mục"""
        total = 0
        try:
            for entry in os.scandir(path):
                if entry.is_file(follow_symlinks=False):
                    total += entry.stat().st_size
                elif entry.is_dir(follow_symlinks=False):
                    total += self.get_dir_size(entry.path)
        except (PermissionError, FileNotFoundError):
            pass
        return total
    
    def format_size(self, size_bytes):
        """Chuyển bytes sang đơn vị dễ đọc"""
        for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
            if size_bytes < 1024.0:
                return f"{size_bytes:.2f} {unit}"
            size_bytes /= 1024.0
        return f"{size_bytes:.2f} PB"
    
    def scan_cache_dirs(self):
        """Quét các thư mục cache phổ biến"""
        self.print("\n[bold cyan]🔍 ĐANG QUÉT CÁC THƯ MỤC CACHE...[/bold cyan]\n")
        
        cache_locations = {
            "Browser Cache": [
                Path.home() / "AppData/Local/Google/Chrome/User Data/Default/Cache",
                Path.home() / "AppData/Local/Microsoft/Edge/User Data/Default/Cache",
                Path.home() / "AppData/Local/Mozilla/Firefox/Profiles",
            ],
            "Windows Temp": [
                Path(os.environ.get('TEMP', 'C:/Windows/Temp')),
                Path("C:/Windows/Temp"),
                Path("C:/Windows/Prefetch"),
            ],
            "Application Cache": [
                Path.home() / "AppData/Roaming/discord/Cache",
                Path.home() / "AppData/Roaming/Spotify/Data",
                Path.home() / "AppData/Roaming/Code/Cache",
            ],
            "GPU Cache": [
                Path.home() / "AppData/Local/NVIDIA/DXCache",
                Path.home() / "AppData/Local/AMD/DxCache",
                Path.home() / "AppData/Local/D3DSCache",
            ]
        }
        
        results = []
        for category, paths in cache_locations.items():
            category_size = 0
            category_count = 0
            
            for cache_path in paths:
                if cache_path.exists():
                    try:
                        size = self.get_dir_size(str(cache_path))
                        if size > 0:
                            category_size += size
                            category_count += 1
                            self.scan_results[category].append({
                                'path': str(cache_path),
                                'size': size,
                                'size_str': self.format_size(size)
                            })
                    except Exception as e:
                        pass
            
            if category_size > 0:
                results.append({
                    'category': category,
                    'size': category_size,
                    'size_str': self.format_size(category_size),
                    'count': category_count
                })
        
        return sorted(results, key=lambda x: x['size'], reverse=True)
    
    def scan_dev_projects(self, base_dir=None):
        """Quét các thư mục code projects (node_modules, __pycache__, etc)"""
        if base_dir is None:
            base_dir = Path.home()
        
        self.print("\n[bold cyan]🔍 ĐANG QUÉT CODE PROJECTS...[/bold cyan]")
        self.print(f"📂 Thư mục: {base_dir}\n")
        
        targets = {
            "node_modules": "Node.js packages",
            "__pycache__": "Python cache",
            ".gradle/caches": "Gradle cache",
            "bin": ".NET binaries",
            "obj": ".NET objects",
            "build": "Build output",
            "dist": "Distribution files",
            ".next": "Next.js cache",
            ".nuxt": "Nuxt.js cache",
        }
        
        results = defaultdict(list)
        total_size = 0
        
        # Scan only common dev directories
        dev_dirs = ['Documents', 'Desktop', 'Projects', 'Code', 'Dev']
        
        for dev_dir in dev_dirs:
            search_path = base_dir / dev_dir
            if not search_path.exists():
                continue
                
            self.print(f"  Đang quét: {dev_dir}...")
            
            for root, dirs, files in os.walk(str(search_path)):
                # Skip hidden and system directories
                dirs[:] = [d for d in dirs if not d.startswith('.git')]
                
                for target, description in targets.items():
                    if target in dirs or target in [Path(root).name]:
                        target_path = Path(root) / target if target in dirs else Path(root)
                        try:
                            size = self.get_dir_size(str(target_path))
                            if size > 10 * 1024 * 1024:  # > 10MB
                                results[description].append({
                                    'path': str(target_path),
                                    'size': size,
                                    'size_str': self.format_size(size)
                                })
                                total_size += size
                        except:
                            pass
        
        return dict(results), total_size
    
    def analyze_old_files(self, days=90):
        """Phân tích file cũ không dùng"""
        self.print(f"\n[bold cyan]🔍 TÌM FILE CŨ (>{days} ngày)...[/bold cyan]\n")
        
        old_files = []
        cutoff_date = datetime.now() - timedelta(days=days)
        
        # Scan Downloads and Desktop
        scan_dirs = [
            Path.home() / "Downloads",
            Path.home() / "Desktop",
        ]
        
        for scan_dir in scan_dirs:
            if not scan_dir.exists():
                continue
                
            self.print(f"  Quét: {scan_dir}...")
            
            try:
                for item in scan_dir.iterdir():
                    if item.is_file():
                        mtime = datetime.fromtimestamp(item.stat().st_mtime)
                        if mtime < cutoff_date:
                            size = item.stat().st_size
                            old_files.append({
                                'path': str(item),
                                'name': item.name,
                                'size': size,
                                'size_str': self.format_size(size),
                                'modified': mtime.strftime('%Y-%m-%d'),
                                'days_old': (datetime.now() - mtime).days
                            })
            except PermissionError:
                pass
        
        return sorted(old_files, key=lambda x: x['size'], reverse=True)[:20]
    
    def generate_suggestions(self, cache_results, dev_results, old_files):
        """Tạo gợi ý thông minh dựa trên phân tích"""
        suggestions = []
        
        # Gợi ý dựa trên cache
        total_cache = sum(r['size'] for r in cache_results)
        if total_cache > 5 * 1024 * 1024 * 1024:  # > 5GB
            suggestions.append({
                'priority': 'HIGH',
                'action': 'Dọn cache',
                'reason': f'Phát hiện {self.format_size(total_cache)} cache',
                'impact': f'Có thể giải phóng ~{self.format_size(total_cache * 0.9)}'
            })
        
        # Gợi ý dựa trên dev projects
        if dev_results[1] > 1 * 1024 * 1024 * 1024:  # > 1GB
            suggestions.append({
                'priority': 'MEDIUM',
                'action': 'Dọn node_modules/build folders cũ',
                'reason': f'Phát hiện {self.format_size(dev_results[1])} code artifacts',
                'impact': 'Có thể cài lại khi cần'
            })
        
        # Gợi ý dựa trên file cũ
        if old_files:
            total_old = sum(f['size'] for f in old_files)
            suggestions.append({
                'priority': 'LOW',
                'action': 'Xem xét file cũ trong Downloads/Desktop',
                'reason': f'{len(old_files)} file cũ >90 ngày ({self.format_size(total_old)})',
                'impact': 'Nên backup hoặc xóa'
            })
        
        return suggestions
    
    def create_html_report(self, cache_results, dev_results, old_files, suggestions):
        """Tạo báo cáo HTML chi tiết với charts"""
        html = """<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🧹 Safe Cleanup - Analytical Report</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 20px;
        }
        .container { 
            max-width: 1400px; 
            margin: 0 auto; 
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
        }
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px;
            text-align: center;
        }
        .header h1 { font-size: 48px; margin-bottom: 10px; }
        .header p { font-size: 18px; opacity: 0.9; }
        .content { padding: 40px; }
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }
        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.3);
        }
        .stat-value {
            font-size: 42px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .stat-label {
            font-size: 16px;
            opacity: 0.9;
        }
        .section {
            margin-bottom: 40px;
            background: #f8f9fa;
            padding: 30px;
            border-radius: 15px;
        }
        .section h2 {
            color: #667eea;
            margin-bottom: 20px;
            font-size: 28px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        th {
            background: #667eea;
            color: white;
            font-weight: 600;
        }
        tr:hover { background: #f5f5f5; }
        .chart-container {
            position: relative;
            height: 400px;
            margin: 20px 0;
        }
        .suggestion {
            background: white;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 10px;
            border-left: 5px solid #667eea;
        }
        .priority-high { border-left-color: #ff4444; }
        .priority-medium { border-left-color: #ffaa00; }
        .priority-low { border-left-color: #44ff44; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🧹 Safe Cleanup</h1>
            <p>Analytical Report - Generated at {timestamp}</p>
        </div>
        
        <div class="content">
            <div class="stats">
                <div class="stat-card">
                    <div class="stat-value">{total_cache}</div>
                    <div class="stat-label">Cache Size</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">{dev_size}</div>
                    <div class="stat-label">Dev Artifacts</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">{old_files_count}</div>
                    <div class="stat-label">Old Files</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">{suggestions_count}</div>
                    <div class="stat-label">Suggestions</div>
                </div>
            </div>
            
            <div class="section">
                <h2>📊 Cache Analysis</h2>
                <div class="chart-container">
                    <canvas id="cacheChart"></canvas>
                </div>
            </div>
            
            <div class="section">
                <h2>💡 Smart Suggestions</h2>
                {suggestions_html}
            </div>
            
            <div class="section">
                <h2>📁 Top Cache Directories</h2>
                {cache_table}
            </div>
        </div>
    </div>
    
    <script>
        const ctx = document.getElementById('cacheChart').getContext('2d');
        new Chart(ctx, {{
            type: 'doughnut',
            data: {{
                labels: {labels},
                datasets: [{{
                    data: {data},
                    backgroundColor: [
                        '#667eea', '#764ba2', '#f093fb', '#4facfe',
                        '#43e97b', '#fa709a', '#fee140', '#30cfd0'
                    ]
                }}]
            }},
            options: {{
                responsive: true,
                maintainAspectRatio: false,
                plugins: {{
                    legend: {{ position: 'right' }}
                }}
            }}
        }});
    </script>
</body>
</html>"""
        
        # Generate data for template
        total_cache = sum(r['size'] for r in cache_results)
        
        suggestions_html = ""
        for s in suggestions:
            priority_class = f"priority-{s['priority'].lower()}"
            suggestions_html += f"""
            <div class="suggestion {priority_class}">
                <strong>🎯 {s['action']}</strong><br>
                <small>{s['reason']}</small><br>
                <em>💡 {s['impact']}</em>
            </div>
            """
        
        cache_table = "<table><tr><th>Category</th><th>Size</th><th>Files</th></tr>"
        for r in cache_results[:10]:
            cache_table += f"<tr><td>{r['category']}</td><td>{r['size_str']}</td><td>{r['count']}</td></tr>"
        cache_table += "</table>"
        
        labels = json.dumps([r['category'] for r in cache_results[:8]])
        data = json.dumps([r['size'] for r in cache_results[:8]])
        
        html = html.format(
            timestamp=datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            total_cache=self.format_size(total_cache),
            dev_size=self.format_size(dev_results[1]) if dev_results else "0 B",
            old_files_count=len(old_files),
            suggestions_count=len(suggestions),
            suggestions_html=suggestions_html,
            cache_table=cache_table,
            labels=labels,
            data=data
        )
        
        output_file = Path("cleanup_report_advanced.html")
        output_file.write_text(html, encoding='utf-8')
        self.print(f"\n✅ Báo cáo HTML: [green]{output_file.absolute()}[/green]")
        
        return str(output_file.absolute())
    
    def run_full_analysis(self):
        """Chạy phân tích đầy đủ"""
        self.print("\n[bold magenta]" + "="*60 + "[/bold magenta]")
        self.print("[bold cyan]🧹 SAFE CLEANUP - ANALYTICAL ENGINE[/bold cyan]")
        self.print("[bold magenta]" + "="*60 + "[/bold magenta]\n")
        
        # 1. Scan cache
        cache_results = self.scan_cache_dirs()
        
        # 2. Scan dev projects
        dev_results, dev_size = self.scan_dev_projects()
        
        # 3. Find old files
        old_files = self.analyze_old_files(90)
        
        # 4. Generate suggestions
        suggestions = self.generate_suggestions(cache_results, (dev_results, dev_size), old_files)
        
        # 5. Print results
        self.print("\n[bold green]📊 KẾT QUẢ PHÂN TÍCH:[/bold green]\n")
        
        if HAS_RICH:
            table = Table(title="Cache Analysis")
            table.add_column("Category", style="cyan")
            table.add_column("Size", style="magenta")
            table.add_column("Count", style="green")
            
            for r in cache_results[:10]:
                table.add_row(r['category'], r['size_str'], str(r['count']))
            
            self.console.print(table)
        else:
            for r in cache_results[:10]:
                print(f"  {r['category']:<30} {r['size_str']:>15} ({r['count']} locations)")
        
        # Print suggestions
        self.print("\n[bold yellow]💡 GỢI Ý THÔNG MINH:[/bold yellow]\n")
        for i, s in enumerate(suggestions, 1):
            priority_color = {'HIGH': 'red', 'MEDIUM': 'yellow', 'LOW': 'green'}[s['priority']]
            self.print(f"  [{priority_color}]{i}. [{s['priority']}] {s['action']}[/{priority_color}]")
            self.print(f"     → {s['reason']}")
            self.print(f"     💡 {s['impact']}\n")
        
        # 6. Generate HTML report
        report_file = self.create_html_report(cache_results, (dev_results, dev_size), old_files, suggestions)
        
        self.print("\n[bold green]✅ PHÂN TÍCH HOÀN TẤT![/bold green]")
        self.print(f"[cyan]📂 Mở báo cáo: {report_file}[/cyan]\n")
        
        return report_file


def main():
    parser = argparse.ArgumentParser(description='🧹 Safe Cleanup Analyzer')
    parser.add_argument('--scan-dev', action='store_true', help='Quét dev projects')
    parser.add_argument('--days', type=int, default=90, help='Ngày cho file cũ (default: 90)')
    
    args = parser.parse_args()
    
    analyzer = CleanupAnalyzer()
    analyzer.run_full_analysis()


if __name__ == "__main__":
    main()
