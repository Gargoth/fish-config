# Dependencies:
# git, exa, speedtest-cli (python), gh-cli

# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"

# Set to vi mode
fish_vi_key_bindings

# Set environment variables
set -x EDITOR nvim
set -x CLICOLOR 1
set -x HOME ~

# Aliases
alias ls='exa --color=always --group-directories-first --icons'
alias la='exa -a --color=always --group-directories-first --icons'
alias ll='exa -l --color=always --group-directories-first --icons'
alias lt='exa -T --color=always --group-directories-first --icons'
alias ldir='exa -d --color=always --group-directories-first --icons'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gf='git fetch'
alias gps='git push -u'
alias gpl='git pull'
alias gl='git log --pretty=oneline'

alias efish='$EDITOR ~/.config/fish/config.fish'
alias sfish='source ~/.config/fish/config.fish'
alias stbytes='speedtest-cli --bytes'

alias ..='cd ..'

function config
    if test $argv
        cd ~/.config/$argv
    else
        cd ~/.config
    end
end

function c
    gcc $argv
    ./a.out
end

alias pc='cd /mnt/c/Users/Gargoth'

function gh-starred
    gh api user/starred --template '{{range .}}{{.full_name|color "yellow"}} ({{timeago .updated_at}}){{"\n"}}{{end}}'
end
