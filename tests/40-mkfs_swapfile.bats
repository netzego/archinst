#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "mkfs_swapfile(): ${BATS_SUITE_TMPDIR}/swapfile 8M" {
    local swapfile="${BATS_SUITE_TMPDIR}/swapfile"
    local size="8M"

    run -0 mkfs_swapfile "${swapfile}" "${size}"

    [ -f "${swapfile}" ] 
}

@test "mkfs_swapfile(): ${BATS_SUITE_TMPDIR}/no_dir/swapfile 8M" {
    local swapfile="${BATS_SUITE_TMPDIR}/no_dir/swapfile"
    local size="8M"

    run -1 mkfs_swapfile "${swapfile}" "${size}"
}
