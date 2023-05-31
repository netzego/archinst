#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "update_mirrorlist(): \$BATS_SUITE_TMPDIR/mirrorlist" {
    local path="${BATS_SUITE_TMPDIR}/mirrorlist"

    run -0 update_mirrorlist "${path}"
}
