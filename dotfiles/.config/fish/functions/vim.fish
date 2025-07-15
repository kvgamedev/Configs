function vim --wraps="nvim --config = '~/.config/lazyvim'" --wraps='nvim -u ~/.config/lazyvim/init.lua' --wraps=nvim --description 'alias vim nvim'
  nvim $argv
        
end
