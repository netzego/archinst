#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "remove_lockfile(): LOCKFILE do NOT exists" {
    run -0 remove_lockfile
}

@test "remove_lockfile(): LOCKFILE exists" {
    touch "${LOCKFILE}"

    run -0 remove_lockfile
}
