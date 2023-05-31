#!/bin/bash

# DESC: load a console keyboard layout
# ARGS: $1: keymap to to load
# NOTE: list all maps via `ls /usr/share/kbd/keymaps/**/*.map.gz`
load_keymap() {
    local map="${1:-us}"

    print_header "${FUNCNAME[0]}"

    loadkeys "${map}" &>/dev/null

    # shellcheck disable=SC2181
    if [ $? -ne 0 ]; then
        die 1 "\`${map}' do not load"
    fi
}
