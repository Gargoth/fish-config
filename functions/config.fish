function config
    if test $argv
        cd ~/.config/$argv
    else
        cd ~/.config
    end
end
