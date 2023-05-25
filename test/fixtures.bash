#!/bin/bash
# shellcheck disable=SC2154

# DESC: unbind a readonly variable via gdb
# ARGS: $1: readonly variable to unbind
# NOTE: this must run as root
unbind_readonly() {
    local varname="$1"

    if [ "$UID" -ne 0 ]; then
        die 1 "\`${FUNCNAME[0]}' must run as root"
    fi

    # see https://stackoverflow.com/a/17398009
    gdb -ex 'call (int) unbind_variable("'"${varname}"'")' --pid=$$ --batch
}

# DESC: create test image inside $BATS_SUITE_TMPDIR
# ARGS: none
fixture_create_image() {
    local tmpdir="${BATS_SUITE_TMPDIR}"
    local image="${tmpdir}/test.img"

    truncate -s 2G "${image}"
}

# DESC: delete test image
# ARGS: none
fixture_delete_image() {
    local tmpdir="${BATS_SUITE_TMPDIR}"
    local image="${tmpdir}/test.img"

    rm -v "${image}"
}

# DESC: attach test image to a loop device
# ARGS: none
fixture_attach_image() {
    local tmpdir="${BATS_SUITE_TMPDIR}"
    local image="${tmpdir}/test.img"

    losetup --find "${image}"
}

# DESC: detach test image
# ARGS: none
fixture_detach_image() {
    local tmpdir="${BATS_SUITE_TMPDIR}"
    local image="${tmpdir}/test.img"
    local device="$(losetup -j "${image}" | cut -d : -f 1)"

    losetup --detach "${device}"
}
