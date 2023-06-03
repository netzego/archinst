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

    # TODO: do not use the -p or -P option. see: configure_initrd.bash.
    # BUG: this breaks on live environment with low ram configuration
    systemd-nspawn -D "${rootfs}" \
        mkinitcpio --nocolor --verbose -p linux-lts

    lsinitcpio -l "${rootfs}/boot/initramfs-linux-lts.img"
}
