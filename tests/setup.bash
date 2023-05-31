#!/bin/bash
# shellcheck disable=SC2154

# DESC: this functions runs once for every bat function call
# ARGS: none
# NOTE: overwrite $0 and $BASH_ARGV0. might not smart or it's a bug in bats?
setup() {
    readonly BASH_ARGV0="archinst"

    load "fixtures.bash"

    load "../include/colors.bash"
    load "../include/utils.bash"
    load "../include/vars.bash"
    load "../include/cleanup.bash"
    load "../include/check_root.bash"
    load "../include/load_configfile.bash"
    load "../include/parse_args.bash"
    load "../include/check_args.bash"
    load "../include/write_lockfile.bash"
    load "../include/print_help.bash"
    load "../include/print_version.bash"
    load "../include/print_usage.bash"
    load "../include/print_vars.bash"
    load "../include/print_header.bash"
    load "../include/warning.bash"
    load "../include/check_device.bash"
    load "../include/check_network.bash"
    load "../include/load_keymap.bash"
}
