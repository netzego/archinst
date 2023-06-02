#!/bin/bash
# shellcheck disable=SC2154

# DESC: build a fat32 filesystem and mounts it
# ARGS: `$1` (optional): disc/partition to
# EXIT: if `$1` do not exists
#       if `$1` is not a block device
# COND: $UEFIPART
# EXPL: mkfs_fat32 "/dev/sdX1"
# TODO: write tests
mkfs_fat32() {
    local device="${1:-$UEFIPART}"

    print_header

    if [ ! -e "${device}" ]; then
        die 1 "\`${device}' not exists"
    fi

    if [ ! -b "${device}" ]; then
        die 1 "\`${device}' is not block device"
    fi

    mkfs.fat -F 32 "${device}"
}
