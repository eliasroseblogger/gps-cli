# 🛰️ GPS CLI - Universal Device Location Tracker

[![Release](https://img.shields.io/github/v/release/alexcolls/gps-cli?style=flat-square)](https://github.com/alexcolls/gps-cli/releases)
[![License](https://img.shields.io/github/license/alexcolls/gps-cli?style=flat-square)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-blue?style=flat-square)](README.md)
[![Shell](https://img.shields.io/badge/shell-bash%204.0%2B-green?style=flat-square)](README.md)
[![CI](https://img.shields.io/github/actions/workflow/status/alexcolls/gps-cli/test.yml?branch=main&style=flat-square&label=tests)](https://github.com/alexcolls/gps-cli/actions)
[![Issues](https://img.shields.io/github/issues/alexcolls/gps-cli?style=flat-square)](https://github.com/alexcolls/gps-cli/issues)
[![Stars](https://img.shields.io/github/stars/alexcolls/gps-cli?style=flat-square)](https://github.com/alexcolls/gps-cli/stargazers)

A powerful command-line tool for tracking device location across multiple platforms. Track your Linux, macOS, Windows, Android, or iOS device with ease using free or self-hosted tracking providers.

> 🚀 **Quick Start:** Install in 2 minutes | 🆓 **Free Forever** | 🌍 **Works Everywhere** | 🔒 **Privacy-Focused**

## 🆓 FREE Default Configuration

**Zero configuration required!** GPS-CLI works immediately with:
- **FREE Traccar Demo Server** (`https://demo2.traccar.org`) - NO account or signup needed!
- **IP-Based Geolocation** - NO GPS hardware required (city-level accuracy)
- **Instant Setup** - Just run `gps setup` and you're tracking in seconds

Perfect for testing, personal use, or getting started quickly. Want more precision or privacy? Easily switch to self-hosted options or GPS hardware later!

## ✨ Features

🌍 **Multi-Provider Support**
- Traccar (Free demo server + self-hosted)
- OwnTracks (Privacy-focused MQTT/HTTP)
- PhoneTrack (Nextcloud integration)
- GPSLogger (Custom HTTP endpoints)

📡 **Flexible Location Sources**
- IP-based geolocation (works anywhere)
- GPS hardware support (via gpsd)
- Automatic fallback mechanisms

🗺️ **Web-Based Tracking**
- Real-time map visualization
- Shareable tracking URLs
- Works on any device with a browser

⚙️ **Highly Configurable**
- Adjustable update intervals
- Background tracking daemon
- Privacy-focused local storage

🎨 **User-Friendly Interface**
- 🎉 **NEW:** Interactive menu mode (run `gps` without arguments)
- Beautiful color-coded menu with 8 options
- Continuous loop - no need to restart between operations
- All prompts show default values
- Simple command structure for CLI automation
- Comprehensive help system

📊 **Location History**
- Track last 50 locations
- Timestamped entries
- Easy history review

🔒 **Privacy & Security**
- All configuration stored locally
- Self-hosted options available
- No data sharing required

## 📋 Requirements

**Core Dependencies:**
- `bash` (version 4.0+)
- `curl` (for API requests)
- `jq` (for JSON parsing)

**Optional:**
- `gpsd` and `cgps` (for GPS hardware support)

### Installing Dependencies

**Debian/Ubuntu/Kali:**
```bash
sudo apt-get update
sudo apt-get install -y bash curl jq

# Optional: for GPS hardware
sudo apt-get install -y gpsd gpsd-clients
```

**macOS:**
```bash
brew install bash curl jq

# Optional: for GPS hardware
brew install gpsd
```

**Arch Linux:**
```bash
sudo pacman -S bash curl jq gpsd
```

## 🚀 Installation

### Quick Install

```bash
cd /home/kali/labs
git clone https://github.com/yourusername/gps-cli.git
cd gps-cli
./install.sh
```

### Manual Installation

```bash
# Make script executable
chmod +x gps

# Create symlink
mkdir -p ~/.local/bin
ln -s $(pwd)/gps ~/.local/bin/gps

# Add to PATH (if not already)
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc  # or ~/.bashrc
source ~/.zshrc
```

### Verify Installation

```bash
gps help
```

## 🎯 Quick Start

### Interactive Mode (Recommended for Beginners)

Simply run `gps` without any arguments to launch the beautiful interactive menu:

```bash
gps
```

You'll see a menu like this:

```
╔════════════════════════════════════════════════════════════════════════════╗
║           🛰️  GPS CLI - Universal Device Location Tracker v0.3.0         ║
╚════════════════════════════════════════════════════════════════════════════╝

  [1] 🔧 Setup Tracking Provider    - Configure Traccar, OwnTracks, etc.
  [2] ▶️  Start Tracking             - Begin sending location updates
  [3] ⏹️  Stop Tracking              - Stop location updates
  [4] 📊 Show Status                - View tracking status and last location
  [5] 🗺️  Show Tracking URL          - Display web tracking link
  [6] ⚙️  Configure Settings         - Adjust update interval and options
  [7] 📜 View Location History       - Show recent location updates
  [8] 📡 List Providers              - Show available tracking providers

  [0] 🚪 Exit                        - Quit GPS CLI
```

**Features:**
- 🔄 Continuous loop - no need to restart between operations
- ⌨️ Simple number-based navigation
- 🎨 Color-coded menu items for easy identification
- ⚙️ All prompts show default values
- ⌃C Graceful exit with Ctrl+C

**First Time Setup (via Interactive Menu):**
1. Select option `[1]` to setup tracking provider
2. Choose **Traccar** (option 1)
3. Select **FREE demo server** (default)
4. Enter a device name (or press Enter for auto-generated)
5. Back to main menu - select `[2]` to start tracking
6. Select `[5]` to get your tracking URL
7. Open the URL in a browser to see your device on the map!

### Command-Line Mode (For Automation & Scripts)

Prefer commands? All CLI functionality is still available:

#### 1. Setup Tracking Provider

```bash
gps setup
```

Choose **Traccar** (option 1), select the **FREE demo server**, and give your device a name (e.g., "my-laptop" or "gps-tracker")!

The device name will be used to identify your device in the Traccar dashboard.

#### 2. Start Tracking

```bash
gps start
```

#### 3. Get Your Tracking URL

```bash
gps url
```

Open the URL in any web browser to see your device on a map!

#### 4. Check Status

```bash
gps status
```

#### 5. Stop Tracking

```bash
gps stop
```

## 📖 Usage

### Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `gps setup` | - | Configure tracking provider |
| `gps start` | - | Start GPS tracking |
| `gps stop` | - | Stop GPS tracking |
| `gps status` | `s` | Show tracking status and location |
| `gps url` | `link` | Display tracking URL |
| `gps config` | `configure` | Configure update interval |
| `gps history` | `h` | Show location history |
| `gps providers` | `list` | List available providers |
| `gps help` | `-h`, `--help` | Show help message |

### Examples

**Start tracking with default settings:**
```bash
gps start
```

**Check your current status:**
```bash
gps status
```

**Get tracking URL to share:**
```bash
gps url
```

**Change update interval to 30 seconds:**
```bash
gps config
# Enter: 30
```

**View location history:**
```bash
gps history
```

**List all providers:**
```bash
gps providers
```

## 🛠️ Providers

### 1. Traccar (Recommended) 🌟

**Best for:** Everyone - Easiest setup with free demo server

**Setup:**
1. Run `gps setup`
2. Select option `1` (Traccar)
3. Select option `1` (Free demo server)
4. Enter a device name (e.g., "gps-tracker") or press Enter for auto-generated name
5. Done! Your tracking URL will be displayed

**Features:**
- ✅ Free demo server (no registration)
- ✅ Web-based map interface
- ✅ Real-time tracking
- ✅ Custom device names for easy identification
- ✅ Osmand protocol for better device management
- ✅ Self-hosted option available

**Web Interface:**
- Demo server: https://demo2.traccar.org
- Login not required for viewing
- Just use your device ID in the URL

**Self-Hosting Traccar:**
```bash
# Docker installation
docker run -d --name traccar \
  -p 8082:8082 \
  -p 5055:5055 \
  traccar/traccar:latest
```

Then configure GPS CLI to use `http://your-server:8082`

### 2. OwnTracks 🔒

**Best for:** Privacy-conscious users with technical expertise

**Requirements:**
- MQTT broker (Mosquitto) or HTTP endpoint
- Self-hosted OwnTracks Recorder for web interface

**Setup:**
1. Install Mosquitto MQTT broker
2. Install OwnTracks Recorder
3. Run `gps setup` and select OwnTracks
4. Enter your endpoint URL

**Installation (Server):**
```bash
# Install Mosquitto
sudo apt-get install mosquitto mosquitto-clients

# Install OwnTracks Recorder
# See: https://github.com/owntracks/recorder
```

**Features:**
- ✅ End-to-end encryption
- ✅ Privacy-focused
- ✅ MQTT or HTTP support
- ⚠️ Requires own server

### 3. PhoneTrack ☁️

**Best for:** Nextcloud users

**Requirements:**
- Nextcloud instance
- PhoneTrack app installed

**Setup:**
1. Install PhoneTrack on your Nextcloud
2. Create a tracking session
3. Get session token from PhoneTrack
4. Run `gps setup` and select PhoneTrack
5. Enter Nextcloud URL and session token

**Installation (Nextcloud):**
```bash
# Install via Nextcloud app store or:
sudo -u www-data php occ app:install phonetrack
```

**Features:**
- ✅ Integrated with Nextcloud
- ✅ Session-based tracking
- ✅ Privacy-first design
- ⚠️ Requires Nextcloud

### 4. GPSLogger 🔧

**Best for:** Custom integrations and developers

**Requirements:**
- HTTP endpoint that accepts POST requests

**Setup:**
1. Set up your custom endpoint
2. Run `gps setup` and select GPSLogger
3. Enter endpoint URL and auth token

**Example Backend (Node.js/Express):**
```javascript
app.post('/gps/update', (req, res) => {
  const { device_id, latitude, longitude, timestamp } = req.body;
  // Store location in your database
  res.json({ success: true });
});
```

**Features:**
- ✅ Maximum flexibility
- ✅ Custom integrations
- ✅ Any HTTP endpoint
- ⚠️ DIY implementation

## 📱 Mobile Devices

### Android

**Option 1: Traccar Client (Recommended)**
1. Install "Traccar Client" from Google Play Store
2. Open app → Settings
3. Set Device Identifier to your GPS CLI device ID
4. Set Server Address: `https://demo2.traccar.org:5055`
5. Start tracking

**Option 2: GPSLogger for Android**
1. Install "GPSLogger" from F-Droid or Google Play
2. Configure custom URL endpoint
3. Enable automatic logging

### iOS

**OwnTracks for iOS**
1. Install "OwnTracks" from App Store
2. Configure HTTP endpoint or MQTT broker
3. Set device ID and credentials
4. Start tracking

### Other Options

- **Traccar Manager** - iOS/Android management app
- **PhoneTrack** - Nextcloud mobile app
- Any app that can POST to HTTP endpoints

## ⚙️ Configuration

### Config Location

All configuration is stored in `~/.config/gps-cli/`:
- `config.json` - Main configuration
- `history.json` - Location history
- `gps.log` - Application logs
- `.env` - Provider credentials (optional)
- `tracker.pid` - Background process ID

### Environment Variables

Copy `.env.sample` to `~/.config/gps-cli/.env` for advanced configuration:

```bash
cp .env.sample ~/.config/gps-cli/.env
nano ~/.config/gps-cli/.env
```

**Key Settings:**
```bash
# Update interval (seconds)
UPDATE_INTERVAL=60

# GPS source (auto, ip, hardware)
GPS_SOURCE=auto

# Provider selection
GPS_PROVIDER=traccar
```

### Update Intervals

```bash
# Interactive configuration
gps config

# Common intervals:
# 30  = 30 seconds (high frequency)
# 60  = 1 minute (default, balanced)
# 300 = 5 minutes (battery saving)
# 600 = 10 minutes (low frequency)
```

## 🔧 Troubleshooting

### Tracking Not Starting

**Check dependencies:**
```bash
which curl jq
```

**Check configuration:**
```bash
cat ~/.config/gps-cli/config.json
```

**Check logs:**
```bash
tail -f ~/.config/gps-cli/gps.log
```

### Location Not Updating

**Verify background process:**
```bash
gps status
```

**Check IP geolocation APIs:**
```bash
curl -s https://ipapi.co/json/ | jq
```

**Restart tracking:**
```bash
gps stop
gps start
```

### Tracking URL Not Working

**Traccar demo server:**
- URL format: `https://demo2.traccar.org/?id=YOUR_DEVICE_NAME`
- Device must send at least one location update first
- Wait 1-2 minutes after starting tracking
- Device will appear in the dashboard with the name you chose during setup

**Self-hosted:**
- Verify server is accessible
- Check firewall rules
- Ensure correct port configuration

### Permission Denied

**Make script executable:**
```bash
chmod +x ~/.local/bin/gps
```

**Check PATH:**
```bash
echo $PATH | grep .local/bin
```

### GPS Hardware Not Detected

**Install gpsd:**
```bash
sudo apt-get install gpsd gpsd-clients
```

**Check GPS device:**
```bash
lsusb  # Look for GPS device
cgps   # Test GPS reception
```

**Start gpsd:**
```bash
sudo gpsd /dev/ttyUSB0 -F /var/run/gpsd.sock
```

## 🔐 Privacy & Security

### Data Storage

- **Local only:** All configuration stored in `~/.config/gps-cli/`
- **No cloud sync:** Data never leaves your device (unless you configure it)
- **Open source:** Audit the code yourself

### IP Geolocation

- **Approximate:** City-level accuracy (5-50km radius)
- **Third-party APIs:** ipapi.co and ip-api.com
- **Limited data:** Only IP address sent to geolocation APIs
- **Fallback:** Multiple providers for reliability

### Provider Security

| Provider | Privacy Level | Data Storage | Encryption |
|----------|---------------|--------------|------------|
| Traccar (demo) | ⚠️ Public | Demo server | HTTPS |
| Traccar (self-hosted) | ✅ Private | Your server | HTTPS |
| OwnTracks | ✅ Private | Your server | End-to-end |
| PhoneTrack | ✅ Private | Your Nextcloud | HTTPS |
| GPSLogger | 🤷 Depends | Your endpoint | Your choice |

### Recommendations

1. **For maximum privacy:** Use self-hosted OwnTracks or Traccar
2. **For testing:** Traccar demo is fine (temporary use)
3. **For existing setup:** PhoneTrack if you already use Nextcloud
4. **For custom needs:** GPSLogger with your own backend

## 🌐 Cross-Platform Support

### Linux ✅
- Fully supported
- All providers available
- GPS hardware support via gpsd

### macOS ✅
- Fully supported
- All providers available
- Limited GPS hardware support

### Windows (WSL) ✅
- Supported via WSL or MSYS2
- All providers available
- No GPS hardware support

### Android 📱
- Use Traccar Client app
- Configure with same device ID
- Points to same tracking URL

### iOS 📱
- Use OwnTracks app
- Requires MQTT/HTTP setup
- Alternative: Traccar iOS app

## 📊 Use Cases

### Personal Tracking
- Track your laptop when traveling
- Find lost devices
- Monitor device location history

### Asset Tracking
- Track company equipment
- Monitor fleet vehicles (with GPS hardware)
- Logistics and delivery tracking

### Development & Testing
- Test location-based applications
- Simulate device movement
- API integration testing

### Security & Backup
- Emergency location tracking
- Anti-theft monitoring
- Backup location tracking

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Report bugs:** Open an issue
2. **Suggest features:** Start a discussion
3. **Submit PRs:** Fork, code, and create pull request
4. **Improve docs:** Fix typos, add examples
5. **Share providers:** Add support for new tracking services

## 📄 License

This project is free and open-source. Use, modify, and distribute as you wish.

## 🙏 Acknowledgments

- **Traccar:** Excellent open-source GPS tracking platform
- **OwnTracks:** Privacy-focused location tracking
- **PhoneTrack:** Great Nextcloud integration
- **IP Geolocation APIs:** ipapi.co and ip-api.com

## 📞 Support

- **Documentation:** This README
- **Issues:** GitHub Issues
- **Discussions:** GitHub Discussions
- **Logs:** Check `~/.config/gps-cli/gps.log`

## 🗺️ Roadmap

### v0.2.0 (Released)
- [x] Device naming support
- [x] Osmand protocol for Traccar
- [x] Improved IP geolocation stability
- [x] Better error handling and timeouts
- [x] JSON parsing fixes

### v0.3.0 (Planned)
- [ ] Enhanced GPS hardware support
- [ ] Multiple device tracking
- [ ] Geofencing alerts
- [ ] Export location data (CSV, KML)
- [ ] Web dashboard

### v0.4.0 (Future)
- [ ] Bluetooth beacon support
- [ ] Wi-Fi positioning
- [ ] Battery optimization modes
- [ ] Encryption for all providers
- [ ] Mobile app companion

## 📝 Version

Current version: **0.2.0**

See [CHANGELOG.md](CHANGELOG.md) for version history.

---

**Made with ❤️ for privacy-conscious device tracking**

🛰️ Track responsibly | 🔒 Privacy matters | 🌍 Location everywhere
