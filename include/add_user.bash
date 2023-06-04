#!/bin/bash

# DESC: add a user
# AGRS: `$1` (optional): file to user configuration
#       `$2` (optional): path to the file with the password hash
#       `$3` (optional): path to the rootfs (mountpoint)
# EXIT: if `$2` do not exists
# EXPL: add_user "./userconfig" "./userhash" "/mnt"
# TODO: write tests
add_user() {
    declare -r configfile="${1:-${PWD}/${SCRIPTNAME}.userconfig}"
    declare -r pwhashfile="${2:-${PWD}/${SCRIPTNAME}.userhash}"
    declare -r rootfs="${3:-${MOUNTPOINT}}"

    print_header

    if [ -f "${configfile}" ]; then
        # shellcheck source=./archinst.userconfig
        source "${configfile}"
    fi

    if [ ! -f "${pwhashfile}" ]; then
        die "password hashfile \`${pwhashfile}' does not exists"
    fi

    systemd-nspawn -D "${rootfs}" \
        useradd \
        --create-home \
        --uid "${USER_UID}" \
        --user-group \
        --password "$(cat "${PWD}/${SCRIPTNAME}.userhash")" \
        --groups "$(echo -n "${USER_GROUPS[@]}" | tr " " ",")" \
        --shell "${USER_SHELL}" \
        "${USER_NAME}"
}
