#!/bin/bash

PACMAN_PACKAGES=(
	git
	base-devel
	neovim
	fzf
	lazygit
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
	hyprlock
	tmux
	keyd
	fish
	lf
	nautilus
	ghostty
	mission-center
	zig
)

AUR_PACKAGES=(
	matugen
	wlogout
	brave-bin
)

sudo pacman -R dolphin
echo "Installing Packages..."
sudo pacman -Syu --noconfirm --needed "${PACMAN_PACKAGES[@]}"

echo "Installing Yay"
git clone https://aur.archlinux.org/yay-bin.git ~/yay-bin
cd ~/yay-bin
makepkg -si
cd ~/
rm -rf ~/yay-bin

yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

echo "Importing configs..."
cp -r ~/Configs/dotfiles/.config/* $HOME/.config/
cp -r ~/Configs/dotfiles/.local/* $HOME/.local/

echo "Setting up Fish..."
chsh -s /usr/bin/fish
