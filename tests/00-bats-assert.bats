#!/bin/bats

load "/usr/lib/bats/bats-support/load"
load "/usr/lib/bats/bats-assert/load"

@test "bats-assert is okey" {
    # shellcheck disable=SC2050
    run echo 'foobar'
    assert_output 'foobar'
}
