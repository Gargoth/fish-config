# Dependencies:
# git, exa, batcat, speedtest-cli (python), gh-cli

# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"

# Set to vi mode
fish_vi_key_bindings

# Fish prompt
function fish_mode_prompt
    if test "$fish_key_bindings" != fish_default_key_bindings
        set --local vi_mode_color
        set --local vi_mode_symbol

        set -l cyan (set_color -o cyan)
        set -l yellow (set_color -o yellow)
        set -l red (set_color -o red)
        set -l green (set_color -o green)
        set -l blue (set_color -o blue)
        set -l normal (set_color normal)

        switch $fish_bind_mode
            case default
                set vi_mode_color (set_color $fish_color_selection)
                set vi_mode_symbol N
            case insert
                set vi_mode_color (set_color $fish_color_selection)
                set vi_mode_symbol I
            case replace replace_one
                set vi_mode_color (set_color $fish_color_match)
                set vi_mode_symbol R
            case visual
                set vi_mode_color (set_color $fish_color_match)
                set vi_mode_symbol V
        end
        echo -es $green "[" $vi_mode_symbol "] " $green $USER $normal "@" $hostname " \x1b[0m"
    end
end

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

alias cats='batcat'

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
