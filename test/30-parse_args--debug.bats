#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "parse_args(): --debug/-d" {
    local args=(
        "--debug"
        "-d"
    )

    for arg in "${args[@]}"; do
        run -0 parse_args "${arg}"
    done
}
