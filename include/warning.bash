#!/bin/bash
# shellcheck disable=SC2154

warning() {
    if [ "${BATCHMODE}" != true ]; then

        print_header "${FUNCNAME[0]}"

        warn "This will DESTROY all data in ${DEVICE}"

        read -rp "${READ_PREFIX} Type \`yes' (in caps) to continue: " answer

        if [ ! "${answer}" == "YES" ]; then
            die 1 "stop execution"
        fi
    fi
}
