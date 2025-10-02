# Changelog

All notable changes to GPS CLI will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2025-10-02

### Added
- 🎨 **Interactive Menu Mode** - Brand new user interface!
  - Beautiful menu-driven interface with 8 main options
  - Clear screen and continuous loop for seamless navigation
  - Color-coded menu items (Green: actions, Cyan: info, Yellow: settings, Magenta: utilities)
  - Professional box-drawing characters and emoji icons
  - "Press Enter to continue..." pause after each operation
  - Runs automatically when `gps` is called without arguments
- 🔧 **Provider Selection Submenu** - Dedicated interface for choosing tracking providers
  - Shows all 4 providers with descriptions
  - Option to return to main menu
  - Directly integrates with existing setup functions
- ⚙️ **Default Values Throughout** - All prompts now show default options
  - Traccar server: defaults to option 1 (demo server)
  - Port selection: defaults to 5055
  - Device name: auto-generated if empty
  - Update interval: shows current value as default (60s)
  - Consistent format: `"prompt text (default: value):"` or `"[default]"`
- 🛡️ **Enhanced Error Handling**
  - Graceful Ctrl+C handling with trap
  - Invalid selection feedback with 2-second delay
  - Friendly exit messages

### Improved
- 🖥️ **User Experience**
  - Dual-mode operation: interactive (no args) OR command-line (with args)
  - No need to restart the app between operations
  - Clear visual feedback for all actions
  - Better onboarding for new users
- 🔄 **Helper Functions**
  - `clear_screen()` - Clears terminal for clean display
  - `pause()` - Waits for user with colored prompt
  - `show_main_menu()` - Displays main interactive menu
  - `show_provider_menu()` - Provider selection submenu
  - `interactive_mode()` - Main menu loop with trap handling

### Changed
- 🚀 **Default Behavior** - Running `gps` without arguments now launches interactive menu
  - Previous: displayed static help text and exited
  - New: launches beautiful interactive menu interface
- 💻 **Setup Flow** - All prompts updated to show default values

### Technical
- ✅ **Backward Compatibility** - All CLI commands still work exactly as before
  - `gps start`, `gps stop`, `gps status`, etc. unchanged
  - No breaking changes to existing functionality
- 📝 **Code Quality**
  - Added 155 lines of new functionality
  - Clean separation between interactive and CLI modes
  - Consistent error handling throughout

## [0.2.1] - 2025-10-02

### Changed
- **FREE Default Configuration Documentation**
  - Added prominent section to README emphasizing FREE Traccar demo server
  - Documented that NO account or signup is required
  - Highlighted IP-based geolocation requires NO GPS hardware
  - Updated `.env.sample` with clear FREE configuration header
  - Emphasized zero-configuration instant setup for new users
  - Clarified Traccar demo server is the default, self-hosting is optional

### Improved
- **User Experience**
  - Clearer messaging about free options
  - Better onboarding for first-time users
  - Reduced barrier to entry with prominent free tier information
  - Enhanced documentation for quick start scenarios

## [0.2.0] - 2025-10-02

### Added
- 🏷️ **Device naming support** - Name your devices during setup for easy identification
  - Custom device names (e.g., "gps-tracker", "laptop", "upc")
  - Auto-generated names with random suffix if not provided
  - Device name validation (alphanumeric, hyphens, underscores)
  - Display device name in status and tracking output
- 🔄 **Osmand protocol support** for Traccar - Better device identification in dashboard
  - Devices now appear with custom names in Traccar web interface
  - URL-encoded identifiers for special characters
  - HTTP response code tracking and logging

### Improved
- ⏱️ **IP geolocation stability**
  - Added 10-second timeout to prevent hanging
  - Rate limit detection and handling
  - Fallback to alternative services on errors
  - Better null value checking
  - Improved error messages for timeout/rate limit scenarios
- 🔧 **JSON parsing fixes**
  - Fixed jq argjson errors with proper type conversion
  - Use jq to construct JSON instead of manual string concatenation
  - Redirect status messages to stderr to avoid polluting JSON output
  - Fixed numeric conversions for port and timestamp values
- 📊 **Enhanced logging**
  - Log successful location updates to Traccar
  - Better HTTP status code tracking
  - Improved error context in log messages

### Changed
- 🗺️ **Tracking URL format** - Now uses device name instead of device ID
  - Old format: `https://demo2.traccar.org/?deviceId=abc123`
  - New format: `https://demo2.traccar.org/?id=gps-tracker`
- 💻 **Setup flow** - Added device name prompt during Traccar setup
- 💡 **Status display** - Shows both device name and ID for better clarity

### Fixed
- 🐛 Fixed hanging during IP geolocation API calls
- 🐛 Fixed jq parsing errors with invalid JSON input
- 🐛 Fixed mixed stdout/stderr output contaminating JSON
- 🐛 Improved backward compatibility with existing configurations

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
