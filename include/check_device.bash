#!/bin/bash

# DESC: check if $1 is a block device and if writeable else will exit with
#       status code 1
# ARGS: $1 path to a device
# EXIT: if $1 is NOT a block device
#       if $1 is NOT writable
check_device() {
    local device="$1"

    if [ ! -b "${device}" ]; then
        die 1 "\`${device}' is not a block device"
    fi

    if [ ! -w "${device}" ]; then
        die 1 "\`${device}' is not writable"
    fi
}
