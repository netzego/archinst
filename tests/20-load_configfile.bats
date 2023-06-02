#!/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "load_configfile \"\" (\$CONFIGFILE)" {
    local configfile=""

    run -0 load_configfile "${configfile}"
}

@test "load_configfile \"${BATS_SUITE_TMPDIR}/not_exists\"" {
    local configfile="${BATS_SUITE_TMPDIR}/not_exists"

    run -1 load_configfile "${configfile}"

    [ "${lines[-1]}" = "${ERR_PREFIX} \`${configfile}' could not be sourced" ]
}
