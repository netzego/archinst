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

# DESC: declare a global readonly array with values equal to lines
#       (exclude empty lines and ons with trailing #) from files in
#       `$@`. if files in `${@[2..-1]}` do not exists this function
#       will not complain. the values of the declared array are
#       unique and sorted.
# ARGS: `$1` (required): the name of the global array which is defined
#       `$@` (required): one ore more filenames to read in
# EXIT: if `$@` is empty
#       if `${@[1]}` do not exists
# EXPL: filearray "VARNAME" "a.foo" [ "not.exists" "b.bar" ... ]
# TODO: write tests
filearray() {
    declare -r varname="$1"
    shift
    declare -ar files=("$@")

    if [ ${#files} -lt 1 ]; then
        die 1 "missing at least one filename"
    fi

    if [ ! -f "${files[0]}" ]; then
        die 1 "\`${files[0]}' do not exists"
    fi

    # grep -v: inverts the matching patterns
    # grep -s: suppress errors. in case `$2` do not exists.
    # grep -h: suppress filenames in the output.
    declare -agr "${varname}"="$(grep -shv "^#\|^\$" "${files[@]}" | sort -u)"
}
