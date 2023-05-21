#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "overwriten variables \$0 and \$BASH_ARGV0" {
    [ "${BASH_ARGV0}" = "archinst" ]
    [ "${BASH_ARGV0}" = "$0" ]
    [ "${SCRIPTNAME}" = "archinst" ]
}

# NOTE: this should be enough to see if sourcing from include/ works
@test "verify some sourced vars/funcs" {
    # include/colors.bash
    [ -n "${a_norm}" ]

    # include/utils.bash
    [ "$(type -t die)" = "function" ]
}
