#!/bin/bash

DIR="$HOME/.local/bin/Configs"
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
	zsh
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
	zsh-history-substring-search
	tmux
)

AUR_PACKAGES=(
	matugen-bin
	wlogout
	brave-bin
	zsh-theme-powerlevel10k-git
)

DELETE_PACKAGES=(
	dolphin
	wofi
)

echo "Installing Packages..."
sudo pacman -Syu --noconfirm --needed "${PACMAN_PACKAGES[@]}"
sudo pacman -R --noconfirm "${DELETE_PACKAGES[@]}"

echo "Installing Yay"
git clone https://aur.archlinux.org/yay.git $HOME/yay
cd $HOME/yay
makepkg -si

yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

# echo "Importing configs..."
# cp -r $DIR/dotfiles/.config/* $HOME/.config/
# cp -r $DIR/dotfiles/.local/* $HOME/.local/

echo "Changing Shell to ZSH"
chsh -s /usr/bin/zsh
