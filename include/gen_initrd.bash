#!/bin/bash
# shellcheck disable=SC2154

# DESC: generates initramfs.img via `mkinitcpio -p linux-lts`
# ARGS: `$1` (optional): path to rootfs
# EXIT: if `$preset` (hard coded) not exists
# COND: $WORKSPACE
#       $MOUNTPOINT
# NOTE: on machines with 2G ram or less, expect some trouble shooting
# TODO: cleanup, write tests, make preset/linux-version configurable,
#       deadcode
gen_initrd() {
    local rootfs="${1:-$MOUNTPOINT}"
    local preset="${rootfs}/etc/mkinitcpio.d/linux-lts.preset"

    print_header

    # TODO: do not use the -p or -P option. see: configure_initrd.bash.
    # BUG: this breaks on live environment with low ram configuration
    # systemd-nspawn -D "${rootfs}" \
    #     mkinitcpio --nocolor --verbose -p linux-lts

    if [ ! -f "${preset}" ]; then
        die 1 "\`${preset}' does not exists"
    fi

    # to run mkinitcpio without the -p or -P flag. we need some information
    # of the kernel version and locations (uki, vmlinuz and initrd) we about
    # to install. we can gather all from the /etc/mkinitcpio.d/*.preset
    # file. which is a bash
    source "${preset}"

    systemd-nspawn -D "${rootfs}" \
        mkinitcpio --nocolor --verbose \
        --uki "${default_uki}" \
        --kernel "${ALL_kver}" \
        --kernelimage "${ALL_kver}"

    # mkinitcpio --verbose is probably enough
    # lsinitcpio -l "${rootfs}/boot/initramfs-linux-lts.img"
}
