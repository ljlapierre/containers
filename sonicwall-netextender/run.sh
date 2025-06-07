#!/usr/bin/env bash
# Usage: ./run.sh
if [ "$(id -u)" -eq 0 ]; then
    echo "Please run as a standard user, the script will prompt for sudo, i.e. ./run.sh"
    exit 1
fi
sudo podman build -qf Containerfile -t sonicwall-netextender
sudo podman container run \
    --privileged \
    --init \
    --net host \
    --systemd always \
    --name sonicwall-netextender sonicwall-netextender
