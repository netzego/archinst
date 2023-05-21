#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "print_usage()" {
    run -0 print_usage

    [ "${lines[0]:0:5}" = "usage" ]
}
