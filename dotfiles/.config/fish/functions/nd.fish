function nd --wraps='cd (fd . -ut d | fzf) && nvim .' --description 'alias nd cd (fd . -ut d | fzf) && nvim .'
  cd (fd . -ut d | fzf) && nvim . $argv
        
end
