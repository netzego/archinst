#!/bin/bash
# shellcheck disable=SC2034

readonly PWD="$(pwd)"
readonly SCRIPTNAME="$(basename "${BASH_ARGV0}")"
readonly VERSION_NUMBER="0"
readonly LOCKFILE="/tmp/${SCRIPTNAME}.lock"
readonly CONFIGFILE="${PWD}/${SCRIPTNAME}.config"
readonly WORKSPACE="/tmp/${SCRIPTNAME}-$(openssl rand -hex 8)"
readonly MOUNTPOINT="${WORKSPACE}/mnt"
readonly BTRFS_OPTIONS="noatime,compress=zstd"
filearray "PACKAGES" "${SCRIPTDIR}/include/core.packages" "${PWD}/${SCRIPTNAME}.packages"
readonly SUBVOLUMES=(
    # subvol:mountpoint
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

BATCHMODE=false
CMDLINE_EXTRA=""
HOSTNAME="archinstall"
KEYMAP="us"
LOCALE="en_US.UTF-8"
SWAP_SIZE="4G"
TIMEZONE="Europe/Berlin"
UEFI_SIZE="265M"
