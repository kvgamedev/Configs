if status is-interactive
	alias ls 'eza --icons auto'
	alias cd 'z'
	alias cf 'cd (fzf --walker=dir,hidden)'
	alias vim 'nvim'
	alias v 'nvim'
	alias vi 'nvim (fzf)'
	alias ch 'cd (fzf --walker=dir,hidden --walker-dir=$HOME)'

	starship init fish | source
	zoxide init fish | source
end
