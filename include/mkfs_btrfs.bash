#!/bin/bash
# shellcheck disable=SC2154

# DESC: create a btrfs filesytem and subvolumes
# ARGS: $1 device
mkfs_btrfs() {
    local partition="$1"
    local mntpnt="${WORKSPACE}/mnt"
    local mount_options="noatime,compress=zstd"
    local subvolumes=(
        "@rootfs:/"
        "@home:/home"
        "@log:/var/log"
        "@machines:/var/lib/machines"
        "@pkgs:/var/cache/pacman/pkgs"
        "@root:/root"
        "@snapshots:/snapshots"
        "@srv:/srv"
        "@swap:/swap"
    )

    print_header "${FUNCNAME[0]}"

    mkfs.btrfs -f "${partition}"

    # <FS-ROOT>
    mount -o "${mount_options}" "${partition}" "${mntpnt}"
    for s in "${subvolumes[@]}"; do
        local subvol=$(echo "${s}" | cut -d : -f 1)
        # local subdir=$(echo "${s}" | cut -d : -f 2)
        btrfs -v subvol create "${mntpnt}/${subvol}"
    done
    btrfs -v subvolume set-default "${mntpnt}/@rootfs"
    umount -v "${mntpnt}"

    # @rootfs
    mount -o "${mount_options}" "${partition}" "${mntpnt}"
    for s in "${subvolumes[@]}"; do
        local subvol=$(echo "${s}" | cut -d : -f 1)
        local subdir=$(echo "${s}" | cut -d : -f 2)
        [[ "${subvol}" = "@rootfs" ]] && continue
        mkdir -vp "${mntpnt}/${subdir}"
        mount -o "${mount_options},subvol=${subvol}" "${partition}" "${mntpnt}/${subdir}"
    done
}
