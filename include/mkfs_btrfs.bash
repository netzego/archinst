#!/bin/bash
# shellcheck disable=SC2154

# DESC: create a btrfs filesystem with subvolumes and dir structure
# ARGS: `$1` (optional): partition
#       `$2` (optional): mountpoint
#       `$3` (optional): array of strings defining "subvolumes:mountpoint".
#                        eg.: array=("@rootfs:/" ...)
#       `$4` (optional): btrfs mount options. see man:mount(8).
# EXMP: mkfs_btfs "/dev/sdx2" "/mnt" ("@rootfs:/" "@home:/home") "noatime,compress=zstd"
# COND: $WORKSPACE
#       $MOUNTPOINT
#       $SUBVOLUMES
#       $BTRFS_OPTIONS
# TODO: update test; remove deadcode; update func call
mkfs_btrfs() {
    local partition="${1:-$LUKSPART}"
    local mountdir="${2:-$MOUNTPOINT}"
    local subvolumes=("${3:-${SUBVOLUMES[@]}}")
    local options="${4:-$BTRFS_OPTIONS}"
    # local subvolumes=(
    #     "@rootfs:/"
    #     "@home:/home"
    #     "@log:/var/log"
    #     "@machines:/var/lib/machines"
    #     "@pkgs:/var/cache/pacman/pkgs"
    #     "@root:/root"
    #     "@snapshots:/snapshots"
    #     "@srv:/srv"
    #     "@swap:/swap"
    # )

    print_header "${FUNCNAME[0]}"

    mkfs.btrfs -f "${partition}"

    # <FS-ROOT>
    mount -o "${options}" "${partition}" "${mountdir}"
    for s in "${subvolumes[@]}"; do
        local subvol=$(echo "${s}" | cut -d : -f 1)
        # local subdir=$(echo "${s}" | cut -d : -f 2)
        btrfs -v subvol create "${mountdir}/${subvol}"
    done
    btrfs -v subvolume set-default "${mountdir}/@rootfs"
    umount -v "${mountdir}"

    # @rootfs
    mount -o "${options}" "${partition}" "${mountdir}"
    for s in "${subvolumes[@]}"; do
        local subvol=$(echo "${s}" | cut -d : -f 1)
        local subdir=$(echo "${s}" | cut -d : -f 2)
        [[ "${subvol}" = "@rootfs" ]] && continue
        mkdir -vp "${mountdir}/${subdir}"
        mount -o "${options},subvol=${subvol}" "${partition}" "${mountdir}/${subdir}"
    done

    umount -v -R "${mountdir}"
}
