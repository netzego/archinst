#!/bin/bash
# shellcheck disable=SC2034

readonly a_norm=$(tput sgr0)
readonly a_underline=$(tput smul)
readonly a_bold=$(tput bold)

readonly f_black=$(tput setaf 0)
readonly f_red=$(tput setaf 1)
readonly f_green=$(tput setaf 2)
readonly f_yellow=$(tput setaf 3)
readonly f_blue=$(tput setaf 4)
readonly f_magenta=$(tput setaf 5)
readonly f_cyan=$(tput setaf 6)
readonly f_white=$(tput setaf 7)

readonly b_black=$(tput setab 0)
readonly b_red=$(tput setab 1)
readonly b_green=$(tput setab 2)
readonly b_yellow=$(tput setab 3)
readonly b_blue=$(tput setab 4)
readonly b_magenta=$(tput setab 5)
readonly b_cyan=$(tput setab 6)
readonly b_white=$(tput setab 7)
