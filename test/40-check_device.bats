#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "check_device(): no parameter" {

    run -1 check_device

    [ "${output}" = "${ERR_PREFIX} \`' is not a block device" ]
}

@test "check_device(): wrong parameter" {
    local device="/dev/null"

    run -1 check_device "${device}"

    [ "${output}" = "${ERR_PREFIX} \`${device}' is not a block device" ]
}

@test "check_device(): $BATS_FIXTURE_DEVICE" {
    local device="${BATS_FIXTURE_DEVICE}"

    run -0 check_device "${device}"
}

@test "check_device(): not attached device /dev/loop13" {
    local device="/dev/loop13"

    run -1 check_device "${device}"

    [ "${output}" = "${ERR_PREFIX} \`${device}' is not attached" ]
}
