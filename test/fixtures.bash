#!/bin/bash
# shellcheck disable=SC2154

# DESC: unbind a readonly variable via gdb
# ARGS: $1: readonly variable to unbind
# NOTE: this must run as root
unbind_readonly() {
    local varname="$1"

    if [ "$UID" -ne 0 ]; then
        die 1 "\`${FUNCNAME[0]}' must run as root"
    fi

    # see https://stackoverflow.com/a/17398009
    gdb -ex 'call (int) unbind_variable("'"${varname}"'")' --pid=$$ --batch
}
