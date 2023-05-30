#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "print_usage()" {
    run -0 print_usage

    [ "${lines[0]:0:5}" = "usage" ]
}
