#!/bin/bash

# DESC: load a console keyboard layout
# ARGS: `$1` (optional): keymap to to load
# NOTE: list all maps via `ls /usr/share/kbd/keymaps/**/*.map.gz`
# TODO: clean up; test if check is unnecessary due strict mode
load_keymap() {
    local map="${1:-us}"

    print_header

    loadkeys "${map}" &>/dev/null

    # shellcheck disable=SC2181
    if [ $? -ne 0 ]; then
        die 1 "\`${map}' do not load"
    fi
}
