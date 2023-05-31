#!/bin/bash

# DESC: updates /etc/pacman
# ARGS: none
update_mirrorlist() {
    local path="${1:-/etc/pacman.d/mirrorlist}"
    local countrylist="${2:-DE}"

    print_header "${FUNCNAME[0]}"

    reflector \
        --verbose \
        --save "${path}" \
        --latest 8 \
        --fastest 8 \
        --age 12 \
        --sort rate \
        --protocol https \
        --country "${countrylist}"

    cat "${path}"
}
