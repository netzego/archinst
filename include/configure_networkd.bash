#!/bin/bash
# shellcheck disable=SC2154

# DESC: configure/enable basic network settings
# ARGS: `$1` (optional): directory of the rootfs
# COND: $WORKSPACE
#       $MOUNTPOINT
# TODO: refactor systemd-resolved config
configure_networkd() {
    local rootfs="${1:-$MOUNTPOINT}"

    print_header

    systemd-nspawn -D "${rootfs}" systemctl enable systemd-networkd.service
    systemd-nspawn -D "${rootfs}" systemctl enable systemd-resolved.service

    ln -frs "${rootfs}/usr/lib/systemd/network/80-ethernet.network.example" \
        "${rootfs}/etc/systemd/network/80-ethernet.network"

    ln -frs "${rootfs}/usr/lib/systemd/network/80-wifi-station.network.example" \
        "${rootfs}/etc/systemd/network/80-wifi-station.network"

    ln -frs "${rootfs}/run/systemd/resolve/stub-resolv.conf" \
        "${rootfs}/etc/resolv.conf"
}
