#!/bin/bash

MODE_CACHE_FILE="$HOME/.local/bin/walset/.mode"
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

if [ ! -f $MODE_CACHE_FILE ]; then
    touch $MODE_CACHE_FILE
    echo "dark" > "$MODE_CACHE_FILE"
fi

MODE="$(cat $MODE_CACHE_FILE)"
IMAGE="$(hyprctl hyprpaper listloaded)"

while [[ $# -gt 0 ]]; do
    case "$1" in
        -m|--mode)
            MODE="$2"
            shift 2
            ;;
        -i|--image)
            IMAGE="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

if [ ! -f "$IMAGE" ]; then
    echo "Error: Image file $IMAGE does not exist."
    exit 1
fi

hyprctl hyprpaper reload ,"$IMAGE"

echo "preload = $IMAGE" > $CONFIG_FILE
echo "wallpaper = , $IMAGE" >> $CONFIG_FILE

matugen -m "$MODE" image "$IMAGE"
echo "$MODE" > "$MODE_CACHE_FILE"

pkill -SIGUSR2 waybar
pkill -SIGUSR1 kitty
hyprctl reload
hyprctl dispatch sendshortcut ctrl shift, comma, class:com.mitchellh.ghostty
pkill dunst
pkill rofi
