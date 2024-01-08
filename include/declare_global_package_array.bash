#!/bin/bash

# DESC: declare a global array with values equal to lines (exclude empty
#       lines and ons with trailing #) from files `$1` and `$2`. if file
#       `$2` do not exists this function will not complain. the values of
#       the array are unique and sorted.
# ARGS: `$1` (optional): the first file
#       `$2` (optional): the second file
#       `$3` (optional): the name of the global array which is defined
# EXIT: if `$1` do not exists
# COND: $SCRIPTDIR
#       $SCRIPTNAME
# TODO: write tests
declare_global_package_array() {
    declare -r default="${1:-$SCRIPTDIR/include/core.packages}"
    declare -r extra="${2:-$SCRIPTDIR/${SCRIPTNAME}.packages}"
    declare -r varname="${3:-PACKAGES}"
    # grep -v: inverts the matching patterns
    # grep -s: suppress errors. in case `$2` do not exists.
    # grep -h: suppress filenames in the output.
    declare -agr "${varname}"="$(grep -shv "^#\|^\$" "${default}" "${extra}" | sort -u)"
}
