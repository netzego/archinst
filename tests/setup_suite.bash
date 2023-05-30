#!/bin/bash
# shellcheck disable=SC2154,SC2034

load "fixtures.bash"

# DESC: this functions runs once for every bat test run
# ARGS: none
# NOTE: this file is sourced/load by bats auto magically
setup_suite() {
    bats_require_minimum_version 1.5.0

    # test loop13 devive
    fixture_create_loop13
    # test image
    fixture_create_image
    fixture_attach_image

    export BATS_FIXTURE_IMAGE="${BATS_SUITE_TMPDIR}/test.img"
    export BATS_FIXTURE_DEVICE="$(losetup -j "${BATS_FIXTURE_IMAGE}" | cut -d : -f 1)"
}

teardown_suite() {
    # test loop13 device
    fixture_remove_loop13
    # test image cleanup
    fixture_detach_image
    fixture_delete_image
}
