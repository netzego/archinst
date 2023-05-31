#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "warning: <<< YES" {
    run -0 warning <<< "YES"
}

@test "warning: <<< NO (Not YES)" {
    run -1 warning <<< "NO"

    [ "${lines[-1]}" == "${ERR_PREFIX} stop execution" ]
}
