#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "parse_args(): positional arguments" {
    local args=(
        ""
        "--"
        "pos1"
        "pos1 pos2"
        "-- pos1 pos2"
        "-d -v pos1 pos2"
        "-d -v -- pos1 pos2"
    )

    for i in "${args[@]}"; do
        # https://stackoverflow.com/a/10586169
        IFS=' ' read -r -a arr <<<"$i"
        run -0 parse_args "${arr[@]}"
    done
}
