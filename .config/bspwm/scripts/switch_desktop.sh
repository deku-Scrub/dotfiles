#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)


get_all_windows() (
    wmctrl -l | sed -r -e 's/ +/ /g' | cut -d' ' -f1,2
)


get_next_idx() (
    local ACTIVE_DESKTOP="${1}"
    local STEP="${2}"

    local NEXT_IDX=$(( ACTIVE_DESKTOP + 1 ))
    if [ "${STEP}" -lt 0 ]
    then
        NEXT_IDX=$(( ACTIVE_DESKTOP - 1 ))
    fi
    echo "${NEXT_IDX}"
)


main() (
    # Signed number that represents the direction in which to switch
    # windows (before (<0) or after (>=0) the active window).
    local STEP="${1}"

    local ACTIVE_ID="$(
        xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW \
        | cut -f2 \
        | cut -f2 -dx
        )"
    local ACTIVE_DESKTOP="$(
        get_all_windows \
        | grep -F "${ACTIVE_ID}" \
        | cut -d' ' -f2
        )"
    local NEXT_IDX="$(get_next_idx "${ACTIVE_DESKTOP}" "${STEP}")"
    wmctrl -s "${NEXT_IDX}"
)


main ${@}
