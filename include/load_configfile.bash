#!/bin/bash

# DESC: Loads $PWD/$SCRIPTNAME.config file
# ARGS: None
# shellcheck disable=SC2154,SC1090
load_configfile() {
    if [ -e "${CONFIGFILE}" ]; then
        source "${CONFIGFILE}"
    else
        die 1 "\`${CONFIGFILE}' not found"
    fi
}
