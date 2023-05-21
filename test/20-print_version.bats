#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "print_version()" {
    run -0 print_version

    [ "${output}" = "${SCRIPTNAME} v${VERSION_NUMBER}" ]
}
