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

	sed -i "30s/ 30;/ 0;/g" "$HOME/.config/waybar/style.css"
	sed -i "19s/: 6 8 0 8/: 0 0 0 0/g" "$HOME/.config/waybar/style.css"
	sed -i "51s/: 0 2/: 0 0/g" "$HOME/.config/waybar/style.css"
	sed -i "41s/: 2/: 1/g" "$HOME/.config/waybar/style.css"
	sed -i "9s/: 0.5/: 1.0/g" "$HOME/.config/matugen/templates/rofi-colors.rasi"
	sed -i "5s/: 20px/: 0px/g" "$HOME/.config/rofi/themes/style_1.rasi"

	notify-send -t 400 "FAST"
	echo "chill" > ".cache"

elif [[ "$CACHE" == "chill" ]]; then
	cp ./chill $HYPRVAR

	sed -i "30s/ 0;/ 30;/g" "$HOME/.config/waybar/style.css"
	sed -i "19s/: 0 0 0 0/: 6 8 0 8/g" "$HOME/.config/waybar/style.css"
	sed -i "41s/: 1/: 2/g" "$HOME/.config/waybar/style.css"
	sed -i "51s/: 0 0/: 0 2/g" "$HOME/.config/waybar/style.css"
	sed -i "9s/: 1.0/: 0.5/g" "$HOME/.config/matugen/templates/rofi-colors.rasi"
	sed -i "5s/: 0px/: 20px/g" "$HOME/.config/rofi/themes/style_1.rasi"

	notify-send -t 400 "CHILL"
	echo "fast" > ".cache"

fi

pkill -SIGUSR2 waybar
~/.local/bin/walset/themeGenerator.sh
