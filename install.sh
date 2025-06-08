#!/bin/bash

PACMAN_PACKAGES=(
	git
	base-devel
	neovim
	fzf
	dunst
	lazygit
	rofi-wayland
	noto-fonts
	noto-fonts-extra
	noto-fonts-emoji
	ttf-jetbrains-mono-nerd
	man-db
	cliphist
	fastfetch
	waybar
	brightnessctl
	libnotify
	7zip
	hypridle
	hyprsunset
	hyprlock
	hyprpaper
	keyd
	fish
	lf
	nautilus
	ghostty
	mission-center
	wev
	git-lfs
	fd
)

AUR_PACKAGES=(
	matugen
	wlogout
	brave-bin
)

DELETE_PACKAGES=(
	dolphin
)

echo "Installing Packages..."
sudo pacman -Syu --noconfirm --needed "${PACMAN_PACKAGES[@]}"
sudo pacman -R --noconfirm "${DELETE_PACKAGES[@]}"

echo "Installing Yay"
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
rm -rf ~/yay-bin

yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

echo "Importing configs..."
cp -r ~/Configs/dotfiles/.config/* $HOME/.config/
cp -r ~/Configs/dotfiles/.local/* $HOME/.local/

echo "Setting up Fish..."
chsh -s /usr/bin/fish
