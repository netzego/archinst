#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bash"
load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "write_lockfile(): LOCKFILE do NOT exists" {
    run -0 write_lockfile

    [ -e "$LOCKFILE" ]

    rm "${LOCKFILE}"
}

@test "write_lockfile(): LOCKFILE do exists" {
    touch "${LOCKFILE}"

    run -1 write_lockfile

    [ "${output}" = "${ERR_PREFIX} \`${LOCKFILE}' exists" ]

    rm "${LOCKFILE}"
}

@test "write_lockfile(): LOCKFILE path prefix NOT exists [run as root]" {
    [[ "$UID" -ne 0 ]] && skip

    unbind_readonly "LOCKFILE"

    # shellcheck disable=SC2030
    LOCKFILE="/non_exists/${SCRIPTNAME}.lock"

    [ "${output}" = "${ERR_PREFIX} \`${LOCKFILE}' path prefix do not exists" ]

    run -1 write_lockfile
}
