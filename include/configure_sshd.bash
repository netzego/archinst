#!/bin/bash
# shellcheck disable=SC2154

# DESC: configure sshd.service
# ARGS: none
# COND: $WORKSPACE
#       $MOUNTPOINT
# TODO: checks, tests
configure_sshd() {
    print_header

    systemd-nspawn -D "${MOUNTPOINT}" systemctl enable sshd.service
}
