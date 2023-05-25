#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "print_vars()" {
    local regex='ARGS:'

    run -0 print_vars

    [[ "${lines[0]}" =~ ${regex} ]]
}
