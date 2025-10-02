# Changelog

All notable changes to GPS CLI will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2025-10-02

### Added
- 🎉 Initial release of GPS CLI
- 🛰️ Multi-provider support:
  - Traccar (free demo server + self-hosted)
  - OwnTracks (MQTT/HTTP)
  - PhoneTrack (Nextcloud integration)
  - GPSLogger (custom endpoints)
- 📡 IP-based geolocation using multiple APIs:
  - ipapi.co (primary)
  - ip-api.com (fallback)
- 🗺️ Web-based tracking with shareable URLs
- ⚙️ Configurable update intervals (default: 60 seconds)
- 📊 Real-time status monitoring
- 📜 Location history tracking (last 50 locations)
- 🎨 Colorful CLI interface with emojis
- 📝 Comprehensive logging system
- 🔧 Background tracking daemon
- 🆔 Automatic unique device ID generation
- 📋 Command aliases for quick access
- 🔒 Privacy-focused with local configuration storage
- 📱 Cross-platform support (Linux, macOS, Windows WSL)
- 📦 Easy installation script with dependency checking

### Commands
- `gps setup` - Configure tracking provider
- `gps start` - Start GPS tracking
- `gps stop` - Stop GPS tracking
- `gps status` - Show tracking status and location
- `gps url` - Display tracking URL
- `gps config` - Configure update interval
- `gps history` - Show location history
- `gps providers` - List available providers
- `gps help` - Show help information

### Dependencies
- bash (4.0+)
- curl
- jq
- gpsd (optional, for GPS hardware support)

### Configuration
- Config location: `~/.config/gps-cli/`
- Environment variables via `.env` file
- JSON-based configuration management

### Documentation
- Complete README with installation instructions
- Provider-specific setup guides
- Troubleshooting section
- Cross-platform usage examples
- Mobile device tracking instructions

### Notes
- IP geolocation provides city-level accuracy
- GPS hardware support planned for future releases
- All tracking data stored locally for privacy
- Free demo server available for Traccar testing

[0.1.0]: https://github.com/yourusername/gps-cli/releases/tag/v0.1.0
