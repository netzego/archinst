#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "write_gpt_table: without \$2" {
    run -0 write_gpt_table "$BATS_FIXTURE_DEVICE"

    [[ "${lines[0]}" = "---"* ]]
}

@test "write_gpt_table: with \$2" {
    run -0 write_gpt_table "$BATS_FIXTURE_DEVICE" "32M"

    [[ "${lines[0]}" = "---"* ]]
}
