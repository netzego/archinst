#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

# IFS=$'\n\t'

readonly SCRIPTDIR="$(dirname "$(realpath "${BASH_ARGV0}")")"
readonly ARGS=("$@")

source "${SCRIPTDIR}/include/colors.bash"
source "${SCRIPTDIR}/include/utils.bash"
source "${SCRIPTDIR}/include/vars.bash"
source "${SCRIPTDIR}/include/cleanup.bash"
source "${SCRIPTDIR}/include/check_root.bash"
source "${SCRIPTDIR}/include/load_configfile.bash"
source "${SCRIPTDIR}/include/parse_args.bash"
source "${SCRIPTDIR}/include/check_args.bash"
source "${SCRIPTDIR}/include/write_lockfile.bash"
source "${SCRIPTDIR}/include/print_help.bash"
source "${SCRIPTDIR}/include/print_version.bash"
source "${SCRIPTDIR}/include/print_usage.bash"
source "${SCRIPTDIR}/include/print_vars.bash"

# ARGS: none
# NOTE: stdout and stderr will eventually get logged
main() {
    if [ "${DEBUG}" = true ]; then
        print_vars
    fi

    : # implement your own logic below here
}

trap cleanup EXIT

# check_root
load_configfile
parse_args "${ARGS[@]}"
check_args
write_lockfile

if [ "${HELP}" = true ]; then
    print_help
    exit 0
fi

if [ "${VERSION}" = true ]; then
    print_version
    exit 0
fi

main 2>&1 | tee "${LOGFILE}"

exit 0
