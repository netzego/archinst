#!/bin/bash

# DESC: create a btrfs swapfile
# ARGS: $1: fn of the swapfile
#       $2: size of the swapfile
mkfs_swapfile() {
    local fn="${1:-${WORKSPACE}/mnt/swap/swapfile}"
    local size="${2:-${SWAP_SIZE}}"
    local dir="$(dirname "${fn}")"

    print_header "${FUNCNAME[0]}"

    if [ ! -d "${dir}" ]; then
        die 1 "\`${dir}' is not a directory"
    fi

    btrfs -v filesystem mkswapfile --size "${size}" "${fn}"
}
