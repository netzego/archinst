#!/bin/bats
# shellcheck disable=SC2154

load "/usr/lib/bats/bats-support/load"
load "/usr/lib/bats/bats-assert/load"
load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "write_lockfile(): LOCKFILE do NOT exists" {
    run -0 write_lockfile

    [ -e "$LOCKFILE" ]

    rm "${LOCKFILE}"
}

@test "write_lockfile(): LOCKFILE path prefix NOT exists [run as root]" {
    [[ "$UID" -ne 0 ]] && skip

    unbind_readonly "LOCKFILE"

    # shellcheck disable=SC2030
    declare -gr LOCKFILE="/non_exists/${SCRIPTNAME}.lock"

    run -1 write_lockfile

    assert_output --partial "touch: cannot "
}
