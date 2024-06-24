function gch
    git branch -r | fzf-tmux -p | xargs git checkout
end
