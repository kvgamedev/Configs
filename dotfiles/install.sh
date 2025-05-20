#!/bin/bash

PACMAN_PACKAGES=(
	git
	base-devel
	neovim
	vivaldi
	fzf
	rofi-wayland
	zsh
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
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
	keyd
)

AUR_PACKAGES=(
	matugen
	wlogout
)

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
cp -r ~/Configs/.config/* ~/.config/

echo "Setting up ZSH..."
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
