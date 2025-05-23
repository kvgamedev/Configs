#!/bin/bash

PACMAN_PACKAGES=(
	git
	base-devel
	neovim
	fzf
	rofi-wayland
	swww
	noto-fonts
	noto-fonts-extra
	noto-fonts-emoji
	ttf-jetbrains-mono-nerd
	man-db
	cliphist
	fastfetch
	waybar
	base-devel
	brightnessctl
	libnotify
	7zip
	hypridle
	hyprsunset
	tmux
	keyd
	fish
)

AUR_PACKAGES=(
	matugen
	wlogout
	brave-bin
)

echo "Installing Packages..."
sudo pacman -Syu --noconfirm --needed "${PACMAN_PACKAGES[@]}"

# echo "Installing Yay"
# git clone https://aur.archlinux.org/yay-bin.git ~/yay-bin
# cd ~/yay-bin
# makepkg -si
# cd ~/
# rm -rf ~/yay-bin

yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

echo "Importing configs..."
cp -r ~/Configs/.config/* $HOME/.config/

echo "Setting up FISH..."
chsh -s /usr/bin/fish
