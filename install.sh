#!/bin/bash

DIR=$(pwd)
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
	nautilus
	ghostty
	mission-center
	wev
	git-lfs
	fd
	unzip
)

AUR_PACKAGES=(
	matugen-bin
	wlogout
	brave-bin
)

DELETE_PACKAGES=(
	dolphin
	wofi
)

echo "Installing Packages..."
sudo pacman -Syu --noconfirm --needed "${PACMAN_PACKAGES[@]}"
sudo pacman -R --noconfirm "${DELETE_PACKAGES[@]}"

echo "Installing Yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
rm -rf ~/yay-bin

yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

echo "Importing configs..."
cp -r $DIR/dotfiles/.config/* $HOME/.config/
cp -r $DIR/dotfiles/.local/* $HOME/.local/
