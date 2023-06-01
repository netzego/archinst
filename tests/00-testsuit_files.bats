#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "suite_setup(): check $BATS_SUITE_TMPDIR" {
    [ -d "${BATS_SUITE_TMPDIR}" ]
}

@test "suite_setup(): check $BATS_SUITE_TMPDIR/test.img" {
    [ -f "${BATS_SUITE_TMPDIR}/test.img" ]
}

@test "suite_setup(): check /dev/loop13" {
    [ -b "/dev/loop13" ]
}

@test "suite_setup(): check $BATS_SUITE_TMPDIR/char" {
    [ -c "$BATS_SUITE_TMPDIR/char" ]
}

@test "suite_setup(): check $BATS_SUITE_TMPDIR/block" {
    [ -b "$BATS_SUITE_TMPDIR/block" ]
}
