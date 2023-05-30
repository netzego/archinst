#!/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "parse_args(): --logfile/-l /dev/null" {
    local args=(
        "--logfile /dev/null"
        "-l /dev/null"
        # with additinal options and pos arguments
        "--logfile /dev/null --"
        "-l /dev/null --"
        "-l /dev/null --verbose"
        "-l /dev/null -- pos1 pos2"
    )

    for i in "${args[@]}"; do
        # https://stackoverflow.com/a/10586169
        IFS=' ' read -r -a arr <<<"$i"
        run -0 parse_args "${arr[@]}"
    done
}

@test "parse_args(): --logfile/-l wrong invocations" {
    local args=(
        # arg is missing
        "--logfile"
        "-l"
        # missing arg followed by an valid options
        "--logfile --"
        "--logfile -v"
        "--logfile -h"
        "--logfile --verbose"
    )

    for i in "${args[@]}"; do
        # https://stackoverflow.com/a/10586169
        IFS=' ' read -r -a arr <<<"$i"
        # echo "${arr[@]}"
        run -2 parse_args "${arr[@]}"
    done
}
