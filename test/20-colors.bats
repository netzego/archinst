#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bash"
load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "text style variables" {
    [ -n "${a_norm}" ]
    [ -n "${a_bold}" ]
    [ -n "${a_underline}" ]
}

@test "foreground color variables" {
    # insert escape code with ^V-ESC
    [ "${f_black}" = "[30m" ]
    [ "${f_green}" = "[32m" ]
    [ "${f_yellow}" = "[33m" ]
    [ "${f_blue}" = "[34m" ]
    [ "${f_magenta}" = "[35m" ]
    [ "${f_cyan}" = "[36m" ]
    [ "${f_white}" = "[37m" ]
}

@test "background color variables" {
    # insert escape code with ^V-ESC
    [ "${b_black}" = "[40m" ]
    [ "${b_red}" = "[41m" ]
    [ "${b_green}" = "[42m" ]
    [ "${b_yellow}" = "[43m" ]
    [ "${b_blue}" = "[44m" ]
    [ "${b_magenta}" = "[45m" ]
    [ "${b_cyan}" = "[46m" ]
    [ "${b_white}" = "[47m" ]
}
