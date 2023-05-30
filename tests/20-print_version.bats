#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "print_version()" {
    run -0 print_version

    [ "${output}" = "${SCRIPTNAME} v${VERSION_NUMBER}" ]
}
