#!/usr/bin/env bash

PACMAN=(
	# Essentials
	git
	base-devel
	libnotify
	brightnessctl
	cliphist

	noto-fonts
	noto-fonts-emoji
	ttf-jetbrains-mono-nerd

	# Utils
	fzf
	yazi
	fish
	keyd
	swww
	rofi-wayland

	# Modern Replacements
	starship
	lazygit
	zoxide
	eza
	bat
	ripgrep
	fd
)
sudo pacman -S --needed --noconfirm ${PACMAN[@]}

# AUR=(
# 	brave-bin
# 	ghostty-git
# 	neovim-nightly-bin
# )

# paru -S --needed --noconfirm ${AUR[@]}
