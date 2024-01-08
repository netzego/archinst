#!/bin/bash
# shellcheck disable=SC2154

# DESC: run systemd-firtsboot
# ARGS: `$1` (optional): path to the rootfs
# EXIT: if ${PWD}/archinst.roothash do not exists
# COND: $WORKSPACE
#       $MOUNTPOINT
#       $LOCALE
#       $TIMEZONE
#       $HOSTNAME
#       $KEYMAP
# TODO: cleanup
systemd_firstboot() {
    declare -r rootfs="${1:-${MOUNTPOINT}}"
    declare -r locale="${LOCALE}"
    declare -r timezone="${TIMEZONE}"
    declare -r hostname="${HOSTNAME}"
    declare -r keymap="${KEYMAP}"
    declare -r shell="${DEFAULT_SHELL}"
    declare -r hashfile="${PWD}/${SCRIPTNAME}.roothash"
    # declare -r cmdline="rd.luks.name=${luks_uuid}=root root=UUID=${root_uuid} rw ${CMDLINE_EXTRA}"

    print_header

    if [ ! -f "${hashfile}" ]; then
        die 1 "\`${hashfile}' does not exists"
    fi

    # systemd-nspawn -D "${MOUNTPOINT}" \
    systemd-firstboot \
        --force \
        --root "${MOUNTPOINT}" \
        --root-password-hashed="$(cat "${hashfile}")" \
        --locale="${locale}" \
        --root-shell="${shell}" \
        --timezone="${timezone}" \
        --hostname="${hostname}" \
        --keymap="${keymap}"
}
