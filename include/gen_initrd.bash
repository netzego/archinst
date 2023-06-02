#!/bin/bash
# shellcheck disable=SC2154

# DESC: generates initramfs.img via `mkinitcpio -P`
# ARGS: None
# COND: $WORKSPACE
#       $MOUNTPOINT
gen_initrd() {
    print_header "${FUNCNAME[0]}"

    systemd-nspawn -D "${MOUNTPOINT}" mkinitcpio --nocolor -P

    lsinitcpio -l "${MOUNTPOINT}/boot/initramfs-linux-lts.img"
}
