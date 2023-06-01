#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "update_pacman(): /var/lib/pacman/db.lck" {
    local lockfile="/var/lib/pacman/db.lck"

    touch "${lockfile}"
    run -1 update_pacman
    rm -v "${lockfile}"
}

@test "update_pacman():" {
    run -0 update_pacman
}
