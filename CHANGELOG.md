# Changelog

All notable changes to WinClean Pro will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [3.0.0] - 2025-11-03

### ?? Major Release - Complete Rewrite

#### Added
- **Multiple Cleanup Profiles**
  - Quick Clean (2-3 minutes)
  - Standard Clean (5-7 minutes) 
  - Deep Clean (15-20 minutes)
  - Custom Clean (user-selectable)

- **Analysis Mode**
  - Scan without cleaning
  - Generate detailed reports
  - Estimate reclaimable space

- **Enhanced User Interface**
  - Professional menu system
  - Progress indicators
  - Real-time statistics
  - Box drawing characters

- **Comprehensive Application Support**
  - 250+ applications supported
  - Browsers: Chrome, Edge, Firefox, Brave, Opera, Vivaldi
  - Communication: Discord, Teams, Zoom, Slack, Skype
  - Games: Steam, Epic, Origin, Battle.net, Riot
  - Development: VS Code, JetBrains, Visual Studio, Android Studio
  - Media: Spotify, VLC, Adobe CC, OBS Studio
  - Cloud: OneDrive, Dropbox, Google Drive

- **Safety Features**
  - Administrator privilege checking
  - Automatic UAC elevation
  - Locked file handling
  - Comprehensive error recovery
  - Detailed logging system

- **Logging & Reporting**
  - Automatic log directory creation
  - Timestamped log files
  - Cleanup statistics
  - Error tracking
  - Execution time monitoring

#### Changed
- Complete code restructure
- Improved error handling
- Better performance
- Cleaner code organization

#### Technical
- UTF-8 encoding support
- Delayed expansion enabled
- Modular function design
- Consistent naming conventions

---

## [2.0.0] - 2024-12-15

### Added
- Basic cleanup functionality
- Browser cache cleaning
- Windows temp file removal
- Recycle bin cleanup

### Changed
- Improved admin check
- Better error messages

---

## [1.0.0] - 2024-10-01

### Added
- Initial release
- Basic Windows temp cleanup
- Simple batch script
- Manual execution only

---

## Planned Features

### [3.1.0] - Q1 2025
- [ ] Real-time space calculation
- [ ] Before/after comparison
- [ ] Enhanced custom clean options
- [ ] Backup important files before cleaning
- [ ] Undo last cleanup
- [ ] Multi-language support (Spanish, French, German)

### [3.2.0] - Q2 2025
- [ ] GUI interface (optional)
- [ ] Scheduled cleanup automation GUI
- [ ] Cloud backup for logs
- [ ] Email reports
- [ ] Integration with Windows Task Scheduler GUI

### [4.0.0] - Future
- [ ] Plugin system for custom cleaners
- [ ] Machine learning for smart cleaning
- [ ] Registry cleaning (carefully)
- [ ] Disk defragmentation integration
- [ ] System optimization tools
- [ ] Performance monitoring

---

## Version History Summary

| Version | Release Date | Major Features |
|---------|-------------|----------------|
| **3.0.0** | 2025-11-03 | Multiple profiles, 250+ apps, analysis mode |
| 2.0.0 | 2024-12-15 | Enhanced cleanup, browser support |
| 1.0.0 | 2024-10-01 | Initial release |

---

## Breaking Changes

### 3.0.0
- Complete rewrite - not backward compatible
- New menu system
- Different log file format
- Changed function names

---

## Migration Guide

### From 2.x to 3.0

**Old Way:**
```batch
cleanup.bat
```

**New Way:**
```batch
WinCleanPro.cmd
? Select profile from menu
```

**Log Files:**
- Old: `cleanup.log`
- New: `logs\cleanup_YYYYMMDD.log`

---

## Contributors

- **v3.0.0**: Complete rewrite, professional features
- **v2.0.0**: Enhanced browser support
- **v1.0.0**: Initial concept

---

## Acknowledgments

Inspired by leading open-source projects:
- **BleachBit** - Privacy focus and safe cleaning algorithms
- **CCleaner** - Comprehensive application coverage
- **PrivaZer** - Deep system scanning techniques

Special thanks to:
- Windows community for feedback
- Beta testers for bug reports
- Open source contributors

---

**Note:** This changelog follows semantic versioning. Version numbers indicate:
- **Major (3.x.x)** - Breaking changes
- **Minor (x.1.x)** - New features, backward compatible
- **Patch (x.x.1)** - Bug fixes

---

*For detailed commit history, see: https://github.com/winclean-pro/commits*
