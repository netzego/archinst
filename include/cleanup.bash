#!/bin/bash

# DESC: remove $LOCKFILE if any
# ARGS: none
remove_lockfile() {
    if [ -e "${LOCKFILE}" ]; then
        rm -v "${LOCKFILE}"
    fi
}

# DESC: remove $WORKSPACE directory
# ARGS: none
remove_workspace() {
    if [ -d "${WORKSPACE}" ]; then
        rm -frv "${WORKSPACE}"
    fi
}

# DESC: clean up artifacts on exit signals
# ARGS: none
# NOTE: this is meant to call from a trap
cleanup() {
    print_header "${FUNCNAME[0]}"

    remove_workspace
    remove_lockfile
}
