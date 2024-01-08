#!/bin/bats

load "setup_file.bash"
load "setup.bash"

@test "archinst --debug \$BATS_FIXTURE_IMAGE" {

    local bin="$(which "${BATS_TEST_DIRNAME}/../archinst")"

    run ${bin} --debug "${BATS_FIXTURE_IMAGE}"
}
