#!/usr/bin/env bash

pgrep -x rofi > /dev/null || exit 0

read -r cx cy <<< "$(hyprctl cursorpos -j | jq -r '"\(.x) \(.y)"')"

read -r x y w h <<< "$(hyprctl layers -j | jq -r '
    [.[] | .levels[][] | select(.namespace == "rofi")][0]
    | "\(.x) \(.y) \(.w) \(.h)"
')"

if [[ -z "$x" || "$x" == "null" ]]; then
    exit 0
fi

if (( cx >= x && cx <= x + w && cy >= y && cy <= y + h )); then
    exit 0
fi

pkill -x rofi