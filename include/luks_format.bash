#!/bin/bash

# DESC: creates a luks2 partition
# ARGS: `$1` (required): partition to use
#       `$2` (optional): a luks keyfile. eg. `echo -n "t3st" > keyfile`
# EXIT: if $1 partition do not exists
#       if $1 partition is not a block device
# EXPL: luks_format "/dev/sdX2" "/path/to/keyfile"
# COND: $ROOTPART
# TODO: check empty keyfile var
luks_format() {
    local partition="${1:-$ROOTPART}"
    local keyfile="${2}"

    print_header

    if [ ! -e "${partition}" ]; then
        die 1 "\`${partition}' do not exists"
    fi

    if [ ! -b "${partition}" ]; then
        die 1 "\`${partition}' is not a block device"
    fi

    if [ -f "${keyfile}" ]; then
        cryptsetup \
            --verbose \
            --batch-mode \
            --type luks2 \
            luksFormat "${partition}" "${keyfile}"
    else
        cryptsetup \
            --verbose \
            --batch-mode \
            --type luks2 \
            luksFormat "${partition}"
    fi
}
