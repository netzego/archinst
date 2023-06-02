#!/bin/bash

# DESC: update package database
# ARGS: none
update_pacman() {
    print_header

    if [ -f "/var/lib/pacman/db.lck" ]; then
        die 1 "${FUNCNAME[0]}: db.lck exists"
    fi

    if ! pacman -Sy; then
        die 1 "could not update package database"
    fi
}
