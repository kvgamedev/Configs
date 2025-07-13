function nd --wraps='cd (fzf --walker=dir,hidden) && nvim .' --description 'alias nd cd (fzf --walker=dir,hidden) && nvim .'
  cd (fzf --walker=dir,hidden) && nvim . $argv
        
end
