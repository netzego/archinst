#!/bin/bash
# shellcheck disable=SC2154

# DESC: install systemd-boot
# ARGS: none
# COND: $WORKSPACE
#       $MOUNTPOINT
install_bootloader() {
    print_header "${FUNCNAME[0]}"

    bootctl --root "${MOUNTPOINT}" --esp-path=/efi --install-source=image install

    systemd-nspawn -D "${MOUNTPOINT}" bootctl list
}
