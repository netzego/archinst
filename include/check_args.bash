#!/bin/bash

# DESC: check if path prefix exists and is writable
# ARGS: $1 (required): path to check
# EXIT: if path prefix do not exists
check_path_prefix() {
    local path="$1"
    local prefix="$(realpath "$(dirname "${path}")")"

    if [ ! -d "${prefix}" ]; then
        die 1 "\`${path}' path prefix do not exists"
    fi
}

# DESC: check for global variable $LOGFILE
# ARGS: $1 (optional): the logfile path
# EXIT: if `$1` path prefix do not exists
#       if `$1` is not a regular file
#       if `$1` is not writeable
check_logfile() {
    local logfile="${1:-$LOGFILE}"

    check_path_prefix "${logfile}"

    if [ ! -w "${logfile}" ]; then
        die 1 "\`${logfile}' is not writable"
    fi
}

# DESC: check for global variable $LOCKFILE
# ARGS: $1 (optional): the lockfile path
# EXIT: if `$1` path prefix do not exists
#       if `$1` is not a regular file
#       if `$1` is not writeable
check_lockfile() {
    local lockfile="${1:-$LOCKFILE}"

    check_path_prefix "${lockfile}"

    if [ -e "${lockfile}" ]; then
        die 1 "\`${lockfile}' exists"
    fi
}

# DESC: allocated checks for cli args
# ARGS: none
# NOTE: this must run only after load_configfile and parse_args was called
check_args() {
    check_logfile
    check_lockfile
}
