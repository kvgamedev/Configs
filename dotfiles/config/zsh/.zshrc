if [[ -z $TMUX ]]; then tmux attach || tmux; fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch

export MANPAGER="nvim +Man!"
bindkey -v

# path+='/home/kv/.local/bin'
path+='/home/kv/Documents/zig-x86_64-linux-0.15.0-dev.1222+5fb36d260'

zstyle :compinstall filename '/home/kv/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

alias ls='ls --color=auto'
alias la='ls -la'
alias vi='nvim'
alias nf='nvim $(fzf)'
alias cf='cd $(fzf --walker=dir,hidden --height=40%)'
alias zig='~/Documents/zig-x86_64-linux-0.15.0-dev.1222+5fb36d260/zig'
alias tls='tmux ls'
alias mkdir='mkdir -p'
alias ts='~/.local/bin/Configs/dotfiles/local/bin/Commands/tmux-sessionizer.sh'

autoload -Uz compinit
compinit

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

