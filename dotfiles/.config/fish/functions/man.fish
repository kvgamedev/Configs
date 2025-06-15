function man --wraps='nvim -c "Man $argv" -c "only"' --description 'alias man nvim -c "Man $argv" -c "only"'
  nvim -c "Man $argv" -c "only" $argv
        
end
