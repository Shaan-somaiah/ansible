#!/bin/bash

HOSTNAME=$(hostnamectl hostname | tr '[:lower:]' '[:upper:]')
IP=$(hostname -I | awk '{print $1}')
UPTIME=$(uptime -p | sed 's/up //')
LOAD=$(cut -d " " -f1-3 /proc/loadavg)
OS=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2- | tr -d '"')

GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

echo -e "${GREEN}"
figlet "$HOSTNAME"

echo "OS:     $OS"
echo "IP:     $IP"
echo "Uptime: $UPTIME"
echo "Load:   $LOAD"
echo -e "${RESET}"
