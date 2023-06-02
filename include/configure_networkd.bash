#!/bin/bash
# shellcheck disable=SC2154

# DESC: configure/enable basic network settings
# ARGS: none
# COND: $WORKSPACE
#       $MOUNTPOINT
configure_networkd() {
    print_header "${FUNCNAME[0]}"

    systemd-nspawn -D "${MOUNTPOINT}" systemctl enable systemd-networkd.service
    systemd-nspawn -D "${MOUNTPOINT}" systemctl enable systemd-resolved.service

    ln -frs "${MOUNTPOINT}/usr/lib/systemd/network/80-ethernet.network.example" \
        "${MOUNTPOINT}/etc/systemd/network/80-ethernet.network"

    ln -frs "${MOUNTPOINT}/run/systemd/resolve/stub-resolv.conf" \
        "${MOUNTPOINT}/etc/resolv.conf"
}
