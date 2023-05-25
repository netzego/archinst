#!/bin/bash
# shellcheck disable=SC2154

load "fixtures.bash"

# DESC: this functions runs once for every bat test run
# ARGS: none
# NOTE: this file is sourced/load by bats auto magically
setup_suite() {
    bats_require_minimum_version 1.5.0
}
