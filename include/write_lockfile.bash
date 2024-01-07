#!/bin/bash

# DESC: writes lockfile to path
# ARGS: `$1` (optional): path of the lockfile
# COND: $LOCKFILE
write_lockfile() {
    declare -r lockfile="${1:-$LOCKFILE}"

    print_header

    touch "${lockfile}"
}
