#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "mkfs_btrfs(): ${BATS_FIXTURE_DEVICE}" {
    declare -r device="${BATS_FIXTURE_DEVICE}"
    declare -r mntpoint="${BATS_SUITE_TMPDIR}/mnt"

    mkdir -vp "${mntpoint}"

    run -0 mkfs_btrfs "${device}" "${mntpoint}"

    rm -vfr "${WORKSPACE}"
}
