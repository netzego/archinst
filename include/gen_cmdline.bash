#!/bin/bash
# shellcheck disable=SC2154

# DESC: generate /etc/kernel/cmdline
# ARGS: `$1` (required): UUID of root partiton (eg. /dev/sdX2)
#       `$2` (required): UUID of luks partiton (eg. /dev/mapper/XXX)
# COND: $WORKSPACE
#       $MOUNTPOINT
#       $CMDLINE_EXTRA
# TODO: tests
gen_cmdline() {
    local root_uuid="$1"
    local luks_uuid="$2"
    local cmdline="rd.luks.name=${root_uuid}=rootfs root=UUID=${luks_uuid} rootflags=noatime,compress=zstd rw ${CMDLINE_EXTRA}"

    print_header

    echo "${cmdline}" | tee "${MOUNTPOINT}/etc/kernel/cmdline"
}
