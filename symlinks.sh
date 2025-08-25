#!/usr/bin/env bash

cd ~/.dotfiles/configs
for i in $(ls); do
	ln -sf "$(realpath $i)" ~/.config/
done
