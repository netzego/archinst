#!/bin/bash
# shellcheck disable=SC2154

# DESC: configure /etc/mkinitcpio.conf and /etc/mkinitcpio.d/*.presets
# ARGS: `$1` (optional): the directory containing the rootfs
# COND: $WORKSPACE
#       $MOUNTPOINT
# TODO: deadcode, write tests
configure_initrd() {
    local rootfs="${1:-$MOUNTPOINT}"
    local hooks=(
        base
        systemd
        autodetect
        modconf
        kms
        keyboard
        sd-vconsole
        block
        sd-encrypt
        filesystems
        fsck
    )

    print_header

    info "\$HOOKS" "${hooks[*]}"

    # configure HOOKS array to boot an luks encrypted rootfs
    sed -i "s%^HOOKS=.*$%HOOKS=(${hooks[*]})%" "${rootfs}/etc/mkinitcpio.conf"

    # logs the HOOKS array
    grep "^HOOKS=" "${rootfs}/etc/mkinitcpio.conf"

    # Enable the unified lernel image generation. this simplifies greatly
    # the boot hassle.
    sed -i 's%^#default_uki%default_uki%' "${rootfs}/etc/mkinitcpio.d/linux-lts.preset"

    # comment out fallback image, this got me into trouble on a machine with
    # few ram (2G). mkinitcpio do not finished on this machine. TODO: find a
    # way to maintain this inside the prefix. Probably via a direct call to
    # minitcpio without the -p or -P parameter. see mkinicpio(8).
    #sed -i 's%^fallback%#fallback%' "${rootfs}/etc/mkinitcpio.d/linux-lts.preset"

    # logs the .preset file
    cat "${rootfs}/etc/mkinitcpio.d/linux-lts.preset"
}
