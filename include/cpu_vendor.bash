#!/bin/bash

# DESC: get the cpu vendor name. `amd`, `intel` or `unknown`
# AGRS: None
# RETN: `amd`, `intel` or ``
# TODO: write test
cpu_vendor() {
    declare -lr buf="$(lscpu | grep "^Vendor")" # `-l` make var lowercase

    case $buf in
    *amd*)
        declare -r cpu="amd"
        ;;
    *intel*)
        declare -r cpu="intel"
        ;;
    *)
        declare -r cpu=""
        ;;
    esac

    echo "$cpu"
}
