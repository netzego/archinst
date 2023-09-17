#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "check_lockfile w/ no args (/tmp/archinst.lock do NOT exist)" {

    run -0 check_lockfile
}

@test "check_lockfile \"/tmp/archinst.lock\"" {
    local lockfile="/tmp/archinst.lock" # default value set thru vars.bash

    touch "${lockfile}"

    ls -l "${lockfile}"

    run -1 check_lockfile "${lockfile}"

    rm -v "${lockfile}"
}

@test "check_lockfile ${BATS_SUITE_TMPDIR}/exists" {
    local lockfile="${BATS_SUITE_TMPDIR}/exists"

    touch "${lockfile}"

    run -1 check_lockfile "${lockfile}"
    
    rm -v "${lockfile}"
}
