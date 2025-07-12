#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}Error:${NC} Please run this script as root (use sudo)"
    exit 1
fi

providers=("Shecan" "Radar" "Electro" "Begzar" "DNS Pro" "403" "Google" "Cloudflare" \
           "Quad9" "Ultra-DNS1" "Ultra-DNS2" "NTT" "DNS-XBOX" "OpenDNS" "MCI" "MTN-Irancel" "Rightel" "Reset to Default")

declare -A dns_servers=(
    ["Shecan"]="178.22.122.100 185.51.200.2"
    ["Radar"]="10.202.10.10 10.202.10.11"
    ["Electro"]="78.157.42.100 78.157.42.101"
    ["Begzar"]="185.55.226.26 185.55.226.25"
    ["DNS Pro"]="87.107.110.109 87.107.110.110"
    ["403"]="10.202.10.202 10.202.10.102"
    ["Google"]="8.8.8.8 8.8.4.4"
    ["Cloudflare"]="1.1.1.1 1.0.0.1"
    ["Quad9"]="9.9.9.9 149.112.112.112"
    ["Ultra-DNS1"]="64.6.64.6 64.6.65.6"
    ["Ultra-DNS2"]="156.154.70.2 165.154.71.2"
    ["NTT"]="129.250.35.250 129.250.35.251"
    ["DNS-XBOX"]="37.220.84.124"
    ["OpenDNS"]="208.67.222.222 208.67.220.220"
    ["MCI"]="208.67.220.200 208.67.222.222"
    ["MTN-Irancel"]="74.82.42.42"
    ["Rightel"]="91.239.100.100 89.223.43.71"
    ["Reset to Default"]="127.0.0.53"
)

show_current() {
    echo
    echo -e "${YELLOW}Current DNS:${NC}"
    grep "^nameserver" /etc/resolv.conf 2>/dev/null | awk '{print "  •", $2}' || echo "  (none)"
    echo
}

show_menu() {
    echo -e "${CYAN}Available DNS Providers:${NC}"
    for i in "${!providers[@]}"; do
        name="${providers[$i]}"
        printf "  %2d) %-17s %s\n" $((i + 1)) "$name" "${dns_servers[$name]}"
    done
    echo "   0) Exit"
    echo
}

backup_resolv() {
    local backup="/etc/resolv.conf.bak.$(date +%Y%m%d_%H%M%S)"
    cp /etc/resolv.conf "$backup"
    echo -e "${GREEN}Backup created:${NC} $backup"
}

update_resolv() {
    local provider="$1"
    local dns_list="$2"
    local tmp
    tmp=$(mktemp)

    {
        echo "# Updated on $(date)"
        if [ "$provider" != "Reset to Default" ]; then
            echo "# Provider: $provider"
        fi
        for dns in $dns_list; do
            echo "nameserver $dns"
        done

        if [ "$provider" = "Reset to Default" ]; then
            grep -E '^(options|search)' /etc/resolv.conf 2>/dev/null
        else
            echo "options edns0 trust-ad"
            local existing_search
            existing_search=$(grep "^search" /etc/resolv.conf 2>/dev/null)
            if [ -n "$existing_search" ]; then
                echo "$existing_search"
            fi
        fi
    } > "$tmp"

    chmod 644 "$tmp"
    mv "$tmp" /etc/resolv.conf
    echo -e "${GREEN}DNS updated:${NC} $provider (${dns_list// /, })"
}

main() {
    show_current
    while true; do
        show_menu
        read -rp "Select (0-${#providers[@]}): " choice
        echo

        if [[ ! "$choice" =~ ^[0-9]+$ ]]; then
            echo -e "${RED}Invalid input${NC}, numbers only."
            continue
        fi

        if [ "$choice" -eq 0 ]; then
            echo -e "${CYAN}Bye.${NC}"
            exit 0
        fi

        if [ "$choice" -lt 1 ] || [ "$choice" -gt "${#providers[@]}" ]; then
            echo -e "${RED}Invalid option.${NC}"
            continue
        fi

        provider="${providers[$((choice - 1))]}"
        backup_resolv
        update_resolv "$provider" "${dns_servers[$provider]}"
        show_current
        break
    done
}

main

