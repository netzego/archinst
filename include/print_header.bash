#!/bin/bash

# DESC: prints a header to stdout
# ARGS: $1: headline to print
print_header() {
    local hl="$1"

    # print arow of dashes
    # shellcheck disable=SC1001
    printf 'H%.0s' {1..76} | tr H \-

    # position cursor to begin of line and one line up
    # shellcheck disable=SC2005
    echo "$(tput cuu1)"

    echo "--- $hl -"
}
