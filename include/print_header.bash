#!/bin/bash

# DESC: prints a header with the name of the calling function to stdout
# ARGS: none
print_header() {
    local hl="${FUNCNAME[1]}"

    # print arow of dashes
    # shellcheck disable=SC1001
    printf 'H%.0s' {1..76} | tr H \-

    # position cursor to begin of line and one line up
    # shellcheck disable=SC2005
    echo "$(tput cuu1)"

    echo "--- $hl -"
}
