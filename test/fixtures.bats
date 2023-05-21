#!/bin/bash
# shellcheck disable=SC2154

# DESC: this functions runs once for every bat file
# ARGS: none
setup_file() {
    bats_require_minimum_version 1.5.0
}

# DESC: this functions runs once for every bat function call
# ARGS: none
# NOTE: overwrite $0 and $BASH_ARGV0. might not smart or it's a bug in bats?
setup() {
    readonly SCRIPTDIR="$(realpath "$(dirname "${BATS_TEST_FILENAME}")")/.."
    readonly BASH_ARGV0="bashskel.bash"

    source "${SCRIPTDIR}/include/colors.bash"
    source "${SCRIPTDIR}/include/utils.bash"
    source "${SCRIPTDIR}/include/vars.bash"
    source "${SCRIPTDIR}/include/cleanup.bash"
    source "${SCRIPTDIR}/include/check_root.bash"
    source "${SCRIPTDIR}/include/load_configfile.bash"
    source "${SCRIPTDIR}/include/parse_args.bash"
    source "${SCRIPTDIR}/include/check_args.bash"
    source "${SCRIPTDIR}/include/write_lockfile.bash"
    source "${SCRIPTDIR}/include/print_help.bash"
    source "${SCRIPTDIR}/include/print_version.bash"
    source "${SCRIPTDIR}/include/print_usage.bash"
    source "${SCRIPTDIR}/include/print_vars.bash"
}

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
