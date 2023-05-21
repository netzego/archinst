#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "check_root() [run as root]" {
    [[ "$UID" -ne 0 ]] && skip

    run -0 check_root
}

@test "check_root() [run NOT as root]" {
    [[ "$UID" -eq 0 ]] && skip

    run -1 check_root

    [ "${output}" = "${ERR_PREFIX} must run as root" ]
}
