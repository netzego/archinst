#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "includes/check_logfile(): LOGFILE from vars.bash" {

    # LOGFILE=/dev/null from includes/vars.bash

    run -0 check_logfile
}

@test "includes/check_logfile(): LOGFILE not exists; valid path" {

    LOGFILE=/tmp/logfile.not.exists

    run -0 check_logfile
}

@test "includes/check_logfile(): LOGFILE not exists; invalid path" {

    LOGFILE=/invalid/logfile

    run -1 check_logfile

    [ "${output}" = "${ERR_PREFIX} \`${LOGFILE}' path to file do not exist" ]
}
