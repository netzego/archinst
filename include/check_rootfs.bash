#!/bin/bash
# shellcheck disable=SC2154

# DESC: check if directory is rootfs directory and is a mountpoint
# ARGS: `$1` (optional): path to rootfs directory
# COND: $MOUNTPOINT
check_rootfs() {
    local rootfs="${1:-$MOUNTPOINT}"

    if [ ! -e "${rootfs}" ]; then
        die 1 "\`${rootfs}' does not exists"
    fi

    if [ ! -d "${rootfs}" ]; then
        die 1 "\`${rootfs}' is not a directory"
    fi

    if ! mountpoint "${rootfs}"; then
        die 1 "\`${rootfs}' is not a mountpoint"
    fi

    if [ ! -e "${rootfs}/etc/os-release" ]; then
        die 1 "\`${rootfs}' seems to contain a rootfs"
    fi
}
