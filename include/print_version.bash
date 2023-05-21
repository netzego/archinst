#!/bin/bash

# DESC: Prints the version number and exit
# ARGS: None
# shellcheck disable=SC2154
print_version() {
    echo "${SCRIPTNAME} v${VERSION_NUMBER}"
}
