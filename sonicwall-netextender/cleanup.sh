#!/usr/bin/env bash
# Usage: ./cleanup.sh
if [ "$(id -u)" -eq 0 ]; then
    echo "Please run as a standard user, the script will prompt for sudo, i.e. ./run.sh"
    exit 1
fi

distrobox rm -r -Y sonicwall-netextender
