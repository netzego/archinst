#!/usr/bin/bats

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "check_network: archlinux.org" {
    run -0 check_network
}

@test "check_network: 8.8.8.8" {
    local host="8.8.8.8"

    run -0 check_network
}

@test "check_network: test.tld" {
    local host="test.tld"

    run -1 check_network "${host}"

    [ "${lines[-1]}" == "${ERR_PREFIX} \`${host}' is not reachable" ]
}

@test "check_network: 128.128.128.128" {
    local host="128.128.128.128"

    run -1 check_network "${host}"

    [ "${lines[-1]}" == "${ERR_PREFIX} \`${host}' is not reachable" ]
}
