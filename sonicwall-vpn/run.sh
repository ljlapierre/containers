#!/usr/bin/env bash
# Usage: ./run.sh
if [ "$(id -u)" -eq 0 ]; then
    echo "Please run as a standard user, the script will prompt for sudo, i.e. ./run.sh"
    exit 1
fi
sudo podman build -qf Containerfile -t sonicwall-vpn
sudo podman container run --name sonicwall-vpn sonicwall-vpn
