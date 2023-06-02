#!/bin/bash
# shellcheck disable=SC2154

# DESC: prints a warning to stdout and require user interaction to continue
#       execution
# ARGS: $1 (optional): the device about to wipe
# GLOB: $BATCHMODE
#       $DEVICE
#       $READ_PREFIX
#       die()
#       print_header()
warning() {
    local device="${1:-$DEVICE}"

    if [ -z "${device}" ]; then
        die 1 "${FUNCNAME[0]}: \$1 is empty"
    fi

    if [ "${BATCHMODE}" != true ]; then

        print_header "${FUNCNAME[0]}"

        warn "This will WIPE all your data on \`${device}'"

        read -rp "${READ_PREFIX} Type \`yes' (in caps) to continue: " answer

        if [ ! "${answer}" == "YES" ]; then
            die 1 "stop execution"
        fi
    fi
}
