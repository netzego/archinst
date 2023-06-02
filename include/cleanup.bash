#!/bin/bash
# shellcheck disable=SC2154

# DESC: remove $LOCKFILE if any
# ARGS: none
remove_lockfile() {
    if [ -e "${LOCKFILE}" ]; then
        rm -v "${LOCKFILE}"
    fi
}

# DESC: remove $WORKSPACE directory
# ARGS: none
remove_workspace() {
    if [ -d "${WORKSPACE}" ]; then
        rm -frv "${WORKSPACE}"
    fi
}

# DESC: closes the luks partition
# ARGS: none
close_luks_partiton() {
    local device="${DEVICE}"
    local mapped_device="$(lsblk --raw -n -p -o NAME,TYPE "${device}" | grep crypt | cut -d ' ' -f 1)"

    if [ -e "${mapped_device}" ]; then
        echo "close ${mapped_device}"
        cryptsetup close "${mapped_device}"
    fi
}

# DESC: umount ${WORKSPACE}/mnt
# ARGS: none
umount_workspace_mnt() {
    local mntpnt="${WORKSPACE}/mnt"

    if mountpoint "${mntpnt}"; then
        umount -v -R "${mntpnt}"
    fi
}

# DESC: kill leftover gpg agent from pacstrap -K
# ARGS: none
kill_leftover_agent() {
    if [ -n "$(pgrep -f 'gpg-agent --homedir')" ]; then
        echo "killed gpg-agent zombie process from pacstrap"
        kill $(pgrep -f "gpg-agent --homedir")
    fi
}

# DESC: clean up artifacts on exit signals
# ARGS: none
# NOTE: this is meant to call from a trap
cleanup() {
    print_header

    sync

    kill_leftover_agent
    umount_workspace_mnt
    close_luks_partiton
    remove_workspace
    remove_lockfile
}
