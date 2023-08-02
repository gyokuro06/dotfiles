function ggraph --wraps='git log --graph --color --oneline --all' --description 'alias ggraph=git log --graph --color --oneline --all'
  git log --graph --color --oneline --all $argv; 
end
