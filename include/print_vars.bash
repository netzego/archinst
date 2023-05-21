#!/bin/bash

# DESC: prints all variables to stdout
# ARGS: None
# shellcheck disable=SC2154
print_vars() {
    printf "%s %16s: %s\n" "${INFO_PREFIX}" "ARGS" "${ARGS[*]}"
    printf "%s %16s: %s\n" "${INFO_PREFIX}" "ARGS_LENGHT" "${#ARGS[@]}"
    printf "%s %16s: %s\n" "${INFO_PREFIX}" "SCRIPTNAME" "${SCRIPTNAME}"
    printf "%s %16s: %s\n" "${INFO_PREFIX}" "PWD" "${PWD}"
    printf "%s %16s: %s\n" "${INFO_PREFIX}" "VERSION_NUMBER " "${VERSION_NUMBER}"
    printf "%s %16s: %s\n" "${INFO_PREFIX}" "LOCKFILE" "${LOCKFILE}"
    printf "%s %16s: %s\n" "${INFO_PREFIX}" "CONFIGFILE" "${CONFIGFILE}"
    printf "%s %16s: %s\n" "${INFO_PREFIX}" "VERBOSE" "${VERBOSE}"
    printf "%s %16s: %s\n" "${INFO_PREFIX}" "DEBUG" "${DEBUG}"
    printf "%s %16s: %s\n" "${INFO_PREFIX}" "POS_ARGS" "${POS_ARGS[*]}"
    printf "%s %16s: %s\n" "${INFO_PREFIX}" "POS_ARGS_LENGTH" "${#POS_ARGS[@]}"
    printf "%s %16s: %s\n" "${INFO_PREFIX}" "FOO" "${FOO}"
    printf "%s %16s: %s\n" "${INFO_PREFIX}" "BAR" "${BAR}"
}
