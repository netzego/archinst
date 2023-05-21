#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "parse_args(): bad arguments" {
    local args=(
        "--bad"
        "-x"
        "-X"
        "--bad -x -bad"
    )

    for i in "${args[@]}"; do
        # https://stackoverflow.com/a/10586169
        IFS=' ' read -r -a arr <<<"$i"
        run -2 parse_args "${arr[@]}"
    done
}

@test "parse_args(): good and bad arguments mixed" {
    local args=(
        "--help --bad"
        "-h --bad"
        "--bad --help"
        "--bad --help"
        "--help -x"
        "-h -x"
    )

    for i in "${args[@]}"; do
        # https://stackoverflow.com/a/10586169
        IFS=' ' read -r -a arr <<<"$i"
        run -2 parse_args "${arr[@]}"
    done
}

@test "parse_args(): edge cases" {
    local args=(
        # same as '-b ad'
        "-bad"
        "-bad --help"
    )

    for i in "${args[@]}"; do
        # https://stackoverflow.com/a/10586169
        IFS=' ' read -r -a arr <<<"$i"
        run -0 parse_args "${arr[@]}"
    done
}
