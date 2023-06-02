#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "warning(): \$1=\"\"" {
    [[ "$UID" -ne 0 ]] && skip

    run -1 warning ""

    [ "${lines[-1]}" == "${ERR_PREFIX} warning: \$1 is empty" ]
}

@test "warning(): \$1=${BATS_FIXTURE_DEVICE} <<< YES" {
    [[ "$UID" -ne 0 ]] && skip

    run -0 warning "${BATS_FIXTURE_DEVICE}" <<< "YES"
}

@test "warning(): <<< NO" {
    [[ "$UID" -ne 0 ]] && skip

    run -1 warning "${BATS_FIXTURE_DEVICE}" <<< "NO"

    [ "${lines[-1]}" == "${ERR_PREFIX} stop execution" ]
}
