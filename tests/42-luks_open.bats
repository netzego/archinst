#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "luks_open(): ${BATS_FIXTURE_DEVICE}p2 ${BATS_SUITE_TMPDIR}/keyfile" {
    local device="${BATS_FIXTURE_DEVICE}p2"
    local keyfile="${BATS_SUITE_TMPDIR}/keyfile"
    local mapname="bats-$(openssl rand -hex 8)"

    run -0 luks_open "${device}" "${keyfile}" "${mapname}"

    [ -e "/dev/mapper/${mapname}" ]

    cryptsetup close "${mapname}"
}

@test "luks_open(): ${BATS_FIXTURE_DEVICE}p2" {
    local device="${BATS_FIXTURE_DEVICE}p2"
    local mapname="bats-$(openssl rand -hex 8)"

    run -0 luks_open "${device}" "" "${mapname}" <<< "${BATS_FIXTURE_PASSWORD}"

    [ -e "/dev/mapper/${mapname}" ]

    cryptsetup close "${mapname}"
}

@test "luks_open(): ${BATS_SUITE_TMPDIR}/not_exists" {
    local device="${BATS_SUITE_TMPDIR}/not_exists"

    run -1 luks_open "${device}"
}

@test "luks_open(): ${BATS_SUITE_TMPDIR}/block" {
    local device="${BATS_SUITE_TMPDIR}/block"

    run -1 luks_open "${device}"
}

@test "luks_open(): ${BATS_SUITE_TMPDIR}/char" {
    local device="${BATS_SUITE_TMPDIR}/char"

    run -1 luks_open "${device}"
}
