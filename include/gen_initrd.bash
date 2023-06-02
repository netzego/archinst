#!/bin/bash
# shellcheck disable=SC2154

# DESC: generates initramfs.img via `mkinitcpio -p linux-lts`
# ARGS: `$1` (optional): path to rootfs
# COND: $WORKSPACE
#       $MOUNTPOINT
# NOTE: on machines with 2G ram or less, expect some trouble shooting
gen_initrd() {
    local rootfs="${1:-$MOUNTPOINT}"

    print_header

    systemd-nspawn -D "${rootfs}" mkinitcpio --nocolor -p linux-lts

    lsinitcpio -l "${rootfs}/boot/initramfs-linux-lts.img"
}
