#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "parse_args(): --version/--vers" {
    local args=(
        "--version"
        "--vers"
    )

    for arg in "${args[@]}"; do
        run -0 parse_args "${arg}"
    done
}
