#!/bin/bash

SELECTED_MODE=$(echo -e "dark\nlight" | rofi -dmenu -i -p "Theme")

[ -z $SELECTED_MODE ] && exit

$HOME/.local/bin/walset/themeGenerator.sh -m $SELECTED_MODE
