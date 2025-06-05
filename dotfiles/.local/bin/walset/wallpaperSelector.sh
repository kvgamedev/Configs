#!/bin/bash

WALL_DIR="$HOME/Pictures/Wallpapers/"

cd "$WALL_DIR" || exit

SELECTED_WALL=$(for a in *.jpg *.png *.jpeg; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -i -p "Wallpaper" -show-icons -theme ~/.config/rofi/wallpaperSelect.rasi)

if [ -n "$SELECTED_WALL" ]; then
    $HOME/.local/bin/walset/themeGenerator.sh -i "$WALL_DIR/$SELECTED_WALL"
fi
