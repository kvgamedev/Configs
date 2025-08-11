#!/usr/bin/env bash

cd ~/.Custom/configs
for i in $(ls); do
	ln -sf "$(realpath $i)" ~/.config/
done
