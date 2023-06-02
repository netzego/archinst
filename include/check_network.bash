#!/bin/bash

# DESC: check if host system is online with curl
# ARGS: $1: host (dns name or ip address). default: archlinux.org
# EXIT: if $1 is not reachable
check_network() {
    local host="${1:-archlinux.org}"

    print_header

    if ! curl --connect-timeout 0.5 -s -I "${host}"; then
        die 1 "\`${host}' is not reachable"
    fi
}
