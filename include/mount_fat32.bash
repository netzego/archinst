#!/bin/bash
# shellcheck disable=SC2154

# DESC: mount uefi partition inside rootfs
# ARGS: `$1` (optional): path to the device/partition
#       `$2` (required): path to efi directory. should be inside rootfs.
# EXPL: mount_fat32 "/dev/sdX1" "/mnt/efi"
# COND: $MOUNTPOINT
#       $UEFIPART
# TODO: write tests
mount_fat32() {
    local device="${1:-$UEFIPART}"
    local mntpoint="${2:-$MOUNTPOINT}/efi"

    print_header

    mkdir -vp "${mntpoint}"

    check_mountpoint "${mntpoint}"

    mount -v "${device}" "${mntpoint}"
}
