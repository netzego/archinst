#!/bin/bash
# shellcheck disable=SC2154

# DESC: configure systemd-timesyncd.service
# ARGS: none
# COND: $WORKSPACE
#       $MOUNTPOINT
# TODO: checks, tests
configure_timesyncd() {
    print_header "${FUNCNAME[0]}"

    systemd-nspawn -D "${MOUNTPOINT}" systemctl enable systemd-timesyncd.service
}
