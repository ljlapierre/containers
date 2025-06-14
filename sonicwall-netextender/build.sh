#!/usr/bin/env bash
# Usage: ./build.sh
# or supply a deb link
# ./build.sh "https://software.sonicwall.com/NetExtender/NetExtender-linux-amd64-10.3.0-21.deb"
if [ "$(id -u)" -eq 0 ]; then
    echo "Please run as a standard user, the script will prompt for sudo, i.e. ./build.sh"
    exit 1
fi

if [ -n "$1" ]; then
    deblink="$1"
else
    deblink="https://software.sonicwall.com/NetExtender/NetExtender-linux-amd64-10.3.0-21.deb"
fi

distrobox create -Y \
    -n sonicwall-netextender \
    -i docker.io/library/ubuntu:latest \
    -r -I --unshare-devsys --unshare-groups --unshare-ipc \
    -ap libwebkit2gtk-4.1-0

distrobox enter -r -T sonicwall-netextender -- curl -o /tmp/sonicwall.deb $deblink
distrobox enter -r -T sonicwall-netextender -- sudo apt-get install -y /tmp/sonicwall.deb
distrobox enter -r -T sonicwall-netextender -- rm -f /tmp/sonicwall.deb
distrobox enter -r -T sonicwall-netextender -- distrobox-export -a 'SonicWall NetExtender'

echo -e '\n\033[0;31mNOTE: \033[0mSet a password for your user inside the container, then log out of the container to finish the build.\n'
distrobox enter -r sonicwall-netextender
