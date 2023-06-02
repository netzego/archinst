#!/bin/bash

# DESC: synchronize pacman's master package database
# ARGS: none
# EXIT: if /var/lib/pacman/db.lck exists
# TODO: test
update_pacman() {
    print_header

    if [ -f "/var/lib/pacman/db.lck" ]; then
        die 1 "${FUNCNAME[0]}: db.lck exists"
    fi

    if ! pacman -Sy; then
        die 1 "${FUNCNAME[0]}: could not synchronize the master database"
    fi
}
