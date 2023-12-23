#!/bin/bash

# DESC: generates /etc/fstab
# ARGS: `$1` (optional): directory of the rootfs
# EXIT: if `$rootfs` is not directory
#       if `$rootfs` is not mountpoint
#       if `$rootfs/swap/swapfile` does not exists
# COND: $WORKSPACE
#       $MOUNTPOINT
# NOTE: temporally disables all swap files/devices on the host while
#       activate the target swapfile
gen_fstab() {
    local rootfs="${1:-$MOUNTPOINT}"
    local swapfile="${rootfs}/swap/swapfile"

    print_header

    if [ ! -d "${rootfs}" ]; then
        die 1 "\`${rootfs}' is not a directory"
    fi

    if ! mountpoint "${rootfs}"; then
        die 1 "\`${rootfs}' is not a mountpoint"
    fi

    if [ ! -f "${swapfile}" ]; then
        die 1 "\`${swapfile}' does not exists"
    fi

    swapoff --all
    swapon "${swapfile}"

    genfstab -U "${rootfs}" >"${rootfs}/etc/fstab"

    # # fix broken entries
    # sed -i 's/\/luks-[0-9a-f]\+/\/rootfs/' "${rootfs}/etc/fstab"

    cat "${rootfs}/etc/fstab"

    swapoff "${swapfile}"
    swapon -a
}
