if status is-interactive
	test -z "$TMUX"; and tmux attach || tmux
end
