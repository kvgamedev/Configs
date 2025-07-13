function cdf --wraps='cd (fzf --walker=dir,hidden)' --description 'alias cdf cd (fzf --walker=dir,hidden)'
  cd (fzf --walker=dir,hidden) $argv
        
end
