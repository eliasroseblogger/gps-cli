#!/bin/bash
# GPS CLI Demo Script
# Showcases all features with simulated interactions

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

print_step() {
    echo ""
    echo -e "${CYAN}${BOLD}═══════════════════════════════════════════════════${RESET}"
    echo -e "${CYAN}${BOLD}  $1${RESET}"
    echo -e "${CYAN}${BOLD}═══════════════════════════════════════════════════${RESET}"
    echo ""
}

print_info() {
    echo -e "${BLUE}ℹ${RESET} $1"
}

print_success() {
    echo -e "${GREEN}✓${RESET} $1"
}

print_demo() {
    echo -e "${YELLOW}$${RESET} ${BOLD}$1${RESET}"
}

pause() {
    read -p "Press Enter to continue..."
}

clear
echo -e "${CYAN}${BOLD}"
cat << "EOF"
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║              GPS CLI - Demo & Feature Showcase              ║
║                                                              ║
║            Universal Device Location Tracker                ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
EOF
echo -e "${RESET}"

print_info "This demo will showcase GPS CLI features"
print_info "No actual tracking will be started"
echo ""
pause

# Step 1: Show help
print_step "Step 1: GPS CLI Help"
print_demo "./gps help"
echo ""
./gps help
pause

# Step 2: List providers
print_step "Step 2: Available Providers"
print_demo "./gps providers"
echo ""
./gps providers
pause

# Step 3: Show current status
print_step "Step 3: Check Status"
print_demo "./gps status"
echo ""
./gps status || true
pause

# Step 4: Show configuration location
print_step "Step 4: Configuration Files"
print_info "All configuration is stored in: ~/.config/gps-cli/"
echo ""
echo "Configuration structure:"
echo "  ~/.config/gps-cli/"
echo "  ├── config.json       # Main configuration"
echo "  ├── history.json      # Location history"
echo "  ├── gps.log          # Application logs"
echo "  ├── .env             # Provider credentials (optional)"
echo "  └── tracker.pid      # Background process ID"
pause

# Step 5: Show .env.sample
print_step "Step 5: Configuration Template"
print_demo "cat .env.sample"
echo ""
head -30 .env.sample
echo "..."
echo "(showing first 30 lines)"
pause

# Step 6: Installation demo
print_step "Step 6: Installation"
print_info "To install GPS CLI system-wide:"
echo ""
print_demo "./install.sh"
echo ""
print_info "The installer will:"
echo "  • Check dependencies (bash, curl, jq)"
echo "  • Create symlink in ~/.local/bin/gps"
echo "  • Add to PATH if needed"
echo "  • Verify installation"
pause

# Step 7: Quick start workflow
print_step "Step 7: Quick Start Workflow"
echo ""
echo -e "${BOLD}Complete tracking setup in 4 commands:${RESET}"
echo ""
echo -e "${YELLOW}1.${RESET} ${GREEN}gps setup${RESET}"
echo "   └─ Configure provider (Traccar, OwnTracks, etc.)"
echo ""
echo -e "${YELLOW}2.${RESET} ${GREEN}gps start${RESET}"
echo "   └─ Start background tracking"
echo ""
echo -e "${YELLOW}3.${RESET} ${GREEN}gps url${RESET}"
echo "   └─ Get web tracking URL"
echo ""
echo -e "${YELLOW}4.${RESET} ${GREEN}gps status${RESET}"
echo "   └─ Check tracking status"
pause

# Step 8: Provider examples
print_step "Step 8: Provider Setup Examples"
echo ""
echo -e "${BOLD}Traccar (Free Demo):${RESET}"
echo "  1. gps setup"
echo "  2. Select '1' (Traccar)"
echo "  3. Select '1' (Free demo server)"
echo "  4. Done! Get URL: https://demo2.traccar.org/?deviceId=YOUR_ID"
echo ""
echo -e "${BOLD}OwnTracks (Self-hosted):${RESET}"
echo "  1. gps setup"
echo "  2. Select '2' (OwnTracks)"
echo "  3. Enter endpoint: http://your-server.com/owntracks"
echo "  4. Enter credentials (optional)"
echo ""
echo -e "${BOLD}PhoneTrack (Nextcloud):${RESET}"
echo "  1. gps setup"
echo "  2. Select '3' (PhoneTrack)"
echo "  3. Enter Nextcloud URL"
echo "  4. Enter session token"
echo ""
echo -e "${BOLD}GPSLogger (Custom):${RESET}"
echo "  1. gps setup"
echo "  2. Select '4' (GPSLogger)"
echo "  3. Enter HTTP endpoint URL"
echo "  4. Enter auth header (optional)"
pause

# Step 9: Commands reference
print_step "Step 9: Command Reference"
echo ""
echo "┌─────────────────┬──────────┬──────────────────────────────────┐"
echo "│ Command         │ Alias    │ Description                      │"
echo "├─────────────────┼──────────┼──────────────────────────────────┤"
echo "│ gps setup       │ -        │ Configure tracking provider      │"
echo "│ gps start       │ -        │ Start GPS tracking               │"
echo "│ gps stop        │ -        │ Stop GPS tracking                │"
echo "│ gps status      │ s        │ Show status and location         │"
echo "│ gps url         │ link     │ Display tracking URL             │"
echo "│ gps config      │ configure│ Configure update interval        │"
echo "│ gps history     │ h        │ Show location history            │"
echo "│ gps providers   │ list     │ List available providers         │"
echo "│ gps help        │ -h       │ Show help message                │"
echo "└─────────────────┴──────────┴──────────────────────────────────┘"
pause

# Step 10: Features summary
print_step "Step 10: Key Features"
echo ""
echo -e "${GREEN}🌍 Multi-Provider Support${RESET}"
echo "   • Traccar, OwnTracks, PhoneTrack, GPSLogger"
echo ""
echo -e "${GREEN}📡 Flexible Location Sources${RESET}"
echo "   • IP-based geolocation (works anywhere)"
echo "   • GPS hardware support (via gpsd)"
echo ""
echo -e "${GREEN}🗺️  Web-Based Tracking${RESET}"
echo "   • Real-time map visualization"
echo "   • Shareable tracking URLs"
echo ""
echo -e "${GREEN}⚙️  Highly Configurable${RESET}"
echo "   • Adjustable update intervals (10s-600s)"
echo "   • Background tracking daemon"
echo ""
echo -e "${GREEN}📊 Location History${RESET}"
echo "   • Track last 50 locations"
echo "   • Timestamped entries"
echo ""
echo -e "${GREEN}🔒 Privacy-Focused${RESET}"
echo "   • Self-hosted options available"
echo "   • Local configuration storage"
pause

# Step 11: Platform support
print_step "Step 11: Cross-Platform Support"
echo ""
echo "✅ Linux (Full support)"
echo "   └─ All features, GPS hardware support"
echo ""
echo "✅ macOS (Full support)"
echo "   └─ All features, limited GPS hardware"
echo ""
echo "✅ Windows WSL (Full support)"
echo "   └─ All features via WSL/MSYS2"
echo ""
echo "📱 Android"
echo "   └─ Use Traccar Client app with same device ID"
echo ""
echo "📱 iOS"
echo "   └─ Use OwnTracks app with endpoint config"
pause

# Step 12: Use cases
print_step "Step 12: Use Cases"
echo ""
echo -e "${CYAN}1. Personal Device Tracking${RESET}"
echo "   Track your laptop, desktop, or server location"
echo ""
echo -e "${CYAN}2. Emergency Location Sharing${RESET}"
echo "   Share tracking URL with trusted contacts"
echo ""
echo -e "${CYAN}3. Travel Tracking${RESET}"
echo "   Monitor device location during trips"
echo ""
echo -e "${CYAN}4. Device Recovery${RESET}"
echo "   Locate lost or stolen devices"
echo ""
echo -e "${CYAN}5. Fleet Management${RESET}"
echo "   Track multiple devices with unique IDs"
echo ""
echo -e "${CYAN}6. Development & Testing${RESET}"
echo "   Test location-based applications"
pause

# Final
print_step "Demo Complete!"
echo ""
echo -e "${GREEN}${BOLD}🎉 GPS CLI Demo Finished!${RESET}"
echo ""
echo "To get started:"
echo ""
echo -e "  ${YELLOW}1.${RESET} Install:     ${GREEN}./install.sh${RESET}"
echo -e "  ${YELLOW}2.${RESET} Setup:       ${GREEN}gps setup${RESET}"
echo -e "  ${YELLOW}3.${RESET} Start:       ${GREEN}gps start${RESET}"
echo -e "  ${YELLOW}4.${RESET} Get URL:     ${GREEN}gps url${RESET}"
echo ""
echo "📖 Documentation:"
echo "   • Quick Start:  QUICKSTART.md"
echo "   • Full Guide:   README.md"
echo "   • GitHub:       https://github.com/alexcolls/gps-cli"
echo ""
echo -e "${CYAN}Happy tracking! 🛰️🗺️${RESET}"
echo ""
