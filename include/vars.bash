#!/bin/bash
# shellcheck disable=SC2034

readonly PWD="$(pwd)"
readonly SCRIPTNAME="$(basename "${BASH_ARGV0}")"
readonly VERSION_NUMBER="0"
readonly LOCKFILE="/tmp/${SCRIPTNAME}.lock"
readonly CONFIGFILE="${PWD}/${SCRIPTNAME}.config"

BATCHMODE=false
KEYMAP="us"
UEFI_SIZE="128M"
