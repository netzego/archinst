#!/bin/bash

# DESC: loads $PWD/$SCRIPTNAME.config file
# ARGS: `$1` (optional): path to configfile
# shellcheck disable=SC2154,SC1090
load_configfile() {
    local configfile="${1:-$CONFIGFILE}"

    if ! source "${configfile}"; then
        die 1 "\`${configfile}' could not be sourced"
    fi
}
