function repos
    if test $argv
        cd ~/repos/$argv
    else
        cd (ls -d ~/repos/*/ | fzf-tmux -p)
    end
end
