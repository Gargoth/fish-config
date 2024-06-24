function gsw
    git branch | fzf-tmux -p | xargs git switch
end
