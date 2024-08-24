#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)


get_all_windows() (
    wmctrl -l | sed -r -e 's/ +/ /g' | cut -d' ' -f1,2
)


get_windows_in_desktop() (
    local DESKTOP_IDX="${1}"
    get_all_windows | grep -E "${DESKTOP_IDX}"'$'
)


get_next_idx() (
    local ACTIVE_IDX="${1}"
    local ACTIVE_DESKTOP="${2}"
    local STEP="${3}"

    local N_WINDOWS="$(get_windows_in_desktop "${ACTIVE_DESKTOP}" | wc -l)"
    local NEXT_IDX=$(( (ACTIVE_IDX % N_WINDOWS) + 1 ))
    if [ "${STEP}" -lt 0 ]
    then
        NEXT_IDX=$(( ACTIVE_IDX - 1 ))
        if [ "${NEXT_IDX}" -eq 0 ]
        then
            NEXT_IDX="${N_WINDOWS}"
        fi
    fi
    echo "${NEXT_IDX}"
)


main() (
    # Signed number that represents the direction in which to switch
    # windows (before (<0) or after (>=0) the active window).
    local STEP="${1}"

    # From https://superuser.com/questions/382616/detecting-currently-active-window
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
    local ACTIVE_IDX="$(
        get_windows_in_desktop "${ACTIVE_DESKTOP}" \
        | grep -Fn "${ACTIVE_ID}" \
        | cut -f1 -d':'
        )"
    local NEXT_IDX="$(get_next_idx "${ACTIVE_IDX}" "${ACTIVE_DESKTOP}" "${STEP}")"
    local NEXT_ID="$(
        get_windows_in_desktop "${ACTIVE_DESKTOP}" \
        | tail -n+"${NEXT_IDX}" \
        | head -n1 \
        | cut -d' ' -f1
        )"
    wmctrl -i -a "${NEXT_ID}"
)


main ${@}
