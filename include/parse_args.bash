#!/bin/bash

# Setting the default values. Values are might got a value from the
# configfile and thus should NOT be written.
HELP=false
VERSION=false
DEBUG="${DEBUG:-false}"
VERBOSE="${VERBOSE:-false}"
LOGFILE="${LOGFILE:-/dev/null}"
# FOO="${FOO:-abc}"
# BAR="${BAR:-xyz}"
POS_ARGS=()

# DESC: make global args readonly
# ARGS: none
readonly_args() {
    readonly HELP
    readonly VERSION
    readonly DEBUG
    readonly VERBOSE
    readonly LOGFILE
    # readonly FOO
    # readonly BAR
    readonly POS_ARGS
}

# DESC: test if string do NOT start with a hyphen
# ARGS: `$1` (required): string to test
exif_startwith_hyphen() {
    local arg="$1"

    if [ "${arg:0:1}" = "-" ]; then
        die 2 "\`$1' start with a hyphen. did you forget an argument?"
    fi
}

# DESC: wraps getopt to parse cli arguments and sets global parameters
# ARGS: `$@` (required): arguments from the cli
# NOTE: an example is found here /usr/share/doc/util-linux
# shellcheck disable=SC2154,SC2034
parse_args() {
    local name="${f_red}***${a_norm} ${SCRIPTNAME}"
    temp=$(getopt -o "hvdl:" -l "help,verbose,debug,logfile:,version" -n "${name}" -- "$@")

    # `$temp` MUST not be a local variable! otherwise this will NOT work
    # shellcheck disable=SC2181
    if [ $? -ne 0 ]; then
        exit 2
    fi

    # ensures `--` is set in $@. `$temp` **must** be quoted.
    eval set -- "$temp"
    unset temp

    while true; do
        case "$1" in
        "-h" | "--help")
            HELP=true
            shift
            continue
            ;;
        "--version")
            VERSION=true
            shift
            continue
            ;;
        "-v" | "--verbose")
            VERBOSE=true
            shift
            continue
            ;;
        "-d" | "--debug")
            DEBUG=true
            shift
            continue
            ;;
        "-l" | "--logfile")
            exif_startwith_hyphen "$2"
            LOGFILE="$2"
            shift 2
            continue
            ;;
        # "-f" | "--foo")
        #     exif_startwith_hyphen "$2"
        #     FOO="$2"
        #     shift 2
        #     continue
        #     ;;
        # "-b" | "--bar")
        #     exif_startwith_hyphen "$2"
        #     BAR="$2"
        #     shift 2
        #     continue
        #     ;;
        "--")
            shift
            break
            ;;
        *)
            # this should never happens, because the `eval set -- "$temp"`
            # line sets the explicit `--` arguments. which always get catched
            # before this this case statement.
            die 13 "Ooops, this should not happen. Please report this bug."
            ;;
        esac
    done

    # this does NOT work without braces
    POS_ARGS=("$@")

    readonly_args
}
