#!/usr/bin/bash

source_dir="$HOME/.local/bin/Configs/dotfiles/config/"
destination_dir="$HOME/.config/"

for item in $source_dir/*; do
	ln -sf $(realpath $item) $destination_dir
done
