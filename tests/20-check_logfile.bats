#!/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "check_logfile \"\"" {
    local logfile=""

    run -0 check_logfile ""
}

@test "check_logfile \"/dev/null\" (default value)" {
    local logfile="/dev/null"

    run -0 check_logfile
}

@test "check_logfile ${BATS_SUITE_TMPDIR}/not_exists" {
    local logfile="${BATS_SUITE_TMPDIR}/not_exists"

    # this should actualy pass, cause if logf. doesn't exist it should be created
    run -0 check_logfile "${logfile}"
} 

@test "check_logfile ${BATS_SUITE_TMPDIR}/not_writeable" {
    [[ "$UID" -eq 0 ]] && skip

    local logfile="${BATS_SUITE_TMPDIR}/not_writeable"

    touch "${logfile}"
    chmod 110 "${logfile}"

    run -1 check_logfile "${logfile}"

    rm "${logfile}"
} 

@test "check_logfile ${BATS_SUITE_TMPDIR}/not_exists/logfile" {
    local logfile="${BATS_SUITE_TMPDIR}/not_exists/logfile"

    run -1 check_logfile "${logfile}"

    [ "${lines[-1]}" = "${ERR_PREFIX} \`${logfile}' path prefix do not exists" ]
}
