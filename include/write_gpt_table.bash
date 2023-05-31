#!/bin/bash

# DESC: write gpt table to device and print info of the device to stdout
# ARGS: $1: block device to write the gpt table
#       $2: uefi part size
write_gpt_table() {
    local device="${1}"
    local uefi_size="${2:-${UEFI_SIZE}}"

    print_header "${FUNCNAME[0]}"

    sgdisk -Z "${device}"

    sgdisk --new=1::+${uefi_size} --typecode=1:ef00 "${device}"
    sgdisk --new=2::-0 --typecode=2:8300 "${device}"

    sgdisk --info 1 "${device}"
    sgdisk --info 2 "${device}"

    partprobe "${device}"

    sgdisk --print "${device}"
}
