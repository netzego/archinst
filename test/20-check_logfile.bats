#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "check_logfile(): LOGFILE=/dev/null" {
    # LOGFILE=/dev/null from includes/vars.bash

    run -0 check_logfile
}

@test "check_logfile(): LOGFILE=/tmp/not_exists" {
    LOGFILE=/tmp/not_exists

    run -0 check_logfile
}

@test "check_logfile(): LOGFILE=/not_exists/logfile" {
    LOGFILE=/not_exists/logfile

    run -1 check_logfile

    [ "${output}" = "${ERR_PREFIX} \`${LOGFILE}' path prefix do not exists" ]
}
