#!/bin/bash

folder=$(fzf --walker=dir,hidden --walker-root=$HOME --tmux 80%)

tmux new-session -d -c "$folder" -s $(basename "$folder")

if [ -z $TMUX ]; then
	tmux attach -t $(basename "$folder")
else
	tmux switch-client -t $(basename "$folder")
fi
