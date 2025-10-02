# 🚀 Quick Start Guide

Get GPS CLI up and running in **under 2 minutes**!

## ⚡ Super Quick Start

```bash
# 1. Install
./install.sh

# 2. Setup (choose option 1, then option 1)
gps setup

# 3. Start tracking
gps start

# 4. Get your URL
gps url
```

That's it! Open the URL in your browser to see your location on a map! 🗺️

## 📋 Step-by-Step

### Step 1: Install GPS CLI

```bash
cd /home/kali/labs/gps-cli
./install.sh
```

**What happens:**
- Checks dependencies (bash, curl, jq)
- Creates symlink in `~/.local/bin`
- Adds to PATH if needed

**After installation:**
```bash
# Restart terminal or:
source ~/.zshrc  # or ~/.bashrc
```

### Step 2: Setup Provider

```bash
gps setup
```

**Choose your provider:**

#### Option 1: Traccar (Recommended for Testing)
1. Select `1` (Traccar)
2. Select `1` (Free demo server)
3. Done! You'll see your device ID and tracking URL

**Your tracking URL will look like:**
```
https://demo2.traccar.org/?deviceId=abc123def456
```

#### Option 2: Self-Hosted Traccar
1. Select `1` (Traccar)
2. Select `2` (Own server)
3. Enter your server URL: `https://your-server.com`
4. Enter port: `5055` (or your custom port)

#### Option 3: OwnTracks (Privacy-focused)
1. Select `2` (OwnTracks)
2. Enter your HTTP endpoint or MQTT broker URL
3. Enter credentials (if required)

#### Option 4: PhoneTrack (Nextcloud)
1. Select `3` (PhoneTrack)
2. Enter your Nextcloud URL
3. Enter PhoneTrack session token
4. Enter device name

#### Option 5: GPSLogger (Custom)
1. Select `4` (GPSLogger)
2. Enter your HTTP endpoint URL
3. Enter authentication header (if required)

### Step 3: Start Tracking

```bash
gps start
```

**What happens:**
- Gets your current location via IP geolocation
- Starts background tracking daemon
- Updates location every 60 seconds (default)
- Shows your device ID and tracking URL

**Example output:**
```
🚀 Starting GPS tracking...
📡 Getting location from IP address...
✅ Initial location: San Francisco, United States
✅ Tracking started!
📱 Device ID: abc123def456
🗺️  Track at: https://demo2.traccar.org/?deviceId=abc123def456
💡 Use 'gps status' to check tracking
💡 Use 'gps stop' to stop tracking
```

### Step 4: View on Map

```bash
gps url
```

**Copy the URL and open in your browser:**
- You'll see a map with your device location
- Location updates automatically
- Works on any device with internet

### Step 5: Check Status

```bash
gps status
```

**See your tracking info:**
- Provider name
- Device ID
- Update interval
- Tracking status (Active/Stopped)
- Last known location
- Tracking URL

**Example output:**
```
📊 GPS Tracking Status

Provider: traccar
Device ID: abc123def456
Update Interval: 60s

✅ Status: Tracking Active (PID: 12345)

📍 Last Known Location:
  Latitude: 37.7749
  Longitude: -122.4194
  City: San Francisco
  Country: United States
  Time: 2025-10-02T03:00:00Z

🗺️  Tracking URL:
  https://demo2.traccar.org/?deviceId=abc123def456
```

## 🎛️ Configuration

### Change Update Interval

```bash
gps config
```

**Common intervals:**
- `10` = 10 seconds (high frequency, more data usage)
- `30` = 30 seconds (balanced)
- `60` = 1 minute (default)
- `300` = 5 minutes (battery saving)
- `600` = 10 minutes (low frequency)

### View Location History

```bash
gps history
```

**See your last 20 locations with timestamps**

### Stop Tracking

```bash
gps stop
```

**Stops the background daemon**

## 📱 Track Mobile Devices

### Android

1. Install **Traccar Client** from Google Play Store
2. Open app → Settings
3. Device Identifier: Use the **same device ID** from `gps status`
4. Server Address: `https://demo2.traccar.org:5055`
5. Start tracking

**Both devices will appear at the same tracking URL!**

### iOS

1. Install **OwnTracks** from App Store
2. Configure with your endpoint/MQTT broker
3. Set device ID from your GPS CLI setup
4. Start tracking

## 🔧 Troubleshooting

### Tracking not starting?

```bash
# Check dependencies
which curl jq

# Check logs
tail -f ~/.config/gps-cli/gps.log

# Restart tracking
gps stop
gps start
```

### Location not updating?

```bash
# Check status
gps status

# Test IP geolocation manually
curl -s https://ipapi.co/json/ | jq

# Restart with different interval
gps stop
gps config  # Set to 30 seconds
gps start
```

### Tracking URL not working?

**For Traccar demo:**
- Wait 1-2 minutes after starting tracking
- Device must send at least one location update first
- Check: https://demo2.traccar.org then search for your device ID

### Permission denied?

```bash
chmod +x ~/.local/bin/gps
```

## 💡 Pro Tips

### 1. Background Tracking on Boot

Add to crontab:
```bash
@reboot /home/kali/.local/bin/gps start
```

### 2. Multiple Devices

Use different device IDs for different devices, all tracking to same URL!

### 3. Share Tracking Link

The tracking URL is shareable - anyone can view your location (no login needed for Traccar demo)

### 4. Privacy Mode

Use self-hosted Traccar or OwnTracks for complete privacy:
```bash
# Self-host Traccar with Docker
docker run -d --name traccar \
  -p 8082:8082 -p 5055:5055 \
  traccar/traccar:latest

# Then setup GPS CLI with your server
gps setup  # Choose Traccar → Own server
```

## 🎯 Use Cases

### 1. Track Your Laptop
```bash
gps setup  # Once
gps start  # Every time you boot
```

### 2. Emergency Location
```bash
# Keep tracking running
# Share URL with trusted contacts
gps url
```

### 3. Travel Tracking
```bash
# Before trip
gps setup
gps start

# During trip
gps status  # Check location

# After trip
gps history  # Review route
gps stop
```

### 4. Device Recovery
```bash
# Keep tracking running
# If device stolen, use URL to locate
# Works even if screen is locked
```

## 📊 Commands Cheat Sheet

| Command | What It Does |
|---------|--------------|
| `gps setup` | First-time configuration |
| `gps start` | Start tracking |
| `gps stop` | Stop tracking |
| `gps status` | Check status & location |
| `gps url` | Get tracking URL |
| `gps config` | Change update interval |
| `gps history` | View location history |
| `gps providers` | List all providers |
| `gps help` | Show help |

## 🆘 Get Help

- **Documentation:** [README.md](README.md)
- **Issues:** https://github.com/alexcolls/gps-cli/issues
- **Logs:** `~/.config/gps-cli/gps.log`

## 🎉 You're All Set!

GPS CLI is now tracking your device. Open your tracking URL to see the magic! 🗺️✨

---

**Need more details?** Check the full [README.md](README.md) for advanced usage, provider setup, and troubleshooting.
