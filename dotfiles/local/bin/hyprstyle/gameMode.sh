#!/bin/bash

cd "$HOME/.local/bin/Configs/dotfiles/local/bin/hyprstyle/"

HYPRVAR="$HOME/.config/hypr/variables.conf"
HYPRLOCK="$HOME/.config/hypr/hyprlock.conf"
waybar_dir="$HOME/.config/waybar/style.css"
rofi_style1="$HOME/.config/rofi/themes/style_1.rasi"

if [ ! -f ".cache" ]; then
	touch ".cache"
	echo "fast" > ".cache"
fi

CACHE=$(cat ".cache")

if [[ "$CACHE" == "fast" ]]; then
	cp ./fast $HYPRVAR

	sed -i "30s/ 30;/ 0;/g" "$waybar_dir"
	sed -i "19s/: 6 8 0 8/: 0 0 0 0/g" "$waybar_dir"
	sed -i "51s/: 0 2/: 0 0/g" "$waybar_dir"
	sed -i "41s/: 2/: 1/g" "$waybar_dir"
	sed -i "10s/: 0.5/: 1.0/g" "$HOME/.config/matugen/templates/rofi-colors.rasi"
	sed -i "5s/: 20px/: 0px/g" "$rofi_style1"
	sed -i "29s/: 2px/: 1px/g" "$rofi_style1"
	sed -i "45s/ 15/ 0/g" "$HYPRLOCK"

	notify-send -t 400 "FAST"
	echo "chill" > ".cache"

elif [[ "$CACHE" == "chill" ]]; then
	cp ./chill $HYPRVAR

	sed -i "30s/ 0;/ 30;/g" "$waybar_dir"
	sed -i "19s/: 0 0 0 0/: 6 8 0 8/g" "$waybar_dir"
	sed -i "41s/: 1/: 2/g" "$waybar_dir"
	sed -i "51s/: 0 0/: 0 2/g" "$waybar_dir"
	sed -i "10s/: 1.0/: 0.5/g" "$HOME/.config/matugen/templates/rofi-colors.rasi"
	sed -i "5s/: 0px/: 20px/g" "$rofi_style1"
	sed -i "29s/: 1px/: 2px/g" "$rofi_style1"
	sed -i "45s/ 0/ 15/g" "$HYPRLOCK"

	notify-send -t 400 "CHILL"
	echo "fast" > ".cache"

fi

~/.local/bin/Configs/dotfiles/local/bin/walset/themeGenerator.sh
