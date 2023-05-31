#!/usr/bin/bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "load_keymap(): default map=en" {
    run -0 load_keymap
}

@test "load_keymap(): map=de" {
    local map="de"

    run -0 load_keymap "${map}"
}

@test "load_keymap(): map=en" {
    local map="en"

    run -0 load_keymap "${map}"
}

@test "load_keymap(): map=non_exists" {
    local map="non_exists"

    run -1 load_keymap "${map}"

    [ "${lines[-1]}" == "$ERR_PREFIX \`${map}' do not load" ]
}
