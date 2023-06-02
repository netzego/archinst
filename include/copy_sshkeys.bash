#!/bin/bash
# shellcheck disable=SC2154

# DESC: copy archinst.pubkey to /root/.ssh/.authorized_keys
# ARGS: none
# COND: $WORKSPACE
#       $MOUNTPOINT
# TODO: checks, tests, naming
copy_sshkeys() {
    local pubkeyfile="${PWD}/${SCRIPTDIR}/${SCRIPTNAME}.pubkey"

    print_header "${FUNCNAME[0]}"

    if [[ -f "${pubkeyfile}" ]]; then
        cp -v "${pubkeyfile}" "${mountpoint}/root/.ssh/authorized_keys"
    fi
}
