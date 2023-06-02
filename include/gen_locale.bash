#!/bin/bash
# shellcheck disable=SC2154

# DESC: generates the locale
# ARGS: none
# COND: $WORKSPACE
#       $MOUNTPOINT
#       $LOCALE
gen_locale() {
    local locale="${LOCALE}"

    print_header "${FUNCNAME[0]}"

    if [ ! -f "${MOUNTPOINT}/etc/locale.gen" ]; then
        die 1 "\`${MOUNTPOINT}/etc/locale.gen' does not exists"
    fi

    echo "${locale} UTF-8" >>"${MOUNTPOINT}/etc/locale.gen"

    systemd-nspawn -D "${MOUNTPOINT}" locale-gen
}
