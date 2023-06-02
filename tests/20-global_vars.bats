#!/bin/bats
# shellcheck disable=SC2154

# TODO: BTRFS_OPTIONS
# TODO: PACKAGES
# TODO: SUBVOLUMES

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "check global variable \$SCRIPTDIR" {
    info "\$SCRIPTDIR: ${SCRIPTDIR}"

    [ ! -z "${SCRIPTDIR}" ]
}

@test "check global variable \$PWD" {
    info "\$PWD: ${PWD}"

    [ ! -z "${PWD}" ]
}

@test "check global variable \$SCRIPTNAME" {
    info "\$SCRIPTNAME: ${SCRIPTNAME}"

    [ ! -z "${SCRIPTNAME}" ]
}

@test "check global variable \$VERSION_NUMBER" {
    info "\$VERSION_NUMBER: ${VERSION_NUMBER}"

    [ ! -z "${VERSION_NUMBER}" ]
}

@test "check global variable \$LOCKFILE" {
    info "\$LOCKFILE: ${LOCKFILE}"

    [ ! -z "${LOCKFILE}" ]
}

@test "check global variable \$CONFIGFILE" {
    info "\$CONFIGFILE: ${CONFIGFILE}"

    [ ! -z "${CONFIGFILE}" ]
}

@test "check global variable \$WORKSPACE" {
    info "\$WORKSPACE: ${WORKSPACE}"

    [ ! -z "${WORKSPACE}" ]
}

@test "check global variable \$MOUNTPOINT" {
    info "\$MOUNTPOINT: ${MOUNTPOINT}"

    [ ! -z "${MOUNTPOINT}" ]
}
