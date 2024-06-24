function config
    if test $argv
        cd ~/.config/$argv
    else
        cd (ls -d ~/.config/*/ | fzf-tmux -p)
    end
end
