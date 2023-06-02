#!/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "print_header(): normal output" {

    run -0 print_header

    # actually two lines, here we test the 2.
    [[ "${lines[-1]}" == "--- bats"* ]]
}
