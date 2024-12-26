#!/bin/bash

# Define color codes for a Nordic theme
declare -A COLORS=(
    ["BLUE"]='\033[0;38;5;66m'
    ["CYAN"]='\033[0;38;5;73m'
    ["GREEN"]='\033[0;38;5;71m'
    ["YELLOW"]='\033[0;38;5;222m'
    ["RED"]='\033[0;38;5;168m'
    ["PURPLE"]='\033[0;38;5;176m'
    ["NC"]='\033[0m'
)

# Initialize action tracking arrays
declare -A ACTIONS_SUMMARY
declare -a REMOVED_PACKAGES=()
declare -a UPGRADED_PACKAGES=()
declare -a FIXED_PACKAGES=()

# Progress bar function
show_progress() {
    local duration=$1
    local width=50
    local progress=0
    local step=$((width / duration))

    echo -n "["
    while [ $progress -lt $width ]; do
        echo -n "▓"
        ((progress++))
        sleep 0.1
    done
    echo -n "]"
    echo
}

# Spinner animation
show_spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Enhanced logging function with timestamps
log() {
    local color=$1
    local message=$2
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo -e "${COLORS[$color]}[$timestamp] $message${COLORS[NC]}"
}

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
    log "RED" "Please run as root or with sudo"
    exit 1
fi

# Display system info
print_system_info() {
    log "PURPLE" "System Information:"
    echo -e "${COLORS[CYAN]}OS:\t\t$(uname -o)"
    echo -e "Kernel:\t\t$(uname -r)"
    echo -e "Architecture:\t$(uname -m)"
    echo -e "Hostname:\t$(hostname)${COLORS[NC]}\n"
}

# Display fancy header
print_header() {
    clear
    echo -e "${COLORS[BLUE]}"
    echo "╔══════════════════════════════════════╗"
    echo "║      System Maintenance Script       ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "${COLORS[NC]}\n"
}

# Track package changes
track_changes() {
    local action=$1
    local output=$2

    case $action in
        "upgrade")
            # Track upgraded packages
            local upgraded=$(echo "$output" | grep "^Inst" | cut -d " " -f 2)
            if [ ! -z "$upgraded" ]; then
                readarray -t UPGRADED_PACKAGES <<< "$upgraded"
                ACTIONS_SUMMARY["upgraded"]=${#UPGRADED_PACKAGES[@]}
            else
                ACTIONS_SUMMARY["upgraded"]=0
            fi
            ;;
        "autoremove")
            # Track removed packages
            local removed=$(echo "$output" | grep "^Remv" | cut -d " " -f 2)
            if [ ! -z "$removed" ]; then
                readarray -t REMOVED_PACKAGES <<< "$removed"
                ACTIONS_SUMMARY["removed"]=${#REMOVED_PACKAGES[@]}
            else
                ACTIONS_SUMMARY["removed"]=0
            fi
            ;;
        "fix-broken")
            # Track fixed packages
            local fixed=$(echo "$output" | grep "^Inst" | cut -d " " -f 2)
            if [ ! -z "$fixed" ]; then
                readarray -t FIXED_PACKAGES <<< "$fixed"
                ACTIONS_SUMMARY["fixed"]=${#FIXED_PACKAGES[@]}
            else
                ACTIONS_SUMMARY["fixed"]=0
            fi
            ;;
    esac
}

# Print detailed summary
print_detailed_summary() {
    echo -e "\n${COLORS[PURPLE]}═══════════════════════════════════"
    echo "      Maintenance Summary Report      "
    echo -e "═══════════════════════════════════${COLORS[NC]}\n"

    # Package upgrades
    echo -e "${COLORS[CYAN]}Packages Upgraded: ${COLORS[GREEN]}${ACTIONS_SUMMARY["upgraded"]}${COLORS[NC]}"
    if [ ${ACTIONS_SUMMARY["upgraded"]} -gt 0 ]; then
        echo -e "${COLORS[YELLOW]}Upgraded packages:${COLORS[NC]}"
        printf '%s\n' "${UPGRADED_PACKAGES[@]}" | sed 's/^/  - /'
    fi

    # Removed packages
    echo -e "\n${COLORS[CYAN]}Packages Removed: ${COLORS[GREEN]}${ACTIONS_SUMMARY["removed"]}${COLORS[NC]}"
    if [ ${ACTIONS_SUMMARY["removed"]} -gt 0 ]; then
        echo -e "${COLORS[YELLOW]}Removed packages:${COLORS[NC]}"
        printf '%s\n' "${REMOVED_PACKAGES[@]}" | sed 's/^/  - /'
    fi

    # Fixed packages
    echo -e "\n${COLORS[CYAN]}Packages Fixed: ${COLORS[GREEN]}${ACTIONS_SUMMARY["fixed"]}${COLORS[NC]}"
    if [ ${ACTIONS_SUMMARY["fixed"]} -gt 0 ]; then
        echo -e "${COLORS[YELLOW]}Fixed packages:${COLORS[NC]}"
        printf '%s\n' "${FIXED_PACKAGES[@]}" | sed 's/^/  - /'
    fi

    # Print disk space changes
    echo -e "\n${COLORS[CYAN]}Disk Space Changes:${COLORS[NC]}"
    df -h --output=source,used,avail | grep -v "tmpfs" | awk -v cyan="${COLORS[CYAN]}" -v nc="${COLORS[NC]}" '
        NR==1 {
            printf "\n%-20s %-10s %-10s\n", "Filesystem", "Used", "Available"
        }
        NR>1 {
            printf "%-20s %-10s %-10s\n", $1, $2, $3
        }'
}

# Main maintenance function with tracking
perform_maintenance() {
    local step=$1
    local cmd=$2
    local action=$3
    local success_msg=$4
    local error_msg=$5

    log "CYAN" "Step $step: $success_msg"
    
    # Capture output for tracking
    local output
    if output=$(eval "$cmd" 2>&1); then
        show_progress 5
        log "GREEN" "✔ $success_msg"
        # Track changes if action is specified
        if [ ! -z "$action" ]; then
            track_changes "$action" "$output"
        fi
        return 0
    else
        log "RED" "✘ $error_msg"
        return 1
    fi
}

# Main execution
print_header
print_system_info

# Create maintenance steps with tracking actions
maintenance_steps=(
    "apt-get update##Updating package list#Failed to update package list"
    "apt-get upgrade -y#upgrade#Upgrading packages#Failed to upgrade packages"
    "apt-get install -f -y#fix-broken#Fixing broken installations#Failed to fix broken installations"
    "apt-get autoremove -y#autoremove#Removing unnecessary packages#Failed to remove unnecessary packages"
    "apt-get autoclean##Cleaning up package cache#Failed to clean up package cache"
)

# Execute maintenance steps
for i in "${!maintenance_steps[@]}"; do
    IFS='#' read -r cmd action success_msg error_msg <<< "${maintenance_steps[$i]}"
    perform_maintenance $((i+1)) "$cmd" "$action" "$success_msg" "$error_msg" || exit 1
done

# Display completion message and detailed summary
print_detailed_summary

echo -e "\n${COLORS[BLUE]}"
echo "╔══════════════════════════════════════╗"
echo "║     Maintenance Tasks Completed      ║"
echo "╚══════════════════════════════════════╝"
echo -e "${COLORS[NC]}"

log "GREEN" "All maintenance tasks completed successfully!"
exit 0
