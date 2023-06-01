#!/bin/bash

# DESC: open a luks partition
# ARGS: $1: luks encrypted partition
#       $2: luks keyfile
#       $3: mapname (optional)
# EXIT: if $1 do not exists
#       if $1 is not a block device
#       if $1 is not luks device
luks_open() {
    local partition="$1"
    local keyfile="$2"
    local auto_mapname="luks-$(openssl rand -hex 8)"
    local mapname="${3:-${auto_mapname}}"

    print_header "${FUNCNAME[0]}"

    if [ ! -e "${partition}" ]; then
        die 1 "\`${partition}' do not exists"
    fi

    if [ ! -b "${partition}" ]; then
        die 1 "\`${partition}' is not a block device"
    fi

    if ! cryptsetup isLuks "${partition}"; then
        die 1 "\`${partition}' is not a luks partiton"
    fi

    if [ -f "${keyfile}" ]; then
        cryptsetup --verbose --key-file "${keyfile}" open "${partition}" "${mapname}"
    else
        cryptsetup --verbose open "${partition}" "${mapname}"
    fi
}
