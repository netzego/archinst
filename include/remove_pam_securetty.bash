#!/bin/bash
# shellcheck disable=SC2154

# DESC: remove pam_securetty from /etc/pam.d/login
#       this enable logins via nspawn/machhinectl
# ARGS: none
# COND: $WORKSPACE
#       $MOUNTPOINT
# TODO: tests
remove_pam_securetty() {
    print_header

    sed -i 's%^\(.*pam_securetty.so\)$%#\1%' "${MOUNTPOINT}/etc/pam.d/login"
}
