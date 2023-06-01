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

# DESC: create loop device
# ARGS: none
fixture_create_loop13() {
    local loop_device="/dev/loop13"

    if [ ! -b "${loop_device}" ]; then
        mknod -m660 "${loop_device}" b 7 13
    fi
}

# DESC: remove loop device
# ARGS: none
fixture_remove_loop13() {
    local loop_device="/dev/loop13"

    if [ -b "${loop_device}" ]; then
        rm -v "${loop_device}"
    fi
}
# DESC: creates a keyfile
# ARGS: none
fixture_create_keyfile() {
    local pw="${BATS_FIXTURE_PASSWORD}"

    echo -n "${pw}" >"${BATS_SUITE_TMPDIR}/keyfile"
}

# DESC: creates test device files inside $BATS_SUITE_TMPDIR
# ARGS: none
fixture_create_test_devices() {
    local char="${BATS_SUITE_TMPDIR}/char"
    local block="${BATS_SUITE_TMPDIR}/block"

    mknod -m660 "${char}" c 128 128
    mknod -m660 "${block}" b 128 128
}

# DESC: removes test device files
# ARGS: none
fixture_remove_test_devices() {
    local char="${BATS_SUITE_TMPDIR}/char"
    local block="${BATS_SUITE_TMPDIR}/block"

    rm -v "${char}"
    rm -v "${block}"
}
