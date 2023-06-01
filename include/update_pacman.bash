#!/bin/bash

# DESC: update package database
# ARGS: none
update_pacman() {
    print_header "${FUNCNAME[0]}"

    if ! pacman -Sy; then
        die 1 "could not update package database"
    fi
}
