#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bash"
load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "parse_args(): --help/-h" {
    local args=(
        "--help"
        "-h"
    )

    for arg in "${args[@]}"; do
        run -0 parse_args "${arg}"
    done
}
