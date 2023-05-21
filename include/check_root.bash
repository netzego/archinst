#!/bin/bash

# DESC: Check if $UID is equal 0
# ARGS: None
check_root() {
    if [ "$UID" -ne 0 ]; then
        die 1 "must run as root"
    fi
}
