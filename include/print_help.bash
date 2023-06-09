#!/bin/bash

# DESC: print help msg to stdout
# ARGS: none
# shellcheck disable=SC2154
print_help() {
    echo "${SCRIPTNAME} (v${VERSION_NUMBER})"
    echo ""
    echo "-h, --help        print this help and exit"
    echo "    --version     print the version number and exit"
    echo "-d, --debug       set debug flag"
    echo "-v, --verbose     set verbose flag"
    echo "-l, --logfile     set the logfile and activate logging"
}
