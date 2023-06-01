#!/bin/bash
# shellcheck disable=SC2154,SC2034

load "fixtures.bash"

# DESC: this functions runs once for every bat test run
# ARGS: none
# NOTE: this file is sourced/load by bats auto magically
setup_suite() {
    bats_require_minimum_version 1.5.0

    export BATS_FIXTURE_PASSWORD="t3st"
    export BATS_FIXTURE_IMAGE="${BATS_SUITE_TMPDIR}/test.img"

    # test image
    fixture_create_image
    fixture_attach_image
    # test loop13 devive
    fixture_create_loop13
    fixture_create_keyfile
    fixture_create_test_devices

    export BATS_FIXTURE_DEVICE="$(losetup -j "${BATS_FIXTURE_IMAGE}" | cut -d : -f 1)"
}

# DESC: teardown suite setup. runs once per test run.
# ARGS: none
teardown_suite() {
    # test image cleanup
    fixture_detach_image
    fixture_delete_image
    # test loop13 device
    fixture_remove_loop13
    fixture_remove_test_devices
}
