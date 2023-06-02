#!/bin/bash
# shellcheck disable=SC2154

# DESC: check if directory is a good mountpoint. eg is not already a
#       mountpoint or is not empty.
# ARGS: `$1` (required): path to mountpoint
# TODO: write tests
check_mountpoint() {
    local mntpoint="${1}"

    if [ ! -d "${mntpoint}" ]; then
        die 1 "\`${mntpoint}' is not a directory"
    fi

    if [ "$(ls -A "${mntpoint}")" ]; then
        die 1 "\`${mntpoint}' directory is not empty"
    fi

    if mountpoint "${mntpoint}"; then
        die 1 "\`${mntpoint}' is already a mountpoint"
    fi
}
