#!/bin/bash

# DESC: generates /etc/fstab
# ARGS: none
# EXIT: if $MOUNTPOINT is not directory
#       if $MOUNTPOINT is not mountpoint
#       if $MOUNTPOINT/swap/swapfile do not exists
# COND: $WORKSPACE
#       $MOUNTPOINT
#       mkfs_btrfs()
#       mkfs_swapfile()
# NOTE: temporally disables all swap files/devices on the host while
#       activate the target swapfile
gen_fstab() {
    local swapfile="${MOUNTPOINT}/swap/swapfile"

    print_header "${FUNCNAME[0]}"

    if [ ! -d "${MOUNTPOINT}" ]; then
        die 1 "\`${MOUNTPOINT}' is not a directory"
    fi

    if ! mountpoint "${MOUNTPOINT}"; then
        die 1 "\`${MOUNTPOINT}' is not a mountpoint"
    fi

    if [ ! -f "${swapfile}" ]; then
        die 1 "\`${swapfile}' does not exists"
    fi

    swapoff --all
    swapon "${swapfile}"

    genfstab -U "${MOUNTPOINT}" | tee "${MOUNTPOINT}/etc/fstab"

    swapoff "${swapfile}"
    swapon -a
}
