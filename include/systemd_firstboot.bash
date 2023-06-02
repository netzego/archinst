#!/bin/bash
# shellcheck disable=SC2154

# DESC: run systemd-firtsboot
# ARGS: none
# EXIT: if ${PWD}/archinst.roothash do not exists
# COND: $WORKSPACE
#       $MOUNTPOINT
#       $LOCALE
#       $TIMEZONE
#       $HOSTNAME
#       $KEYMAP
systemd_firstboot() {
    local locale="${LOCALE}"
    local timezone="${TIMEZONE}"
    local hostname="${HOSTNAME}"
    local keymap="${KEYMAP}"
    # local cmdline="rd.luks.name=${luks_uuid}=root root=UUID=${root_uuid} rw ${CMDLINE_EXTRA}"
    local hashed_pw_file="${PWD}/${SCRIPTNAME}.roothash"

    print_header "${FUNCNAME[0]}"

    if [ ! -f "${hashed_pw_file}" ]; then
        die 1 "\`${hashed_pw_file}' does not exists"
    fi

    systemd-nspawn -D "${MOUNTPOINT}" \
        systemd-firstboot \
        --force \
        --root-password-hashed="$(cat "${hashed_pw_file}")" \
        --locale="${locale}" \
        --root-shell="/bin/bash" \
        --timezone="${timezone}" \
        --hostname="${hostname}" \
        --keymap="${keymap}"
}
