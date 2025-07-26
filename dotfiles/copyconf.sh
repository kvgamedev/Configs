#!/bin/bash

config_loc="$HOME/Downloads/Configs/dotfiles/.config"
bin_loc="$HOME/Downloads/Configs/dotfiles/.local"

CONFIGS=(
	dunst
	fastfetch
	fontconfig
	ghostty
	gtk-3.0
	gtk-4.0
	hypr
	matugen
	nvim
	qt5ct
	qt6ct
	rofi
	waybar
	wlogout
	tmux
)

rm -rf "$config_loc"
rm -rf "$bin_loc"

mkdir "$config_loc"
mkdir "$bin_loc"

cd "$HOME/.config/"

cp -r "${CONFIGS[@]}" "$config_loc"
cp -r "$HOME/.local/bin/" "$bin_loc"
