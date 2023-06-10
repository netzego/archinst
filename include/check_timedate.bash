#!/bin/bash

# DESC: test system timedate setting is syncronized via ntp
# ARGS: none
# NOTE: this does not set the time
# TODO: consider to set the time on the host
check_timedate() {
    local is_ntp="$(timedatectl show --property=NTP --value)"
    local is_ntpsync="$(timedatectl show --property=NTPSynchronized --value)"

    print_header

    if [ "${is_ntp}" != "yes" ]; then
        die 1 "ntp is not set"
    fi

    if [ "${is_ntpsync}" != "yes" ]; then
        die 1 "ntp is not synchronized"
    fi
}
