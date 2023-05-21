#!/bin/bash

# DESC: remove $LOCKFILE if any
# ARGS: none
remove_lockfile() {
    if [ -e "${LOCKFILE}" ]; then
        rm -v "${LOCKFILE}"
    fi
}

# DESC: clean up artifacts on exit signals
# ARGS: none
# NOTE: this is meant to call from a trap
cleanup() {
    remove_lockfile
}
