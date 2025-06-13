#!/usr/bin/env bash
# Usage: ./run.sh
if [ "$(id -u)" -eq 0 ]; then
    echo "Please run as a standard user, the script will prompt for sudo, i.e. ./run.sh"
    exit 1
fi
sudo podman build -qf Containerfile -t sonicwall-netextender
sudo podman container run \
    --rmi \
    --net host \
    --name sonicwall-netextender sonicwall-netextender

sudo podman exec -it sonicwall-netextender /bin/bash

    # --privileged \
    # -d \
    # --init \
    # --systemd always \
sudo podman container run \
    --rmi \
    --net host \
    --name sonicwall-netextender sonicwall-netextender

# https://www.reddit.com/r/podman/comments/1jlnt2b/podman_wayland_gui/
# https://discussion.fedoraproject.org/t/cannot-run-wayland-gui-app-in-podman/105151/8
# https://major.io/p/run-xorg-applications-with-podman/