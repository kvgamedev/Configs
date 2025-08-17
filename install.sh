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
	man-db
	fzf
	yazi
	fish
	keyd
	swww
	rofi-wayland
	unzip

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

ALL=(
	amd-ucode
	base
	base-devel
	bat
	bluez
	bluez-utils
	brave-bin
	brightnessctl
	cliphist
	dkms
	dolphin
	dunst
	efibootmgr
	eza
	fd
	fish
	fzf
	ghostty-git
	git
	grim
	gst-plugin-pipewire
	htop
	hyprland
	iwd
	keyd
	kitty
	kwalletmanager
	lazygit
	libnotify
	libpulse
	libva-nvidia-driver
	linux
	linux-firmware
	linux-headers
	lua-language-server
	man-db
	nano
	neovim-nightly-bin
	network-manager-applet
	networkmanager
	noto-fonts
	noto-fonts-emoji
	nvidia-dkms
	paru
	paru-debug
	pipewire
	pipewire-alsa
	pipewire-jack
	pipewire-pulse
	polkit-kde-agent
	qt5-wayland
	qt6-wayland
	rofi-wayland
	rustup
	sddm
	slurp
	smartmontools
	sof-firmware
	starship
	stylua
	swww
	ttf-jetbrains-mono-nerd
	unzip
	uwsm
	wev
	wget
	wireless_tools
	wireplumber
	xdg-desktop-portal-hyprland
	xdg-utils
	xorg-server
	xorg-xinit
	yazi
	zig
	zls
	zoxide
	zram-generator
)
