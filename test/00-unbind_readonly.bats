#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bats"

# DESC: test if unbind_readonly func work properly
@test "fixtures.bats::unbind_readonly() [run NOT as root]" {
    [[ "$UID" -eq 0 ]] && skip

    # shellcheck disable=SC2034
    readonly RO_VAR=true

    run -1 unbind_readonly "RO_VAR"

    [ "${output}" = "${ERR_PREFIX} \`unbind_readonly' must run as root" ]
}

# DESC: test if unbind_readonly func work properly
@test "fixtures.bats::unbind_readonly() [run as root]" {
    [[ "$UID" -ne 0 ]] && skip

    readonly RO_VAR=true

    run -0 unbind_readonly "RO_VAR"

    # shellcheck disable=SC2034
    RO_VAR=false
}
