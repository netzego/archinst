#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "print_vars()" {
    local regex='^\[..m>>>\[..\s+ARGS:'

    run -0 print_vars

    [[ "${lines[0]}" =~ ${regex} ]]
}
