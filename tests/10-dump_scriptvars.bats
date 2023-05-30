#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

# NOTE: overwrite $0 and $BASH_ARGV0. this might not smart or it's a bug in bats?
@test "dump \$SCRIPTDIR and \$SCRIPTNAME" {
    echo "SCRIPTDIR: ${SCRIPTDIR}"
    echo "SCRIPTNAME: ${SCRIPTNAME}"
    echo "\$0: ${0}"
}
