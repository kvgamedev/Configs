function cf --wraps='cd (fzf --walker=dir,hidden)' --description 'alias cf cd (fzf --walker=dir,hidden)'
  cd (fzf --walker=dir,hidden) $argv
        
end
