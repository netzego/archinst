#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "mkfs_btrfs(): ${BATS_FIXTURE_DEVICE}p2" {
    local device="${BATS_FIXTURE_DEVICE}p2"

    run -0 create_workspace
    run -0 mkfs_btrfs "${device}"

    umount -v -R "${WORKSPACE}/mnt"

    rm -vfr "${WORKSPACE}"
}
