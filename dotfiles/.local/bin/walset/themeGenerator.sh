#!/bin/bash

CACHE_FILE="$HOME/.local/bin/walset/.cache"

if [ ! -f $CACHE_FILE ]; then
    touch $CACHE_FILE
    echo "dark" > "$CACHE_FILE"
fi

CACHE_MODE="$(cat $CACHE_FILE)"
MODE=""
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

if [ -z "$MODE" ]; then
    matugen -m "$CACHE_MODE" image "$IMAGE"
else
    matugen -m "$MODE" image "$IMAGE"
    echo "$MODE" > "$CACHE_FILE"
fi

pkill -SIGUSR2 waybar
pkill -SIGUSR1 kitty
hyprctl reload
hyprctl dispatch sendshortcut ctrl shift, comma, class:com.mitchellh.ghostty
pkill dunst
pkill rofi
