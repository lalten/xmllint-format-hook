#!/bin/bash

set -euo pipefail

# Extract arguments that should be passed to each xmllint invocation
args=()
while [[ $1 == -* ]]; do
    if [[ $1 == "--output" ]]; then
        echo "Can not use --output twice"
        exit 1
    fi
    if [[ $1 == "--XMLLINT_INDENT" ]]; then
        shift
        export XMLLINT_INDENT=$1
        shift
    else
        args+=("$1")
        shift
    fi
done

ret=0

# The rest of the arguments are assumed to be files to be processed
for file in "${@}"; do
    # shellcheck disable=SC2068
    xmllint ${args[@]} --output "$file" "$file" || ret=1
done

exit $ret
