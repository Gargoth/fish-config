function gri
    if test $argv
        git rebase -i HEAD~$argv
    else
        git rebase -i HEAD~1
    end
end
