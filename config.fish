# Dependencies:
# git, eza, batcat, speedtest-cli (python), gh-cli, pandoc, eisvogel

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

# Functions
function dfzf
    cd (dirname (fzf))
end

function config
    if test $argv
        cd ~/.config/$argv
    else
        cd (ls -d ~/.config/*/ | fzf --preview 'eza -1 --color=always --group-directories-first --icons {}')
    end
end

function econfig
    if test $argv
        $EDITOR ~/.config/$argv
    else
        cd (ls -d ~/.config/*/ | fzf --preview 'eza -1 --color=always --group-directories-first --icons {}') && $EDITOR; cd -
    end
end

function repos
    if test $argv
        cd ~/repos/$argv
    else
        cd (ls -d ~/repos/*/ | fzf --preview 'eza -1 --color=always --group-directories-first --icons {}')
    end
end

function erepos
    if test $argv
        $EDITOR ~/repos/$argv
    else
        cd (ls -d ~/repos/*/ | fzf --preview 'eza -1 --color=always --group-directories-first --icons {}') && $EDITOR; cd -
    end
end

function c
    gcc $argv
    ./a.out
    rm ./a.out
end

function cpp
    clang++ $argv
    ./a.out
    rm ./a.out
end

function gh-starred
    gh api user/starred --template '{{range .}}{{.full_name|color "yellow"}} ({{timeago .updated_at}}){{"\n"}}{{end}}'
end

# Abbreviations
abbr --add ls 'eza --color=always --group-directories-first --icons'
abbr --add la 'eza -a --color=always --group-directories-first --icons'
abbr --add ll 'eza -l --color=always --group-directories-first --icons'
abbr --add lt 'eza -T --color=always --group-directories-first --icons --ignore-glob="node_modules|venv"'
abbr --add ldir 'eza -d --color=always --group-directories-first --icons'
abbr --add gs 'git status'
abbr --add ga 'git add'
abbr --add gc 'git commit'
abbr --add gf 'git fetch'
abbr --add gps 'git push'
abbr --add gpl 'git pull'
abbr --add gd 'git diff'
abbr --add gr 'git restore'
abbr --add gl "git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%an%C(reset)%C(bold yellow)%d%C(reset) %C(dim white)- %s%C(reset)' --all"
abbr --add efish '$EDITOR ~/.config/fish/config.fish'
abbr --add sfish 'source ~/.config/fish/config.fish'
abbr --add .. 'cd ..'
abbr --add ... 'cd ...'
abbr --add .... 'cd ....'

switch (uname)
    # WSL
    case Linux
        abbr --add pc 'cd /mnt/c/Users/Gargo'
        abbr --add here 'explorer.exe .'
        abbr --add open 'wslview'
        abbr --add fd 'fdfind'
    # MacOs
    case Darwin
        abbr --add tailscale '/Applications/Tailscale.app/Contents/MacOS/Tailscale'
        abbr --add sshpc 'ssh -t gargo@gargoth-acer \'ssh gargoth@localhost -p 2022\''
    case '*'
end

starship init fish | source
