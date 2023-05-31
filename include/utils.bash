#!/bin/bash
# shellcheck disable=SC2154

readonly INFO_COLOR="${f_cyan}"
readonly INFO_STRING=">>>"
readonly INFO_PREFIX="${INFO_COLOR}${INFO_STRING}${a_norm}"
readonly ERR_COLOR="${f_red}"
readonly ERR_STRING="***"
readonly ERR_PREFIX="${ERR_COLOR}${ERR_STRING}${a_norm}"
readonly WARN_COLOR="${f_magenta}"
readonly WARN_STRING="@@@"
readonly WARN_PREFIX="${WARN_COLOR}${WARN_STRING}${a_norm}"
readonly READ_COLOR="${f_magenta}"
readonly READ_STRING="<<<"
readonly READ_PREFIX="${READ_COLOR}${READ_STRING}${a_norm}"

# DESC: prints colored $INFO_PREFIX and "$@" to stdout.
# ARGS: $@: messages to print
info() {
    echo -e "${INFO_PREFIX}" "$*"
}

# DESC: prints colored $ERR_PREFIX and "$@" to stderr.
# ARGS: $@: messages to print
err() {
    echo -e "${ERR_PREFIX}" "$*" >&2
}

# DESC: prints $WARN_PREFIX and "$@" to stderr.
# ARGS: $@: messages to print
warn() {
    echo -e "${WARN_PREFIX}" "$*" >&2
}

# DESC: prints ${@:1} to stderr and exit with code $1
# ARGS: $1: numeric exit code
#       ${@:1}: messages to print
die() {
    local exitcode="$1"
    shift
    err "$*"
    exit "${exitcode}"
}

# DESC: test if $1 is an array
# ARGS: $1: varibale name
is_array() {
    local varname="$1"

    if [[ "$(declare -p "${varname}")" =~ "declare -a" ]]; then
        echo true
    else
        echo false
    fi
}
