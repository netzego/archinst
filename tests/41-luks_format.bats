#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "luks_format(): ${BATS_FIXTURE_DEVICE}p2 \"\" <<< ${BATS_FIXTURE_PASSWORD}" {
    local rootpart="${BATS_FIXTURE_DEVICE}p2"
    local keyfile=""

    run -0 luks_format "${rootpart}" "${keyfile}" <<< "${BATS_FIXTURE_PASSWORD}"
}

@test "luks_format(): ${BATS_FIXTURE_DEVICE}p2 ${BATS_SUITE_TMPDIR}/keyfile" {
    local rootpart="${BATS_FIXTURE_DEVICE}p2"
    local keyfile="${BATS_SUITE_TMPDIR}/keyfile"

    run -0 luks_format "${rootpart}" "${keyfile}"
}

@test "luks_format(): ${BATS_SUITE_TMPDIR}/not_exists \"\"" {
    local rootpart="${BATS_SUITE_TMPDIR}/not_exists"
    local keyfile=""

    run -1 luks_format "${rootpart}" "${keyfile}"
}

@test "luks_format(): ${BATS_SUITE_TMPDIR}/char \"\"" {
    local rootpart="${BATS_SUITE_TMPDIR}/char"
    local keyfile=""

    run -1 luks_format "${rootpart}" "${keyfile}"
}
