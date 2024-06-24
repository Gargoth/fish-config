function dfzf --description "Go to parent directory of chosen file from fzf"
    cd (dirname (fzf-tmux -p))
end

