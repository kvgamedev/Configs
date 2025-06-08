#!/bin/bash

cd "$HOME/.local/bin/hyprstyle/"
HYPRVAR="$HOME/.config/hypr/variables.conf"

if [ ! -f ".cache" ]; then
	touch ".cache"
	echo "fast" > ".cache"
fi

CACHE=$(cat ".cache")

if [[ "$CACHE" == "fast" ]]; then
	cp ./fast $HYPRVAR
	notify-send -t 400 "FAST"
	echo "chill" > ".cache"

elif [[ "$CACHE" == "chill" ]]; then
	cp ./chill $HYPRVAR
	notify-send -t 400 "CHILL"
	echo "fast" > ".cache"

fi
