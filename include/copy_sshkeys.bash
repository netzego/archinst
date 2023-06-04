#!/bin/bash
# shellcheck disable=SC2154

# DESC: copy archinst.pubkey to /root/.ssh/.authorized_keys
# ARGS: `$1` (optional): the path to a ssh authorized_keys file
#       `$2` (optional): the path to the rootfs
# COND: $WORKSPACE
#       $MOUNTPOINT
# TODO: checks, tests
copy_sshkeys() {
    declare -r keyfile="${1:-${PWD}/${SCRIPTNAME}.pubkey}"
    declare -r rootfs="${2:-${MOUNTPOINT}}"

    print_header

    if [[ -f "${keyfile}" ]]; then
        cp -v "${keyfile}" "${rootfs}/root/.ssh/authorized_keys"
    fi
}
