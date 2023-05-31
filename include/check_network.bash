#!/bin/bash

# DESC: check if system is online by ping
# ARGS: $1: host (dns name or ip address). default: archlinux.org
#       $2: how many packets to send. default: 1
#       $3: sec to wait before drop packet. default: 0.3
# EXIT: if $1 is not reachable
check_network() {
    local host="${1:-archlinux.org}"
    local count="${2:-1}"
    local timeout="${3:-0.3}"

    print_header "${FUNCNAME[0]}"

    ping -n -q -c "${count}" -W "${timeout}" "${host}" &>/dev/null

    # shellcheck disable=SC2181
    if [ $? -ne 0 ]; then
        die 1 "\`${host}' is not reachable"
    fi
}
