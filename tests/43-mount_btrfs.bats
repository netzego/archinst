#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "mkfs_mount ${BATS_FIXTURE_DEVICE} ${BATS_SUITE_TMPDIR}/mnt \"\" \"\"" {
    local device="${BATS_FIXTURE_DEVICE}"
    local mntpoint="${BATS_SUITE_TMPDIR}/mnt"
    # local subvols="${SUBVOLUMES}"
    # local options="${BTRFS_OPTIONS}"

    mkdir -vp "${mntpoint}"

    run -0 mkfs_btrfs "${device}" "${mntpoint}"
    run -0 mount_btrfs "${device}" "${mntpoint}"

    umount -v -R "${mntpoint}"
}
