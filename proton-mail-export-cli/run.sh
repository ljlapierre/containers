#!/usr/bin/env bash
# Usage: ./run.sh /path/to/backup/directory
podman build -f Containerfile -t proton-mail-export-cli
podman container run --name proton-mail-export-cli -iv "$1:/backup" proton-mail-export-cli
podman container rm -f proton-mail-export-cli
podman image rm proton-mail-export-cli
podman image prune -af --external
