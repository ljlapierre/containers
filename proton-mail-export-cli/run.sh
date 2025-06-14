#!/usr/bin/env bash
# Usage: ./run.sh /path/to/backup/directory
if [ -z "${1}" ]; then
    echo "Please specify a backup directory, i.e. ./run.sh /path/to/backup/directory"
    exit 1
fi
podman build -qf Containerfile -t proton-mail-export-cli
podman container run --rmi --name proton-mail-export-cli -iv "${1}:/backup" proton-mail-export-cli
podman image prune -af
