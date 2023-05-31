#!/usr/bin/bats
# shellcheck disable=SC2154

shopt -s expand_aliases

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "check_timedate(): timedatctl -> yes" {
    # patch timedatectl
    alias timedatectl="echo 'yes'; true"

    run -0 check_timedate

    # unpatch timedatectl
    unalias timedatectl
}

@test "check_timedate(): timedatctl -> no" {
    # patch timedatectl
    alias timedatectl="echo 'no'; true"

    run -1 check_timedate

    [ "${lines[-1]}" == "${ERR_PREFIX} ntp is not set" ]

    # unpatch timedatectl
    unalias timedatectl
}
