#!/bin/bash
# shellcheck disable=SC2154

# DESC: configure /etc/mkinitcpio.conf and /etc/mkinitcpio.d/*.presets
# ARGS: none
# COND: $WORKSPACE
#       $MOUNTPOINT
configure_initrd() {
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

    print_header "${FUNCNAME[0]}"

    info "\$HOOKS" "${hooks[*]}"

    sed -i "s%^HOOKS=.*$%HOOKS=(${hooks[*]})%" "${MOUNTPOINT}/etc/mkinitcpio.conf"
    grep "^HOOKS=" "${MOUNTPOINT}/etc/mkinitcpio.conf"

    sed -i 's%^#default_uki%default_uki%' "${MOUNTPOINT}/etc/mkinitcpio.d/linux-lts.preset"
    grep "^default_uki=" "${MOUNTPOINT}/etc/mkinitcpio.d/linux-lts.preset"
}
