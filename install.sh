#!/bin/bash
# GPS CLI Installation Script
# Cross-platform GPS tracking tool installer

set -e  # Exit on error

# ============================================================================
# Color definitions for output formatting
# ============================================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
RESET='\033[0m'

# ============================================================================
# Global variables
# ============================================================================
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS_TYPE=""
SHELL_TYPE=""
SHELL_CONFIG=""
BIN_DIR="$HOME/.local/bin"
INSTALL_SYMLINK="$BIN_DIR/gps"
LOG_FILE="/tmp/gps-cli_install.log"

# ============================================================================
# Utility Functions
# ============================================================================

print_header() {
    echo -e "${CYAN}${BOLD}"
    echo "╔════════════════════════════════════════════════════════════════════╗"
    echo "║                    GPS CLI Installation Script                    ║"
    echo "║              Universal Device Location Tracker                     ║"
    echo "╚════════════════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
}

print_status() {
    local status=$1
    local message=$2
    
    case $status in
        "success")
            echo -e "${GREEN}✓${RESET} $message"
            ;;
        "error")
            echo -e "${RED}✗${RESET} $message"
            ;;
        "info")
            echo -e "${BLUE}ℹ${RESET} $message"
            ;;
        "warning")
            echo -e "${YELLOW}⚠${RESET} $message"
            ;;
        "progress")
            echo -e "${CYAN}→${RESET} $message"
            ;;
    esac
}

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

handle_error() {
    local message=$1
    print_status "error" "$message"
    log_message "ERROR: $message"
    echo -e "\n${YELLOW}Check log file for details: $LOG_FILE${RESET}"
    exit 1
}

# ============================================================================
# Detection Functions
# ============================================================================

detect_os() {
    print_status "progress" "Detecting operating system..."
    
    case "$(uname -s)" in
        Linux*)
            OS_TYPE="Linux"
            print_status "success" "Detected: Linux"
            ;;
        Darwin*)
            OS_TYPE="macOS"
            print_status "success" "Detected: macOS"
            ;;
        CYGWIN*|MINGW*|MSYS*)
            OS_TYPE="Windows"
            print_status "success" "Detected: Windows (WSL/MSYS)"
            ;;
        *)
            handle_error "Unsupported operating system: $(uname -s)"
            ;;
    esac
    
    log_message "Detected OS: $OS_TYPE"
}

detect_shell() {
    print_status "progress" "Detecting shell environment..."
    
    if [ -n "$ZSH_VERSION" ]; then
        SHELL_TYPE="zsh"
    elif [ -n "$BASH_VERSION" ]; then
        SHELL_TYPE="bash"
    else
        case "$SHELL" in
            */zsh)
                SHELL_TYPE="zsh"
                ;;
            */bash)
                SHELL_TYPE="bash"
                ;;
            *)
                SHELL_TYPE="bash"
                ;;
        esac
    fi
    
    print_status "success" "Detected shell: $SHELL_TYPE"
    log_message "Detected shell: $SHELL_TYPE"
}

detect_shell_config() {
    print_status "progress" "Locating shell configuration file..."
    
    if [ "$SHELL_TYPE" = "zsh" ]; then
        if [ -f "$HOME/.zshrc" ]; then
            SHELL_CONFIG="$HOME/.zshrc"
        else
            SHELL_CONFIG="$HOME/.zshrc"
        fi
    else
        if [ -f "$HOME/.bashrc" ]; then
            SHELL_CONFIG="$HOME/.bashrc"
        elif [ -f "$HOME/.bash_profile" ]; then
            SHELL_CONFIG="$HOME/.bash_profile"
        else
            SHELL_CONFIG="$HOME/.bashrc"
        fi
    fi
    
    print_status "success" "Shell config: $SHELL_CONFIG"
    log_message "Shell config file: $SHELL_CONFIG"
}

# ============================================================================
# Dependency Checking Functions
# ============================================================================

check_command() {
    command -v "$1" >/dev/null 2>&1
}

check_dependencies() {
    print_status "progress" "Checking required dependencies..."
    
    local missing_deps=()
    
    # Check for bash
    if ! check_command bash; then
        missing_deps+=("bash")
    fi
    
    # Check for curl
    if ! check_command curl; then
        missing_deps+=("curl")
    fi
    
    # Check for jq
    if ! check_command jq; then
        missing_deps+=("jq")
    fi
    
    if [ ${#missing_deps[@]} -eq 0 ]; then
        print_status "success" "All dependencies are satisfied (bash, curl, jq)"
        return 0
    else
        print_status "error" "Missing dependencies: ${missing_deps[*]}"
        echo ""
        print_status "info" "Installing missing dependencies..."
        install_dependencies "${missing_deps[@]}"
    fi
}

install_dependencies() {
    local deps=("$@")
    
    if [ "$OS_TYPE" = "Linux" ]; then
        if check_command apt-get; then
            sudo apt-get update && sudo apt-get install -y "${deps[@]}"
        elif check_command dnf; then
            sudo dnf install -y "${deps[@]}"
        elif check_command pacman; then
            sudo pacman -S --noconfirm "${deps[@]}"
        elif check_command yum; then
            sudo yum install -y "${deps[@]}"
        else
            handle_error "Could not detect package manager. Please install ${deps[*]} manually."
        fi
    elif [ "$OS_TYPE" = "macOS" ]; then
        if check_command brew; then
            brew install "${deps[@]}"
        else
            handle_error "Homebrew not found. Please install ${deps[*]} manually."
        fi
    else
        handle_error "Unsupported OS for automatic dependency installation. Please install ${deps[*]} manually."
    fi
    
    print_status "success" "Dependencies installed successfully"
}

# ============================================================================
# Installation Functions
# ============================================================================

install_gps_cli() {
    echo ""
    echo -e "${BOLD}${BLUE}═══════════════════════════════════════════════════════════════${RESET}"
    echo -e "${BOLD}${BLUE}  Installing GPS CLI${RESET}"
    echo -e "${BOLD}${BLUE}═══════════════════════════════════════════════════════════════${RESET}"
    echo ""
    
    # Verify we're in the project directory
    if [ ! -f "$SCRIPT_DIR/gps" ]; then
        handle_error "gps script not found. Please run this script from the gps-cli directory."
    fi
    
    # Make sure the script is executable
    chmod +x "$SCRIPT_DIR/gps"
    print_status "success" "Made gps script executable"
    
    # Create bin directory
    mkdir -p "$BIN_DIR"
    print_status "success" "Created bin directory: $BIN_DIR"
    log_message "Created bin directory: $BIN_DIR"
    
    # Create symlink
    print_status "progress" "Creating symlink to gps script..."
    
    if [ -L "$INSTALL_SYMLINK" ] || [ -f "$INSTALL_SYMLINK" ]; then
        print_status "warning" "Existing gps command found, removing..."
        rm -f "$INSTALL_SYMLINK"
    fi
    
    ln -s "$SCRIPT_DIR/gps" "$INSTALL_SYMLINK"
    print_status "success" "Created symlink: $INSTALL_SYMLINK -> $SCRIPT_DIR/gps"
    log_message "Created symlink: $INSTALL_SYMLINK"
    
    # Add to PATH if needed
    add_to_path
    
    # Verify installation
    print_status "progress" "Verifying installation..."
    if "$INSTALL_SYMLINK" help >/dev/null 2>&1; then
        print_status "success" "Installation verified"
        log_message "Installation verified successfully"
    else
        print_status "warning" "Could not verify installation completely"
    fi
    
    # Success message
    echo ""
    echo -e "${GREEN}${BOLD}✓ GPS CLI Installation Complete!${RESET}"
    echo ""
    echo -e "${BOLD}Installation details:${RESET}"
    echo -e "  • Script location: ${CYAN}$SCRIPT_DIR/gps${RESET}"
    echo -e "  • Symlink created: ${CYAN}$INSTALL_SYMLINK${RESET}"
    echo ""
    echo -e "${BOLD}Next steps:${RESET}"
    
    if ! echo "$PATH" | grep -q "$BIN_DIR"; then
        echo -e "  1. ${YELLOW}Restart your terminal${RESET} or run: ${CYAN}source $SHELL_CONFIG${RESET}"
        echo -e "  2. Run the application: ${YELLOW}gps help${RESET}"
    else
        echo -e "  • Run the application: ${YELLOW}gps help${RESET}"
    fi
    
    echo ""
    echo -e "${BOLD}Quick Start:${RESET}"
    echo -e "  ${YELLOW}gps setup${RESET}         # Configure tracking provider"
    echo -e "  ${YELLOW}gps start${RESET}         # Start tracking"
    echo -e "  ${YELLOW}gps url${RESET}           # Get tracking URL"
    echo -e "  ${YELLOW}gps status${RESET}        # Check tracking status"
    echo ""
    echo -e "${BOLD}Supported Providers:${RESET}"
    echo -e "  🛰️  Traccar (Free demo available)"
    echo -e "  🔒 OwnTracks (Privacy-focused)"
    echo -e "  ☁️  PhoneTrack (Nextcloud)"
    echo -e "  🔧 GPSLogger (Custom endpoint)"
    echo ""
    
    log_message "Installation completed successfully"
}

add_to_path() {
    print_status "progress" "Checking PATH configuration..."
    
    # Check if $BIN_DIR is already in PATH
    if echo "$PATH" | grep -q "$BIN_DIR"; then
        print_status "success" "$BIN_DIR is already in PATH"
        log_message "$BIN_DIR already in PATH"
        return 0
    fi
    
    # Check if it's already in the shell config
    if [ -f "$SHELL_CONFIG" ] && grep -q "$BIN_DIR" "$SHELL_CONFIG"; then
        print_status "success" "$BIN_DIR is configured in $SHELL_CONFIG"
        log_message "$BIN_DIR already configured in shell config"
        return 0
    fi
    
    # Add to shell config
    print_status "progress" "Adding $BIN_DIR to PATH in $SHELL_CONFIG..."
    
    # Backup shell config
    if [ -f "$SHELL_CONFIG" ]; then
        cp "$SHELL_CONFIG" "${SHELL_CONFIG}.backup.$(date +%Y%m%d_%H%M%S)"
        print_status "info" "Backed up shell config"
    fi
    
    # Add to config file
    {
        echo ""
        echo "# Added by GPS CLI installer on $(date)"
        echo 'export PATH="$HOME/.local/bin:$PATH"'
    } >> "$SHELL_CONFIG"
    
    print_status "success" "Added to PATH in $SHELL_CONFIG"
    log_message "Added $BIN_DIR to PATH in $SHELL_CONFIG"
    
    # Update current session
    export PATH="$BIN_DIR:$PATH"
}

# ============================================================================
# Main Installation Flow
# ============================================================================

main() {
    # Initialize log file
    echo "GPS CLI Installation Log - $(date)" > "$LOG_FILE"
    log_message "Installation started"
    
    # Print header
    clear
    print_header
    
    # Detect environment
    detect_os
    detect_shell
    detect_shell_config
    
    echo ""
    print_status "info" "Environment detected: $OS_TYPE with $SHELL_TYPE"
    echo ""
    
    # Check dependencies
    echo -e "${BOLD}Checking dependencies...${RESET}"
    echo ""
    check_dependencies
    
    echo ""
    print_status "success" "All dependencies are satisfied"
    echo ""
    
    # Install
    install_gps_cli
    
    echo -e "${GREEN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "${GREEN}${BOLD}  Installation log saved to: $LOG_FILE${RESET}"
    echo -e "${GREEN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    
    log_message "Installation completed successfully"
}

# ============================================================================
# Script Entry Point
# ============================================================================

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --help|-h)
            print_header
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --help, -h     Show this help message"
            echo ""
            echo "This script will install GPS CLI as a system-wide command."
            echo "Requirements: bash, curl, jq"
            echo ""
            echo "Providers supported:"
            echo "  • Traccar - Free demo or self-hosted GPS tracking"
            echo "  • OwnTracks - Privacy-focused location tracking"
            echo "  • PhoneTrack - Nextcloud-based tracking"
            echo "  • GPSLogger - Custom HTTP endpoint support"
            echo ""
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Run main installation
main
