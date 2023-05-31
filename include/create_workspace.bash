#!/bin/bash
# shellcheck disable=SC2154

# DESC: creates a workspace dirctory
# ARGS: none
create_workspace() {
    print_header "${FUNCNAME[0]}"

    if [ -e "${WORKSPACE}" ]; then
        die 1 "\`${WORKSPACE}' already exists"
    fi

    mkdir -pv "${WORKSPACE}"
}
