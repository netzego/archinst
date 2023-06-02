#!/bin/bash
# shellcheck disable=SC2154

# DESC: mounts the rootfs partiton to $MOUNTPOINT
# ARGS: $1 (optional): partition
#       $2 (optional): mountpoint
#       $3 (optional): array of strings defining "subvolumes:mountpoint".
#                      eg.: array=("@rootfs:/" ...)
#       $4 (optional): btrfs mount options. see man:mount(8).
# EXMP: mount_btfs "/dev/sdx2" "/mnt" ("@rootfs:/" "@home:/home") "noatime,compress=zstd"
# COND: $WORKSPACE
#       $MOUNTPOINT
#       $LUKSPART
#       $BTRFS_OPTIONS
#       $SUBVOLUMES
mount_btrfs() {
    local partition="${1:-$LUKSPART}"
    local mntpoint="${2:-$MOUNTPOINT}"
    local subvolumes=("${3:-${SUBVOLUMES[@]}}")
    local options=${4:-$BTRFS_OPTIONS}

    print_header

    check_mountpoint "${mntpoint}"

    # mount default subvolume
    mount -v -o "${options}" "${partition}" "${mntpoint}"

    # mount subvolumes
    for s in "${subvolumes[@]}"; do
        local subvol=$(echo "${s}" | cut -d : -f 1)
        local subdir=$(echo "${s}" | cut -d : -f 2)
        [[ "${subvol}" = "@rootfs" ]] && continue
        mount -v -o "${options},subvol=${subvol}" "${partition}" "${mntpoint}/${subdir}"
    done
}
