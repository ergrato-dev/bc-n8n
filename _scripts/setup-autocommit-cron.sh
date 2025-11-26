#!/bin/bash

# ============================================================================
# Setup Autocommit Cron Job for Fedora 43
# ============================================================================
#
# What?
#   Script to install/uninstall the autocommit cron job on Fedora 43.
#
# For?
#   - Easy setup of automated commits every 5 minutes
#   - Manage the cron job without manual crontab editing
#
# Impact?
#   - Installs cron job that runs autocommit.sh every 5 minutes
#   - Uses user crontab (no root required)
#
# Usage:
#   ./setup-autocommit-cron.sh install    # Install cron job
#   ./setup-autocommit-cron.sh uninstall  # Remove cron job
#   ./setup-autocommit-cron.sh status     # Check status
#
# ============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AUTOCOMMIT_SCRIPT="${SCRIPT_DIR}/autocommit.sh"
CRON_COMMENT="# bc-n8n autocommit"
CRON_SCHEDULE="*/5 * * * *"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

print_header() {
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║           Autocommit Cron Setup for Fedora 43                ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

check_dependencies() {
    echo -e "${BLUE}[INFO]${NC} Checking dependencies..."
    
    # Check if cronie is installed (Fedora's cron implementation)
    if ! command -v crond &> /dev/null && ! systemctl is-active --quiet crond 2>/dev/null; then
        echo -e "${YELLOW}[WARN]${NC} cronie not installed or not running"
        echo -e "${BLUE}[INFO]${NC} Installing cronie..."
        sudo dnf install -y cronie
        sudo systemctl enable --now crond
        echo -e "${GREEN}[SUCCESS]${NC} cronie installed and started"
    else
        echo -e "${GREEN}[OK]${NC} cronie is available"
    fi
    
    # Check if autocommit.sh exists
    if [ ! -f "${AUTOCOMMIT_SCRIPT}" ]; then
        echo -e "${RED}[ERROR]${NC} autocommit.sh not found at ${AUTOCOMMIT_SCRIPT}"
        exit 1
    fi
    
    # Make sure autocommit.sh is executable
    chmod +x "${AUTOCOMMIT_SCRIPT}"
    echo -e "${GREEN}[OK]${NC} autocommit.sh is executable"
}

install_cron() {
    echo -e "${BLUE}[INFO]${NC} Installing cron job..."
    
    # Check if already installed
    if crontab -l 2>/dev/null | grep -q "${AUTOCOMMIT_SCRIPT}"; then
        echo -e "${YELLOW}[WARN]${NC} Cron job already installed"
        return 0
    fi
    
    # Add cron job
    (crontab -l 2>/dev/null; echo "${CRON_COMMENT}"; echo "${CRON_SCHEDULE} ${AUTOCOMMIT_SCRIPT}") | crontab -
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[SUCCESS]${NC} Cron job installed successfully"
        echo ""
        echo -e "${BLUE}Schedule:${NC} Every 5 minutes"
        echo -e "${BLUE}Script:${NC} ${AUTOCOMMIT_SCRIPT}"
        echo ""
        echo -e "Current crontab:"
        crontab -l | grep -A1 "bc-n8n"
    else
        echo -e "${RED}[ERROR]${NC} Failed to install cron job"
        exit 1
    fi
}

uninstall_cron() {
    echo -e "${BLUE}[INFO]${NC} Removing cron job..."
    
    # Check if installed
    if ! crontab -l 2>/dev/null | grep -q "${AUTOCOMMIT_SCRIPT}"; then
        echo -e "${YELLOW}[WARN]${NC} Cron job not found"
        return 0
    fi
    
    # Remove cron job
    crontab -l 2>/dev/null | grep -v "${AUTOCOMMIT_SCRIPT}" | grep -v "${CRON_COMMENT}" | crontab -
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[SUCCESS]${NC} Cron job removed successfully"
    else
        echo -e "${RED}[ERROR]${NC} Failed to remove cron job"
        exit 1
    fi
}

show_status() {
    echo -e "${BLUE}[INFO]${NC} Checking autocommit cron status..."
    echo ""
    
    # Check crond service
    if systemctl is-active --quiet crond 2>/dev/null; then
        echo -e "${GREEN}[✓]${NC} crond service is running"
    else
        echo -e "${RED}[✗]${NC} crond service is NOT running"
        echo -e "    Run: ${YELLOW}sudo systemctl start crond${NC}"
    fi
    
    # Check cron job
    if crontab -l 2>/dev/null | grep -q "${AUTOCOMMIT_SCRIPT}"; then
        echo -e "${GREEN}[✓]${NC} Autocommit cron job is installed"
        echo ""
        echo -e "Cron entry:"
        crontab -l | grep -A1 "bc-n8n"
    else
        echo -e "${YELLOW}[✗]${NC} Autocommit cron job is NOT installed"
        echo -e "    Run: ${YELLOW}$0 install${NC}"
    fi
    
    # Check log file
    LOG_FILE="${SCRIPT_DIR}/autocommit.log"
    if [ -f "${LOG_FILE}" ]; then
        echo ""
        echo -e "${BLUE}[INFO]${NC} Last 5 log entries:"
        tail -5 "${LOG_FILE}"
    fi
}

show_usage() {
    echo "Usage: $0 {install|uninstall|status}"
    echo ""
    echo "Commands:"
    echo "  install    - Install the autocommit cron job (every 5 minutes)"
    echo "  uninstall  - Remove the autocommit cron job"
    echo "  status     - Show current status"
    echo ""
    echo "Manual cron setup (alternative):"
    echo "  crontab -e"
    echo "  Add: */5 * * * * ${AUTOCOMMIT_SCRIPT}"
}

# Main
print_header

case "${1}" in
    install)
        check_dependencies
        install_cron
        ;;
    uninstall)
        uninstall_cron
        ;;
    status)
        show_status
        ;;
    *)
        show_usage
        exit 1
        ;;
esac
