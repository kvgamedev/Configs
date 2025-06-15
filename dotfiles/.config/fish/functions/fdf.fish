function fdf --wraps='cd (fd . -ut d | fzf)' --description 'alias fdf cd (fd . -ut d | fzf)'
  cd (fd . -ut d | fzf) $argv
        
end
