#!/bin/bash
# shellcheck disable=SC2154

# DESC: install packages via pacstrap
# ARGS: `$1` (optional): array of pacman packages to install
#       `$2` (optional): install directory
# COND: $WORKSPACE
#       $MOUNTPOINT
#       $PACKAGES[]
# EXIT: if `$2` is not a directory
#       if `$2` is not mountpoint
install_packages() {
    local pkgs=${1:-${PACKAGES[@]}}
    local rootdir=${2:-$MOUNTPOINT}

    print_header

    if [ ! -d "${rootdir}" ]; then
        die 1 "\`${rootdir}' is not a directory"
    fi

    if ! mountpoint "${rootdir}"; then
        die 1 "\`${rootdir}' is not a mountpoint"
    fi

    # shellcheck disable=SC2086,SC2048
    pacstrap -K "${rootdir}" ${pkgs[*]}
}
