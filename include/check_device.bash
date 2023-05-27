#!/bin/bash

# DESC: check if $1 is a block device and if writeable else will exit with
#       status code 1
# ARGS: $1 path to a device
# EXIT: if $1 is NOT a block device
#       if $1 is NOT writable
check_device() {
    local device="$1"

    if [ ! -e "${device}" ]; then
        die 1 "\`${device}' do not exists"
    fi

    if [ ! -b "${device}" ]; then
        die 1 "\`${device}' is not a block device"
    fi

    if [ ! -w "${device}" ]; then
        die 1 "\`${device}' is not writable"
    fi

    # check if loop device adn if it is attached to a file
    if [[ "${device}" = *"loop"* ]]; then
        if [ "$(losetup -Jl "${device}" | jq '.[][]."back-file"')" == "null" ]; then
            die 1 "\`${device}' is not attached"
        fi
    fi
}
