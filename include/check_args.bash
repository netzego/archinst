#!/bin/bash

# DESC: check if path prefix exists and is writable
# ARGS: $1: path to check
# EXIT: if path prefix do not exists
#       if path prefix is not writable
check_path_prefix() {
    local path="$1"
    local prefix="$(realpath "$(dirname "${path}")")"

    if [ ! -d "${prefix}" ]; then
        die 1 "\`${path}' path prefix do not exists"
    fi
}

# DESC: check $LOGFILE path prefix
# ARGS: none
check_logfile() {
    check_path_prefix "${LOGFILE}"
}

# DESC: allocated checks for cli args
# ARGS: none
# NOTE: this must run only after load_configfile and parse_args was called
check_args() {
    check_logfile
}
