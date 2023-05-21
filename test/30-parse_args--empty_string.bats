#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "parse_args(): empty string" {
    local args=()

    run -0 parse_args "${args[@]}"
}
