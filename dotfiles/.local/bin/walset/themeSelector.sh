#!/bin/bash

SELECTED_MODE=$(echo -e "dark\nlight" | rofi -dmenu -i -p "Theme")

if [ -z "$SELECTED_MODE" ]; then
	exit
fi

$HOME/.local/bin/walset/themeGenerator.sh -m $SELECTED_MODE
echo "$SELECTED_MODE" > "$HOME/.local/bin/walset/.cache/mode_cache"
