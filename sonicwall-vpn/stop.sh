#!/usr/bin/env bash
# Usage: ./stop.sh
if [ "$(id -u)" -eq 0 ]; then
    echo "Please run as a standard user, the script will prompt for sudo, i.e. ./run.sh"
    exit 1
fi
sudo podman container stop sonicwall-vpn
sudo podman container rm -f sonicwall-vpn
sudo podman image rm sonicwall-vpn
sudo podman image prune -af --external
