#!/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "print_help()" {
    run -0 print_help

    [ "${lines[0]}" = "${SCRIPTNAME} (v${VERSION_NUMBER})" ]
}
