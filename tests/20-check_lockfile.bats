#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "check_lockfile \"\" (/tmp/archinst.lock)" {
    local lockfile=""

    run -0 check_lockfile "${lockfile}"
}

@test "check_lockfile ${BATS_SUITE_TMPDIR}/exists" {
    local lockfile="${BATS_SUITE_TMPDIR}/exists"

    touch "${lockfile}"

    run -1 check_lockfile "${lockfile}"
    
    rm -v "${lockfile}"
}
