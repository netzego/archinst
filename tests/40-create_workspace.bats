#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "create_workspace(): \$WORKSPACE do not exists" {
    run -0 create_workspace

    rm -vfr "${WORKSPACE}"
}

@test "create_workspace(): \$WORKSPACE exists" {    
    run -0 create_workspace
    run -1 create_workspace

    [ "${lines[-1]}" == "${ERR_PREFIX} \`${WORKSPACE}' already exists" ]

    rm -vfr "${WORKSPACE}"
}
